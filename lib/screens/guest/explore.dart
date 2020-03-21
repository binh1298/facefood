import 'package:facefood/components/tab_explore.dart';
import 'package:facefood/components/tab_search.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: TabBar(
              labelColor: colorPrimary,
              indicatorColor: colorPrimary,
              unselectedLabelColor: colorTextDefault,
              tabs: [
                Tab(
                  child: Text('Explore'),
                ),
                Tab(
                  child: Text('Search'),
                ),
              ]),
        ),
        body: TabBarView(children: [
          TabExplore(),
          TabSearch(),
        ]),
      ),
    );
  }
}
