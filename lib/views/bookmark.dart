import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inshorts_app/views/discover.dart';

class BookMarkPage extends StatelessWidget {
  BookMarkPage({Key? key}) : super(key: key);
  double screenWidth = 0;
  double screenHeight = 0;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 10,
        leading: Container(
            margin: const EdgeInsets.only(left: 3.0),
            width: 150,
            height: screenHeight,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DiscoverPage()));
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 18,
                color: Colors.blue,
              ),
            )),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            width: screenWidth,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DiscoverPage()));
                  },
                  child: Container(
                    child: const Text(
                      "Discover",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 65),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Bookmarks",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 30,
                        height: 3,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              FontAwesomeIcons.rotateLeft,
              color: Colors.blue,
              size: 20,
            ),
          )
        ],
        // centerTitle: true,
      ),
    );
  }
}
