## Judul
#### IMPLEMENTASI ALGORITMA CONVOLUTIONAL NEURAL NETWORK DALAM PENGENALAN WAJAH MANUSIA MENGGUNAKAN TENSORFLOW 

## Why?
   Pada tahun 2017, riset pada topik deep learning sangat popular dikalangan peneliti perusahaan teknologi terkemuka. Seperti Google dan Tesla dengan autonomous car sehingga memungkinkan meminimalisir tingkat kecelakaan, Amazon dengan amazon Go yang memungkinkan pembeli langsung mengambil produk dan membayar nya secara otomatis di saat keluar dari toko, serta Facebook dan Snapchat yang mengembangkan riset dalam pengenalan wajah. Deep Learning sendiri merupakan cabang dari machine learning yang bertujuan memodelkan data yang memiliki tingkat abstraksi tinggi sehingga memungkinkan mengetahui makna dari kumpulan data, hal ini terinspirasi dengan jaringan syaraf tiruan dengan banyak layer tersembunyi.  
   
   Convolutional neural network (CNN) merupakan pengembangan lebih lanjut dari Multi Layer Perceptron (MLP). Di algoritma CNN ini, Input dari layer sebelumnya bukan array 1 dimensi melainkan array 2 dimensi citra, sehingga jika di analogikan dengan fitur dari wajah manusia, layer pertama merupakan refleksi goresan-goresan berbeda arah, pada layer kedua fitur seperti bentuk mata, hidung, dan mulut mulai terlihat, hal ini karena di lakukan pooling/penggabungan dari layer pertama yang masih berupa goresan-goresan, pada layer ketiga akan terbentuk kombinasi fitur-fitur mata, hidung, dan mulut yang nantinya akan disimpulkan dengan wajah orang tertentu.  
   
   Pada tanggal 15 Februari 2017, Tensorflow telah berumur 1 tahun dan telah rilis versi stabil 1.0. Tensorflow merupakan open source software library  yang digunakan untuk komputasi numeric berdasarkan konsep flow graph yang awalnya dikembangan oleh peneliti dan developer yang mengerjakan project Google Brain untuk meneliti lebih lanjut bidang deep learning. Perusahaan-perusahaan yang saat ini menggunakan tensorflow pada produk mereka antara lain: Airbnb, Dropbox, Google, Google Deepmind, Intel, IBM, Snapchat, Twitter, Uber dan lainnya. Deep learning sendiri memerlukan banyak data training dan hardware computasi tinggi seperti GPU NVIDIA® Tesla® K80 untuk memberikan hasil yang cukup memuaskan, sehingga dalam penyusunan skripsi ini peneliti hanya mengklasifikasikan 10 wajah mahasiswa dan dosen. Serta banyaknya data yang diambil perwajah dan akurasi yang didapatkan merupakan tujuan awal penyusunan skripsi ini.  

## Install Tensorflow menggunakan Docker 
   Jika anda kurang familiar dengan Docker, anda bisa mengunjungi repository saya lainnya yang menjelaskan sesimpel mungkin apa itu Docker, bagaimana Getting Started dengan Docker, serta Pengetahuan yang **Sangat Cukup** untuk memulai Docker [Docker Simplefied](https://ec2ainun.github.io/DockerTF/).
   
   Langkah pertama yaitu clone repository ini dengan perintah:   
```sh
   > git clone https://github.com/ec2ainun/skripsiTF.git
```
   
   Langkah selanjutnya yaitu memilih workspace yang tepat bagi anda, masuk ke folder TFcpuPy2+OpenCV untuk membangun arsitektur dengan bahasa python versi 2.7.6 atau masuk ke TFcpuPy3+OpenCV untuk membangun arsitektur dengan bahasa python versi 3.4.3. Didalam kedua folder tersebut telah terdapat Dockerfile yang akan menginstall semua dependencies yang anda butuhkan untuk memulai dalam belajar dan menggunakan TensorFlow untuk Computer Vision, Dockerfile ini telah tersedia perintah-perintah untuk menginstall library seperti: numpy, scipy, scikit-learn, matplotlib, serta OpenCV. **(build succeed on DigitalOcean Server)** untuk GPU support sementara belum di test oleh penulis.
   
   Langkah berikutnya yaitu build image:
```sh
   > docker build -t namaImage .
   #namaImage bisa anda ganti sesuai interest anda
```
   
   Setelah itu run Image yang telah dibuat, dengan cara:
```sh
   > docker run -p 8888:8888 -p 6006:6006 --name namaContainer -it namaImage
   #namaImage, dan namaContainer bisa anda ganti sesuai interest anda
   # -p digunakan untuk mengekspose port yang mana yang dibuka dan diberi akses dari luar 
```

   akses pada browser anda, jika anda menginstall docker pada laptop atau komputer anda, silahkan kunjungi
```sh
   > localhost:8888
```
   jika running docker di server, silahkan kunjungi
```sh
   > dimana.alamat.server.anda:8888
```
   Lalu masukan password: **makasih**
   
   **Just it!** 
   Done, up, and running. 
   
## Tutorial Tensorflow
- Penjelasan Pengantar bahasa Python : [Pengantar Python 3](http://nbviewer.jupyter.org/github/ec2ainun/notebooks/blob/master/python3.4.ipynb)
- Penjelasan Pengantar TensorFlow : [Pengantar TensorFlow](http://nbviewer.jupyter.org/github/ec2ainun/notebooks/blob/master/Tensor.ipynb)
- Penjelasan Operasi Dasar TensorFlow : [Operasi TensorFlow](http://nbviewer.jupyter.org/github/ec2ainun/notebooks/blob/master/OperasiTF.ipynb)

## P1
- preprosessing : [kulit approach](http://nbviewer.jupyter.org/github/ec2ainun/tugas/blob/master/skripsiP1preproses.ipynb)
- training : [Tensorflow approach](http://nbviewer.jupyter.org/github/ec2ainun/tugas/blob/master/skripsiP1training.ipynb)

### Checklist
- [x] Why?
- [x] Install Tensorflow menggunakan Docker
- [x] Tutorial Tensorflow
- [x] P1
- [ ] Sejarah CNN (Convolutional Neural Network)
- [ ] Penjelasan Arsitektur CNN
- [ ] Implementasi Arsitektur
- [ ] Training dan Testing
- [ ] Kesimpulan
