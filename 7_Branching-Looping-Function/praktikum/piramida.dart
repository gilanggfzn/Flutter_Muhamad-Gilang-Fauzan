import 'dart:io';//supaya bisa masukin stdout.write

void segitiga(){
   for (var a = 0; a < 9; a++) {
    for (var b = 7; b >= a; b--) {
      stdout.write(" ");
    }
    for (var c = 1; c <= a; c++) {
      stdout.write("*");
    }
    for (var d = 1; d <= a - 1; d++) {
      stdout.write("*");
    }
    stdout.write("\n");
  }
}

void main(){
  segitiga();
}