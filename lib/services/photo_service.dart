import 'package:json_serialization_code_gen/models/image_model.dart';
import 'package:http/http.dart ' as http;
import 'dart:convert';

class PhotoService {
  String url;
  List data = [];
  var response;

  List<ImageModel> imageList = [];

  Future<List<ImageModel>> getPhoto() async {
    url = "https://jsonplaceholder.typicode.com/photos";
    response = await http.get(url);
    data = json.decode(response.body);

    imageList = data.map((e) => ImageModel.fromJson(e)).toList();

    return imageList;
  }
}
