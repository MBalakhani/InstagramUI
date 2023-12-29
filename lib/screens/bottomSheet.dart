import 'dart:ui';

import 'package:flutter/material.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet(this.controller, {super.key});
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          color: Color.fromRGBO(255, 255, 255, .1),
          child: _getcontent(context),
        ),
      ),
    );
  }

  _getcontent(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 67,
                    margin: EdgeInsets.only(top: 10, bottom: 22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'share',
                        style: TextStyle(
                          fontFamily: 'GB',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Image.asset('images/icon_share_bottomsheet.png'),
                    ],
                  ),
                  SizedBox(height: 32),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Image.asset('images/icon_search.png'),
                      contentPadding: EdgeInsets.all(13),
                      hintText: 'search',
                      hintStyle: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'GB',
                        fontSize: 18,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(255, 255, 255, .4),
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _getitemGrid();
                },
                childCount: 30,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
                mainAxisExtent: 105,
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(top: 100)),
          ],
        ),
        Positioned(
          bottom: 47,
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 43, vertical: 13),
              child: Text(
                'send',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _getitemGrid() {
    return Column(
      children: [
        Container(
          height: 65,
          width: 65,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Image.asset('images/user.png'),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'MBalakhani',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'GB',
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
