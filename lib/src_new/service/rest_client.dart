
import 'package:cruddemo_2/src_new/model/Data.dart';
import 'package:cruddemo_2/src_new/model/Post_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/61e63fd5-dd51-4c58-b424-ec2a5720828a")
  Future<PostModel> getData();

  @POST("/c97b3cab-4586-4813-a15a-39997a0791e3")
  Future<PostModel> postData(@Body() Data data);

}