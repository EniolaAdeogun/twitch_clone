import 'package:flutter/material.dart';
import 'package:twitch_ui/pages/browse_page.dart';
import 'package:twitch_ui/pages/discover_page.dart';
import 'package:twitch_ui/pages/following_page.dart';
import 'package:twitch_ui/theme/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        child: getAppBar(),
        preferredSize: Size.fromHeight(60),
      ),
      bottomNavigationBar: getTab(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: bgColor,
      leading: IconButton(
          onPressed: () {},
          icon: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: white.withOpacity(0.7)),
            child: Center(
              child: Icon(Icons.person, color: black, size: 20),
            ),
          )),
      actions: [
        IconButton(
            onPressed: null, icon: Icon(Icons.wifi, color: white, size: 22)),
        IconButton(
            onPressed: null,
            icon:
                Icon(Icons.video_camera_back_outlined, color: white, size: 22)),
        IconButton(
            onPressed: null,
            icon: Icon(Icons.inbox_outlined, color: white, size: 22)),
        IconButton(
            onPressed: null,
            icon: Icon(Icons.comment_outlined, color: white, size: 22)),
        IconButton(
            onPressed: null,
            icon: Icon(Icons.search_outlined, color: white, size: 22))
      ],
    );
  }

  Widget getTab() {
    List iconItems = [
      Icons.favorite,
      Icons.explore,
      Icons.copy
    ];

    List textItems = ['Following', 'Discover', 'Browser'];
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
          color: bgColor,
          border: Border(
              top: BorderSide(width: 0.5, color: white.withOpacity(0.2)))),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(iconItems.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = index;
                });
              },
              child: Column(
                children: [
                  Icon(
                    iconItems[index],
                    size: 30,
                    color:
                        pageIndex == index ? secondary : white.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    textItems[index],
                    style: TextStyle(color: secondary, fontSize: 11),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
      FollowingPage(),
     DiscoverPage(),
     BrowsePage(),
      ],
    );
  }
}
