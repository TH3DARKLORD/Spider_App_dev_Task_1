import 'dart:ffi';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:spider_app_dev_task_1/2ndpage.dart';
import 'package:spider_app_dev_task_1/SPLASH.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/page': (context) => page(),
      '/home': (context) => AnimatedSplashScreen(
        splash: Icon(Icons.cookie_outlined),
        nextScreen: trial(),
        duration: 1500,
        backgroundColor: Colors.blueGrey,
        splashTransition: SplashTransition.fadeTransition,
      ),
    },
  ));
}

class trial extends StatefulWidget {
  @override
  State<trial> createState() => _trialState();
}

class _trialState extends State<trial> {
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  double data = 0.00;
  double ans = 0.00;
  String str = "hello";
  String dropdownvalue = 'Select unit';
  bool tempcond = false;
  bool textcond = false;
  String _dropDownValue = 'Select type';
  var items = [
    'Select unit',
    'Temperature',
    'Length',
    'Weight',
    'Speed',
  ];
  var tempunits = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Spider App Dev Task 1"),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: Column(
            children: <Widget>[
              Text(
                'Convert',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Divider(
                height: 50.0,
                color: Colors.grey[800],
                thickness: 5.0,
              ),
              DropdownButton(
                hint: Text('Select Item'),
                dropdownColor: Colors.redAccent,
                value: dropdownvalue,
                underline: SizedBox(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22
                ),
                icon: const Icon(Icons.keyboard_arrow_down),
                iconSize: 25.0,
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                    if (dropdownvalue == 'Temperature')
                    {
                      tempunits = [
                        'Select conversion',
                        'C to K',
                        'K to C',
                        'C to F',
                        'F to C',
                        'F to K',
                        'K to F',
                      ];
                      tempcond=true;
                    }
                    else if (dropdownvalue == 'Length')
                    {
                      tempunits = [
                        'Select conversion',
                        'cm to m',
                        'm to cm',
                        'cm to km',
                        'km to cm',
                        'm to km',
                        'km to m',
                      ];
                      tempcond = true;
                    }
                    else if (dropdownvalue == 'Weight')
                    {
                      tempunits = [
                        'Select conversion',
                        'g to kg',
                        'kg to g',
                        'kg to lbs',
                        'lbs to kg',
                      ];
                      tempcond = true;
                    }
                    else if (dropdownvalue == 'Speed')
                    {
                      tempunits = [
                        'Select conversion',
                        'm/s to km/hr',
                        'km/hr to m/s',
                        'km/hr to miles/hr',
                        'miles/hr to km/hr',
                      ];
                      tempcond = true;
                    }
                    else
                    {tempcond=false;}
                  });
                },
              ),
              Visibility(
                  visible: tempcond,
                  child: DropdownButton(
                    hint: _dropDownValue == null
                        ? Text('Dropdown')
                        : Text(
                      _dropDownValue,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22),
                    ),
                    dropdownColor: Colors.redAccent,
                    iconSize: 30.0,
                    style: TextStyle(color: Colors.white),
                    items: tempunits.map(
                          (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                            () {
                          _dropDownValue = val as String;
                          textcond = true;
                        },
                      );
                    },
                  )
              ),
              Visibility(
                  visible: textcond,
                  child: SizedBox(
                    width: 75.0,
                    child: TextField(
                      controller: myController,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false),
                    ),)
              ),
              Divider(
                height: 50.0,
                color: Colors.grey[800],
                thickness: 3.0,
              ),
              Visibility(
                visible: textcond,
                child: FloatingActionButton(
                  child: Icon(Icons.verified),
                  onPressed: () {
                    data=double.parse(myController.text);
                    if (_dropDownValue=='C to K')
                    {ans=data+273.15;}
                    else if (_dropDownValue=='K to C')
                    {ans=data-273.15;}
                    else if (_dropDownValue=='C to F')
                    {ans=(((data/5)*9)+32);}
                    else if (_dropDownValue=='F to C')
                    {ans=(((data-32)*5)/9);}
                    else if (_dropDownValue=='F to K')
                    {ans=(((data-32)*5)/9)+273.15;}
                    else if (_dropDownValue=='K to F')
                    {ans=((((data-273.15)/5)*9)+32);}
                    else if (_dropDownValue=='cm to m')
                    {ans=data/100;}
                    else if (_dropDownValue=='m to cm')
                    {ans=data*100;}
                    else if (_dropDownValue=='cm to km')
                    {ans=data/1000000;}
                    else if (_dropDownValue=='km to cm')
                    {ans=data*1000000;}
                    else if (_dropDownValue=='m to km')
                    {ans=data/1000;}
                    else if (_dropDownValue=='km to m')
                    {ans=data*1000;}
                    else if (_dropDownValue=='g to kg')
                    {ans=data/1000;}
                    else if (_dropDownValue=='kg to g')
                    {ans=data*1000;}
                    else if (_dropDownValue=='kg to lbs')
                    {ans=data*2.2;}
                    else if (_dropDownValue=='lbs to kg')
                    {ans=data/2.2;}
                    else if (_dropDownValue=='km/hr to m/s')
                    {ans=(data*5)/18;}
                    else if (_dropDownValue=='m/s to km/hr')
                    {ans=data*(18/5);}
                    else if (_dropDownValue=='km/hr to miles/hr')
                    {ans=data*0.62;}
                    else if (_dropDownValue=='miles/hr to km/hr')
                    {ans=data*1.6;}
                    str=ans.toString();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(str),
                        );},);},
                ),
              ),
            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_right),
        onPressed: (
            ){
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (c, a1, a2) => page(),
              transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
              transitionDuration: Duration(milliseconds: 2000),
            ),
          );
        },
      ),

    );
  }
}

