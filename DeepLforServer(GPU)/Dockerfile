FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04
MAINTAINER Moch. Ainun Najib <ec2ainun@gmail.com>

ARG TENSORFLOW_VERSION=1.2.0
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
		opencv-contrib-python \
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


# Set up notebook config
COPY jupyter_notebook_config.py /root/.jupyter/
COPY jalankan.sh /root/
EXPOSE 6006 8888
ADD *.ipynb /notebooks/
WORKDIR /notebooks
RUN chmod +x /root/jalankan.sh

CMD ["/root/jalankan.sh"]