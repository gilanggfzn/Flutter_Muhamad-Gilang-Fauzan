void main(List<String> args) {

  String kata ="kasur rusak";

  if (kata == kata.split('').reversed.join()) {
    print('Kata diatas adalah palindrom');
  } else {
    print('Kata diatas bukan palindrom');
  }
}