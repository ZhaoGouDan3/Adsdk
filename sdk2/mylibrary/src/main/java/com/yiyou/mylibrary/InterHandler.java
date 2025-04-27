package com.yiyou.mylibrary;

import android.util.Log;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

public class InterHandler implements InvocationHandler {

    private String TAG = "广告管理SDK";
    private InterAdListener interListener;

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        Log.i(TAG, method.getName());
        switch (method.getName()){
            case "onInterstitialAdLoaded":
                if(interListener!=null){
                    interListener.onInterstitialAdLoaded();
                }
                break;
            case "onInterstitialAdLoadFail":
                if(interListener!=null){
                    interListener.onInterstitialAdLoadFail();
                }
                break;
            case "onInterstitialAdClicked":
                if(interListener!=null){
                    interListener.onInterstitialAdClicked();
                }
                break;
            case "onInterstitialAdShow":
                if(interListener!=null){
                    interListener.onInterstitialAdShow();
                }
                break;
            case "onInterstitialAdClose":
                if(interListener!=null){
                    interListener.onInterstitialAdClose();
                }
                break;
            case "onInterstitialAdVideoStart":
                if(interListener!=null){
                    interListener.onInterstitialAdVideoStart();
                }
                break;
            case "onInterstitialAdVideoEnd":
                if(interListener!=null){
                    interListener.onInterstitialAdVideoEnd();
                }
                break;
            case "onInterstitialAdVideoError":
                if(interListener!=null){
                    interListener.onInterstitialAdVideoError();
                }
                break;
        }
        return proxy;
    }

    public void setListener(InterAdListener interListener) {
        this.interListener = interListener;
    }
}

