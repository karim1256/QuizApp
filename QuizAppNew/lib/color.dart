import 'dart:js';

import 'package:flutter/material.dart';
import 'package:quizapp/color.dart';
import 'package:quizapp/exam.dart';
import 'package:quizapp/main.dart';

const Color dark1 = Color(0xFF000000);
const Color dark2 = Color.fromARGB(40, 158, 158, 158);
const Color dark3 = Color(0xFF000000);
List<List> data = [];
List<int> Error = [];
int QCounter = 0;
int ECounter = 0;
int result = 0;
String WriteQuation = "question & Answer";
String QuationErorr = "Must Type a Questions !!";
String k = WriteQuation;

TextEditingController question = TextEditingController();
TextEditingController answer = TextEditingController();
TextEditingController examAnswer = TextEditingController();
dynamic? _onStartQuizPressed;
