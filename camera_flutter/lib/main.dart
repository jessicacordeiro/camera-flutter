import 'package:camera_flutter/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(CapturaPhotos());
}

class CapturaPhotos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Camera Demo',
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
      ),
      home: HomePage()
    );
  }
}
