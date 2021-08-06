import 'dart:io';

import 'package:flutter/material.dart';

class Anexo extends StatefulWidget {
  final File arquivo;

  Anexo({Key? key, required this.arquivo}) : super(key: key);

  @override
  _AnexoState createState() => _AnexoState();
}

class _AnexoState extends State<Anexo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 24
      ),
      child: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.file(
              widget.arquivo, 
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
