import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class viewEmployee extends StatefulWidget{
  const viewEmployee({super.key});

  State <viewEmployee> createState() => _viewEmployeeState();
}
class _viewEmployeeState extends State<viewEmployee>{
  List<dynamic> empData=[];
  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Get"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: empData.length,
        itemBuilder:(context,index){
          return Row(
            children: [
              Text(empData[index]["employee_name"]),
              const SizedBox(
                height: 40,
              ),
              Text("${empData[index]["employee_salary"]}"),
            ],
          );
        }),
        floatingActionButton: FloatingActionButton(onPressed: getEmployeeData,
        child: const Icon(Icons.add),),
    );
  }
  void getEmployeeData() async{
    Uri url=Uri.parse("https://dummy.restapiexample.com/api/v1/employees");
    http.Response response=await http.get(url);
    log(response.body);

    var responseData=json.decode(response.body);

    setState(() {
      empData=responseData['data'];
    });
  }

}