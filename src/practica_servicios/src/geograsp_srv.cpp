#include <iostream>

#include <ros/ros.h>
#include <ros/topic.h>
#include <sensor_msgs/PointCloud2.h>
#include <practica_servicios/geograsp.h>
#include <geograsp/GeoGrasp.h>

#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl_conversions/pcl_conversions.h>

#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/visualization/point_cloud_color_handlers.h>

#include <pcl/filters/passthrough.h>

#include <pcl/ModelCoefficients.h>
#include <pcl/filters/extract_indices.h>

#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/extract_clusters.h>
#include <pcl/segmentation/sac_segmentation.h>

#include <Eigen/Dense>


// Diámetro de la lata, usado para devolver el objeto con el diámetro más
// similar
const float DIAM_LATA = 0.11f;

pcl::visualization::PCLVisualizer::Ptr viewer(new pcl::visualization::PCLVisualizer("Cloud viewer"));

Eigen::Vector3f
getLataCerveza(const sensor_msgs::PointCloud2ConstPtr &inputCloudMsg) {
  pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud(
      new pcl::PointCloud<pcl::PointXYZRGB>());
  pcl::fromROSMsg(*inputCloudMsg, *cloud);

  // Remove NaN values and make it dense
  std::vector<int> nanIndices;
  pcl::removeNaNFromPointCloud(*cloud, *cloud, nanIndices);

  // Remove background points
  pcl::PassThrough<pcl::PointXYZRGB> ptFilter;
  ptFilter.setInputCloud(cloud);
  ptFilter.setFilterFieldName("z");
  ptFilter.setFilterLimits(0.0, 2.0);
  ptFilter.filter(*cloud);

  ptFilter.setInputCloud(cloud);
  ptFilter.setFilterFieldName("y");
  ptFilter.setFilterLimits(-0.55, 0.40);
  ptFilter.filter(*cloud);

  ptFilter.setInputCloud(cloud);
  ptFilter.setFilterFieldName("x");
  ptFilter.setFilterLimits(-0.50, 0.50);
  ptFilter.filter(*cloud);

  // Create the segmentation object for the planar model and set all the
  // parameters
  pcl::SACSegmentation<pcl::PointXYZRGB> sacSegmentator;
  pcl::PointIndices::Ptr inliers(new pcl::PointIndices);
  pcl::ModelCoefficients::Ptr coefficients(new pcl::ModelCoefficients);
  pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloudPlane(
      new pcl::PointCloud<pcl::PointXYZRGB>());

  sacSegmentator.setModelType(pcl::SACMODEL_PLANE);
  sacSegmentator.setMethodType(pcl::SAC_RANSAC);
  sacSegmentator.setMaxIterations(50);
  sacSegmentator.setDistanceThreshold(0.02);
  sacSegmentator.setInputCloud(cloud);
  sacSegmentator.segment(*inliers, *coefficients);

  // Remove the planar inliers, extract the rest
  pcl::ExtractIndices<pcl::PointXYZRGB> indExtractor;
  indExtractor.setInputCloud(cloud);
  indExtractor.setIndices(inliers);
  indExtractor.setNegative(false);

  // Get the points associated with the planar surface
  indExtractor.filter(*cloudPlane);

  // Remove the planar inliers, extract the rest
  indExtractor.setNegative(true);
  indExtractor.filter(*cloud);

  // Comprobar que se siguen teniendo puntos
  if (cloud->empty()) {
    ROS_WARN("La segmentación de planos ha eliminado todos los puntos");
    return Eigen::Vector3f::Zero();
  }

  // Calcular las normales para extraer el cilindro posteriormente
  pcl::search::KdTree<pcl::PointXYZRGB>::Ptr tree(
      new pcl::search::KdTree<pcl::PointXYZRGB>);
  tree->setInputCloud(cloud);
  pcl::PointCloud<pcl::Normal>::Ptr cloud_normals(
      new pcl::PointCloud<pcl::Normal>());
  pcl::NormalEstimation<pcl::PointXYZRGB, pcl::Normal> ne;
  ne.setSearchMethod(tree);
  ne.setInputCloud(cloud);
  ne.setKSearch(50);
  ne.compute(*cloud_normals);

  // Crea el objeto para la segmentación del cilindro y define sus parámetros
  pcl::ModelCoefficients::Ptr coefficients_cylinder(new pcl::ModelCoefficients);
  pcl::PointIndices::Ptr inliers_cylinder(new pcl::PointIndices);
  pcl::SACSegmentationFromNormals<pcl::PointXYZRGB, pcl::Normal> seg;
  seg.setOptimizeCoefficients(true);
  seg.setModelType(pcl::SACMODEL_CYLINDER);
  seg.setMethodType(pcl::SAC_RANSAC);
  seg.setNormalDistanceWeight(0.1);
  seg.setMaxIterations(500000);
  seg.setDistanceThreshold(0.05);
  seg.setRadiusLimits(0.050f, 0.06f);
  seg.setInputCloud(cloud);
  seg.setInputNormals(cloud_normals);
  seg.segment(*inliers_cylinder, *coefficients_cylinder);

  // Create cloud with segmentated cylinder
  indExtractor.setInputCloud(cloud);
  indExtractor.setIndices(inliers_cylinder);
  indExtractor.setNegative(false);
  pcl::PointCloud<pcl::PointXYZRGB>::Ptr object_cloud(
      new pcl::PointCloud<pcl::PointXYZRGB>());
  indExtractor.filter(*object_cloud);

  if (object_cloud->empty()) {
    ROS_WARN("No ha quedado ningún punto");
    // Visualize the result
    pcl::visualization::PointCloudColorHandlerRGBField<pcl::PointXYZRGB> rgb(
	cloud);
    pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZRGB>
	planeColor(cloudPlane, 0, 255, 0);

    viewer->removeAllPointClouds();
    viewer->removeAllShapes();

    return Eigen::Vector3f::Zero();
  } else {
    // Create and initialise GeoGrasp
    pcl::visualization::PointCloudColorHandlerRGBField<pcl::PointXYZRGB> rgb(
	object_cloud);
    // pcl::visualization::PointCloudColorHandlerRGBField<pcl::PointXYZRGB> rgb(
    // 	cloud);

    pcl::PointCloud<pcl::PointXYZ>::Ptr cloudPlaneXYZ(
	new pcl::PointCloud<pcl::PointXYZ>());
    pcl::PointCloud<pcl::PointXYZ>::Ptr objectCloudXYZ(
	new pcl::PointCloud<pcl::PointXYZ>());
    pcl::copyPointCloud(*cloudPlane, *cloudPlaneXYZ);
    pcl::copyPointCloud(*object_cloud, *objectCloudXYZ);

    GeoGrasp geoGraspPoints;
    geoGraspPoints.setBackgroundCloud(cloudPlaneXYZ);
    geoGraspPoints.setObjectCloud(objectCloudXYZ);
    geoGraspPoints.setGripTipSize(25); // 25mm grip
    geoGraspPoints.setGrasps(1);       // Keep track only of the best

    // Calculate grasping points
    geoGraspPoints.compute();

    // Extract best pair of points
    GraspContacts bestGrasp = geoGraspPoints.getBestGrasp();
    GraspPose bestPose = geoGraspPoints.getBestGraspPose();

    viewer->removeAllPointClouds();
    viewer->removeAllShapes();
    viewer->addPointCloud<pcl::PointXYZRGB>(object_cloud, rgb, "Lata de cerveza (en principio)");
    viewer->addSphere(bestGrasp.firstPoint, 0.01, 0, 0, 255, "First best grasp point");
    viewer->addSphere(bestGrasp.secondPoint, 0.01, 255, 0, 0, "Second best grasp point");

    return bestPose.midPointPose.translation();
  }
}

bool callback(practica_servicios::geograsp::Request& request,
	      practica_servicios::geograsp::Response& response)
{
  // Recibe el mensaje más reciente del sensor xtion
  ROS_INFO("Esperando a recibir mensaje");
  auto cloud = ros::topic::waitForMessage<sensor_msgs::PointCloud2>
    ("/xtion/depth_registered/points", ros::Duration(10));
  ROS_INFO("Nube de puntos recibida");

  if (cloud) {
    ROS_INFO("Calculando puntos de agarre optimos...");
    // Calcula los puntos de agarre de dicha nube de puntos
    auto p = getLataCerveza(cloud);
    std::cout << p << std::endl;

    response.p.position.x = p.x();
    response.p.position.y = p.y();
    response.p.position.z = p.z();
    return true;
  } else {
    ROS_WARN("No se ha podido leer el mensaje de nube de puntos!");
    return false;
  }
}

int main(int argc, char **argv) {
  ros::init(argc, argv, "cloud_processor");

  ros::NodeHandle n("~");
  ros::Duration(0.5).sleep();

  ros::ServiceServer service = n.advertiseService("geograsp_service", &callback);

  while (ros::ok()) {
    ros::spinOnce();
    viewer->spinOnce();
  }

  return 0;
}
