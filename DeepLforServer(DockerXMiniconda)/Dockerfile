#build docker berdasarkan docker images tensorflow
#pada build docker ini saya menggunakan images tensorlfow versi terbaru dengan python versi 3
FROM gcr.io/tensorflow/tensorflow:latest-py3
#untuk build docker dengan penggunaan hardware GPU bisa menggunakan
#FROM gcr.io/tensorflow/tensorflow:latest-gpu
#untuk infromasi lebih lanjut dapat mengunjungi https://hub.docker.com/r/tensorflow/tensorflow/
MAINTAINER Moch. Ainun Najib <m.ec2.a.najib@gmail.com>
RUN apt-get update && apt-get install -y curl
# Force bash always
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
# Install miniconda to /miniconda
RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b
RUN rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH /miniconda/bin:$PATH

RUN conda update -y conda 
RUN conda create -y -n py3 python=3
ENV PATH /miniconda/envs/py3/bin:$PATH
#ENV PATH=/miniconda/envs/py3/bin:${PATH}
RUN /bin/bash -c "source /miniconda/envs/py3/bin/activate py3"
#RUN source activate py3

ADD *.sh /installOpen/
ADD *.py /installOpen/
WORKDIR /installOpen
#RUN .installDependency.sh
RUN bash installDependency.sh 
RUN rm -rf /notebooks/*
ADD *.ipynb /notebooks/
WORKDIR /notebooks
CMD ["/installOpen/jalankan.sh"]