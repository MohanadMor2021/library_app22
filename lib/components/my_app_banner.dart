import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constant.dart';
import 'global_componnets.dart';




class MyAppBanner extends StatefulWidget {

  String url;
  Widget widget;
  MyAppBanner(this.url , this.widget);



  @override
  _MyAppBannerState createState() => _MyAppBannerState();
}

class _MyAppBannerState extends State<MyAppBanner> {



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30)
          .add(EdgeInsets.only(top: 15)),
      child: InkWell(
        onTap: () async {
         var  url = widget.url;
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: primaryColor),
            color: Colors.white,
          ),
          child:  widget.widget,

        ),
      ),
    );
  }
}

