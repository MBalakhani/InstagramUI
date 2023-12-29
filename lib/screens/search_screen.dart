import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _getSearchBar(),
              ),
              SliverToBoxAdapter(
                child: _getitemList(),
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
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getSearchBar() {
    return Padding(
      padding: EdgeInsets.only(left: 12, right: 12, top: 12),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Image.asset('images/icon_search.png'),
          contentPadding: EdgeInsets.all(12),
          hintText: 'search',
          hintStyle: TextStyle(
            color: Colors.white70,
            fontFamily: 'GB',
            fontSize: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          fillColor: Color(0xff272B40),
        ),
      ),
    );
  }

  _getitemList() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 23,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: Color(0xff272B40),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                child: Text(
                  'item $index ',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'GM',
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
