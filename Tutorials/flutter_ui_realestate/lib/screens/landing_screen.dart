// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ui_realestate/utils/constants.dart';
import 'package:flutter_ui_realestate/utils/custom_function.dart';
import 'package:flutter_ui_realestate/utils/data.dart';
import 'package:flutter_ui_realestate/utils/widgets.dart';
import 'package:flutter_ui_realestate/widgets/app_button.dart';
import 'package:flutter_ui_realestate/widgets/border_box.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double padding = 25;
    EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: padding);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(padding),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Header(),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: horizontalPadding,
                    child: Text('City', style: themeData.textTheme.bodyText2),
                  ),
                  addVerticalSpace(10),
                  Padding(
                    padding: horizontalPadding,
                    child: Text('San Andreas',
                        style: themeData.textTheme.headline1),
                  ),
                  Padding(
                    padding: horizontalPadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  FilterTabs(),
                  addVerticalSpace(padding),
                  PropertyDetail(),
                ],
              ),
              Positioned(
                  bottom: 20,
                  width: size.width,
                  child: Center(
                    child: AppButton(
                        width: size.width * .40,
                        icon: Icons.map,
                        text: 'Map View'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BorderBox(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.menu,
              color: COLOR_BLACK,
            )),
        BorderBox(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.settings,
              color: COLOR_BLACK,
            ))
      ],
    );
  }
}

class FilterTabs extends StatelessWidget {
  const FilterTabs({Key? key}) : super(key: key);

  Container tabBoxBorder(ThemeData themeData, String text) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: COLOR_GREY.withAlpha(25)),
      child: Text(text, style: themeData.textTheme.headline5),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: ['<\$220,000', 'For Sale', '3-4 Beds', '>1000 sqft']
            .map((e) => tabBoxBorder(themeData, e))
            .toList(),
      ),
    );
  }
}

class PropertyDetail extends StatelessWidget {
  const PropertyDetail({Key? key}) : super(key: key);

  Widget detail(ThemeData themeData, Map item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: (Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(item['image'])),
              Positioned(
                  right: 15,
                  top: 15,
                  child: BorderBox(
                      width: 50,
                      height: 50,
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.favorite_border)))
            ],
          ),
          addVerticalSpace(15),
          Row(
            children: [
              Text(
                formatCurrency(item['amount']),
                style: themeData.textTheme.headline2,
              ),
              addHorizontalSpace(10),
              Text(
                item['address'],
                style: themeData.textTheme.bodyText2,
              ),
            ],
          ),
          addVerticalSpace(10),
          Text(
            "${item['bedrooms']} bedrooms / ${item['bathrooms']} bathrooms / ${item['area']} sqft",
            style: themeData.textTheme.headline5,
          ),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Expanded(
      child: ListView.builder(
          itemCount: DATA.length,
          itemBuilder: (context, index) {
            return detail(themeData, DATA[index]);
          }),
    );
  }
}
