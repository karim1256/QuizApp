import 'package:flutter/material.dart';
import 'package:quizapp/color.dart';
import 'package:quizapp/result.dart';

class exam extends StatelessWidget {
  const exam({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
      backgroundColor: const Color.fromARGB(255, 19, 18, 18),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 49, 46, 46),
        title: const Text(
          "QuizApp",
          style: TextStyle(
            color: dark1,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 18,
            ),
            Container(
              width: 85,
              height: 45,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 49, 46, 46),
                borderRadius: BorderRadius.circular(18),
              ),
              alignment: Alignment.center,
              child: Text(
                " ${ECounter + 1} of ${QCounter} ",
                style: const TextStyle(
                  color: dark1,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.only(right: 10, left: 25, top: 30),
              width: 300,
              height: 135,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 49, 46, 46),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Stack(
                children: [
                  Text(
                    data[ECounter][0],
                    style: const TextStyle(
                      color: dark1,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
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
                controller: examAnswer,
              ),
            ),
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
                print(ECounter);
                if (ECounter + 1 == QCounter) {
                  Error.add(ECounter);

                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(),
                      ),
                    );
                  });
                } else if (data[ECounter][1] == examAnswer.text) {
                  result++;
                } else {
                  Error.add(ECounter);
                  print(Error);
                }

                setState(() {
                  ++ECounter;
                  examAnswer.clear();
                });
              },
              child: const Text(
                "Next Questions",
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
