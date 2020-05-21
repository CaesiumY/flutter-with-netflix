import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';
import 'dart:ui';

class DetailScreen extends StatefulWidget {
  final Movie movie;
  DetailScreen({this.movie});
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool like = false;

  @override
  void initState() {
    super.initState();
    like = widget.movie.like;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.movie.poster),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.2),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                                  child: Image.network(widget.movie.poster),
                                  height: 300,
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  child: Text(
                                    '99% 일치 2019 15+ 시즌 1개',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    widget.movie.title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                                  child: FlatButton(
                                      onPressed: () {},
                                      color: Colors.red,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.play_arrow),
                                          Text('재생'),
                                        ],
                                      )),
                                ),
                                Container(
                                  padding: EdgeInsets.all(3),
                                  child: Text(widget.movie.keyword),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    '출연: 현빈, 손예진, 서지혜\n제작자: 이정호, 박지은',
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      child: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ))
                ],
              ),
              Container(
                // color: Colors.black26,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            like = !like;
                            widget.movie.reference.updateData({'like': like});
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            like ? Icon(Icons.check) : Icon(Icons.add),
                            Padding(padding: EdgeInsets.all(5)),
                            Text(
                              '내가 찜한 컨텐츠',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.white60),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 70,
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.thumb_up),
                              Padding(padding: EdgeInsets.all(5)),
                              Text(
                                '평가',
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white60),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 70,
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.send),
                              Padding(padding: EdgeInsets.all(5)),
                              Text(
                                '공유',
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white60),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
