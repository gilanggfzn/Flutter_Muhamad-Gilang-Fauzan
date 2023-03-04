# fungsi lanjutan
* anonumous function
    * tidak memiliki nama
    * fungsi sebagai data
```dart
var hello = (){
	print('hello'); -> anonymous function 
};
void main(){
hello();
}
```
## arrow function

* bisa mempunyai nama atau tidak
* berisi 1 data(bisa dari proses ataupun statis)
* Nilai return fungsi ini diambil data data tersebut
* ditulis dengan =>

## async - await

* bisa menjalankan beberapa proses tanpa perlu menunggu
* prosesnya ditulis dalam bentuk fungsi
* await akan menunggu hingga proses async selesai

tipe data future
dengan memakai future bisa membuat proses berjalannya fungsi diberi waktu/durasi
jika ingin return objek future perlu objek async untuk programnya
```dart
Future<string> p1(){
	return Future.delayed(Duration(second: 1)), ({
		return 'hello dari p1';
    });
}

void main() async{
	var data await p1();
	print(data);
}
```
## Collection
struktur data canggih yang dapat menangani masalah yang kompleks, collection bisa menyimpan kumpulan data atau objek lain pada 1 tempat
contoh: List 
list dapat menyimpan data secara berbaris dan setiap data didalamnya mempunyai index
```dart
void main() async{

	var score = [];
	score.add(50);
	score.add(60);
	score.add(70):
print(score); -> print seluruh data score
print(score[0]); -> print data dari index
print(score[1]);
print(score[2]);

for(var scores in score){
	print(scores); -> untuk ngeprint lebih singkat
}
}
```
Map menyimpan data secara key-value
key berguna selayaknya index pada list
| key1 | value1 |
| key2 | value2 |
| key3 | value3 |
```dart
void main() async{
	var student={};
	student['name']='Alex';
	student['age']=16;
	print(student);

print(student['name']);
print(student['age']);
for(var key in student.keys){
	print(student[key]);
}
}
```

  



