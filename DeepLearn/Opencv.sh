cd ~
git clone --branch 3.3.0 --depth 1 https://github.com/opencv/opencv.git
git clone --branch 3.3.0 --depth 1 https://github.com/opencv/opencv_contrib.git
cd opencv
mkdir build
cd build    
cmake -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules/ -DBUILD_TIFF=ON -DCUDA_CUDA_LIBRARY=/usr/local/cuda-8.0/targets/x86_64-linux/lib/stubs/libcuda.so -DENABLE_AVX=ON -DWITH_OPENGL=ON -DWITH_OPENCL=ON -DWITH_IPP=ON -DWITH_TBB=ON -DWITH_EIGEN=ON -DWITH_V4L=ON -DWITH_QT=ON -DFORCE_VTK=ON -DWITH_CUBLAS=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DCUDA_NVCC_FLAGS="-D_FORCE_INLINES" -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=$(python3 -c "import sys; print(sys.prefix)") -DPYTHON_EXECUTABLE=$(which python3) -DPYTHON_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") -DPYTHON_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") ..     
make -j $(($(nproc) + 1))
make install
/bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
ldconfig
apt-get update