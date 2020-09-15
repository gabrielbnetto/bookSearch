import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Studies App'),
        elevation: 0,
      ),
      body: Container(
        // margin: EdgeInsets.all(10),
        // child: CarouselSlider(
        //   options: CarouselOptions(
        //     height: 210,
        //     aspectRatio: 16/9,
        //     viewportFraction: 0.8,
        //     initialPage: 0,
        //     enableInfiniteScroll: true,
        //     reverse: false,
        //     autoPlay: true,
        //     autoPlayInterval: Duration(seconds: 3),
        //     autoPlayAnimationDuration: Duration(milliseconds: 800),
        //     autoPlayCurve: Curves.fastOutSlowIn,
        //     enlargeCenterPage: true,
        //     // onPageChanged: () {},
        //     scrollDirection: Axis.horizontal,
        //   ),
        //   items: [createCard("AHA")].map((i) {
        //     return Builder(
        //       builder: (BuildContext context) {
        //         return i;
        //         // );
        //       },
        //     );
        //   }).toList(),
        // )
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, top: 10),
              child: Column(
                children: [
                  Image.network('http://books.google.com/books/content?id=DKcWE3WXoj8C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
                  Text("Teste"),
                ]
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 10),
              child: Column(
                children: [
                  Image.network('http://books.google.com/books/content?id=DKcWE3WXoj8C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
                  Text("Teste"),
                ]
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 10),
              child: Column(
                children: [
                  Image.network('http://books.google.com/books/content?id=DKcWE3WXoj8C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
                  Text("Teste"),
                ]
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 10),
              child: Column(
                children: [
                  Image.network('http://books.google.com/books/content?id=DKcWE3WXoj8C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
                  Text("Teste"),
                ]
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 10),
              child: Column(
                children: [
                  Image.network('http://books.google.com/books/content?id=DKcWE3WXoj8C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
                  Text("Teste"),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }

}