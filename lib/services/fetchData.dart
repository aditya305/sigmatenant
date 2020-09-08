import 'package:flutter_app/services/networkHelper.dart';

class FetchData {
  Future<dynamic> getData() async {
    NetworkHelper networkHelper =
        NetworkHelper("https://sigmatenant.ml/mobile/tags");
    var data = networkHelper.getData();
    return data;
  }
}
