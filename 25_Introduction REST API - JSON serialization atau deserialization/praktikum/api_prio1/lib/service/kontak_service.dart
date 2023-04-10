import 'package:api_prio1/model/kontak_model/detail_kontak_response.dart';
import 'package:api_prio1/model/kontak_model/list_kontak_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class KontakService {
  //Get Kontak
  Future<List<ListkontakResponse>> getkontak() async {
    final response = await Dio().get(
        "http://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts");
    print(response.data);

    List<ListkontakResponse> contact = (response.data as List)
        .map(
          (e) => ListkontakResponse(
            id: e["id"],
            name: e["name"],
            phone: e["phone"],
          ),
        )
        .toList();
    return contact;
  }

  //Detail Kontak
  Future<DetailKontakResponse> getDetailKontak(
    String idKontak,
    ) async {
    final response = await Dio().get(
        "http://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/$idKontak",
        );

    return DetailKontakResponse.fromJson(response.data);
  }

  // Create Kontak
  Future<void> createKontak(BuildContext context,{
    required String name,
    required String phone,
  }) async {
    try {
      final response = await Dio().post("http://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts",
    data: {
      "name" : name,
      "phone" : phone,
    },
    );
    if(response.statusCode == 201){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sukses Create Contact'),),);
    }
    return; 
    } on DioError catch (e) {
      if(e.response?.statusCode == 500){
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Server Gagal'),),);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Terjadi Kesalahan!'),),);
      }

      
    }
  }
  //Delete Kontak
  Future<void> deleteKontak(BuildContext context,{
    required String idKontak,
    required String name
    ,}) async{
    try {
      final response = await Dio().delete(
        "http://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/$idKontak",
        );
        if(response.statusCode == 200){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sukses Delete Contact $name'),),);
    }
    } on DioError catch (e) {
      if(e.response?.statusCode == 500){
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Server Gagal'),),);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Terjadi Kesalahan!'),),);
      }

      
    }
  }


  //Update Kontak
  Future<void> updateKontak(BuildContext context,{
    required String name,
    required String phone,
    required String idKontak,
  }) async {
    try {
      final response = await Dio().put("http://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/$idKontak",
    data: {
      "name" : name,
      "phone" : phone,
    },
    );
    if(response.statusCode == 200){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sukses Update Contact'),),);
    }
    return;
    } on DioError catch (e) {
      if(e.response?.statusCode == 500){
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Server Gagal'),),);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Terjadi Kesalahan!'),),);
      }

      
    }
  }

}
