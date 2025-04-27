package com.yiyou.mylibrary;

public interface NativeEventListener {
    void onAdImpressed();

    void onAdClicked();

    void onAdVideoStart();

    void onAdVideoEnd();

    void onAdVideoProgress();
    void isNotNativeExpress(Object mNativeAd);

}
