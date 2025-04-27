package com.yiyou.mylibrary;

import android.util.Log;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

public class SplashHandler implements InvocationHandler {

    private String TAG = "广告管理SDK";
    private SplashAdListener splashAdListener;

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        Log.i(TAG, method.getName());
        switch (method.getName()){
            case "onAdLoaded":
                if(splashAdListener!=null){
                    splashAdListener.onAdLoaded((Boolean) args[0]);
                }
                break;
            case "onAdLoadTimeout":
                if(splashAdListener!=null){
                    splashAdListener.onAdLoadTimeout();
                }
                break;
            case "onNoAdError":
                if(splashAdListener!=null){
                    splashAdListener.onNoAdError();
                }
                break;
            case "onAdShow":
                if(splashAdListener!=null){
                    splashAdListener.onAdShow();
                }
                break;
            case "onAdClick":
                if(splashAdListener!=null){
                    splashAdListener.onAdClick();
                }
                break;
            case "onAdDismiss":
                if(splashAdListener!=null){
                    splashAdListener.onAdDismiss();
                }
                break;
        }
        return proxy;
    }

    public void setListener(SplashAdListener splashAdListener) {
        this.splashAdListener = splashAdListener;
    }
}

