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
  final response = await http.post(Uri.parse('https://run.mocky.io/v3/c97b3cab-4586-4813-a15a-39997a0791e3'),body:post.toJson());
  print(response.statusCode);
  if(response.statusCode==201){
    return false;
  }
  else{
    return true;
  }
}

 static Future<List<Data>?> getPosts() async{
    ///TODO khởi tạo đối tượng
    List<Data> ?data;
    try{
      ///Gửi yêu cầu HTTP GET với các tiêu đề đã cho đến URL đã cho.
      ///Khởi tạo 1 client và đóng khi nó hoàn thành
      final response = await http.get(Uri.parse('https://run.mocky.io/v3/61e63fd5-dd51-4c58-b424-ec2a5720828a'));
      ///Phân tích cú pháp chuỗi và trả về đối tượng Json kết quả.
      Map<String, dynamic> mapResponse = json.decode(response.body);
      ///Json to object
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