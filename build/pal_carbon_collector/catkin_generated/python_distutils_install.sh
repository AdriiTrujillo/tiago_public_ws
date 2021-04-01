#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/adrii/tiago_public_ws/src/pal_statistics/pal_carbon_collector"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/adrii/tiago_public_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/adrii/tiago_public_ws/install/lib/python2.7/dist-packages:/home/adrii/tiago_public_ws/build/pal_carbon_collector/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/adrii/tiago_public_ws/build/pal_carbon_collector" \
    "/usr/bin/python2" \
    "/home/adrii/tiago_public_ws/src/pal_statistics/pal_carbon_collector/setup.py" \
     \
    build --build-base "/home/adrii/tiago_public_ws/build/pal_carbon_collector" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/adrii/tiago_public_ws/install" --install-scripts="/home/adrii/tiago_public_ws/install/bin"
