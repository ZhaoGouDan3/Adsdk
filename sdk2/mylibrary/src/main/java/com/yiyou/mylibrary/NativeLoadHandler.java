package com.yiyou.mylibrary;

import android.util.Log;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

public class NativeLoadHandler implements InvocationHandler {

    private String TAG = "广告管理SDK";
    private NativeLoadListener interListener;

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        Log.i(TAG, method.getName());
        switch (method.getName()) {
            case "onNativeAdLoaded":
                if (interListener != null) {
                    interListener.onNativeAdLoaded();
                }
                break;
            case "onNativeAdLoadFail":
                if (interListener != null) {
                    interListener.onNativeAdLoadFail();
                }
                break;
        }
        return proxy;
    }

    public void setListener(NativeLoadListener interListener) {
        this.interListener = interListener;
    }
}

