import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:nasa_demo/model/nasa.dart';
import 'package:http/http.dart' as http;

class NasaProvider extends ChangeNotifier {
  Nasa nasa = Nasa();

  get getNasaData async {
     await getSingleData().then((value) {
      nasa = value;
    });
    notifyListeners();
  }

  Nasa get finalData {
    return nasa;
  }

  Future<Nasa> getSingleData() async {
    var result;
    try {
      final response = await http.get(
        Uri.parse("https://mocki.io/v1/c6cfff35-a945-427b-a002-430d03799399"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = Nasa.fromJson(item);
      } else {
        print("Not Found !!!!!!!");
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }
}
