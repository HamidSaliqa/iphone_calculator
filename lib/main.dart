import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String number = "0", result = "0";

  onpressedButton(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        number = "0";
        result = "0";
      } else if (buttonText == "=") {

      } else {
        if (number == "0") {
          number = buttonText;
        } else {
          number += buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white30,
        body: Center(
          ///main colmun
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /// for number or result
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(20, 20, 40, 50),
                child: Text(
                  number,
                  style: TextStyle(fontSize: 38),
                ),
              ),

              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(10, 20, 40, 50),
                child: Text(
                  result,
                  style: TextStyle(fontSize: 38),
                ),
              ),

              ///first row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///AC
                  mycircleButton(
                      name: "AC",
                      onpressed: () {
                        setState(() {
                          onpressedButton("AC");
                        });
                      },
                      color: Colors.grey),
                  mycircleButton(
                      name: "+/-", onpressed: () {}, color: Colors.grey),
                  mycircleButton(
                      name: "%", onpressed: () {}, color: Colors.grey),
                  mycircleButton(
                      name: "/",
                      onpressed: () {
                        onpressedButton("/");
                      },
                      color: Colors.orange),
                ],
              ),

              ///second Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  mycircleButton(
                      name: "7",
                      onpressed: () {
                        onpressedButton("7");
                      }),
                  mycircleButton(
                      name: "8",
                      onpressed: () {
                        onpressedButton("8");
                      }),
                  mycircleButton(
                      name: "9",
                      onpressed: () {
                        onpressedButton("9");
                      }),
                  mycircleButton(
                      name: "*",
                      onpressed: () {
                        onpressedButton("*");
                      },
                      color: Colors.orange),
                ],
              ),

              ///3th row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  mycircleButton(
                      name: "4",
                      onpressed: () {
                        onpressedButton("4");
                      }),
                  mycircleButton(
                      name: "5",
                      onpressed: () {
                        onpressedButton("5");
                      }),
                  mycircleButton(
                      name: "6",
                      onpressed: () {
                        onpressedButton("6");
                      }),
                  mycircleButton(
                      name: "-",
                      onpressed: () {
                        onpressedButton("-");
                      },
                      color: Colors.orange),
                ],
              ),

              ///4th row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  mycircleButton(
                      name: "1",
                      onpressed: () {
                        onpressedButton("1");
                      }),
                  mycircleButton(
                      name: "2",
                      onpressed: () {
                        onpressedButton("2");
                      }),
                  mycircleButton(
                      name: "3",
                      onpressed: () {
                        onpressedButton("3");
                      }),
                  mycircleButton(
                      name: "+",
                      onpressed: () {
                        setState(() {
                          onpressedButton("+");
                        });
                      },
                      color: Colors.orange),
                ],
              ),

              ///5th row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: ElevatedButton(
                        onPressed: () {
                          onpressedButton("0");
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "0",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)))),
                            fixedSize: MaterialStatePropertyAll(Size(0, 60)),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white30)),
                      ),
                    ),
                  ),
                  mycircleButton(name: ".", onpressed: () {}),
                  mycircleButton(name: "=", onpressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class mycircleButton extends StatelessWidget {
  final String name;
  final Function? onpressed;
  Color color;

  mycircleButton(
      {required this.name,
      required this.onpressed,
      this.color = Colors.white30});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 100,
        height: 80,
        margin: EdgeInsets.only(top: 5, bottom: 10),

        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        // margin: EdgeInsets.all(15),
        child: ElevatedButton(
          onPressed: () {
            onpressed!();
          },
          child: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(CircleBorder()),
              backgroundColor: MaterialStatePropertyAll(color)),
        ),
      ),
    );
  }
}
