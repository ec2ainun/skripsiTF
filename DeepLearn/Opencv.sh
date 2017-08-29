git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
cd opencv/
mkdir build
cd build/    
cmake -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DFORCE_VTK=ON \
    -DWITH_TBB=ON \
    -DWITH_V4L=ON \
    -DWITH_QT=ON \
    -DWITH_OPENGL=ON \
    -DWITH_CUBLAS=ON \
    -DCUDA_NVCC_FLAGS="-D_FORCE_INLINES" \
    -DWITH_GDAL=ON \
    -DWITH_XINE=ON \
    -DCUDA_CUDA_LIBRARY=/usr/local/cuda-8.0/targets/x86_64-linux/lib/stubs/libcuda.so \
    -DOPENCV_EXTRA_MODULES_PATH= ../../opencv_contrib/modules \
    -DBUILD_EXAMPLES=ON ..
make -j $(($(nproc) + 1))
make install
/bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
ldconfig
apt-get update