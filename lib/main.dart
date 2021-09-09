

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hollo_world/widget/text_widget.dart';

void main() {
  runApp(MaterialApp(
    title: "Hello World",
    home: Scaffold(
      appBar: AppBar(
      title: Text ("Welcome to Flutter"),
      //IconButton
      leading: IconButton(
         icon: Icon(Icons.home,
         color: Colors.white,
         ),
         onPressed: (){
           print("Back to home");
         })
      ),
      body:Center(
       child: LifeCycleWidget() ,
       
      ),
      //Float
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        elevation: 0,
        child: Icon(Icons.add),
        onPressed: (){
          print("Clicked");
        }
      ),
    ),
  ));
}

//Guestur widget
class GestureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Text("Guesture"),
        onTap: (){
          print("Hallo");
        },
        onDoubleTap: (){
          print("Hallo Hallo");
        }

       
      );
}

// LifeCycleWidget
class LifeCycleWidget extends StatefulWidget {
  const LifeCycleWidget({ Key? key }) : super(key: key);

  @override
  _LifeCycleWidgetState createState() => _LifeCycleWidgetState();
}

class _LifeCycleWidgetState extends State<LifeCycleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isStatless = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _isStatless ? Stateless() : StateFul(),
        SizedBox(height:16,),
        FlatButton(
          onPressed: (){
            setState(() {
              _isStatless = !_isStatless;
            });
          },
          child: Text("Change")
        )
      ],
    );
  }
}

class Stateless extends StatelessWidget {
  const Stateless({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("StatelessWidget build");

    return Container(
      child: Text("STATLESS"), 
    );
  }
}

class StateFul extends StatefulWidget {
  const StateFul({ Key? key }) : super(key: key);

  @override
  _StateFulState createState() => _StateFulState();
}

class _StateFulState extends State<StateFul> with WidgetsBindingObserver{
  bool _isChecked = false;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if(state== AppLifecycleState.inactive){
      print("INACTIVE");
    } else if (state == AppLifecycleState.paused){
      print("PAUSED");
    } else if (state == AppLifecycleState.resumed){
      print("RESUMED");
    } else if(state == AppLifecycleState.detached){
      print("DETACHED");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
    WidgetsBinding.instance?.addObserver(this);
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant StateFul oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("setState");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");
    WidgetsBinding.instance?.removeObserver(this);
  }


  @override
  Widget build(BuildContext context) {
    print("StatefullWidget Build");

    return SwitchListTile(
      value: _isChecked, 
      onChanged: (value){
        setState(() {
          _isChecked = value;
        });
      });
  }
}

//Radio Button
enum  Gender { male, female }

class RadioWidget extends StatefulWidget {
  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  Gender _gender = Gender.female;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          ListTile(
            title: Text("Laki - laki"),
            leading: Radio(
                value: Gender.male,
                groupValue: _gender,
                onChanged: (value){
                  setState(() {
                      _gender = Gender.male;
                  });
                }),
          ),
          ListTile(
            title: Text("Perempuan"),
            leading: Radio(
                value: Gender.female,
                groupValue: _gender,
                onChanged: (value){
                  setState(() {
                      _gender = Gender.female;
                  });
                }),
          ),
        ],
      );
}

//RisedButton
class RaisedButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => RaisedButton(
      child: Text(
        "Click here",
        style: TextStyle(fontSize: 20),
      ),
      splashColor: Colors.grey,
      onPressed: () => print("Clicked"));
}

//Slider
class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _min = 0, _max = 100, _value = 60;

  @override
  Widget build(BuildContext context) => Slider(
      min: _min,
      max: _max,
      value: _value,
      onChanged: (value){
        setState(() {
          _value = value;
          print(_value.toString());
        });
      }
      
      );
}

//Switch widget
class SwitchWidget extends StatefulWidget {
  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool _isChecked = true;

  @override
  Widget build(BuildContext context) => Switch(
      value: _isChecked,
      onChanged: (value){
        setState(() {
          _isChecked = value;
          print(_isChecked.toString());
        });
      });
}

// Text Field Jika true maka tampak jika false maka hiden seperti password
class TextFieldWidget extends StatelessWidget {
  final _controller = TextEditingController(text: "Initial text");

  @override
  Widget build(BuildContext context) => TextField(
        obscureText: false,
        controller: _controller,
        decoration: InputDecoration(
          labelText: "Input Text"),
        onChanged: (value){
          print(value);
        },
           // border: OutlineInputBorder(), labelText: "Password"),
      
  );
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

//button
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


