#build docker berdasarkan docker images tensorflow
#pada build docker ini saya menggunakan images tensorlfow versi terbaru dengan python versi 3
FROM gcr.io/tensorflow/tensorflow:latest-py3
#untuk build docker dengan penggunaan hardware GPU bisa menggunakan
#FROM gcr.io/tensorflow/tensorflow:latest-gpu
#untuk infromasi lebih lanjut dapat mengunjungi https://hub.docker.com/r/tensorflow/tensorflow/
MAINTAINER Moch. Ainun Najib <m.ec2.a.najib@gmail.com>

# Pillow needs libjpeg by default as of 3.0.
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends \
        libjpeg8-dev \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install scikit-learn Pillow
ADD *.sh /installOpen/
WORKDIR /installOpen
RUN bash installOpenCV.sh 
RUN rm -rf /notebooks/*
ADD *.sh /notebooks/
WORKDIR /notebooks
CMD ["/run_jupyter.sh"]