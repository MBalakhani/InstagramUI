import 'package:flutter/material.dart';
import 'package:instagram/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  @override
  void initState() {
    super.initState();
    focusNode1.addListener(() {
      setState(() {});
    });
    focusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff323A99),
            Color(0xffF98BFC),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              top: 25,
              child: Image(
                image: AssetImage(
                  'images/rocket.png',
                ),
              ),
            ),
            Column(
              children: [
                Expanded(child: Container()),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff1C1F2E),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 35),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'sign in to ',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Image(
                                  image: AssetImage(
                                    'images/mood.png',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 32),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 44),
                              child: TextField(
                                style: Theme.of(context).textTheme.headline4,
                                focusNode: focusNode1,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    color: focusNode1.hasFocus
                                        ? Color(0xffF35383)
                                        : Colors.white70,
                                    fontFamily: 'GM',
                                    fontSize: 16,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Color(0xffC5C5C5), width: 3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Color(0xffF35383), width: 3),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 32),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 44),
                              child: TextField(
                                style: Theme.of(context).textTheme.headline4,
                                focusNode: focusNode2,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                    color: focusNode2.hasFocus
                                        ? Color(0xffF35383)
                                        : Colors.white70,
                                    fontFamily: 'GM',
                                    fontSize: 16,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Color(0xffC5C5C5), width: 3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Color(0xffF35383), width: 3),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 32),
                            SizedBox(
                              width: 129,
                              height: 46,
                              child: ElevatedButton(
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
                                  'sign in',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ),
                            ),
                            SizedBox(height: 32),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "don't hava an account? / ",
                                  style: TextStyle(
                                      color: Colors.grey, fontFamily: 'GB'),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
