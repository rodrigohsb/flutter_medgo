import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../domain/lesson.dart';

Widget row(Lesson lesson) => Column(
      children: <Widget>[
        Image.network(""),
        Container(height: 8.0),
        Text(lesson.title)
      ],
    );
