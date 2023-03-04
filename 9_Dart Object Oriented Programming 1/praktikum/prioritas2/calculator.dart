class Calculator {
  void penjumlahan(int angka1, int angka2) {
    int hasil = angka1 + angka2;
    print('Hasil Penjumlahan $angka1 + $angka2 = $hasil');
  }

  void pengurangan(int angka1, int angka2) {
    int hasil = angka1 - angka2;
    print('Hasil Pengurangan $angka1 - $angka2 = $hasil');
  }

  void perkalian(int angka1, int angka2) {
    int hasil = angka1 * angka2;
    print('Hasil Perkalian $angka1 * $angka2 = $hasil');
  }

  void pembagian(int angka1, int angka2) {
    double hasil = angka1 / angka2;
    print('Hasil Pembagian $angka1 / $angka2 = $hasil');
  }
}

void main(List<String> args) {
 
  Calculator aplikasi = Calculator();
  int angka1=5;
  int angka2=8;
  
  aplikasi.penjumlahan(angka1, angka2);
  aplikasi.pengurangan(angka1, angka2);
  aplikasi.perkalian(angka1, angka2);
  aplikasi.pembagian(angka1, angka2);
}