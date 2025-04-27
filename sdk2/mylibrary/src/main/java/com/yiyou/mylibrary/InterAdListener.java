package com.yiyou.mylibrary;

public interface InterAdListener {
    void onInterstitialAdLoaded();

    void onInterstitialAdLoadFail();

    void onInterstitialAdClicked();

    void onInterstitialAdShow();

    void onInterstitialAdClose();

    void onInterstitialAdVideoStart();

    void onInterstitialAdVideoEnd();

    void onInterstitialAdVideoError();
}
