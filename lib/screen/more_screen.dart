import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 50),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/bbongflix_logo.png'),
                radius: 100,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Caesiumy',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            Container(
              color: Colors.red,
              padding: EdgeInsets.all(10),
              width: 140,
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Linkify(
                onOpen: (link) async {
                  if (await canLaunch(link.url)) {
                    await launch(link.url);
                  }
                },
                text: "https://github.com/caesiumy",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                linkStyle: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: FlatButton(
                  onPressed: () {},
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.edit, color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '프로필 수정하기',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
