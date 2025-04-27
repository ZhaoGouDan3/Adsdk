package com.yiyou.mylibrary;

import android.util.Log;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

public class NativeHandler implements InvocationHandler {

    private String TAG = "广告管理SDK";
    private NativeEventListener nativeListener;

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        Log.i(TAG, method.getName());
        switch (method.getName()){
            case "onAdImpressed":
                if(nativeListener!=null){
                    nativeListener.onAdImpressed();
                }
                break;
            case "onAdClicked":
                if(nativeListener!=null){
                    nativeListener.onAdClicked();
                }
                break;
            case "onAdVideoStart":
                if(nativeListener!=null){
                    nativeListener.onAdVideoStart();
                }
                break;
            case "onAdVideoEnd":
                if(nativeListener!=null){
                    nativeListener.onAdVideoEnd();
                }
                break;
            case "onAdVideoProgress":
                if(nativeListener!=null){
                    nativeListener.onAdVideoProgress();
                }
                break;
        }
        return proxy;
    }

    public void setListener(NativeEventListener nativeListener) {
        this.nativeListener = nativeListener;
    }
}

