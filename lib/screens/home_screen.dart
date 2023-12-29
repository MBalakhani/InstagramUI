import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:instagram/screens/bottomSheet.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          height: 24,
          width: 128,
          child: Image.asset('images/moodinger_logo.png'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.send),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getStoryList(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _getPostList(context, index);
                },
                childCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getStoryList() {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return index == 0 ? _getAddstory() : _getStoryBox(index);
        },
      ),
    );
  }

  _getPostList(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          _getHeaderPost(),
          SizedBox(height: 12),
          _getPostContent(context, index),
          SizedBox(height: 10),
          _getTextPost(),
          SizedBox(height: 34),
        ],
      ),
    );
  }
}

_getTextPost() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 4.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'MBalakhani',
          style: TextStyle(color: Colors.white, fontFamily: 'GB', fontSize: 14),
        ),
        Text(
          'هیچ وقت از دوباره شروع کردن نترس شاید داستان جدیدتو بیشتر دوست داشته باشی',
          style: TextStyle(color: Colors.white, fontFamily: 'SM', fontSize: 13),
        ),
      ],
    ),
  );
}

_getPostContent(BuildContext context, int index) {
  return Column(
    children: [
      Container(
        width: 394,
        height: 394,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/item$index.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: 15,
              right: 15,
              child: Image.asset('images/icon_video.png'),
            ),
          ],
        ),
      ),
      SizedBox(height: 5),
      Container(
        width: 355,
        height: 46,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(255, 255, 255, .4),
              Color.fromRGBO(255, 255, 255, .2),
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('images/icon_hart.png'),
            Image.asset('images/icon_comments.png'),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  barrierColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: DraggableScrollableSheet(
                        initialChildSize: .9,
                        minChildSize: .4,
                        maxChildSize: 1,
                        builder: (context, controler) {
                          return ShareBottomSheet(controler);
                        },
                      ),
                    );
                  },
                );
              },
              icon: Image.asset('images/icon_share.png'),
            ),
            Image.asset('images/icon_save.png'),
          ],
        ),
      ),
    ],
  );
}

_getHeaderPost() {
  return Padding(
    padding: EdgeInsets.only(
      left: 3,
    ),
    child: Row(
      children: [
        _getImageBox(),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'MBalakhani',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'GB', fontSize: 15),
            ),
            Text(
              'یه برنامه نویس',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'SM', fontSize: 13),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    ),
  );
}

_getImageBox() {
  return DottedBorder(
    borderType: BorderType.RRect,
    radius: Radius.circular(17),
    padding: EdgeInsets.all(4),
    color: Color(0xffF35383),
    dashPattern: [30, 5],
    strokeWidth: 2,
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        width: 38,
        height: 38,
        child: Image.asset('images/user.png'),
      ),
    ),
  );
}

_getStoryBox(int index) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    child: Column(
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(17),
          padding: EdgeInsets.all(4),
          color: Color(0xffF35383),
          dashPattern: [30, 5],
          strokeWidth: 2,
          child: Container(
            height: 58,
            width: 58,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(
                  'images/item$index.png',
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'username $index',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'GB',
          ),
        ),
      ],
    ),
  );
}

_getAddstory() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xff1C1F2E),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset('images/icon_plus.png'),
          ),
        ),
      ),
      Text(
        'your story',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'GB',
        ),
      ),
    ],
  );
}
