import 'package:cruddemo_2/src_new/config/base_url.dart';
import 'package:cruddemo_2/src_new/model/Data.dart';
import 'package:cruddemo_2/src_new/service/network_utils.dart';
import 'package:cruddemo_2/src_new/service/rest_client.dart';
import 'package:logger/logger.dart';

class ApiPresenter {
  var logger = Logger();
  final client =
      RestClient(NetworkUtils.getDioClientConfiguration(BaseUrl.baseUrl));

  Future<List<Data>?> getData() async {
    List<Data>? data;
    try {
      await client.getData().then((value) {
        data = value.data;
      });
      return data;
    } catch (e) {
      logger.e("Error log $e");
    }
  }

  Future<bool> postData(Data data) async {
    try {
      await client.postData(data).then((value) => print('check $value'));
      return true;
    } catch (e) {
      logger.e("Error log $e");
      return false;
    }
  }
}
