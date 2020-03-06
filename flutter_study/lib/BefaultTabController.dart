import 'package:flutter/material.dart';

class TabControllerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          title: Text("TabControllerDemo"),
          bottom: TabBar(

              unselectedLabelColor: Colors.deepPurple,
              indicatorWeight: 2,
              unselectedLabelStyle: TextStyle(fontSize: 16.0),
              labelStyle: TextStyle(fontSize: 16.0),
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              
              isScrollable: true,
              tabs: [
                Tab(
                  text: "列表",
                ),
                Tab(
                  text: "评论",
                ),
                Tab(
                  text: "推荐",
                ),
                Tab(
                  text: "推荐",
                ),
                Tab(
                  text: "推荐",
                ),
                Tab(
                  text: "推荐",
                ),
                Tab(
                  text: "推荐",
                ),
                Tab(
                  text: "推荐",
                ),
              ]),
        ),
        body: TabBarView(children: [
          Icon(Icons.airline_seat_individual_suite),
          Icon(Icons.airline_seat_individual_suite),
          Icon(Icons.airline_seat_individual_suite),
          Icon(Icons.airline_seat_individual_suite),
          Icon(Icons.airline_seat_individual_suite),
          Icon(Icons.airline_seat_individual_suite),
          Icon(Icons.airline_seat_individual_suite),
          Icon(Icons.airline_seat_individual_suite)
        ]),
      ),
    );
//    return DefaultTabController(
//      length: 3,
//      child: Scaffold(
//        appBar: AppBar(
//          title: Text("TabControllerDemo"),
//          bottom: TabBar(
//
//              unselectedLabelColor: Colors.red,
//              indicatorWeight: 3,
//              indicatorColor: Colors.brown,
//              indicatorSize: TabBarIndicatorSize.label,
//              tabs: [
//                Tab(
//                  icon: Icon(Icons.card_membership),
//                ),
//                Tab(
//                  icon: Icon(Icons.calendar_today),
//                ),
//                Tab(
//                  icon: Icon(Icons.format_size),
//                ),
//              ]),
//        ),
//        body: TabBarView(children: [
//          Icon(Icons.airline_seat_individual_suite),
//          Icon(Icons.airline_seat_individual_suite),
//          Icon(Icons.airline_seat_individual_suite)
//        ]),
//      ),
//    );
  }
}
