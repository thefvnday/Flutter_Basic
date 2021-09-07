//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Text("Hello World",style:TextStyle(
    color: Colors.blue,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    
  ),);
  
}