import 'package:flutter/material.dart';
import 'package:news_application/data/model/category_widget_DM..dart';
import 'package:news_application/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:news_application/ui/screens/home/tabs/news/news_tab.dart';
import 'package:news_application/ui/screens/home/tabs/settings/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget currentTab;
  String selectedCategoryTitle = 'News App';

  @override
  void initState() {
    currentTab = CategoriesTab(onCategoryClick: onCategoryClick);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentTab is! CategoriesTab) {
          currentTab = CategoriesTab(onCategoryClick: onCategoryClick);
          selectedCategoryTitle = "News App";
          setState(() {});
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        drawer: buildDrawer(),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .1,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
          centerTitle: true,
          backgroundColor: const Color(0xff39A552),
          title: Text(selectedCategoryTitle),
        ),
        body: currentTab,
      ),
    );
  }

  onCategoryClick(CategoryWidgetDM categoryWidgetDM) {
    currentTab = NewsTab(categoryWidgetDM.id);
    selectedCategoryTitle = categoryWidgetDM.title;
    setState(() {});
  }

  buildDrawer() => Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xff39A552)),
              child: Center(
                  child: Text(
                "News App!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            buildDrawerRow(Icons.list, "Categories", () {
              currentTab = CategoriesTab(onCategoryClick: onCategoryClick);
              setState(() {});
              Navigator.pop(context);
            }),
            const SizedBox(
              height: 20,
            ),
            buildDrawerRow(Icons.settings, "Settings", () {
              currentTab = const SettingsScreen();
              setState(() {});
              Navigator.pop(context);
            }),
          ],
        ),
      );

  buildDrawerRow(IconData iconData, String title, Function onclick) {
    return InkWell(
      onTap: () {
        onclick();
      },
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Icon(
            iconData,
            color: const Color(0xff303030),
            size: 40,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(title,
              style: const TextStyle(
                  color: Color(0xff303030),
                  fontSize: 24,
                  fontWeight: FontWeight.w700))
        ],
      ),
    );
  }
}
