void main() {
  int Faktorial = 1;
  int? angka = 5;
  if (angka < 0){
    print("Angka yang dimasukkan bukan bilangan bulat");
  } else {
    for (int i = 1; i <= angka; i++){
    Faktorial *= i;
}
    print("Hasil faktorial dari " + angka.toString() + " adalah " + Faktorial.toString());
  }
}