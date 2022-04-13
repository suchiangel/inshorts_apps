import 'package:flutter/material.dart';
import 'package:inshorts_app/views/discover.dart';

class CustomAppBar extends StatelessWidget {
   CustomAppBar({ Key? key }) : super(key: key);

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
                Container(
                  child: const Text(
                    "Discover",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
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
                        "My Feed",
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
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Icon(
              Icons.vertical_align_top_rounded,
              color: Colors.blue,
              size: 22,
            ),
          )
        ],
        // centerTitle: true,
      ),
    );
  }
}