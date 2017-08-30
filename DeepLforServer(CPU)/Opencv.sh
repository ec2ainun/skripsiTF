cd ~
git clone --branch 3.3.0 --depth 1 https://github.com/opencv/opencv.git
git clone --branch 3.3.0 --depth 1 https://github.com/opencv/opencv_contrib.git
cd opencv
mkdir build
cd build    
cmake -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules/ -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=$(python3 -c "import sys; print(sys.prefix)") -DPYTHON_EXECUTABLE=$(which python3) -DPYTHON_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") -DPYTHON_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") ..     
make -j $(($(nproc) + 1))
make install
/bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
ldconfig
apt-get update