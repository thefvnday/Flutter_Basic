

import 'package:flutter/material.dart';
import 'package:hollo_world/widget/text_widget.dart';

void main() {
  runApp(MaterialApp(
    title: "Hello World",
    home: Scaffold(
      appBar: AppBar(title: Text ("Welcome to Flutter"),),
      body:Center(
       child: FlatButtonWidget() ,
      ) 
    ),
  ));
}

//column
class FlexWidget extends StatelessWidget {
  const FlexWidget({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextWidget(),
              TextWidget(),
            
            ],
          ),
          TextWidget()
        ],
      );
  }
}

//Stack
class StackWidget extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return Stack(
      children: [
        Positioned(
        child: Text("BUTTOM RIGHT"),
        top: 50,
        left: 50,
        ),
        Positioned(
        child: Text("TOP LEFT"),
        bottom: 50,
        right: 50,
        )
      ],
    );
  }
}

//Container
class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(8),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.red, border: Border.all(color: Colors.black, width: 1)
          ),
          child: Container(
            color: Colors.yellow,
          ),
    );
  }
}

//checkbox
class CheckBoxWidget extends StatefulWidget {
  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool? _value = true;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Checkbox(value: _value, 
      onChanged: (value){
        setState(() {
          _value= value;
        });
      }),
      Text(_value.toString())
    ],
  );
}

//dropdown
class DropDownWidget extends StatefulWidget {
  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? _value = "One";

  @override
  Widget build(BuildContext context) => DropdownButton<String>(
      value: _value,
      icon: Icon(Icons.arrow_downward),
      items: <String>["One", "Two", "Three"]
          .map<DropdownMenuItem<String>>((e) => DropdownMenuItem<String>(
                child: Text(e),
                value: e,
              ))
          .toList(),
      onChanged: (value) => setState(() => _value = value));
}

//buton
class FlatButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FlatButton(
      color: Colors.amber,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(12),
      splashColor: Colors.greenAccent,
      onPressed: () => print("Clicked"),
      child: Text("Click here"));
}