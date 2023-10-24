import 'package:flutter/material.dart';
import 'package:news_application/ui/screens/home/tabs/news/news_tab.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: NewsTab(),
    );
  }
}
