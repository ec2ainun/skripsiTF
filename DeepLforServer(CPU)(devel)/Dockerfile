FROM ubuntu:16.04 

MAINTAINER Moch. Ainun Najib <m.ec2.a.najib@gmail.com>

ARG TENSORFLOW_VERSION=1.2.0
ARG TENSORFLOW_ARCH=cpu

ENV CPUCOUNT 1
RUN CPUCOUNT=$(cat /proc/cpuinfo | grep '^processor.*:' | wc -l)
ENV OPENCV_VERSION 3.1.0


# Install dependencies
RUN apt-get update && apt-get install -y \
		bc \
		build-essential \
		cmake \
		curl \
		g++ \
		gfortran \
		git \
		libffi-dev \
		libfreetype6-dev \
		libhdf5-dev \
		libjpeg-dev \
		liblcms2-dev \
		libopenblas-dev \
		liblapack-dev \
		libopenjpeg5 \
		libpng12-dev \
		libssl-dev \
		libtiff5-dev \
		libwebp-dev \
		libzmq3-dev \
		nano \
		pkg-config \
		python-dev \
		software-properties-common \
		unzip \
		vim \
		wget \
		zlib1g-dev \
		qt5-default \
		libvtk6-dev \
		zlib1g-dev \
		libjpeg-dev \
		libwebp-dev \
		libpng-dev \
		libtiff5-dev \
		libjasper-dev \
		libopenexr-dev \
		libgdal-dev \
		libdc1394-22-dev \
		libavcodec-dev \
		libavformat-dev \
		libswscale-dev \
		libtheora-dev \
		libvorbis-dev \
		libxvidcore-dev \
		libx264-dev \
		yasm \
		libopencore-amrnb-dev \
		libopencore-amrwb-dev \
		libv4l-dev \
		libxine2-dev \
		libtbb-dev \
		libeigen3-dev \
		python3-dev \
		python3-tk \
		python3-numpy \
        python3-pip \
		ant \
		default-jdk \
		doxygen \
		&& \
	apt-get clean && \
	apt-get autoremove && \
	rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip
# Add SNI support to Python
RUN pip3 --no-cache-dir install \
		pyopenssl \
		ndg-httpsclient \
		pyasn1 

# Install other useful Python packages using pip
RUN pip3 --no-cache-dir install --upgrade ipython && \
	pip3 --no-cache-dir install \
		Cython \
		ipykernel \
		jupyter \
		path.py \
		Pillow \
		h5py \
		pygments \
		six \
		sphinx \
		wheel \
		zmq \
		matplotlib \
        numpy \
        pandas \
		scipy \
		scikit-learn \
		&& \
	python3 -m ipykernel.kernelspec

RUN apt-get update && apt-get install -y \
		python3-nose \
		python3-skimage \
		python3-sympy \
		&& \
	apt-get clean && \
	apt-get autoremove && \
	rm -rf /var/lib/apt/lists/*


# Install TensorFlow
RUN pip3 --no-cache-dir install \
	https://storage.googleapis.com/tensorflow/linux/${TENSORFLOW_ARCH}/tensorflow-${TENSORFLOW_VERSION}-cp35-cp35m-linux_x86_64.whl

# Install OpenCV
#RUN git clone --depth 1 https://github.com/opencv/opencv.git /root/opencv && \
#	cd /root/opencv && \
#	mkdir build && \
#	cd build && \
#	cmake -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON .. && \
#	make -j"$(nproc)"  && \
#	make install && \
#	ldconfig && \
#	echo 'ln /dev/null /dev/raw1394' >> ~/.bashrc
RUN cd /opt/ && \
	git clone https://github.com/Itseez/opencv.git && \
	git clone https://github.com/Itseez/opencv_contrib.git && \
	cd opencv && \
	git checkout ${OPENCV_VERSION} && \
	cd ../opencv_contrib && \
	git checkout ${OPENCV_VERSION}

RUN mkdir -p /opt/opencv/build && \
	cd /opt/opencv/build && \
	cmake -D CMAKE_BUILD_TYPE=RELEASE \
		-D CMAKE_INSTALL_PREFIX=/usr/local \
		# -D INSTALL_C_EXAMPLES=ON \
		# -D INSTALL_PYTHON_EXAMPLES=ON \
		-D OPENCV_EXTRA_MODULES_PATH= ../../opencv_contrib/modules \
		# -D BUILD_EXAMPLES=ON \
		.. && \
	make -j${CPUCOUNT} && \
	make install && \
	ldconfig
# now clean up the unwanted source to keep image size to a minimum
RUN cd /opt && \
	rm -rf /opt/opencv && \
	rm -rf /opt/opencv_contrib && \
	apt-get purge -y cmake && \
	apt-get autoremove -y --purge

# Set up notebook config
COPY jupyter_notebook_config.py /root/.jupyter/

COPY jalankan.sh /root/

EXPOSE 6006 8888
ADD *.ipynb /notebooks/
WORKDIR /notebooks
RUN chmod +x /root/jalankan.sh
#CMD ["/bin/bash"]
CMD ["/root/jalankan.sh"]