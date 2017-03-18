#build docker berdasarkan docker images tensorflow
#pada build docker ini saya menggunakan images tensorlfow versi terbaru dengan python versi 3
FROM gcr.io/tensorflow/tensorflow:latest
#untuk build docker dengan penggunaan hardware GPU bisa menggunakan
#FROM gcr.io/tensorflow/tensorflow:latest-gpu
#untuk infromasi lebih lanjut dapat mengunjungi https://hub.docker.com/r/tensorflow/tensorflow/
MAINTAINER Moch. Ainun Najib <m.ec2.a.najib@gmail.com>

RUN pip install scikit-learn Pillow pyreadline
ADD *.sh /installOpen/
ADD *.py /installOpen/
WORKDIR /installOpen
RUN bash installOpenCV.sh 
RUN rm -rf /notebooks/*
ADD *.ipynb /notebooks/
WORKDIR /notebooks
CMD ["/run_jupyter.sh"]