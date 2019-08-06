import 'dart:math';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wx_reader/utils/styles.dart';
import 'package:wx_reader/view/book_details.dart';
import 'package:wx_reader/utils/static_values.dart';
import 'package:wx_reader/model/book.dart';

class DiscoverPage extends StatefulWidget {
  DiscoverPage() : super(key: Key(Random().nextDouble().toString()));

  @override
  State<StatefulWidget> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  Pop _pop;
  RecommendList _recommendList;
  ShowcaseList _showcaseList;
  bool isLoading = false;

  initState() {
    _load();
  }

  _load() async {
    setState(() {
      isLoading = true;
    });

    var httpClient = HttpClient();
    try {
      var request = await httpClient.getUrl(Uri.parse(serverPath + '/app/explorer/'));
      var response = await request.close();

      var json = await response.transform(utf8.decoder).join();
      var data = jsonDecode(json);
      print(data);
      setState(() {
          isLoading = false;
         _pop = Pop.fromJson(data['pop']);
         _recommendList = RecommendList.fromJson(data['recommend']);
         _showcaseList = ShowcaseList.fromJson(data['showcase']);
      });

    }
    catch(exception) {
      print('exception: ' + exception.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = <Widget>[
      Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          child: Stack(
            children: <Widget>[
              FractionallySizedBox(
                alignment: Alignment.center,
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: (_pop != null)?Image.network(
                    serverPath + _pop.background,
                ):Image.asset('static/img/dummy.png', fit: BoxFit.fill,)
              ),
              Positioned(
                top: 16.0,
                left: 16.0,
                child: Text((_pop != null)?_pop.title:"",
                  style: posterTitleTextStyle,
                ),
              ),

              Positioned(
                top: 48.0,
                left: 16.0,
                child: Text((_pop != null)?_pop.subtitle:"",
                  style: posterSubTitleTextStyle,
                ),
              ),

            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                child: Text('为你推荐',
                  style: posterTitleTextStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                child: Text('根据你的阅读历史计算，每日更新',
                  style: posterSubTitleTextStyle,
                ),
              ),

              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Table(
                    columnWidths: <int, TableColumnWidth> {
                      0: FractionColumnWidth(0.5),
                      1: FractionColumnWidth(0.5),
                    },
                    children: <TableRow> [
                      TableRow(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) => BookDetailsPage(id: _recommendList.list[0].id))
                              );
                            },
                            child: Container(
                              height: 240.0,
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 180.0,

                                      child: (_recommendList != null)?Image.network(
                                        serverPath + _recommendList.list[0].cover,
                                        fit: BoxFit.fill,
                                        ):Image.asset('static/img/dummy.png', fit: BoxFit.fill,),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 4.0, 0, 0),
                                      child: Text(
                                        (_recommendList != null)?_recommendList.list[0].name:"",
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) => BookDetailsPage(id: _recommendList.list[1].id))
                              );
                            },
                            child: Container(
                              height: 240.0,
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 180.0,
                                      child: (_recommendList != null)?Image.network(
                                        serverPath + _recommendList.list[1].cover,
                                        fit: BoxFit.fill,
                                      ):Image.asset('static/img/dummy.png', fit: BoxFit.fill,),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 4.0, 0, 0),
                                      child: Text(
                                        (_recommendList != null)?_recommendList.list[1].name:"",
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) => BookDetailsPage(id: _recommendList.list[2].id))
                              );
                            },
                            child: Container(
                              height: 240.0,
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 180.0,
                                      child: (_recommendList != null)?Image.network(
                                        serverPath + _recommendList.list[2].cover,
                                        fit: BoxFit.fill,
                                      ):Image.asset('static/img/dummy.png', fit: BoxFit.fill,),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 4.0, 0, 0),
                                      child: Text(
                                        (_recommendList != null)?_recommendList.list[2].name:"",
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) => BookDetailsPage(id: _recommendList.list[3].id))
                              );
                            },
                            child: Container(
                              height: 240.0,
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 180.0,
                                      child: (_recommendList != null)?Image.network(
                                        serverPath + _recommendList.list[3].cover,
                                        fit: BoxFit.fill,
                                      ):Image.asset('static/img/dummy.png', fit: BoxFit.fill,),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 4.0, 0, 0),
                                      child: Text(
                                        (_recommendList != null)?_recommendList.list[3].name:"",
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
              ),
            ],
          ),

        ),
      ),

    ];

    if(_showcaseList != null) {
      for(Showcase showcase in _showcaseList.list) {
        pageList.add(Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
              child: Column(
                children: <Widget>[
                  Image.network(serverPath + showcase.banner,
                    fit: BoxFit.fill,
                    height: 260.0,
                  ),
                  ListTile(
                    leading: Image.network(
                      serverPath + showcase.leading,
                      width: 48.0,
                      height: 48.0,
                    ),
                    title: Text(showcase.title),
                    trailing: RaisedButton(
                      onPressed: () {
                      }, child: Text('领取')),
                    isThreeLine: false,
                  ),

                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(showcase.trailing),
                    ),
                  ),
                ],
              )
          ),
        ));
      }
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('探索'),
      ),
      child: Stack(
        children: <Widget>[
          DefaultTabController(
              length: pageList.length,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 48.0, 0, 0),
                  child: TabBarView(children: pageList)
              )
          ),
          Opacity(
            opacity: isLoading? 1.0: 0.0,
            child: Center(
              child: CupertinoActivityIndicator(
                radius: 18.0,
                animating: isLoading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageItem {
  const PageItem({this.title});
  final String title;
}

class Pop {
  String title = '';
  String subtitle = '';
  String background = '';
  String url = '';

  Pop({this.title, this.subtitle, this.background, this.url});

  factory Pop.fromJson(Map<String, dynamic> json) {
    return Pop(
      title: json['title'],
      subtitle: json['subtitle'],
      background: json['background'],
      url: json['url'],
    );
  }

}

class RecommendList {
  List<Book> list = [];

  RecommendList({this.list});

  factory RecommendList.fromJson(List<dynamic> json) {
    List<Book> list = json.map((i)=>Book.fromJson(i)).toList();

    return new RecommendList(
        list: list
    );
  }
}

class Showcase {
  String banner;
  String leading;
  String title;
  String subtitle;
  String trailing;

  Showcase({this.banner, this.leading, this.title, this.subtitle, this.trailing});

  factory Showcase.fromJson(Map<String, dynamic> json) {
    return Showcase(
      banner: json['banner'],
      leading: json['leading'],
      title: json['title'],
      subtitle: json['subtitle'],
      trailing: json['trailing'],
    );
  }
}

class ShowcaseList {
  List<Showcase> list = [];

  ShowcaseList({this.list});

  factory ShowcaseList.fromJson(List<dynamic> json) {
    List<Showcase> list = json.map((i)=>Showcase.fromJson(i)).toList();

    return new ShowcaseList(
        list: list
    );
  }
}