# deep dive into dart oop

===

## constructor
* method yang dijalankan saat pembuatan object
* dapat menerima parameter
* tidak memiliki return
* namanya sama dengan nama class
```dart
class Hewan{
	var mata;
	var kaki;
	
	Hewan(){
		mata =0;
		kaki =0;
}
}

void main(List<String> arguments){}
```

## inheritance
* membuat class baru dengan memanfaatkan class yang sudah ada
* bertujuan agar kemampuan class yang sudah ada dapat dimiliki oleh class baru
```dart
class Hewan{
	var mata;
	var kaki;
	
	Hewan(){
		mata =0;
		kaki =0;
}
}

class kambing extends Hewan{
	kambing(){
		mata =2;
		kaki =4;
}
}
```
## penggunaan class
Proses membuat object dari class yang terjadi inheritance seperti pembuatan object pada umumnya
```dart
class Hewan{
	var mata;
	var kaki;
	
	Hewan(){
		mata =0;
		kaki =0;
}
}

class kambing extends Hewan{
	kambing(){
		mata =2;
		kaki =4;
}
}

void main(List<String> arguments){
	var k1 = kambing();
	print(k1.mata);
	var k2= Hewan();
	print(h1.mata);
}
```
## method overriding 
* menulis ulang method yang ada pada super-class
* Bertujuan agar class mempunyai method yang sama dengan proses yang berbeda

### melakukan overriding
* dilakukan pada class yang melakukan inheritance
* method sudah ada pada class induk
* method ditulis ulang seperti membuat method baru pada class anak
* ditambahkan tanda @override dibari sebelum method dibuat
```dart
class Hewan{
	reproduksi(){
		print('tidak diketahui');
}

	bernapas(){
		print('tidak diketahui');
}
}

class kambing extends Hewan{
	@override
	reproduksi(){
		print('melahirkan');
}

	@override
	bernapas(){
		print('paru-paru');
}
}

void main(List<String> arguments){
	var k1 = kambing();
	k1.bernapas();

	var k2 = Hewan();
	k2.bernapas();
}
```
## interface
* interfave sendiri merupakan sebuah class
* menunjukan method apa saja yang ada pada suatu class
* seluruh method wajib di-override
* digunakan dengan menggunakan implements
* sekilas interface mirip dengan inheritance
* pada class yang melakukan implements, wajib melakukan override semua method yang ada pada class induk

```dart
class Hewan{
	reproduksi(){
		print('tidak diketahui');
}

	bernapas(){
		print('tidak diketahui');
}
}

class kambing implements Hewan{
	@override
	reproduksi(){
		print('melahirkan');
}

	@override
	bernapas(){
		print('paru-paru');
}
}

void main(List<String> arguments){
	var k1 = kambing();
	print(k1.reproduksi);

	var k2 = Hewan();
	k2.bernapas();
}
```

## abstract class 

* class yang berupa abstrak
* menunjukan method apa saja yang ada pada suatu class
* digunakan dengan menggunakan extends
* tidak dapat dibuat obect
* tidak semua method harus di override

## polymorphism
* kemampuan data berubah menjadi bentuk lain
* tipe data yang dapat digunakan adalah super class
* dapat dilakukan pada class dengan extends atau implements
```dart
void main(){
	hewan k1 = kambing();
	k1.reproduksi();
	k1.bernapas();
}
```
## Generics
* dapat digunakan pada class/fungsi
* memberi kemampuan agar dapat menerima data dengan tipe berbeda
* tipe data yang di inginkan ditentukan saat membuat class / menjalankan fungsi

### membuat class membuat fungsi dan menggunakan  generics

* class hadiah dapat dimasukkan data dengan tipe T
* tipe T dapat digunakan diseluruh class hadiah
```dart
Class Hadiah<T>{
	var isi;
	Hadiah (T i){
		isi = i;
}
	
}

void main(){
	var h1= Hadiah<String>('mobil');
	print(h1.isi);

	var h2 = Hadiah<int>(10);
	print(h2.isi);
}

//membuat fungsi class generics
void main(){

	void cekTipe<T>(T data){
		print(data.runtimeType);
}

	cekTipe<String>("satu");
	cekTipe<int>(1);
}
```