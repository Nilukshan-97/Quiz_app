import 'package:Quizapp_tamil/Question.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var score = 0;
  var n = 0;

  List que_list = [
    Questions("1.MS Word is a hardware.", false),
    Questions("2.CPU Controls only input data of computer.", false),
    Questions("3.CPU Stands for Central Processing Unit.", true),
    Questions(
        "4.Freeware is software that is available for use at no monetary cost...",
        true),
  ];

  void checkAnswer(bool choice, BuildContext ctx) {
    if (choice == que_list[n].ans) {
      //debugPrint("Correct");
      score = score + 1;
      final snackbar = SnackBar(
        content: Text("Correct Answer"),
        duration: Duration(microseconds: 1000),
        backgroundColor: Colors.green,
      );
      Scaffold.of(ctx).showSnackBar(snackbar);
    } else {
      debugPrint("Wrong");
      final snackbar = SnackBar(
        content: Text("Wrong Answer"),
        duration: Duration(microseconds: 1000),
        backgroundColor: Colors.red,
      );
      Scaffold.of(ctx).showSnackBar(snackbar);
    }
    setState(() {
      if (n < que_list.length - 1) {
        n = n + 1;
      } else {
        final snackbar = SnackBar(
          content: Text("Quiz Completed Score $score/4"),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.blue,
        );
        Scaffold.of(ctx).showSnackBar(snackbar);
        reset();
      }
    });
  }

  void reset() {
    setState(() {
      n = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Simple Quiz"),
        centerTitle: true,
      ),
      body: Builder(
        builder: (ctx) => Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Score: $score/4",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  InkWell(
                    onTap: () => reset(),
                    child: Text(
                      "Reset",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: Colors.brown),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        que_list[n].que,
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => checkAnswer(true, ctx),
                    child: Text(
                      "True",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  RaisedButton(
                    onPressed: () => checkAnswer(false, ctx),
                    child: Text(
                      "False",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
