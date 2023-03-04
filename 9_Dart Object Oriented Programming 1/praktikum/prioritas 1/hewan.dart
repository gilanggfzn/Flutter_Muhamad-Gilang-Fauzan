class Hewan{
  String nama ="hewan";
  int BB=0;
}
 class sapi extends Hewan{
    sapi(){
      nama = "sapi";
      BB = 70;
    }
  }
class kambing extends Hewan{
  kambing(){
    nama="kambing";
    BB= 25;  
  }
}

class mobil{
  int maxberat =150;
  List<String> muatan=['sapi','kambing'];
  
  void tambahMuatan(){
    print("bisa ditambah muatan");
  }
} 
 
void main(List<String> arguments){
 var h1=sapi();
 var h2=kambing();
 var k1 = mobil();
 
 if((h1.BB+h2.BB)<k1.maxberat){
  k1.tambahMuatan();
  print("hewan di mobil adalah : ${k1.muatan}");
 }else{
  print("mobil sudah penuh!!");
 }
 
 
}