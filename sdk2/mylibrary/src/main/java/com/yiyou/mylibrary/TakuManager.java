package com.yiyou.mylibrary;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;


public class TakuManager {
    private String TAG = "广告管理SDK";

    private static TakuManager topOnManager;
    public static boolean isInitialized = false;
    private Context mContext;

    public TakuManager(Context context) {
        mContext = context.getApplicationContext();
    }

    public static TakuManager getInstance(Context context) {
        if (topOnManager == null) {
            synchronized (TakuManager.class) {
                if (topOnManager == null) {
                    topOnManager = new TakuManager(context);
                }
            }
        }
        return topOnManager;
    }

    public void init() {
        /**
         * 反射初始化
         */
        try {
            Class<?> sdkClass = Class.forName("com.anythink.core.api.ATSDK");
            Object sdkInstance = sdkClass.getDeclaredConstructor().newInstance();
            Method setNetworkLogDebug = sdkClass.getMethod("setNetworkLogDebug", boolean.class);
            setNetworkLogDebug.invoke(sdkInstance, false);
            //个性化
            Method setPersonalizedAdStatus = sdkClass.getMethod("setPersonalizedAdStatus", int.class);
            setPersonalizedAdStatus.invoke(sdkInstance, 1);
            //初始化
            Method init = sdkClass.getMethod("init", Context.class, String.class, String.class);
            init.invoke(sdkInstance, mContext, "a6747dd9f4b02a", "ae1e09844fc83758bfe861f8dbc09a055");
            Method start = sdkClass.getMethod("start");
            start.invoke(sdkInstance);
            Log.i(TAG, "初始化成功");
        } catch (Exception e) {
            Log.i(TAG, "初始化失败" + e.getMessage());
        }
    }

    /**
     * 激励视频（非自动加载）
     */
    Class<?> rewardClass;
    Object rewardO;

    public void loadReward() {
        try {
            rewardClass = Class.forName("com.anythink.rewardvideo.api.ATRewardVideoAd");
            Constructor<?> rewardInstance = rewardClass.getConstructor(Context.class, String.class);
            rewardO = rewardInstance.newInstance(mContext, "b677ba0905b0aa");
            //加载
            Method load = rewardClass.getMethod("load");
            load.invoke(rewardO);
            Log.i(TAG, "加载激励成功");
        } catch (Exception e) {
            Log.i(TAG, "加载激励失败" + e.getMessage());
        }
    }

    public boolean isRewardAdReady() {
        if (rewardClass != null) {
            try {
                Method isAdReady = rewardClass.getMethod("isAdReady");
                boolean ready = (boolean) isAdReady.invoke(rewardO);
                Log.i(TAG, "激励广告准备" + ready);
                return ready;
            } catch (Exception e) {
                Log.i(TAG, "激励广告准备异常" + e.getMessage());
                return false;
            }
        }
        Log.i(TAG, "实例为空，请先初始化激励视频");
        return false;
    }

    public void showReward(Activity activity) {
        if (rewardClass != null) {
            try {
                Method show = rewardClass.getMethod("show", Activity.class);
                show.invoke(rewardO, activity);
            } catch (Exception e) {
                Log.i(TAG, "展示激励广告失败异常:" + e.getMessage());
            }
        }
    }

    public void setRewardListener(RewardListener rewardListener) {
        try {
            Class<?> myCallbackClazz = Class.forName("com.anythink.rewardvideo.api.ATRewardVideoListener");//接口
            RewardHandler rewardHandler = new RewardHandler();//类
            rewardHandler.setListener(rewardListener);
            Object o = Proxy.newProxyInstance(
                    getClass().getClassLoader(),//类加载器
                    new Class[]{myCallbackClazz},//接口数组
                    rewardHandler//为接口实现的对应具体方法
            );//为接口实例化对象
            Method method = rewardClass.getDeclaredMethod("setAdListener", myCallbackClazz);//（类名，参数类型）
            method.invoke(rewardO, o);//调用方法，（实例化对象，内部接口实现对象）

        } catch (Exception e) {
            Log.i(TAG, "设置激励监听异常" + e.getMessage());
        }
    }

    /**
     * 插屏广告
     */
    Class<?> interClass;
    Object interO;

    public void loadInterstitialAd() {
        try {
            interClass = Class.forName("com.anythink.interstitial.api.ATInterstitial");
            Constructor<?> rewardInstance = interClass.getConstructor(Context.class, String.class);
            interO = rewardInstance.newInstance(mContext, "b677ba08552a51");
            //加载
            Method load = interClass.getMethod("load");
            load.invoke(interO);
            Log.i(TAG, "加载插屏成功");
        } catch (Exception e) {
            Log.i(TAG, "加载插屏失败" + e.getMessage());
        }
    }

    public boolean isInterAdReady() {
        if (interClass != null) {
            try {
                Method isAdReady = interClass.getMethod("isAdReady");
                boolean ready = (boolean) isAdReady.invoke(interO);
                Log.i(TAG, "插屏广告准备" + ready);
                return ready;
            } catch (Exception e) {
                Log.i(TAG, "插屏广告准备异常" + e.getMessage());
                return false;
            }
        }
        Log.i(TAG, "实例为空，请先初始化插屏视频");
        return false;
    }

    public void showInterstitialAd(Activity activity) {
        if (interClass != null) {
            try {
                Method show = interClass.getMethod("show", Activity.class);
                show.invoke(interO, activity);
            } catch (Exception e) {
                Log.i(TAG, "展示插屏广告失败异常:" + e.getMessage());
            }
        }
    }

    public void setInterListener(InterAdListener interAdListener) {
        try {
            Class<?> myCallbackClazz = Class.forName("com.anythink.interstitial.api.ATInterstitialListener");//接口
            InterHandler interHandler = new InterHandler();//类
            interHandler.setListener(interAdListener);
            Object o = Proxy.newProxyInstance(
                    getClass().getClassLoader(),//类加载器
                    new Class[]{myCallbackClazz},//接口数组
                    interHandler//为接口实现的对应具体方法
            );//为接口实例化对象
            Method method = interClass.getDeclaredMethod("setAdListener", myCallbackClazz);//（类名，参数类型）
            method.invoke(interO, o);//调用方法，（实例化对象，内部接口实现对象）

        } catch (Exception e) {
            Log.i(TAG, "设置插屏监听异常" + e.getMessage());
        }
    }

    /**
     * 原生广告
     */
    Object nativeObject;
    Class<?> atNativeClass;

    public void loadNativeAd(int width, int height, NativeLoadListener nativeLoadListener) {
        try {
            atNativeClass = Class.forName("com.anythink.nativead.api.ATNative");
            Class<?> atNativeListener = Class.forName("com.anythink.nativead.api.ATNativeNetworkListener");

            Constructor<?> nativeConstructor = atNativeClass.getConstructor(Context.class, String.class, atNativeListener);
            NativeLoadHandler nativeLoadHandler = new NativeLoadHandler();//类
            nativeLoadHandler.setListener(nativeLoadListener);
            Object o = Proxy.newProxyInstance(
                    getClass().getClassLoader(),//类加载器
                    new Class[]{atNativeListener},//接口数组
                    nativeLoadHandler//为接口实现的对应具体方法
            );//为接口实例化对象
            nativeObject = nativeConstructor.newInstance(mContext, "b677ba09c8213c", o);

            final int adViewWidth = width;
            final int adViewHeight = height;
            Map localMap = new HashMap<String, Object>();
            localMap.put("key_width", adViewWidth);//单位：px，期望展示广告的宽度
            localMap.put("key_height", adViewHeight);//单位：px，期望展示广告的高度
            localMap.put("tt_image_height", 0);
            //腾讯广告（Tencent Ads），ADSize.AUTO_HEIGHT值为-2
            localMap.put("gdtad_height", -2);
            //反射设置配置
            Method setLocalExtra = atNativeClass.getMethod("setLocalExtra", Map.class);
            setLocalExtra.invoke(nativeObject, localMap);
            //发起广告请求
            Method makeAdRequest = atNativeClass.getMethod("makeAdRequest");
            makeAdRequest.invoke(nativeObject);
            Log.i(TAG, "原生加载成功");
        } catch (Exception e) {
            Log.i(TAG, "原生加载失败" + e.getMessage());
        }
    }

    private View mSelfRenderView;
    private Object mNativeAd;

    public void showNativeAd(Activity activity, View view, View childView, NativeEventListener nativeEventListener) {
        try {
            Class<?> aClass = Class.forName("com.anythink.nativead.api.ATNativeAdView");
            if (aClass.isInstance(view)) {
                // 如果 view 是 ATNativeAdView 类型的实例
                if (nativeObject == null || atNativeClass == null) {
                    return;
                }
                Method checkAdStatus = atNativeClass.getMethod("checkAdStatus");
                Object checkAdInvoke = checkAdStatus.invoke(nativeObject);

                Class<?> atAdStatusInfoClass = Class.forName("com.anythink.core.api.ATAdStatusInfo");

                Method adMethod = atAdStatusInfoClass.getMethod("isReady");

                boolean statusValue = (boolean) adMethod.invoke(checkAdInvoke);
                Log.i(TAG, "原生广告准备" + statusValue);
                if (!statusValue) {
                    return;
                }
                view.setVisibility(View.VISIBLE);

                if (mSelfRenderView == null) {
                    mSelfRenderView = childView; //可在xml布局定义
                }

                Method getNativeAd = atNativeClass.getMethod("getNativeAd");
                Object nativeAd = getNativeAd.invoke(nativeObject);

                //NativeAD

                if (nativeAd != null) {
                    if (mNativeAd != null) {
                        Class<?> nativeAdClass = Class.forName("com.anythink.nativead.api.NativeAd");
                        Method destroy = nativeAdClass.getDeclaredMethod("destroy");
                        destroy.invoke(nativeAd);
                    }
                    mNativeAd = nativeAd;
                    Class<?> atNativeListener = Class.forName("com.anythink.nativead.api.ATNativeEventListener");

                    NativeHandler nativeHandler = new NativeHandler();//类
                    nativeHandler.setListener(nativeEventListener);
                    Object o = Proxy.newProxyInstance(
                            getClass().getClassLoader(),//类加载器
                            new Class[]{atNativeListener},//接口数组
                            nativeHandler//为接口实现的对应具体方法
                    );//为接口实例化对象

                    Method setNativeEventListener = mNativeAd.getClass().getMethod("setNativeEventListener", atNativeListener);
                    setNativeEventListener.invoke(nativeAd, o);


                    Class<?> aTNativePrepareInfo = Class.forName("com.anythink.nativead.api.ATNativePrepareInfo");

                    Method method = aClass.getMethod("removeAllViews");
                    method.invoke(view);

                    Method method1 = mNativeAd.getClass().getMethod("isNativeExpress");
                    boolean isNativeExpress = (boolean) method1.invoke(nativeAd);
                    if (!isNativeExpress) {
                        Log.i(TAG, "自渲染");
                        nativeEventListener.isNotNativeExpress(mNativeAd);
                    } else {
                        Log.i(TAG, "模板");
                        Method renderAdContainer = mNativeAd.getClass().getMethod("renderAdContainer", aClass, View.class);
                        renderAdContainer.invoke(nativeAd, view, null);
                        Method prepare = mNativeAd.getClass().getMethod("prepare", aClass, aTNativePrepareInfo);
                        prepare.invoke(nativeAd, view, null);
                    }

                }

            } else {
                // 如果 view 不是 ATNativeAdView 类型的实例
                Log.i(TAG, "请传ATNativeAdView.");
            }
        } catch (Exception e) {
            Log.i(TAG, "原生展示异常" + e.getMessage());
        }
    }

    /**
     * 开屏广告
     */
    Class<?> aTSplashAd;
    Object splashObject;
    SplashAdListener listener;

    public void loadSplash(Context context, SplashAdListener splashAdListener) {
        try {
            aTSplashAd = Class.forName("com.anythink.splashad.api.ATSplashAd");
            Class<?> aTSplashAdListener = Class.forName("com.anythink.splashad.api.ATSplashAdListener");

            Constructor<?> constructor = aTSplashAd.getConstructor(Context.class, String.class, aTSplashAdListener);
            SplashHandler splashHandler = new SplashHandler();//类
            splashHandler.setListener(splashAdListener);
            Object o = Proxy.newProxyInstance(
                    getClass().getClassLoader(),//类加载器
                    new Class[]{aTSplashAdListener},//接口数组
                    splashHandler//为接口实现的对应具体方法
            );//为接口实例化对象
            splashObject = constructor.newInstance(context, "b677ba0743110a", o);
            Method method = aTSplashAd.getMethod("loadAd");
            method.invoke(splashObject);
            Log.i(TAG, "开屏加载成功");
            this.listener=splashAdListener;
        } catch (Exception e) {
            Log.i(TAG, "开屏异常:"+e.getMessage());
        }
    }
    public void showSplashAd(Activity activity, ViewGroup viewGroup){
        try {
            if(aTSplashAd!=null){
                Method method = aTSplashAd.getMethod("isAdReady");
                boolean isAdReady = (boolean) method.invoke(splashObject);
                if(listener!=null){
                    if(isAdReady){
                        Method method1 = aTSplashAd.getMethod("show", Activity.class, ViewGroup.class);
                        method1.invoke(splashObject,activity,viewGroup);
                    }
                    listener.isAdReady(isAdReady);
                    Log.i(TAG,"开屏广告是否准备完毕"+isAdReady);
                }else {
                    Log.i(TAG,"请先初始化开屏广告！");
                }
            }
        }catch (Exception e){
            Log.i(TAG,"开屏广告展示异常:"+e.getMessage());
        }
    }
}
