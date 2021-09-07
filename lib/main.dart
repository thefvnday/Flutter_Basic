import 'package:flutter/material.dart';
import 'package:hollo_world/widget/text_widget.dart';

void main() {
  runApp(MaterialApp(
    title: "Hello World",
    home: Scaffold(
      appBar: AppBar(title: Text ("Welcome to Flutter"),),
      body:  Column(
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
      ),
    ),
  ));
}
