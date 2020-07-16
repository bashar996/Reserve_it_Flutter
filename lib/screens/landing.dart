import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reserve_it/models/landing_slider.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  Widget PageIndexIndecator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 2.0,
      ),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.purple[400] : Colors.purple[200],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
          itemCount: slides.length,
          onPageChanged: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          itemBuilder: (context, index) {
            return SliderTile(
              imageAssetPath: slides[index].getImagePath(),
              title: slides[index].getTitle(),
              description: slides[index].getDesc(),
            );
          }),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              height: Platform.isIOS ? 70 : 60,
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    enableFeedback: true,
                    splashColor: Colors.purple[600],
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      for (int i = 0; i < slides.length; i++)
                        currentIndex == i
                            ? PageIndexIndecator(true)
                            : PageIndexIndecator(false)
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Container(
                alignment: Alignment.center,
                color: Colors.purple[500],
                width: MediaQuery.of(context).size.width,
                height: Platform.isIOS ? 70 : 60,
              ),
            ),
    );
  }
}

class SliderTile extends StatefulWidget {
  String imageAssetPath, title, description;
  SliderTile({this.imageAssetPath, this.title, this.description});

  @override
  _SliderTileState createState() => _SliderTileState();
}

class _SliderTileState extends State<SliderTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(widget.imageAssetPath),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.purple[400],
              fontFamily: 'lato',
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              widget.description,
              style: TextStyle(fontFamily: 'lato', color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
