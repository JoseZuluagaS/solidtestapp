import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  File? file;
  ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Picture"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              color: Colors.black12,
              child: file == null
                  ? const Icon(
                      Icons.image,
                      size: 50,
                    )
                  : Image.file(
                      file!,
                      fit: BoxFit.fill,
                    ),
            ),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                getgallery();
              },
              color: Colors.lightBlue,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Take Picture From Gallery",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.photo_library_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                getcamera();
              },
              color: Colors.blue[900],
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Take Picture From Camera",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.camera,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getcamera() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.camera);
    if (img != null) {
      setState(() {
        file = File(img!.path);
      });
    }
  }

  void getgallery() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.gallery);
    if (img != null) {
      setState(() {
        file = File(img!.path);
      });
    }
  }
}
