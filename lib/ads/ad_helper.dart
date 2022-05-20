import 'package:google_mobile_ads/google_mobile_ads.dart';



class AdHelper{

//static const bool _testMode = true ;

//==============================================================BannerAd=============================================================================


static String get bannerAduitId {
//  if(_testMode){
//    return BannerAd.testAdUnitId;   // TEST BANNER
//  }
  return "ca-app-pub-3940256099942544/6300978111" ;
}






//==============================================================RewardedAd=============================================================================


static String get  rewardedAdUnitId {

//  if(_testMode){
//    return RewardedAd.testAdUnitId;
//  }
  return  "ca-app-pub-3940256099942544/5224354917";
}


//==============================================================interstitialAd=============================================================================

  static String get  interstitialAdUnitId {

//    if(_testMode){
//      return InterstitialAd.testAdUnitId;
//    }
    return  "ca-app-pub-3940256099942544/1033173712";
  }



}
