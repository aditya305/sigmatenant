import 'package:flutter/material.dart';
import 'package:flutter_app/services/fetchData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Sigma Tenant'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FetchData fetchData = FetchData();
  Future<void> futureContent;
  List<Content> contentData = <Content>[];

  Future<void> getContent() async {
    var data = await fetchData.getData();
    if (contentData.isEmpty) {
      for (int i = 0; i < 5; i++) {
        contentData.add(
          Content(
            displayName: data["tags"][i]["displayName"],
            description: data["tags"][i]["description"],
            tags: data["tags"][i]["meta"],
          ),
        );
      }
    }
    print(contentData);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureContent = getContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: futureContent,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text("None");
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return ListView.builder(
                shrinkWrap: true,
                itemCount: contentData.length,
                padding: EdgeInsets.all(20.0),
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: AnimatedContainer(
                      color: Colors.white,
                      duration: Duration(
                        milliseconds: 200,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                padding: EdgeInsets.all(7.0),
                                child: Text(
                                  contentData[index].displayName ?? "",
                                  style: TextStyle(
                                    color: Color(0xffa63d66),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 2.0), //(x,y)
                                      blurRadius: 0.5,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                child: Text(
                                  contentData[index].tags ?? "",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                child: Text(
                                  contentData[index].description ?? "",
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                child: Text(
                                  "Spaces",
                                  style: TextStyle(
                                    color: Color(0xffa63d66),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
              return ListView.builder(
                shrinkWrap: true,
                itemCount: contentData.length,
                padding: EdgeInsets.all(20.0),
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: AnimatedContainer(
                      color: Colors.white,
                      duration: Duration(
                        milliseconds: 200,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                padding: EdgeInsets.all(7.0),
                                child: Text(
                                  contentData[index].displayName ?? "",
                                  style: TextStyle(
                                    color: Color(0xffa63d66),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 2.0), //(x,y)
                                      blurRadius: 0.5,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                child: Text(
                                  contentData[index].tags ?? "",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                child: Text(
                                  contentData[index].description ?? "",
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                child: Text(
                                  "Spaces",
                                  style: TextStyle(
                                    color: Color(0xffa63d66),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
          }
          return Container();
        },
      ),
    );
  }
}

class Content {
  final String displayName;
  final String description;
  final String tags;

  Content({this.displayName, this.description, this.tags});
}
