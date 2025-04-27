package com.yiyou.mylibrary;

public interface SplashAdListener {
    void onAdLoaded(boolean isTimeout);

    void onAdLoadTimeout();

    void onNoAdError();

    void onAdShow();

    void onAdClick();

    void onAdDismiss();
    void isAdReady(boolean isAdReady);
}
