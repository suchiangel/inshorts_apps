import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:inshorts_app/model/news_model.dart';
import 'package:inshorts_app/services/ad_mobile_services.dart';
import 'package:inshorts_app/views/discover.dart';
import 'package:inshorts_app/views/webview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<String> datas;
  late List<Object> dataads;

  AdMobService admobServices = AdMobService();

  bool _loading = true;
  bool isloaded = false;
  bool _isShowfooter = false;

  double screenWidth = 0;
  double screenHeight = 0;
  int count = 0;
  List<NewsModel> newsList = [];

  void getNews() async {
    var url = Uri.parse("https://news.thedigitalkranti.com/app/latest_news");
    try {
      final response = await http.get(url);
      // log('List====>  ${response.statusCode}');
      // log('List====>  ${response.body}');
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        var _cryptoList = result['news_info'] as List;

        setState(() {
          newsList.clear();
          var listdata = _cryptoList.map((e) => NewsModel.fromjson(e)).toList();
          newsList.addAll(listdata);
          // dataads = List.from(datas);
          // // insert admob banner object in between the array list
          // for (int index = 0; index <= 3; index++) {
          //   var min = 1;
          //   var rm = Random();
          //   //generate a random number from 2 to 18 (+ 1)
          //   var rannumpos = min + rm.nextInt(10);
          //   //and add the banner ad to particular index of arraylist
          //   dataads.insert(rannumpos, AdMobService.createBannerAd()..load());
          // }
          _loading = false;
        });
      }
    } catch (e) {
      // log(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getNews();
    datas = [];
  }

  var image;
  var title;
  var slugCtegory;
  var playStore = "https://play.google.com/store/apps/details?id=com.nis.app";

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
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
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    final imageUrl = '${image}';
                    final uri = Uri.parse(imageUrl);
                    final response = await http.get(uri);
                    final bytes = response.bodyBytes;
                    final temp = await getTemporaryDirectory();
                    final path = '${temp.path}/image.jpg';
                    log('IMAhgsfds===>   $path');
                    log(imageUrl);
                    File(path).writeAsBytesSync(bytes);
                    await Share.shareFiles([path],
                        text:
                            '${title} "\n${image}" \n*ताजा खबरे सबसे पहले पाने के लिए नीचे क्लिक कर ASB News India एप इंस्टॉल करे*  "\n" ');
                    // Share.share(
                    //     "${widget.title}" + "\nअ
                    //भी डाउनलोड करे " + playStoreUrl + "");
                  },
                  icon: Icon(
                    FontAwesomeIcons.shareNodes,
                    color: Colors.blue,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  FontAwesomeIcons.bookmark,
                  color: Colors.blue,
                  size: 20,
                ),
              ],
            ),
          )
        ],
        // centerTitle: true,
      ),
      // : PreferredSize(child: Container(), preferredSize: Size(0.0, 0.0)),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  height: screenHeight / 1.1,
                  width: screenWidth,
                  child: CarouselSlider.builder(
                    itemCount: newsList.length,
                    itemBuilder:
                        (BuildContext context, int index, int pageViewIndex) {
                      if (count < 4) {
                        count++;
                        log('Count=:::>>> $count');
                        return newsWidget(newsList[index]);
                      } else {
                        count = 0;
                        log('Count======>>> $count');
                        _showInterstitialAd();
                        _createInterstitialAd();
                        return newsWidget(newsList[index]);
                        // return bannerAdWidget();
                      }
                    },
                    options: CarouselOptions(
                      scrollDirection: Axis.vertical,
                      autoPlay: false,
                      enlargeCenterPage: false,
                      viewportFraction: 11,
                      aspectRatio: 2.0,
                      initialPage: 2,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget newsWidget(NewsModel item) {
    image = item.imageUrl;
    title = item.title;
    slugCtegory = item.slugCategory;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenWidth,
            height: 230,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: CachedNetworkImage(
                imageUrl: item.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              item.title,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              maxLines: 2,
            ),
          ),
          // bannerAdWidget(),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              setState(() {
                _isShowfooter = !_isShowfooter;
              });
            },
            child: Container(
              height: screenHeight * 0.34,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                item.description,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 12,
              ),
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          //   child: Text(
          //     "",
          //     style: TextStyle(
          //         color: Colors.grey[400],
          //         fontSize: 10,
          //         fontWeight: FontWeight.w500),
          //     maxLines: 13,
          //   ),
          // ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WebviewPage()));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: screenWidth,
              height: 58,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: const [Color(0xFFF020024), Color(0xFFF03012e)],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  stops: [0.0, 0.8],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: RichText(
                  text: TextSpan(
                      text: item.slugCategory,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        TextSpan(
                          text: "\nTap to read more",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bannerAdWidget() {
    return Container(
      child: AdWidget(
        ad: AdMobService.createBannerAd()..load(),
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

  Widget customBottamNavigation() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WebviewPage()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 0),
        width: screenWidth,
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [Color(0xFFF020024), Color(0xFFF03012e)],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            stops: [0.0, 0.8],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: RichText(
            text: TextSpan(
                text: slugCtegory,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
                children: const [
                  TextSpan(
                    text: "\nTap to read more",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  InterstitialAd? _interstitialAd;
  void _showInterstitialAd() {
    log('ssassdsdsd');
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          _createInterstitialAd();
        },
      );
      _interstitialAd!.show();
    }
  }

  void _createInterstitialAd() {
    log('ssassdsd1111sd');

    InterstitialAd.load(
      adUnitId: AdMobService.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _interstitialAd = null;
          _createInterstitialAd();
        },
      ),
    );
  }
}
