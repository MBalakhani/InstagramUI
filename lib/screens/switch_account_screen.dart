import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram/screens/main_screen.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/switch_account_background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 63, top: 132),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don't hava an account? / ",
                      style: TextStyle(color: Colors.grey, fontFamily: 'GB'),
                    ),
                    Text(
                      'sign up',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'GB'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  width: 340,
                  height: 352,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, .5),
                        Color.fromRGBO(255, 255, 255, .1),
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 32),
                      CircleAvatar(
                        backgroundImage: AssetImage('images/user.png'),
                        radius: 65,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'MBalakhani',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 129,
                        height: 46,
                        child: ElevatedButton(
                          style: Theme.of(context).elevatedButtonTheme.style,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return mainscreen();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'Confirm',
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      Text(
                        'switch account',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
