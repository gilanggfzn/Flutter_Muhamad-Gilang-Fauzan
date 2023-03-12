# introduction flutter and flutter widget

---

## perkenalan flutter
flutter merupakan framework yang memakai bahasa pemrograman dart yang berguna membuat aplikasi mobile,desktop, dan web.

## Keunggulan FLutter
	* mudah digunakan dan juga dipelajari
	* produktivitas tinggi
	* dokumentasinya sudah lengkap
	* komunitasnya juga terus berkembang

## bagian dari flutter
* SDK(software development kit)
alat-alat untuk membantu proses pengembangan aplikasi
* Framework
perlengkapan untuk membentuk aplikasi yang dapat di kostumisasi

## Struktur Direktori
---
1. Direktori platform
* android
* ios
* web

2. Direktori project
* lib - ruang kerja utama
* test - aktivitas pengujian

3. File utama
* pertama kali dibaca dan dijalankan
* dalam librari lib

4. Widget
* semua komponen yang ada di flutter disebut widget
* digunakan untuk membuat antarmuka(UI)
* Berupa class
* dapat terdiri dari beberapa widget lainnya

### Jenis- jenisnya
- stateless widget
	* tidak bergantung pada perubahan data
	* hanya fokus pada tampilan
	* dibuat dengan extends pada class stateless 	widget

- statefull widget
	* mementingkan pada perubahan data
	* dibuat dengan extends pada class statefull 	widget
	* 1 widget menggunakan 2 class(widget dan 	state)

didalam statefull ada fungsi yang bernama setstate yang berguna untuk perubahan data yang terjadi sedangkan si stateless juga tidak ada


- built in widget
* widget yang dapat langsung digunakan
* sudah te instal bersama dengan flutter projectnya

- Material App
membangun aplikasi dengan desain material
- scaffold 
membentuk sebuah halaman
-App Bar 
membentuk application bar yang ada pada bagian atas halaman
- Text
widget untuk menampilkan text
- body 
widget yang akan muncul di bawah bagian appbar bersifat wajib


