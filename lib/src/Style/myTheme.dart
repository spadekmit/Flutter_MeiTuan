import 'package:flutter/material.dart';

const GradeTextStyle = TextStyle(color: Colors.orange, fontSize: 12.0);
const BehindGradeTextStyle = TextStyle(fontSize: 12.0);
const CardTitleTextStyle = TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold);

const GradientDecoration = BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color.fromARGB(50, 200, 200, 200)]
          )
        );