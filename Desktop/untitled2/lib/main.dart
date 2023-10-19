import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController editingController=TextEditingController();
  String ? inputText="Rupee";
  String ? outputText="USD";

  double resultvalue=0.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('currency converter') ,
        ),
        body: Column(
          children: [
            TextField(
              controller: editingController ,
            ),
            Row(
              children: [
                Text('From: '),
                DropdownButton(items: [ DropdownMenuItem(child: Text('Rupee'),value: "Rupee",),
                DropdownMenuItem(child: Text('USD'),value:"USD",),
                DropdownMenuItem(child: Text('Pounds'),value: "Pounds",)],
                    value: inputText,
                    onChanged: (String ? data){
                  setState(() {
                    inputText=data;
                  });
                    }),
              ],
            ),
            Row(
              children: [
                Text('To: '),
                DropdownButton(items: [ DropdownMenuItem(child: Text('Rupee'),value: "Rupee",),
                DropdownMenuItem(child: Text('USD'),value: "USD",),
                DropdownMenuItem(child: Text('Pounds'),value: "Pounds",)],
                    value: outputText,
                    onChanged: (String ? data){
                  setState(() {
                    outputText=data;
                  });
                    })
              ],
            ),
            ElevatedButton(onPressed: increment, child:Text('convert')),
            Text('result is: $resultvalue')
          ],
        ),
      ),
    );

  }
  void increment(){
    double result=0.0;
    if(inputText=="Rupee" && outputText=="Rupee"){
      result=double.parse(editingController.text);
    }
    else if(inputText=="Rupee" && outputText=="Pounds"){
      result=double.parse(editingController.text)*0.009;
    }
    else if(inputText=="Pounds" && outputText=="Rupees"){
      result=double.parse(editingController.text)/0.009;
    }
    else if(inputText=="Rupee" && outputText=="USD"){
      result=double.parse(editingController.text)/81;
    }
    else if(inputText=="USD" && outputText=="USD"){
      result=double.parse(editingController.text);
    }
    else if(inputText=="USD" && outputText=="Rupee"){
      result=double.parse(editingController.text)*81;
    }
    setState(() {
      resultvalue=result;
    });
  }
}

