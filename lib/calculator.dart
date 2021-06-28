import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

// Calculator App made by Saleheen Noor.

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  dynamic calculationOutput = '';

  Widget button(var txt, Color btnColor, Color txtColor) {
  return Container(
    child: ElevatedButton(
      onPressed: (){
        setState(() {
          calculationOutput = calculationOutput + txt;
        });
      },
      child: Text(txt, 
        style: TextStyle(
          fontSize: 30,
          color: txtColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(24),
        primary: btnColor,
      ),
    ),
  );
}

clear(){
 setState(() {
   calculationOutput = '';
 });
}

delete(){
  dynamic characters = calculationOutput;
  List int = [];
  for (var i = 0; i < characters.length; i++){
    int.add(characters[i]);
  }
  int.removeLast();
  var minus = int.join();
  setState(() {
   calculationOutput = minus;
 });
}

calculationResult(){
  Parser cal = Parser();
  Expression exp = cal.parse(calculationOutput);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  setState((){
    calculationOutput = eval.toString();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: (calculationOutput == '')
                  ? Text('0',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 60,
                    ),
                  )
                  :
                  Text(calculationOutput,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 60,
                    ),
                  ),
                ),
              ),
            ],
          ),       
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // button('C', Colors.white, Colors.teal),
              ElevatedButton(
                onPressed: clear,
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(24),
                  primary: Colors.white,
                ),
                child: Align(
                  alignment: Alignment.center,
                    child: Text('C',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.teal
                      ),
                  ),
                )
              ),
              // button("<-", Colors.white, Colors.teal),
              ElevatedButton(
                onPressed: delete,
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(24),
                  primary: Colors.white,
                ),
                child: Align(
                  alignment: Alignment.center,
                    // child: Text('<-',
                    // style: TextStyle(
                    //   fontSize: 30,
                    //   color: Colors.teal
                    //   ),
                    // ),
                    child: Row(
                    children: <Widget>[
                      Text('', style: TextStyle(color: Colors.white),),
                      Icon(Icons.backspace, color: Colors.teal,),
                    ],
                  ),
                )
              ),
              button("%", Colors.white, Colors.teal),
              button("/", Colors.teal, Colors.white)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              button("7", Colors.white, Colors.teal),
              button("8", Colors.white, Colors.teal),
              button("9", Colors.white, Colors.teal),
              button("*", Colors.teal, Colors.white)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              button("4", Colors.white, Colors.teal),
              button("5", Colors.white, Colors.teal),
              button("6", Colors.white, Colors.teal),
              button("+", Colors.teal, Colors.white)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              button("1", Colors.white, Colors.teal),
              button("2", Colors.white, Colors.teal),
              button("3", Colors.white, Colors.teal),
              button("-", Colors.teal, Colors.white)
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                button("0", Colors.white, Colors.teal),
                button(".", Colors.white, Colors.teal),
                ElevatedButton(
                  onPressed: calculationResult,
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
                    primary: Colors.teal,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                      child: Text('=',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white
                        ),
                    ),
                  )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}