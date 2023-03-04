void main(args) async {
  List<int> angkaAwal = [4, 2, 5, 1, 3, 7, 9, 8];
  var penjumlahan = angkaAwal.reduce((Value, Element) => Value + Element);

  double rerata = penjumlahan/ angkaAwal.length;
  print('Nilai rata - rata bilangan dari : ${angkaAwal} adalah : ${rerata}');
  print( 'Pembulatan ke atasnya = ${rerata.round()}');
}