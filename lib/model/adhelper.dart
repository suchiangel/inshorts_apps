import 'dart:io';

class AdHelper {
  static get intrestitalAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7941982969141689/3534291411";
    } else {
      return "";
    }
  }

  static get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-7941982969141689/8122566821';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544~3347511713';
    } else {
      throw UnsupportedError("Unsopperted Error");
    }
  }
}
