import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import '../service/api.dart';

class Post {
  int? id;
  String? fullname;
  String? email;
  String? mobile;

  Post({this.id, this.fullname, this.email, this.mobile});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json["id"],
        fullname: json["fullname"],
        email: json["email"],
        mobile: json["mobile"]);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fullname'] = fullname;
    map['email'] = email;
    map['mobile'] = mobile;
    return map;
  }

  // static Future<List<Post>> getPosts(http.Client client) async {
  //   // ignore: unused_local_variable
  //   final response = await client.get(Uri.parse(
  //       BASEURL)); //ham await de ho tro gui request len server, dong thoi dam bao request nay thuc hien xong thi moi toi cac ham khac
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> mapResponse = json.decode(response.body);
  //     if (mapResponse["message"] == "all user data") {
  //       log('run');
  //       final todos = mapResponse["data"].cast<Map<String, dynamic>>();
  //       final listOfTodos = await todos.map<Post>((json) {
  //         return Post.fromJson(json);
  //       }).toList();
  //       return listOfTodos;
  //     } else {
  //       return [];
  //     }
  //   } else {
  //     throw Exception('Failed to load Todo from the Internet');
  //   }
  // }
}

List<Post> postFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<Post>.from(str.map((item) {
    return Post.fromJson(item);
  }));
}

String postToJson(Post data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
