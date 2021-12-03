// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui/colors/colors.dart';
import 'package:flutter_ui/data/data.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget marginV([double h = 10.0]) {
    return (SizedBox(
      height: h,
    ));
  }

  Widget marginH([double w = 10.0]) {
    return (SizedBox(
      width: w,
    ));
  }

  Widget header() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: (Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile.png"),
          ),
          Icon(Icons.menu)
        ],
      )),
    );
  }

  Widget heading() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: (Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Food'),
          Text('Delivery'),
        ],
      )),
    );
  }

  Widget searchBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: (Row(
        children: [
          Icon(Icons.search),
          // TextFormField(),
        ],
      )),
    );
  }

  Widget category() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 180,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Data.category.length,
            itemBuilder: (BuildContext context, int index) {
              Map item = Data.category[index];
              return categoryRenderItems(index, item);
            }),
      ),
    );
  }

  Widget categoryRenderItems(int index, Map<dynamic, dynamic> item) {
    return Card(
      margin: EdgeInsets.fromLTRB(index == 0 ? 20 : 0, 0, 10, 0),
      color: index == 0 ? AppColors.yellow : AppColors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      elevation: 2,
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(item['image']),
                Text(item['title']),
                CircleAvatar(
                  radius: 12,
                  backgroundColor:
                      index == 0 ? AppColors.white : AppColors.secondary,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: index == 0 ? AppColors.black : AppColors.white,
                    size: 10,
                  ),
                )
              ])),
    );
  }

  Widget popular() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: ListView.builder(
            itemCount: Data.popular.length,
            itemBuilder: (BuildContext context, int index) {
              Map item = Data.popular[index];
              return popularRenderItems(index, item);
            }),
      ),
    );
  }

  Widget popularRenderItems(int index, Map<dynamic, dynamic> item) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      elevation: 2,
      child: Padding(
          padding: EdgeInsets.all(20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              children: [],
            ),
            // Stack(children[Positioned(right: 0, child: Image.asset(item['image']))]),
            Stack(
              clipBehavior: Clip.hardEdge,
              children: [Positioned(child: Image.asset((item['image'])))],
            )
          ])),
    );
  }

  Widget itemHeading([text = '']) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20), child: (Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            heading(),
            searchBar(),
            marginV(20),
            itemHeading('Categories'),
            category(),
            marginV(20),
            itemHeading('Popular'),
            popular(),
          ],
        ),
      ),
    );
  }
}
