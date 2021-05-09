import 'package:dio/dio.dart';

class ApiRequests {
  final Dio _dio = new Dio();
  ApiRequests({String jwtAuth}) {
    if (jwtAuth != null) {
      _dio.options.headers["Authorization"] = "Bearer $jwtAuth";
    }
  }

  getRequest(String url) async {
    var response;

    try {
      response = await _dio.get(url);
      return response;
    } on DioError catch (e) {
      return {
        "status": 0,
        "error": e?.response?.statusMessage,
      };
    } catch (e) {
      print(e);
      return null;
    }
  }

  postRequest(String url, Map data) async {
    try {
      Response response = await _dio.post(url, data: data);
      return response;
    } on DioError catch (e) {
      return {
        "status": 0,
        "error": e?.response?.statusMessage,
      };
    } catch (e) {
      print(e);
      return null;
    }
  }

  putRequest(String url, var data) async {
    try {
      Response response = await _dio.put(url, data: data);
      return response;
    } on DioError catch (e) {
      return {
        "status": 0,
        "error": e?.response?.statusMessage,
      };
    } catch (e) {
      print(e);
      return null;
    }
  }
}
