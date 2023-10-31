import 'package:flutter/material.dart';
import 'package:news_application/data/model/category_widget_DM..dart';
import 'package:news_application/ui/screens/home/tabs/categories/category_widget.dart';

class CategoriesTab extends StatelessWidget {
  final Function onCategoryClick;

  const CategoriesTab({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Pick your Category \nof interest",
            style: TextStyle(
                color: Color(0xff4F5A69),
                fontSize: 22,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: GridView.builder(
            itemCount: CategoryWidgetDM.categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .85,
                mainAxisSpacing: 20,
                crossAxisSpacing: 25),
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onCategoryClick(CategoryWidgetDM.categories[index]);
                },
                child: CategoryWidget(
                    categoryWidgetDM: CategoryWidgetDM.categories[index])),
          ),
        ))
      ],
    );
  }
}
