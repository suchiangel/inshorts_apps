import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:inshorts_app/model/news_model.dart';
import 'package:inshorts_app/services/ad_mobile_services.dart';
import 'package:inshorts_app/views/bookmark.dart';
import 'package:inshorts_app/views/discover.dart';
import 'package:inshorts_app/views/webview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AdMobService admobServices = AdMobService();

  bool _loading = true;
  bool _isShowfooter = false;

  double screenWidth = 0;
  double screenHeight = 0;
  int count = 0;
  List<NewsModel> newsList = [];

  void getNews() async {
    var url = Uri.parse("https://news.thedigitalkranti.com/new/v1/news");
    try {
      final response = await http.get(url);
      // log('List====>  ${response.statusCode}');
      // log('List====>  ${response.body}');
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        var _cryptoList = result['data'] as List;

        setState(() {
          for (var element in _cryptoList) {
            var temp = NewsModel();
            temp = NewsModel.fromJson(element);
            newsList.add(temp);
          }
          _loading = false;
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  var image;
  var title;
  var slugCtegory;
  var playStore = "https://play.google.com/store/apps/details?id=com.nis.app";

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width; // screen width
    double screenPad = 1; // screen padding for swiping between pages
    int _currentPosition = 1;
    return Scaffold(
      extendBody: true,
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              width: screenWidth,
              height: screenHeight,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: newsList.length,
                    onPageChanged: (index) {
                      setState(() {
                        _isShowfooter = !_isShowfooter;
                      });
                    },
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      if (count < 4) {
                        count++;
                        log('Count=:::>>> $count');
                        return newsWidget(newsList[index]);
                      } else {
                        count = 0;
                        log('Count======>>> $count');
                        // _showInterstitialAd();
                        // _createInterstitialAd();
                        return bannerAdWidget();
                      }
                    },
                  ),
                  Positioned(
                      child: _isShowfooter ? customAppbar() : Container())
                ],
              ),
            ),
    );
  }

  Widget newsWidget(NewsModel item) {
    image = item.image;
    title = item.title;
    slugCtegory = item.slug;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: screenWidth,
          height: screenHeight * 0.36,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: CachedNetworkImage(
              imageUrl: item.image == null
                  ? "http://via.placeholder.com/640x360"
                  : "${item.image}",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: screenWidth,
          height: screenHeight * 0.08,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "${item.title}",
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w600),
            maxLines: 2,
          ),
        ),
        // bannerAdWidget(),

        InkWell(
          onTap: () {
            setState(() {
              _isShowfooter = !_isShowfooter;
            });
          },
          child: Container(
            height: screenHeight * 0.43,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Html(
                data: item.description == null
                    ? "नोएडा (Noida News) में लगातार कोरोना (Corona) का कहर दिख रहा है। अभी हाल ही में नोएडा (Noida) के स्कूल में बच्चें कोरोना से संक्रमित पाए गए थे। जिस कारण वश स्कूल बंद किये गए थे। तो वहीं अब 32 छात्र और शिक्षक के रूप में नए मामले सामने आए हैं। जिसके बाद से स्वास्थ्य विभाग (Noida Health Department) भी अलर्ट हो गया है। साथ ही लोगों में एक बार फिर कोरोना को लेकर भय पैदा हो गया है"
                    : "${item.description}",
                style: {
                  "body": Style(
                    color: Colors.black87,
                    fontSize: FontSize(16),
                    fontWeight: FontWeight.w500,
                    maxLines: 12,
                  )
                }),
          ),
        ),
        SizedBox(
          height: 30,
        ),

        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebviewPage(
                          slugCategory: "${item.slug}",
                        )));
          },
          child: Container(
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
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  "${item.slug}";
                },
                child: Text(
                  "Tap to read more",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  // ignore: prefer_const_literals_to_create_immutables
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget customBottamBar() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebviewPage(
                      slugCategory: "${slugCtegory}",
                    )));
      },
      child: Container(
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
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              "${slugCtegory}";
            },
            child: Text(
              "Tap to read more",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              // ignore: prefer_const_literals_to_create_immutables
            ),
          ),
        ),
      ),
    );
  }

  Widget bannerAdWidget() {
    return Container(
      child: AdWidget(
        ad: AdMobService.createBannerAd(screenHeight, screenWidth)..load(),
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

  Widget customAppbar() {
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
                  padding: EdgeInsets.only(left: 40, top: 10),
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
                Container(
                  padding: EdgeInsets.only(left: 60, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                                  '${title} "\n${slugCtegory}" \n*ताजा खबरे सबसे पहले पाने के लिए नीचे क्लिक कर ASB News India एप इंस्टॉल करे*  "\n" ');
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookMarkPage()));
                        },
                        child: Icon(
                          FontAwesomeIcons.bookmark,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
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
