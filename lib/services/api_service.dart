import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/music_data_model.dart';

class APIService {
  Future<MusicDataResponseModel> musicData() async {
    final queryParameters = {
      'term': 'radiohead',
    };
    final url = Uri.https('itunes.apple.com', '/search', queryParameters);
    print(url);

    final response = await http.get(
      url,
    );
    print('Response ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      print(url);
      return MusicDataResponseModel.fromJson(json.decode(response.body));
    } else {
      throw CustomError(apiResponseCode: response.statusCode);
    }
  }
}

class CustomError implements Exception {
  int apiResponseCode;

  CustomError({required this.apiResponseCode});
}
