// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:inshorts_app/model/adhelper.dart';

// class AdProvider with ChangeNotifier {
//   bool isFullPageAdLoaded = false;
//   late InterstitialAd fullPageAd;

//   void initializeFullPageAd() async {
//    await InterstitialAd.load(
//         // adUnitId: AdHelper.homePageBanner(),
//         request: const AdRequest(),
//         adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
//           log("Full Page Ad Loaded!");
//           fullPageAd = ad;
//           isFullPageAdLoaded = true;
//         }, onAdFailedToLoad: (err) {
//           log(err.toString());
//           isFullPageAdLoaded = false;
//         }));
//         notifyListeners();
//   }
// }
