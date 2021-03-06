import 'dart:io';
import 'package:camera_camera/camera_camera.dart';
import 'package:camera_flutter/preview_page.dart';
import 'package:camera_flutter/widgets/anexo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? arquivo;
  final picker = ImagePicker();

  Future getFileFromGallery() async {
    final file = await picker.getImage(source: ImageSource.gallery);

    if(file != null) {
      setState(() => arquivo = File(file.path));
    }
  }

  showPreview(file) async {
    File? arq = await Get.to(() => PreviewPage(file: file));

    if (file != null) {
      setState(() => arquivo = arq);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CapturaPhoto'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ignore: unnecessary_null_comparison
                if (arquivo != null) Anexo(arquivo: arquivo!),
                ElevatedButton.icon(
                  onPressed: () => Get.to(
                    () => CameraCamera(onFile: (file) => showPreview(file)),
                  ),
                  icon: Icon(Icons.camera_alt),
                  label: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Tire uma foto'),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      textStyle: TextStyle(
                        fontSize: 18.0,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'ou',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                OutlinedButton.icon(
                  icon: Icon(Icons.attach_file),
                  label: Text(
                    'Selecione um arquivo',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () => getFileFromGallery(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
