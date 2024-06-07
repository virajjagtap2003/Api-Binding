import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:model_class/employee_model.dart';

class viewEmployee extends StatefulWidget{
  const viewEmployee({super.key});

  @override
  State <viewEmployee> createState() => _viewEmployeeState();
}
class _viewEmployeeState extends State<viewEmployee>{
  List<Data> empData=[];
  @override
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
              Text("${empData[index].employeeName}"),
              const SizedBox(
                height:40,
              ),
              Text("${empData[index].employeeSalary}"),
            ],
            
            
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: getEmployeeData,
        child: const Icon(Icons.add),),
    );
  }
  void getEmployeeData() async{
    Uri url=Uri.parse("https://dummy.restapiexample.com/api/v1/employees");
    http.Response response=await http.get(url);
    log(response.body);// string to json

    var responseData=json.decode(response.body);
    EmployeeModel empModel=EmployeeModel.fromJson(responseData);

    setState(() {
      empData=empModel.data!;
    });
  }

}