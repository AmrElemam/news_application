import 'package:flutter/material.dart';
import 'package:news_application/data/api/api_manager.dart';
import 'package:news_application/data/model/SourcesResponse.dart';
import 'package:news_application/ui/screens/home/tabs/news/news_list/news_list.dart';

class NewsTab extends StatefulWidget {
  final String categoryId;

  const NewsTab(this.categoryId, {super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.categoryId),
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
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: TabBarView(
                children: list
                    .map((source) => NewsList(
                          sourceId: source.id!,
                        ))
                    .toList()),
          )
        ],
      ),
    );
  }

  Widget buildTabWidget(String name, bool isSelected) {
    return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: isSelected ? const Color(0xff39A552) : Colors.white,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(width: 2, color: const Color(0xff39A552))),
        child: Text(
          name,
          style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xff39A552)),
        ));
  }
}
