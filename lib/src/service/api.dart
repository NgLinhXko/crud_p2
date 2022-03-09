import 'package:cruddemo_2/src/domain/Post.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../domain/Post.dart';
import 'dart:convert';
import 'dart:developer';

import '../model/Data.dart';
import '../model/Post_model.dart';
const SERVER_NAME = "192.168.1.25";
const BASEURL = "http://$SERVER_NAME:3000/user";

class API{
  static Future<bool> createPost(Data post) async{
  final response = await http.post(Uri.parse(BASEURL),body:post.toJson());
  print(response.statusCode);
  if(response.statusCode==200){
    return true;
  }
  else{
    return false;
  }
}

  static Future<List<Data>?> getPosts() async{
    List<Data> ?data;
    try{
      final response = await http.get(Uri.parse(BASEURL));
      Map<String, dynamic> mapResponse = json.decode(response.body);
      PostModel postModel=PostModel.fromJson(mapResponse);
      data=postModel.data;
      return data;
    }catch(e){
      print('error $e');
      return null;

    }

//   if(response.statusCode == 200){
//
//     Map<String, dynamic> mapResponse = json.decode(response.body);
//     if(mapResponse["message"] == "all user data"){
//       log('run');
//       final todos = mapResponse["data"].cast<Map<String, dynamic>>();
//       final listOfTodos =  await todos.map<Todo>((json){
//         return Todo.fromJson(json);
//       }).toList();
//       return listOfTodos;
//     }else{
//       return [];
//     }
//   }else{
//     throw Exception('Failed to load Todo from the Internet');
//   }
// }
  }
}