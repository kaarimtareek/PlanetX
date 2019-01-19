import 'package:flutter/material.dart';

 bool _isNumeric(String str) {
    if(str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

class MyPlanet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.indigoAccent.shade200,
        title: new Text(
          "Planet X",
          textDirection: TextDirection.ltr,
        ),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: new Container(
          child: new ListView(
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'lib/my_planet/105planet.png',
                width: 150.0,
                height: 150.0,
              ),
              new Padding(
                padding: EdgeInsets.all(10.0),
              ),
              new PlanetWieght()
            ],
          )
        ],
      )),
    ));
  }
}

class PlanetWieght extends StatefulWidget {
  _PlanetState createState() => _PlanetState();
}

class _PlanetState extends State<PlanetWieght> {
  String stringResult;
  int radioVlaueGroup = 0;
  double result=0.0;
  String _currentPlanet ;
  void calcWieght(String s, double d) {
    if (_isNumeric(s)){
    if(s.isNotEmpty){
      if (int.parse(s) > 0) 
          result = int.parse(s) * d;
          stringResult=null;
    }
    
  }
  else {
    result=0;
    stringResult='Invalid input';
   
  }
  
  }
  void onChangeText(String s){
    setState(() {
          switch (radioVlaueGroup) {
        case 0:
          calcWieght(_planetWieghtControl.text, 0.06);
          _currentPlanet = 'Pluto';
          break;
        case 1:
          calcWieght(_planetWieghtControl.text, 0.38);
          _currentPlanet = 'Mars';
          break;
        case 2:
          calcWieght(_planetWieghtControl.text, 0.91);
          _currentPlanet = 'Venus';
          break;
      }
        });
  }

  void handleRadioChangeValue(int value) {
    setState(() {
      radioVlaueGroup = value;
      switch (radioVlaueGroup) {
        case 0:
          calcWieght(_planetWieghtControl.text, 0.06);
          _currentPlanet = 'Pluto';
          break;
        case 1:
          calcWieght(_planetWieghtControl.text, 0.38);
          _currentPlanet = 'Mars';
          break;
        case 2:
          calcWieght(_planetWieghtControl.text, 0.91);
          _currentPlanet = 'Venus';
          break;
      }
    });
  }

  final TextEditingController _planetWieghtControl =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.0,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new TextField(
            onChanged:onChangeText  ,
            controller: _planetWieghtControl,
            keyboardType: TextInputType.number,
            maxLengthEnforced: true,
            maxLength: 8,
            decoration: InputDecoration(
                hintText: 'Enter Your Wieght on Earth',
                icon: new Icon(Icons.person),
                fillColor: Colors.indigoAccent.shade200),
          ),
          new Padding(padding: EdgeInsets.all(10.0)),
          new Row(
            children: <Widget>[
              new Radio<int>(
                value: 0,
                groupValue: radioVlaueGroup,
                onChanged: handleRadioChangeValue,
              ),
              Text('Pluto'),
              new Radio<int>(
                value: 1,
                groupValue: radioVlaueGroup,
                onChanged: handleRadioChangeValue,
              ),
              Text('Mars'),
              new Radio<int>(
                value: 2,
                groupValue: radioVlaueGroup,
                onChanged: handleRadioChangeValue,
              ),
              Text('Venus')
            ],
          ),
          new Padding(
            padding: EdgeInsets.all(15.0),
          ),
          //Result Text
          new Text(
              stringResult==null?"Your Weight on planet $_currentPlanet is $result":stringResult,
              textAlign: TextAlign.center,
              
              )
        ],
      ),
    );
  }
}
