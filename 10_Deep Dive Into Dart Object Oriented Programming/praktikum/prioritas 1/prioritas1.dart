class BangunRuang {
  double? panjang;
  double? lebar;
  double? tinggi;

  BangunRuang({this.panjang, this.lebar, this.tinggi});
  Volume() {
    return ' ';
  }
}

class Kubus extends BangunRuang {
  double? sisi;
  kubus() {
    this.sisi;
  }

  @override
  Volume() {
    return sisi! * sisi! * sisi!;
  }
}

class Balok extends BangunRuang {
  @override
  Volume() {
    return panjang! * lebar! * tinggi!;
  }
}

void main() {
  Kubus kubus = new Kubus();
  print(
      'kubus dengan sisi ${kubus.sisi = 5} volumenya adalah ${kubus.Volume()}');

  Balok balok = new Balok();
  print(
      'balok dengan panjang ${balok.panjang = 6},lebar ${balok.lebar = 8},tinggnya ${balok.tinggi = 10},volumenya adalah ${balok.Volume()} ');
}
