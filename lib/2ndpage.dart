import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class page extends StatefulWidget {
  @override
  State<page> createState() => _pageState();
}

class _pageState extends State<page> {
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    myController2.dispose();
    super.dispose();
  }
  double data = 0.00;
  double ans = 0.00;
  double secval = 0.00;
  String dropdownvalue = 'Select unit';
  bool tempcond = false;
  bool textcond = false;
  String _dropDownValue = 'Select type';
  String _dropDownVal = 'Select type';
  String output='WRONG!!!';
  Color? bg = Colors.grey[700];
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
                'Compare and Check',
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
                        'C',
                        'K',
                        'F',
                      ];
                      tempcond=true;
                    }
                    else if (dropdownvalue == 'Length')
                    {
                      tempunits = [
                        'Select conversion',
                        'cm',
                        'm',
                        'km',
                      ];
                      tempcond = true;
                    }
                    else if (dropdownvalue == 'Weight')
                    {
                      tempunits = [
                        'Select conversion',
                        'g',
                        'kg',
                        'lbs',
                      ];
                      tempcond = true;
                    }
                    else if (dropdownvalue == 'Speed')
                    {
                      tempunits = [
                        'Select conversion',
                        'm/s',
                        'km/hr',
                        'miles/hr',
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
                  child:
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        DropdownButton(
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
                        ),


                        DropdownButton(
                          hint: _dropDownVal == null
                              ? Text('Dropdown')
                              : Text(
                            _dropDownVal,
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
                                _dropDownVal = val as String;
                              },
                            );
                          },
                        )
                      ]
                  )
              ),
              Visibility(
                  visible: textcond,
                  child:
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 70.0,
                          child:
                          TextField(
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
                          ),),
                        SizedBox(
                          width: 70.0,
                          child:
                          TextField(
                            controller: myController2,
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
                          ),),

                      ])
              ),
              Divider(
                height: 50.0,
                color: Colors.grey[800],
                thickness: 3.0,
              ),
              Visibility(
                visible: textcond,
                child: FloatingActionButton(
                  child: Icon(Icons.verified_rounded),
                  onPressed: () {
                    data=double.parse(myController.text);
                    if (_dropDownValue=='C' && _dropDownVal=='K')
                    {ans=data+273.15;}
                    else if (_dropDownValue=='K' && _dropDownVal=='C')
                    {ans=data-273.15;}
                    else if (_dropDownValue=='C' && _dropDownVal=='F')
                    {ans=(((data/5)*9)+32);}
                    else if (_dropDownValue=='F' && _dropDownVal=='C')
                    {ans=(((data-32)*5)/9);}
                    else if (_dropDownValue=='F' && _dropDownVal=='K')
                    {ans=(((data-32)*5)/9)+273.15;}
                    else if (_dropDownValue=='K' && _dropDownVal=='F')
                    {ans=((((data-273.15)/5)*9)+32);}
                    else if (_dropDownValue=='cm' && _dropDownVal=='m')
                    {ans=data/100;}
                    else if (_dropDownValue=='m' && _dropDownVal=='cm')
                    {ans=data*100;}
                    else if (_dropDownValue=='cm' && _dropDownVal=='km')
                    {ans=data/1000000;}
                    else if (_dropDownValue=='km' && _dropDownVal=='cm')
                    {ans=data*1000000;}
                    else if (_dropDownValue=='m' && _dropDownVal=='km')
                    {ans=data/1000;}
                    else if (_dropDownValue=='km' && _dropDownVal=='m')
                    {ans=data*1000;}
                    else if (_dropDownValue=='g' && _dropDownVal=='kg')
                    {ans=data/1000;}
                    else if (_dropDownValue=='kg' && _dropDownVal=='g')
                    {ans=data*1000;}
                    else if (_dropDownValue=='kg' && _dropDownVal=='lbs')
                    {ans=data*2.2;}
                    else if (_dropDownValue=='lbs' && _dropDownVal=='kg')
                    {ans=data/2.2;}
                    else if (_dropDownValue=='km/hr' && _dropDownVal=='m/s')
                    {ans=(data*5)/18;}
                    else if (_dropDownValue=='m/s' && _dropDownVal=='km/hr')
                    {ans=data*(18/5);}
                    else if (_dropDownValue=='km/hr' && _dropDownVal=='miles/hr')
                    {ans=data*0.62;}
                    else if (_dropDownValue=='miles/hr' && _dropDownVal=='km/hr')
                    {ans=data*1.6;}
                    secval=double.parse(myController2.text);
                    if (ans==secval){
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("VOILA"),
                          );
                        },
                      );
                      bg = Colors.redAccent;
                    }
                    else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("WRONG!!!"),
                          );
                        },
                      );
                      bg = Colors.black;
                      HapticFeedback.heavyImpact();
                    }
                  },
                ),
              ),
            ]
        ),
      ),
      backgroundColor: bg,
    );
  }
}