import 'package:flutter/material.dart';
import 'package:news_application/data/api/api_manager.dart';
import 'package:news_application/data/model/SourcesResponse.dart';

class NewsTab extends StatefulWidget {
  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildtabs(snapshot.data!);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildtabs(List<Source> list) {
    return DefaultTabController(
      length: list.length,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TabBar(
              indicatorColor: Colors.transparent,
              isScrollable: true,
              onTap: (index) {
                currentTabIndex = index;
                setState(() {});
              },
              tabs: list
                  .map((source) => buildTabWidget(source.name ?? "",
                      currentTabIndex == list.indexOf(source)))
                  .toList()),
          Expanded(
            child: TabBarView(
                children: list
                    .map((_) => Container(
                          color: Colors.red,
                        ))
                    .toList()),
          )
        ],
      ),
    );
  }

  Widget buildTabWidget(String name, bool isSelected) {
    return Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: Colors.blue)),
        child: Text(
          name,
          style: TextStyle(color: isSelected ? Colors.white : Colors.blue),
        ));
  }
}
