import 'package:flutter/material.dart';
import 'package:quizapp/main.dart';
import 'package:quizapp/color.dart';
import 'package:quizapp/exam.dart';

void main() {
  runApp(ResultPage());
}

class ResultPage extends StatelessWidget {
  ResultPage({Key? key}) : super(key: key);

  Widget ListErrors() {
    if (Error.isEmpty) {
      return const Text(
        "You don't have any errors",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: Error.map((i) {
          return Text(
            "question ${i + 1} Answer ${data[i][1]}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          );
        }).toList(),
      );
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: dark1,
          appBar: AppBar(
            backgroundColor: dark2,
            title: Text(
              "Result",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Stack(alignment: Alignment.topCenter, children: [
                  Container(
                    margin: const EdgeInsets.only(top: 22),
                    padding:
                        const EdgeInsets.only(right: 10, left: 25, top: 30),
                    width: 300,
                    height: 350,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 49, 46, 46),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    child: Text(
                      result > QCounter / 2 ? 'You Succeed' : "You Failed",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 88,
                    child: Text(
                      " Result: ${result} / ${QCounter}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(top: 145, child: ListErrors())
                ]),
                SizedBox(
                  height: 25,
                ),
                Row(children: <Widget>[
                  SizedBox(
                    width: 30,
                  ),
                  MaterialButton(
                    color: Colors.grey,
                    disabledColor: Colors.grey,
                    textColor: dark1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minWidth: 100,
                    height: 50,
                    onPressed: () {
                      ECounter = 0;
                      Error.clear();
                      result = 0;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => exam(),
                        ),
                      );
                    },
                    child: const Text(
                      "Reapate Quiz",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                    minWidth: 150,
                    color: Colors.grey,
                    disabledColor: Colors.grey,
                    textColor: dark1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    onPressed: () {
                      ECounter = 0;
                      QCounter = 0;
                      data.clear();
                      Error.clear();
                      result = 0;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => getQu(),
                        ),
                      );
                    },
                    child: const Text(
                      "New Quiz",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ));
  }
}
