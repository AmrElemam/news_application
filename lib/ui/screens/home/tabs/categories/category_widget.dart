import 'package:flutter/material.dart';
import 'package:news_application/data/model/category_widget_DM..dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidgetDM categoryWidgetDM;
  final Radius radius = const Radius.circular(25);

  CategoryWidget({super.key, required this.categoryWidgetDM});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryWidgetDM.backgroundColor,
          borderRadius: BorderRadius.only(
              bottomLeft: categoryWidgetDM.isLeftedSide ? Radius.zero : radius,
              bottomRight:
                  !categoryWidgetDM.isLeftedSide ? Radius.zero : radius,
              topLeft: radius,
              topRight: radius)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(categoryWidgetDM.imagePath,
              height: MediaQuery.of(context).size.height * .12),
          const SizedBox(
            height: 10,
          ),
          Text(
            categoryWidgetDM.title,
            style: const TextStyle(color: Colors.white, fontSize: 22),
          )
        ],
      ),
    );
  }
}
