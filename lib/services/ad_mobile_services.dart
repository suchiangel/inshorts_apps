import 'dart:developer';
import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static String get interstitialAdUnitId => Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-4471645545827285/7703250106';
  static String get bannerAdUnitId => Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/6300978111';

  int num_attempot_load = 0;
  bool _isRewardedAdReady = false;
  late RewardedAd _rewardedAd;
  late InterstitialAd _interstitialAd;

  static get intrestitalAdUnitId => null;
  double screenWidth = 0;
  double screenHeight = 0;

  static initialize() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  static BannerAd createBannerAd(double width, double height) {
    BannerAd ad = BannerAd(
      size: AdSize(
        height: height.toInt(),
        width: width.toInt(),
      ),
      adUnitId: bannerAdUnitId,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) => log('Ad Loaded'),
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          // Dispose the ad here to free resources.
          ad.dispose();
          log('Ad failed to load: $error');
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) => log('Ad opened.'),
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) => log('Ad closed.'),
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) => log('Ad impression.'),
      ),
    );
    return ad;
  }

  Future<void> interAd() async {
    return await InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          num_attempot_load = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          num_attempot_load + 1;
          _interstitialAd = _interstitialAd;
          if (num_attempot_load <= 2) {
            createInterAd();
          }
        },
      ),
    );
  }

  void createInterAd() {
    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          num_attempot_load = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          num_attempot_load + 1;
          _interstitialAd = _interstitialAd;
          if (num_attempot_load <= 2) {
            createInterAd();
          }
        },
      ),
    );
  }

  void showInterAd() {
    if (_interstitialAd == null) {
      return;
    }
    _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) {
      log('Ad onShowAd Fullscreen');
    }, onAdDismissedFullScreenContent: (InterstitialAd ad) {
      log('Ad Dismissed');
      ad.dispose();
    }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
      log('$ad OnAdError $error');
      ad.dispose();
    });
    _interstitialAd.show();
    _interstitialAd = _interstitialAd;
  }
  //   void showRewardedAd() {
  //   _rewardedAd.show(
  //     onUserEarnedReward: (RewardedAd ad, RewardItem rpoint) {
  //       log('Rewarded Earned is ${rpoint.amount}');
  //     },
  //   );
  //   _rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
  //     onAdShowedFullScreenContent: (RewardedAd ad) {},
  //     onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
  //       log('Ad error');
  //       // ad.dispose();
  //     },
  //     onAdDismissedFullScreenContent: (RewardedAd ad) {
  //       log('Ad Dismissed');
  //       // ad.dispose();
  //     },
  //   );
  // }

}
