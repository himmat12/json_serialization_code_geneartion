import 'package:flutter/material.dart';
import 'package:json_serialization_code_gen/models/image_model.dart';
import 'package:json_serialization_code_gen/services/photo_service.dart';

class Galleryage extends StatefulWidget {
  @override
  _GalleryageState createState() => _GalleryageState();
}

class _GalleryageState extends State<Galleryage> {
  PhotoService photoService = PhotoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
      ),
      body: FutureBuilder(
        future: photoService.getPhoto(),
        builder: (context, snapshot) {
          List<ImageModel> imageList = snapshot.data;

          return snapshot.hasError
              ? Center(
                  child: Text("404 error"),
                )
              : snapshot.connectionState != ConnectionState.done
                  ? LinearProgressIndicator()
                  : GridView.builder(
                      itemCount: imageList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Image.network(imageList[index].url);
                      },
                    );
        },
      ),
    );
  }
}
