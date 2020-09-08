import 'package:flutter/material.dart';
import 'package:sigmatenant/services/fetch_json.dart';

class HomePage extends StatelessWidget {
  static final String tag = '/HomePage';

  getDisplayName() async {
    FetchJson fetchJson = FetchJson();
    var data = await fetchJson.getJson();
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
