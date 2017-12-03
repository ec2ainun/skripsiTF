#if try to change the available cuda and cudnn version
#https://hub.docker.com/r/nvidia/cuda/
FROM nvidia/cuda:8.0-cudnn6-runtime-ubuntu16.04
MAINTAINER Moch. Ainun Najib <ec2ainun@gmail.com>

#if try to change the available version
#https://www.tensorflow.org/install/install_linux#the_url_of_the_tensorflow_python_package
ARG TENSORFLOW_VERSION=1.4.0
ARG TENSORFLOW_ARCH=gpu

# Install dependencies
RUN apt-get update && apt-get install -y \
		bc \
		build-essential \
		cmake \
		curl \
		g++ \
		gfortran \
		git \
		nano \
		pkg-config \
		python-dev \
		software-properties-common \
		unzip \
		vim \
		wget \
		yasm \
		python3-dev \
		python3-tk \
		python3-numpy \
        python3-pip \
		ant \
		default-jdk \
		doxygen \
		ffmpeg \
		qtbase5-dev \
		qt5-default \
		libssl-dev \
		libffi-dev \
		libfreetype6-dev \
		libhdf5-dev \
		liblcms2-dev \
		libwebp-dev \
		libzmq3-dev \
		libgtk-3-dev \ 
		libdc1394-22 \
		libdc1394-22-dev \
		libjpeg-dev \
		libopenjpeg5 \
		libpng12-dev \
		libpng-dev \
		libtiff5-dev \
		libjasper-dev \
		libavcodec-dev \
		libavformat-dev \
		libswscale-dev \
		libxine2-dev \
		libgstreamer0.10-dev \
		libgstreamer-plugins-base0.10-dev \
		libv4l-dev \
		libtbb-dev \
		libeigen3-dev \
		libfaac-dev \
		libmp3lame-dev \
		libopencore-amrnb-dev \
		libopencore-amrwb-dev \
		libtheora-dev \
		libvorbis-dev \
		libxvidcore-dev \
		v4l-utils \
		libvtk6-dev \
		zlib1g-dev \
		libx264-dev \
		liblapacke-dev \
		libopenblas-dev \
		liblapack-dev \
		libopenexr-dev \
		libgdal-dev \
		checkinstall \
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

# Install other useful Python packages using pip3
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
	https://storage.googleapis.com/tensorflow/linux/${TENSORFLOW_ARCH}/tensorflow_gpu-${TENSORFLOW_VERSION}-cp35-cp35m-linux_x86_64.whl

ADD *.sh /
# Install Opencv
RUN bash Opencv.sh

# Set up notebook config
COPY jupyter_notebook_config.py /root/.jupyter/
COPY jalankan.sh /root/
EXPOSE 6006 8888
ADD *.ipynb /notebooks/
WORKDIR /notebooks
RUN chmod +x /root/jalankan.sh

CMD ["/root/jalankan.sh"]
