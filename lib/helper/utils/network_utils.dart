import 'package:dio/dio.dart';

class NetworkUtils {
  static const String _baseUrl = "https://reqres.in/api/";

  static final Dio dio = Dio();

  static _fetchData({String? url}) async {
    url = url ?? "";
    url = _baseUrl + url;
    Response response = await dio.get(url);
    return response;
  }

  static getUsers() async{
    Response response =await _fetchData(url: "users?page=1");
    return response;
  }
}
