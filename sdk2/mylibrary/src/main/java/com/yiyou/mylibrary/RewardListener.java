package com.yiyou.mylibrary;

public interface RewardListener {
    void onRewardedVideoAdLoaded();

    void onRewardedVideoAdFailed();

    void onRewardedVideoAdPlayStart();

    void onRewardedVideoAdPlayEnd();

    void onRewardedVideoAdPlayFailed();

    void onRewardedVideoAdClosed();

    void onRewardedVideoAdPlayClicked();

    void onReward();
}
