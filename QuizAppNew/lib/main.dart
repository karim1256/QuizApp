import 'package:flutter/material.dart';
import 'package:quizapp/color.dart';
import 'package:quizapp/exam.dart';
import 'package:quizapp/result.dart';

void main() {
  runApp(getQu());
}

class getQu extends StatelessWidget {
  const getQu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark2,
      appBar: AppBar(
        backgroundColor: dark1,
        title: const Text(
          "quiz app",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(244, 49, 48, 48),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Text(
              k,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: k == QuationErorr ? Colors.red : dark1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 330,
              child: TextField(
                style: TextStyle(color: dark1),
                maxLines: 1,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.question_answer),
                    border: OutlineInputBorder()),
                controller: question,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 330,
              child: TextField(
                style: TextStyle(color: dark1),
                maxLines: 1,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.question_answer),
                    border: OutlineInputBorder()),
                controller: answer,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
                color: dark1,
                textColor: dark2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minWidth: 120,
                height: 50,
                onPressed: () {
                  if (question.text.isEmpty || answer.text.isEmpty) {
                    setState(() {
                      k = QuationErorr;
                    });
                  } else {
                    List<String> d = [question.text, answer.text];
                    data.add(d);
                    QCounter = data.length;
                    print(data);
                    print(QCounter);
                    question.clear();
                    answer.clear();
                    setState(() {
                      k = WriteQuation;
                    });
                  }
                },
                child: const Text(
                  "add",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
              color: dark1,
              disabledColor: Colors.grey,
              textColor: dark2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minWidth: 120,
              height: 50,
              onPressed: () {
                if (QCounter != 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => exam(),
                    ),
                  );
                } else {
                  setState(() {
                    k = QuationErorr;
                  });
                }
              },
              child: const Text(
                "Start Quiz",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
