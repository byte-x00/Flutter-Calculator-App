import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '🧮 Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  var _formulaToCompute = "0";
  Parser p = Parser();

  void _createFormula(String usersInput) {
    setState((){
      _formulaToCompute += usersInput;
    });
    // if(_formulaToCompute==""){
    //   setState((){
    //     _formulaToCompute = usersInput;
    //   });
    // }
    // else {
    //   setState((){
    //     _formulaToCompute += usersInput;
    //   });
    // }
  }

  void _clearFormula(){
    setState((){
      _formulaToCompute="";
    });
  }

  void _backspace(){
    if(_formulaToCompute.isNotEmpty){
      setState((){
        _formulaToCompute = _formulaToCompute.substring(0, _formulaToCompute.length - 1);
      });
    }
  }


  void _getAnswer(){
    if(_formulaToCompute!=""){
      String finalUsersInput = _formulaToCompute;
      finalUsersInput = finalUsersInput.replaceAll('x', '*');
      finalUsersInput = finalUsersInput.replaceAll('÷', '/');
      Expression exps = p.parse(finalUsersInput);
      ContextModel conM = ContextModel();
      double result = exps.evaluate(EvaluationType.REAL, conM);
      setState((){
        _formulaToCompute = result.toString();
      });
    }
  }

  BoxDecoration myContainerDeco() {
    return BoxDecoration(
      border: Border.all(
        width: 10,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Text(widget.title, style: const TextStyle(color: Colors.black),),
      // ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 7,),
              child: const Text("🧮 Calculator", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
            // Text("🧮 Calculator", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black26,
                  )
                ),
              ),
              width: MediaQuery.of(context).size.width-20,
              height: 140,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Text(_formulaToCompute,
                  style: const TextStyle(fontSize: 60),
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
              )
              // color: Colors.red,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton(onPressed: _clearFormula,
                  style: TextButton.styleFrom(
                    primary: Colors.black26,
                    // backgroundColor: Colors.black26,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)
                    )
                  ), child: const Text("AC", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),
                TextButton(onPressed: _backspace,
                  style: TextButton.styleFrom(
                      primary: Colors.black26,
                      // backgroundColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ), child: const Text("del", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),
                TextButton(onPressed: (){  },
                  style: TextButton.styleFrom(
                      primary: Colors.black26,
                      // backgroundColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ), child: const Text("%", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),
                TextButton(onPressed: (){ _createFormula("÷"); },
                  style: TextButton.styleFrom(
                      // primary: Colors.black26,
                      // backgroundColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ), child: const Text("÷", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton(onPressed: (){ _createFormula("7"); },
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      // backgroundColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ), child: const Text("7", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),
                TextButton(onPressed: (){ _createFormula("8"); },
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      // backgroundColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ), child: const Text("8", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),
                TextButton(onPressed: (){ _createFormula("9"); },
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      // backgroundColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ), child: const Text("9", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),
                TextButton(onPressed: (){ _createFormula("x"); },
                  style: TextButton.styleFrom(
                    // primary: Colors.black26,
                    // backgroundColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ), child: const Text("x", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton(onPressed: (){ _createFormula("4"); },
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      // backgroundColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ), child: const Text("4", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),
                TextButton(onPressed: (){ _createFormula("5"); },
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      // backgroundColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ), child: const Text("5", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),
                TextButton(onPressed: (){ _createFormula("6"); },
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      // backgroundColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ), child: const Text("6", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),
                TextButton(onPressed: (){ _createFormula("-"); },
                  style: TextButton.styleFrom(
                    // primary: Colors.black26,
                    // backgroundColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ), child: const Text("-", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton(onPressed: (){ _createFormula("1"); },
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      // backgroundColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ), child: const Text("1", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),
                TextButton(onPressed: (){ _createFormula("2"); },
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      // backgroundColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ), child: const Text("2", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),
                TextButton(onPressed: (){ _createFormula("3"); },
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      // backgroundColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ), child: const Text("3", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),
                TextButton(onPressed: (){ _createFormula("+"); },
                  style: TextButton.styleFrom(
                    // primary: Colors.black26,
                    // backgroundColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ), child: const Text("+", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton(onPressed: (){},
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      // backgroundColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ), child: const Text("", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),
                TextButton(onPressed: (){ _createFormula("0"); },
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      // backgroundColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ), child: const Text("0", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),
                TextButton(onPressed: (){ _createFormula(""); },
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      // backgroundColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ), child: const Text("", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),
                TextButton(onPressed: _getAnswer,
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ), child: const Text("=", style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),),
                ),

              ],
            ),
            const SizedBox(
              height: 0,
            )
          ],
        ),
      )
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
