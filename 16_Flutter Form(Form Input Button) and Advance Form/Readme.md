# FLutter Form dan Advance Form

## Form
* Widget yang dapat menerima isian data dari pengguna
* isian data bisa lebih dari satu

### Membuat Form
* Menggunakan stateful widget
* keadaan form disimpan menggunakan globalkey<FormState>

## Input
1. TextField
* Menerima isian data dari pengguna
* Isian data bisa lebih dari satu

Untuk membuat TextField biasanya harus menggunakan TextEditingController untuk mengambil data, isian data berupa text

2. Radio 
input yang memberikan opsi pilihan kepada pengguna dan pengguna hanya dapat memilih satu opsi saja. untuk membuat radio kita harus menggunakan properti dengan tipe data yang sesuai dengan value pada radio dan fungsinya akan berubah ketika dipanggil.

3. Checkbox
Widget checkbox memberikan opsi/pilihan kepada user dan user dapat memilih beberapa opsi. didalam checkbox data yang diambil bertipe data boolean

4. Dropdown Button
Widget yang memberikan opsi pada user, dropdown hanya dapat memilih satu opsi saja dan opsi tidak ditampilkan di awal, hanya tampil jika ditekan/dipilih. Untuk membuat Dropdown Button data diambil menggunakan properti dengan tipe data yang sesuai dengan value pada DropdownMenuItem

## Button
Sebuah widget yang berfungsi seperti tombol dan akan bekerja saat ditekan

1. Elevated Button
ElevatedButton merupakan tombol yang timbul dan saat ditekan akan menjalankan fungsi onpressed

2. IconButton
tombol yang berupa icon dan saat ditekan akan menjalankan perintah onpressed

# Advance Form

## Date Picker

Widget yang membuat user bisa memasukkan tanggal baik itu tanggal kelahiran, waktu pemesanan tiket, waktu reservasi hotel dan lain - lain. 
### Membuat Date Picker :
* Menggunakan fungsi bawaan flutter showDatePicker
* Fungsi showDatePicker memiliki tipe data future
* Menampilkan dialog material design date picker
* Menambahkan packages intl di pubspec.yaml
* Mempersiapkan variabel
* Menambahkan fungsi showDatePicker di dalam onPressed 

## Color Picker

Widget yang digunakan supaya user bisa memilih color dan penggunaannya bisa untuk berbagai macam kondisi

* Menggunakan packages flutter_colorpicker yang bisa diambil dari pub.dev
* Sebelum digunakan, tambahkan packages tersebut di pubspec.yaml
* Mempersiapkan variabel :
* Membangun UI nya dengan cara membuat Widget 
* Menambahkan fungsi showDialog di dalam onPressed dengan return widget AlertDialog
* Jangan lupa untuk import packages flutter_colorpicker tersebut ke dalam file dart.
* Membuat kode untuk penggunaan packages flutter_colorpicker
* Packages flutter_colorpicker memiliki custom widget yang dapat digunakan, seperti BlockPicker, ColorPicker dan SlidePicker.


## File Picker

widget yang digunakan untuk mengakses storage dan memilih serta membuka file
 
### Cara membuat file picker :

* Menggunakan packages file_picker dan open_file
* menambahkan packages tersebut ke dalam pubspec.yaml 
* mengimport packagesnya di dalam file dart.