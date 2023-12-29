import 'package:flutter/material.dart';
import 'package:instagram/model/enums/activity_type_enums.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color(0xff1C1F2E),
              height: 70,
              child: TabBar(
                controller: _tabController,
                labelStyle: TextStyle(
                  fontFamily: 'GB',
                  fontSize: 17,
                ),
                indicatorColor: Color(0xffF35383),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
                indicatorWeight: 2,
                tabs: [
                  Tab(text: 'following'),
                  Tab(text: 'you'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _folowwingcontent(),
                  _folowwingcontent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _folowwingcontent() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'Now',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'GB',
                fontSize: 16,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _Rowcontent(activitystatus.followback);
          }, childCount: 2),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'Today',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'GB',
                fontSize: 16,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _Rowcontent(activitystatus.likes);
          }, childCount: 3),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'Last week',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'GB',
                fontSize: 16,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _Rowcontent(activitystatus.following);
          }, childCount: 3),
        ),
      ],
    );
  }

  _Rowcontent(activitystatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF35383),
            ),
          ),
          SizedBox(width: 7),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('images/user.png'),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 40,
            width: 200,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MBalakhani',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'GB',
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'started following',
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'GM',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'you',
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'GM',
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '3min',
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'GB',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          _getActionActivityRow(status),
        ],
      ),
    );
  }

  _youContent() {
    return Row(
      children: [],
    );
  }

  _getActionActivityRow(activitystatus status) {
    switch (status) {
      case activitystatus.followback:
        return ElevatedButton(
          onPressed: () {},
          child: Text(
            'Follow',
            style: TextStyle(fontFamily: 'GB'),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0xffF35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        );
      case activitystatus.likes:
        return SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/user1.png'),
            ),
          ),
        );
      case activitystatus.following:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
              color: Colors.white70,
              fontFamily: 'GB',
              fontSize: 12,
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              width: 2,
              color: Colors.white70,
            ),
          ),
        );
      default:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
              color: Colors.white70,
              fontFamily: 'GB',
              fontSize: 12,
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              width: 2,
              color: Colors.white70,
            ),
          ),
        );
    }
  }
}
