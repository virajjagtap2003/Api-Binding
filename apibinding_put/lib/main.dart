import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Center(
            child: ElevatedButton(onPressed: (){
              postEmployeeData();
            }, 
            
            child: const Text("Post Data")),
        ),
      ),
    );
  }
  void postEmployeeData()async{
    Uri url=Uri.parse("https://dummy.restapiexample.com/api/v1/update/21");
    Map<String,String>mapData={
      'name':'viraj',
      'salary':'20000',
      'age':'33'
    };

    http.Response responce= await http.put(url,body:mapData);
    log(responce.body);
  }
}
