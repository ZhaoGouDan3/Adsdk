package com.yiyou.mylibrary;

import android.util.Log;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

public class RewardHandler implements InvocationHandler {

    private String TAG = "广告管理SDK";
    private RewardListener rewardListener;

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        Log.i(TAG, method.getName());
        switch (method.getName()){
            case "onRewardedVideoAdLoaded":
                if(rewardListener!=null){
                    rewardListener.onRewardedVideoAdLoaded();
                }
                break;
            case "onRewardedVideoAdFailed":
                if(rewardListener!=null){
                    rewardListener.onRewardedVideoAdFailed();
                }
                break;
            case "onRewardedVideoAdPlayStart":
                if(rewardListener!=null){
                    rewardListener.onRewardedVideoAdPlayStart();
                }
                break;
            case "onRewardedVideoAdPlayEnd":
                if(rewardListener!=null){
                    rewardListener.onRewardedVideoAdPlayEnd();
                }
                break;
            case "onRewardedVideoAdPlayFailed":
                if(rewardListener!=null){
                    rewardListener.onRewardedVideoAdPlayFailed();
                }
                break;
            case "onRewardedVideoAdClosed":
                if(rewardListener!=null){
                    rewardListener.onRewardedVideoAdClosed();
                }
                break;
            case "onRewardedVideoAdPlayClicked":
                if(rewardListener!=null){
                    rewardListener.onRewardedVideoAdPlayClicked();
                }
                break;
            case "onReward":
                if(rewardListener!=null){
                    rewardListener.onReward();
                }
                break;
        }
        return proxy;
    }

    public void setListener(RewardListener rewardListener) {
        this.rewardListener = rewardListener;
    }
}

