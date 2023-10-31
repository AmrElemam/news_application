import 'package:flutter/material.dart';

class CategoryWidgetDM {
  String title;
  Color backgroundColor;
  String id;
  bool isLeftedSide;
  String imagePath;

  CategoryWidgetDM(
      {required this.id,
      required this.title,
      required this.backgroundColor,
      required this.imagePath,
      required this.isLeftedSide});

  static List<CategoryWidgetDM> categories = [
    CategoryWidgetDM(
        id: "sports",
        title: "sports",
        backgroundColor: const Color(0xffC91C22),
        imagePath: "assets/ball.png",
        isLeftedSide: true),
    CategoryWidgetDM(
        id: "technology",
        title: "Technology",
        backgroundColor: const Color(0xff003E90),
        imagePath: "assets/Politics.png",
        isLeftedSide: false),
    CategoryWidgetDM(
        id: "health",
        title: "Health",
        backgroundColor: const Color(0xffED1E79),
        imagePath: "assets/health.png",
        isLeftedSide: true),
    CategoryWidgetDM(
        id: "business",
        title: "Business",
        backgroundColor: const Color(0xffCF7E48),
        imagePath: "assets/bussines.png",
        isLeftedSide: false),
    CategoryWidgetDM(
        id: "entertainment",
        title: "Entertainment",
        backgroundColor: const Color(0xff4882CF),
        imagePath: "assets/environment.png",
        isLeftedSide: true),
    CategoryWidgetDM(
        id: "science",
        title: "Science",
        backgroundColor: const Color(0xffF2D352),
        imagePath: "assets/science.png",
        isLeftedSide: false),
  ];
}
