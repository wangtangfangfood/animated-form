import 'package:dio/dio.dart';

import 'VersionHelper.dart';

class ForceUpdateService {
  final String url;
  final String versionKey;
  ForceUpdateService(this.url, {this.versionKey});
  Dio dio = new Dio();
  bool updateApp = false;

  checkforUpdate() async {
    // VersionHelper.getVersion();
    dio.options.headers = {'content-type': 'application/json'};

    try {
      Response response = await dio.get(url);
      mustUpdate(response);
    } catch (e) {
      print(e);
    }
  }

  mustUpdate(Response response) {
    // VersionHelper.changeUpdateStatus(response.data[versionKey ?? 'version']);
  }
}
