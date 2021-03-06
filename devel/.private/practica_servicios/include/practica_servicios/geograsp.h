// Generated by gencpp from file practica_servicios/geograsp.msg
// DO NOT EDIT!


#ifndef PRACTICA_SERVICIOS_MESSAGE_GEOGRASP_H
#define PRACTICA_SERVICIOS_MESSAGE_GEOGRASP_H

#include <ros/service_traits.h>


#include <practica_servicios/geograspRequest.h>
#include <practica_servicios/geograspResponse.h>


namespace practica_servicios
{

struct geograsp
{

typedef geograspRequest Request;
typedef geograspResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct geograsp
} // namespace practica_servicios


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::practica_servicios::geograsp > {
  static const char* value()
  {
    return "f99e2553a5b4745dfc6f3efd371b9886";
  }

  static const char* value(const ::practica_servicios::geograsp&) { return value(); }
};

template<>
struct DataType< ::practica_servicios::geograsp > {
  static const char* value()
  {
    return "practica_servicios/geograsp";
  }

  static const char* value(const ::practica_servicios::geograsp&) { return value(); }
};


// service_traits::MD5Sum< ::practica_servicios::geograspRequest> should match 
// service_traits::MD5Sum< ::practica_servicios::geograsp > 
template<>
struct MD5Sum< ::practica_servicios::geograspRequest>
{
  static const char* value()
  {
    return MD5Sum< ::practica_servicios::geograsp >::value();
  }
  static const char* value(const ::practica_servicios::geograspRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::practica_servicios::geograspRequest> should match 
// service_traits::DataType< ::practica_servicios::geograsp > 
template<>
struct DataType< ::practica_servicios::geograspRequest>
{
  static const char* value()
  {
    return DataType< ::practica_servicios::geograsp >::value();
  }
  static const char* value(const ::practica_servicios::geograspRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::practica_servicios::geograspResponse> should match 
// service_traits::MD5Sum< ::practica_servicios::geograsp > 
template<>
struct MD5Sum< ::practica_servicios::geograspResponse>
{
  static const char* value()
  {
    return MD5Sum< ::practica_servicios::geograsp >::value();
  }
  static const char* value(const ::practica_servicios::geograspResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::practica_servicios::geograspResponse> should match 
// service_traits::DataType< ::practica_servicios::geograsp > 
template<>
struct DataType< ::practica_servicios::geograspResponse>
{
  static const char* value()
  {
    return DataType< ::practica_servicios::geograsp >::value();
  }
  static const char* value(const ::practica_servicios::geograspResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // PRACTICA_SERVICIOS_MESSAGE_GEOGRASP_H
