abstract class Matematika {
  int hasil(int x, int y);
}

class FaktorPersekutuanTerkecil implements Matematika {
   @override
  int hasil(int x, int y) {
    int i, j;
    i = x;
    j = y;
    while (i != j) {
      if (i < j) {
        i += x;
      } else {
        j += y;
      }
    }
    return i;
  }
}

class KelipatanPersekutuanTerbesar implements Matematika {
 @override
  int hasil(int x, int y) {
    int i;
    if (x > y) {
      i = x;
      x = y;
      y = i;
    }
    for (i = x; i > 0; i--) {
      if (x % i == 0 && y % i == 0) {
        break;
      }
    }
    return i;
  }
}

void main(List<String> args) {
  var kpk = KelipatanPersekutuanTerbesar();
  print('KPK = ${kpk.hasil(24, 8)}');

  var fpb = FaktorPersekutuanTerkecil();
  print('FPB = ${fpb.hasil(24, 8)}');
}


