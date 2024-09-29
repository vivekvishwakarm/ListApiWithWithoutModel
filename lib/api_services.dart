import 'dart:convert';
import 'package:list_data_api/list_post_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  //ListApiWithModel
  Future<List<ListPostApi>?> getPostWithModel() async {
    try {
      final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        List<ListPostApi> model = List<ListPostApi>.from(
          json.decode(response.body).map(
                (x) => ListPostApi.fromJson(x),
              ),
        );
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  //ListApiWithoutModel
  Future<dynamic> getPostWithoutModel() async {
    try {
      final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        final model = jsonDecode(response.body);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
