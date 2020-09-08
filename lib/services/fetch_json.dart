import 'package:sigmatenant/services/networking.dart';

class FetchJson {
  Future<dynamic> getJson() async {
    NetworkHelper networkHelper =
        NetworkHelper("https://sigmatenant.ml/mobile/tags");
    var tagData = await networkHelper.getData();
    return tagData;
  }
}
