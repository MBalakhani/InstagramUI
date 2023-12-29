// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class userprofilescreen extends StatelessWidget {
  const userprofilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, isscrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 80,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(top: 18, right: 18),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                    ),
                  ),
                ],
                backgroundColor: Color(0xff1C1F2E),
                expandedHeight: 140,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'images/user.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _getHeaderProfile(),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: TabBarviewDelegate(
                  TabBar(
                    indicatorColor: Color(0xffF35383),
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                    indicatorWeight: 2,
                    tabs: [
                      Tab(
                        icon: Image.asset('images/icon_tab_posts.png'),
                      ),
                      Tab(
                        icon: Image.asset('images/icon_tab_bookmark.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomScrollView(
                  slivers: [
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Container(
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(
                                  'images/item$index.png',
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: 10,
                      ),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomScrollView(
                  slivers: [
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Container(
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(
                                  'images/item$index.png',
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: 4,
                      ),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getHeaderProfile() {
    return Padding(
      padding: EdgeInsets.only(left: 18, right: 10, top: 14, bottom: 10),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(17),
                  padding: EdgeInsets.all(4),
                  color: Color(0xffF35383),
                  dashPattern: [50, 5],
                  strokeWidth: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      width: 64,
                      height: 64,
                      child: Image.asset('images/user.png'),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Column(
                  children: [
                    Text(
                      '10',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'GB',
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      'Posts',
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'GB',
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '1.2k',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'GB',
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      'Followers',
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'GB',
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '200',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'GB',
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      'Following',
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'GB',
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('images/icon_profile_edit.png'),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              'MBalakhani',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'GB', fontSize: 15),
            ),
            SizedBox(height: 5),
            Text(
              'محمدم برنامه نویس موبایل',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'SM', fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarviewDelegate extends SliverPersistentHeaderDelegate {
  TabBarviewDelegate(this._tabBar);
  TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Color(0xff1C1F2E), child: _tabBar);
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
