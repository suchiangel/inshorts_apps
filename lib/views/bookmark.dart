import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:inshorts_app/services/ad_mobile_services.dart';
import 'package:inshorts_app/views/discover.dart';

class BookMarkPage extends StatelessWidget {
  BookMarkPage({Key? key}) : super(key: key);
  double screenWidth = 0;
  double screenHeight = 0;
  List<PageView> bookmarksList = [];
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
      ),
      body: BookmarksListWidget(bookmarksList),
    );
  }
}

class BookmarksListWidget extends StatelessWidget {
  BookmarksListWidget(List bookmarksList);
  double screenWidth = 0;
  double screenHeight = 0;
  int count = 0;
  final bool _isShowfooter = false;
  List<PageView> bookmarksList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: bookmarksList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              if (count < 4) {
                count++;
                log('Count=:::>>> $count');
                return Container();
              } else {
                count = 0;
                log('Count======>>> $count');
                // _showInterstitialAd();
                // _createInterstitialAd();
                return bannerAdWidget();
              }
            },
          ),
          Positioned(child: _isShowfooter ? customAppbar(context) : Container())
        ],
      ),
    );
  }

  Widget customAppbar(BuildContext context) {
    return Container(
      height: 80,
      width: screenWidth,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DiscoverPage()));
                  },
                  icon: Icon(
                    FontAwesomeIcons.chevronLeft,
                    size: 18,
                    color: Colors.blue,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DiscoverPage()));
                  },
                  child: Text(
                    "Discover",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 50, top: 10),
                  child: Column(
                    children: [
                      Text(
                        "My Feed",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
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
                Icon(
                  FontAwesomeIcons.shareNodes,
                  color: Colors.blue,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bannerAdWidget() {
    return Container(
      child: AdWidget(
        ad: AdMobService.createBannerAd(screenWidth, screenHeight)..load(),
        key: UniqueKey(),
      ),
      width: screenWidth,
      height: screenHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: .1, color: Colors.black),
      )),
    );
  }
}
