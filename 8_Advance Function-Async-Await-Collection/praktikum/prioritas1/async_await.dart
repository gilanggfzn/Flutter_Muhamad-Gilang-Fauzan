Future<List<double>> dataLoop(List listdata, double pengali) async{
  await Future.forEach(listdata, (listdata)async{
    databaru.add(listdata * pengali);
    await Future.delayed(Duration(seconds: 1));
    print('Pengalinya adalah : $pengali');
  });
  return databaru;
}

List<double> databaru = [];

void main()async{
  List <double> data = [1,2,3,4,5,6,7];
  dataLoop(data, 3);
  
  Future.delayed(Duration(seconds: 1));
  print('Data lamanya adalah : ${data}');
  print('Data barunya adalah : ${databaru}');
}