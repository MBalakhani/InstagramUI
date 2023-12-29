import 'package:flutter/material.dart';

class AddContentScreen extends StatelessWidget {
  const AddContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _getpostview(),
          _getBottomButton(),
        ],
      )),
    );
  }

  _getBottomButton() {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        color: Color(0xff272B40),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: EdgeInsets.only(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Post',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'GB',
                fontSize: 18,
              ),
            ),
            SizedBox(width: 5),
            Text(
              'Story',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'GB',
                fontSize: 18,
              ),
            ),
            SizedBox(width: 5),
            Text(
              'Reel',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'GB',
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getpostview() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _getHeader(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Container(
                height: 394,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset(
                      'images/user1.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
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
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(bottom: 85)),
        ],
      ),
    );
  }

  _getHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        children: [
          Text(
            'New Post',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'GB',
              fontSize: 24,
            ),
          ),
          SizedBox(width: 10),
          Image.asset('images/icon_arrow_down.png'),
          Spacer(),
          Text(
            'Next',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'GB',
              fontSize: 16,
            ),
          ),
          SizedBox(width: 8),
          Image.asset('images/icon_arrow_right_box.png'),
        ],
      ),
    );
  }
}
