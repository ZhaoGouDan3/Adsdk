# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

-keepattributes *Annotation*
-keepattributes Signature
-keepattributes Exceptions

# MD5加密所需类
-keep class org.bouncycastle.** { *; }

# EventBug keep住所有被Subscribe注解标注的方法
-keepclassmembers class * {
    @org.greenrobot.eventbus.Subscribe <methods>;
}
-keep enum org.greenrobot.eventbus.ThreadMode { *; }

# ARouter
-keep public class com.alibaba.android.arouter.routes.**{*;}
-keep public class com.alibaba.android.arouter.facade.**{*;}
-keep class * implements com.alibaba.android.arouter.facade.template.ISyringe{*;}
-keep interface * implements com.alibaba.android.arouter.facade.template.IProvider
-keep class * implements com.alibaba.android.arouter.facade.template.IProvider

# Retrofit
-dontwarn retrofit2.**
-keep class retrofit2.** { *; }

# GSON
# Gson specific classes
-dontwarn sun.misc.**
# JsonSerializer, JsonDeserializer instances (so they can be used in @JsonAdapter)
-keep class * extends com.google.gson.TypeAdapter
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer
# Prevent R8 from leaving Data object members always null
-keepclassmembers,allowobfuscation class * {
  @com.google.gson.annotations.SerializedName <fields>;
}
# Retain generic signatures of TypeToken and its subclasses with R8 version 3.0 and higher.
-keep,allowobfuscation,allowshrinking class com.google.gson.reflect.TypeToken
-keep,allowobfuscation,allowshrinking class * extends com.google.gson.reflect.TypeToken

-dontwarn dalvik.**
-dontwarn com.tencent.smtt.**

-keep class com.tencent.smtt.** {
    *;
}
-keep class com.tencent.tbs.** {
    *;
}

-keep class com.yiwan.ceping.wallet.turbo.task.** { *;}

-keep class com.yiwan.ceping.wallet.turbo.weblibrary.** { *;}
# 保持生成的垃圾代码不被混淆
-keep class com.yiwan.ceping.wallet.turbo.abc.** {*;}

#微信登录
-keep class com.tencent.mm.opensdk.** {

*;

}

-keep class com.tencent.wxop.** {

*;

}

-keep class com.tencent.mm.sdk.** {

*;

}

#友盟
-dontshrink
-dontoptimize
-dontwarn com.google.android.maps.**
-dontwarn com.squareup.okhttp.**
-dontwarn android.webkit.WebView
-dontwarn com.umeng.**
-dontwarn com.tencent.weibo.sdk.**
-dontwarn com.facebook.**
-keep public class javax.**
-keep public class android.webkit.**
-dontwarn android.support.v4.**
-keep enum com.facebook.**
-keepattributes Exceptions,InnerClasses,Signature
-keepattributes *Annotation*
-keepattributes SourceFile,LineNumberTable
-keepattributes EnclosingMethod
-keep public interface com.facebook.**
-keep public interface com.tencent.**
-keep public interface com.umeng.socialize.**
-keep public interface com.umeng.socialize.sensor.**
-keep public interface com.umeng.scrshot.**

-keep public class com.umeng.socialize.* {*;}

-keep class com.umeng.commonsdk.statistics.common.MLog {*;}
-keep class com.umeng.commonsdk.UMConfigure {*;}
-keep class com.umeng.** {*;}
-keep class com.umeng.**
-keep class com.facebook.**
-keep class com.facebook.** { *; }
-keep class com.umeng.scrshot.**
-keep public class com.tencent.** {*;}
-keep class com.umeng.socialize.sensor.**
-keep class com.umeng.socialize.handler.**
-keep class com.umeng.socialize.handler.*
-keep class com.umeng.weixin.handler.**
-keep class com.umeng.weixin.handler.*
-keep class com.umeng.qq.handler.**
-keep class com.umeng.qq.handler.*
-keep class UMMoreHandler{*;}
-keep class com.tencent.mm.sdk.modelmsg.WXMediaMessage {*;}
-keep class com.tencent.mm.sdk.modelmsg.** implements com.tencent.mm.sdk.modelmsg.WXMediaMessage$IMediaObject {*;}
-keep class com.tencent.mm.sdk.** {
   *;
}
-keep class com.tencent.mm.opensdk.** {
   *;
}
-keep class com.tencent.wxop.** {
   *;
}
-keep class com.tencent.mm.sdk.** {
   *;
}
-dontwarn twitter4j.**
-keep class twitter4j.** { *; }

-keep class com.tencent.** {*;}
-dontwarn com.tencent.**
-keep class com.kakao.** {*;}
-dontwarn com.kakao.**
-keep public class com.umeng.com.umeng.soexample.R$*{
    public static final int *;
}
-keep public class com.linkedin.android.mobilesdk.R$*{
    public static final int *;
}
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

-keep class com.tencent.open.TDialog$*
-keep class com.tencent.open.TDialog$* {*;}
-keep class com.tencent.open.PKDialog
-keep class com.tencent.open.PKDialog {*;}
-keep class com.tencent.open.PKDialog$*
-keep class com.tencent.open.PKDialog$* {*;}
-keep class com.umeng.socialize.impl.ImageImpl {*;}
-keep class com.sina.** {*;}
-dontwarn com.sina.**
-keep class  com.alipay.share.sdk.** {
   *;
}

-keepnames class * implements android.os.Parcelable {
    public static final ** CREATOR;
}

-keep class com.linkedin.** { *; }
-keep class com.android.dingtalk.share.ddsharemodule.** { *; }
-keepattributes Signature

#taku
-keep public class com.anythink.**
-keepclassmembers class com.anythink.** {
   *;
}

-keep public class com.anythink.network.**
-keepclassmembers class com.anythink.network.** {
   public *;
}

-dontwarn com.anythink.hb.**
-keep class com.anythink.hb.**{ *;}

-dontwarn com.anythink.china.api.**
-keep class com.anythink.china.api.**{ *;}

-keep class com.anythink.myoffer.ui.**{ *;}
-keepclassmembers public class com.anythink.myoffer.ui.** {
   public *;
}


#广告平台
-ignorewarnings
-dontwarn com.baidu.mobads.sdk.api.**
-keepclassmembers class * extends android.app.Activity {
   public void *(android.view.View);
}

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

-keep class com.baidu.mobads.** { *; }
-keep class com.style.widget.** {*;}
-keep class com.component.** {*;}
-keep class com.baidu.ad.magic.flute.** {*;}
-keep class com.baidu.mobstat.forbes.** {*;}

-keep class android.support.v7.widget.RecyclerView {*;}
-keepnames class android.support.v7.widget.RecyclerView$* {
    public <fields>;
    public <methods>;
}
-keep class android.support.v7.widget.LinearLayoutManager {*;}
-keep class android.support.v7.widget.PagerSnapHelper {*;}
-keep class android.support.v4.view.ViewCompat {*;}
-keep class android.support.v4.util.LongSparseArray {*;}
-keep class android.support.v4.util.ArraySet {*;}
-keep class android.support.v4.view.accessibility.AccessibilityNodeInfoCompat {*;}


-keep class com.tencent.mm.opensdk.** {
    *;
}
-keep class com.tencent.wxop.** {
    *;
}
-keep class com.tencent.mm.sdk.** {
    *;
}
-keep class org.chromium.** {*;}
-keep class org.chromium.** { *; }
-keep class aegon.chrome.** { *; }
-keep class com.kwai.**{ *; }
-dontwarn com.kwai.**
-dontwarn com.kwad.**
-dontwarn com.ksad.**
-dontwarn aegon.chrome.**
# 优化 不优化输入的类文件
-dontoptimize

# androidx

-keep class com.google.android.material.** {*;}
-keep class androidx.** {*;}
-keep public class * extends androidx.**
-keep interface androidx.** {*;}
-dontwarn com.google.android.material.**
-dontnote com.google.android.material.**
-dontwarn androidx.**

# android.support.v4

-dontwarn android.support.v4.**
-keep class android.support.v4.** { *; }
-keep interface android.support.v4.** { *; }
-keep public class * extends android.support.v4.**

# WindAd

-keep class sun.misc.Unsafe { *; }
-keep class com.sigmob.**.**{*;}
-keep interface com.sigmob.**.**{*;}
-keep class com.czhj.**{*;}
-keep interface com.czhj.**{*;}

# miitmdid

-dontwarn com.bun.**
-keep class com.bun.** {*;}
-keep class a.**{*;}
-keep class XI.CA.XI.**{*;}
-keep class XI.K0.XI.**{*;}
-keep class XI.XI.K0.**{*;}
-keep class XI.vs.K0.**{*;}
-keep class XI.xo.XI.XI.**{*;}
-keep class com.asus.msa.SupplementaryDID.**{*;}
-keep class com.asus.msa.sdid.**{*;}
-keep class com.huawei.hms.ads.identifier.**{*;}
-keep class com.samsung.android.deviceidservice.**{*;}
-keep class com.zui.opendeviceidlibrary.**{*;}
-keep class org.json.**{*;}
-keep public class com.netease.nis.sdkwrapper.Utils {public <methods>;}
-keepclassmembers class * {
    *** getContext(...);
    *** getActivity(...);
    *** getResources(...);
    *** startActivity(...);
    *** startActivityForResult(...);
    *** registerReceiver(...);
    *** unregisterReceiver(...);
    *** query(...);
    *** getType(...);
    *** insert(...);
    *** delete(...);
    *** update(...);
    *** call(...);
    *** setResult(...);
    *** startService(...);
    *** stopService(...);
    *** bindService(...);
    *** unbindService(...);
    *** requestPermissions(...);
    *** getIdentifier(...);
   }

-keep class com.bytedance.pangle.** {*;}
-keep class com.bytedance.sdk.openadsdk.** { *; }

-keep class ms.bd.c.Pgl.**{*;}
-keep class com.bytedance.mobsec.metasec.ml.**{*;}

-keep class com.bytedance.embedapplog.** {*;}
-keep class com.bytedance.embed_dr.** {*;}

-keep class com.bykv.vk.** {*;}

-keep class com.lynx.** { *; }

-keep class com.ss.android.**{*;}

-keep class android.support.v4.app.FragmentActivity{}
-keep class androidx.fragment.app.FragmentActivity{}

# klevinAd
-keep class com.tencent.tgpa.**{*;}
-keep class com.tencent.klevin.**{*;}
# Analytics SDK
-keep class com.miui.analytics.** { *; }
-keep class com.xiaomi.analytics.* { public protected *; }
# Mediation SDK
-keep class com.xiaomi.ad.mediation.** { *; }
#Ad SDK
-keep class com.miui.zeus.mimo.sdk.** { *; }
-keep class com.google.gson.examples.android.model.** { <fields>; }
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer
-keep class * extends android.os.IInterface{
    *;
}
-keepattributes SourceFile,LineNumberTable
-dontwarn com.squareup.okhttp.**
-dontwarn okhttp3.**
-keep class com.vivo.*.** { *; }
-dontwarn com.bytedance.article.common.nativecrash.NativeCrashInit
-keep class com.bytedance.sdk.openadsdk.** {*;}
-keep public interface com.bytedance.sdk.openadsdk.downloadnew.** {*;}
-keep class com.pgl.sys.ces.* {*;}
-keep class com.qq.e.** {
 public protected *;
}
-keep class android.support.v4.**{
 public *;
}
-keep class android.support.v7.widget.** {*;}
-dontwarn com.vivo.secboxsdk.**
-keep class com.vivo.secboxsdk.SecBoxCipherException { *; }
-keep class com.vivo.secboxsdk.jni.SecBoxNative { *; }
-keep class com.vivo.secboxsdk.BuildConfig { *; }
-keep class com.vivo.advv.**{*;}
-keep class com.kwad.sdk.** { *;}
-keep class com.ksad.download.** { *;}
-keep class com.kwai.filedownloader.** { *;}
# sdk
-keep class com.bun.miitmdid.** { *; }
-keep interface com.bun.supplier.** { *; }
# asus
-keep class com.asus.msa.SupplementaryDID.** { *; }
-keep class com.asus.msa.sdid.** { *; }
# freeme
-keep class com.android.creator.** { *; }
-keep class com.android.msasdk.** { *; }
# huawei
-keep class com.huawei.hms.ads.** { *; }
-keep interface com.huawei.hms.ads.** {*; }
# lenovo
-keep class com.zui.deviceidservice.** { *; }
-keep class com.zui.opendeviceidlibrary.** { *; }
# meizu
-keep class com.meizu.flyme.openidsdk.** { *; }
# nubia
-keep class com.bun.miitmdid.provider.nubia.NubiaIdentityImpl { *; }
# oppo
-keep class com.heytap.openid.** { *; }
# samsung
-keep class com.samsung.android.deviceidservice.** { *; }
# vivo
-keep class com.vivo.identifier.** { *; }
# xiaomi
-keep class com.bun.miitmdid.provider.xiaomi.IdentifierManager { *; }
# zte
-keep class com.bun.lib.** { *; }
# coolpad
-keep class com.coolpad.deviceidsupport.** { *; }
# ---------掌酷 SDK--------------
-keep class com.wrapper.ZkViewSDK {
 public <fields>;
 public <methods>;
}
-keep class com.wrapper.ZkViewSDK$ActionCallBack {
 public <fields>;
 public <methods>;
}
# 保留枚举类不被混淆
-keepclassmembers enum * {
 public static **[] values();
 public static ** valueOf(java.lang.String);
}
-keep class com.wrapper.ZkViewSDK$KEY {
 public <fields>;
 public <methods>;
}
-keep class com.wrapper.ZkViewSDK$Event {
 public <fields>;
 public <methods>;
}
-keeppackagenames com.zk.**
# ---------掌酷 SDK--------------
#huawei
-keep class com.huawei.openalliance.ad.** { *; }
-keep class com.huawei.hms.ads.** { *; }
-keepattributes Signature
-keepattributes *Annotation*
-keep class com.mbridge.** {*; }
-keep interface com.mbridge.** {*; }
-keep class android.support.v4.** { *; }
-dontwarn com.mbridge.**
-keep class **.R$* { public static final int mbridge*; }
-keep class com.qq.e.** {
    public protected *;
}
-keep class android.support.v4.**{
    public *;
}
-keep class android.support.v7.**{
    public *;
}
-keep class MTT.ThirdAppInfoNew {
    *;
}
-keep class com.tencent.** {
    *;
}
-dontwarn dalvik.**
-dontwarn com.tencent.smtt.**
-dontwarn com.tapadn.**
-keep class com.tapadn.** { *;}
-dontshrink

#Richmob
-keep class com.wj.richmob.**{*;}
-keep class com.hy.richmob.topon.** {*;}

#数盟
-keep class cn.shuzilm.core.** {*;}

#快手视频
-keep class org.chromium.** {*;}
-keep class org.chromium.** { *; }
-keep class aegon.chrome.** { *; }
-keep class com.kwai.**{ *; }
-keep class com.kwad.**{ *; }
-keepclasseswithmembernames class * {
native <methods>;
}
-dontwarn com.kwai.**
-dontwarn com.kwad.**
-dontwarn com.ksad.**
-dontwarn aegon.chrome.**

-keep class com.wj.mobads.**{*;}
-keep class com.hy.mobads.topon.** {*;}


#beizi
-ignorewarnings

-dontoptimize
-dontpreverify
-dontwarn android.app.**
-dontwarn android.support.**
-dontwarn sun.misc.**
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn android.support.**


-keep class sun.misc.**{*;}
-keep class android.support.** { *; }
-keep class android.app.**{*;}
-keep class **.R$* {*;}

# 倍孜混淆
-dontwarn com.beizi.fusion.**
-dontwarn com.beizi.ad.**
-keep class com.beizi.fusion.** {*; }
-keep class com.beizi.ad.** {*; }

-keep class com.qq.e.** {
    public protected *;
}

-keepattributes Exceptions,InnerClasses,Signature,Deprecated,SourceFile,LineNumberTable,*Annotation*,EnclosingMethod

-dontwarn  org.apache.**

# 百度广告渠道混淆
-dontwarn com.baidu.mobads.sdk.api.**
-keepclassmembers class * extends android.app.Activity {
public void *(android.view.View);
}

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

-keep class com.baidu.mobads.** { *; }
-keep class com.style.widget.** {*;}
-keep class com.component.** {*;}
-keep class com.baidu.ad.magic.flute.** {*;}
-keep class com.baidu.mobstat.forbes.** {*;}

# 穿山甲广告渠道混淆
-keepclassmembers class * {
    *** getContext(...);
    *** getActivity(...);
    *** getResources(...);
    *** startActivity(...);
    *** startActivityForResult(...);
    *** registerReceiver(...);
    *** unregisterReceiver(...);
    *** query(...);
    *** getType(...);
    *** insert(...);
    *** delete(...);
    *** update(...);
    *** call(...);
    *** setResult(...);
    *** startService(...);
    *** stopService(...);
    *** bindService(...);
    *** unbindService(...);
    *** requestPermissions(...);
    *** getIdentifier(...);
  }

-keep class com.bytedance.pangle.** {*;}
-keep class com.bytedance.sdk.openadsdk.** { *; }
-keep class com.bytedance.frameworks.** { *; }

-keep class ms.bd.c.Pgl.**{*;}
-keep class com.bytedance.mobsec.metasec.ml.**{*;}

-keep class com.ss.android.**{*;}

-keep class com.bytedance.embedapplog.** {*;}
-keep class com.bytedance.embed_dr.** {*;}

-keep class com.bykv.vk.** {*;}

-keep class bykvm*.**
-keep class com.bytedance.msdk.adapter.**{ public *; }
-keep class com.bytedance.msdk.api.** {
 public *;
}
-keep class com.bytedance.msdk.base.TTBaseAd{*;}
-keep class com.bytedance.msdk.adapter.TTAbsAdLoaderAdapter{
    public *;
    protected <fields>;
}


# 快手广告渠道混淆
-keep class org.chromium.** {*;}
-keep class org.chromium.** { *; }
-keep class aegon.chrome.** { *; }
-keep class com.kwai.**{ *; }
-dontwarn com.kwai.**
-dontwarn com.kwad.**
-dontwarn com.ksad.**
-dontwarn aegon.chrome.**

###聚合混淆
-keep class com.open.ad.** {public protected *;}
###TanxSDK
###优化配置，可进行字段优化、内联、类合并、代码简化、算法指令精简等操作。
-optimizations code/removal/simple,code/removal/advanced,method/removal/parameter,method/inlining/short,method/inlining/tailrecursion
####执行优化的次数，默认1次，多次能达到更好的优化效果。
-optimizationpasses 5
# 混合时不使用大小写混合，混合后的类名为小写
-dontusemixedcaseclassnames
#####保持参数名 指定keep已经被keep的方法的参数类型和参数名称，在混淆library库时非常有用，可供IDE帮助用户进行信息提示和代码自动填充。
-keepparameternames
#####指定保留属性，多个属性可以用多个-keepattributes配置，也可以用逗号分隔，可以使用? * **通配符，并且可以使用否定符（!）。
 ####比如，在混淆ibrary库时，应该至少keep Exceptions, InnerClasses, Signature；如果在追踪代码，还需要keep符号表；使用到注解时也需要keep。
-keepattributes Exceptions,InnerClasses,Signature,Deprecated,SourceFile,LineNumberTable,*Annotation*,EnclosingMethod
####优化时允许访问并修改有修饰符的类和类的成员, 混淆后的类名还会改变地方，到其他包中  需要，所有被混淆的都到一个包去，不需要保留原来的结构
-allowaccessmodification
####混淆前后类、方法、类成员等的对照
-printmapping mapping.txt
####屏蔽警告
-ignorewarnings
####指定在混淆过程中输出更多信息，配置这个选项后，在遇到异常时，将输出完整的堆栈，而不仅仅是异常消息
-verbose
#### 指定不去忽略非公共的库类(不跳过library中的非public的类)
-dontskipnonpubliclibraryclasses
####指定不去忽略非公共库的类成员
-dontskipnonpubliclibraryclassmembers

-dontwarn com.alibaba.fastjson.**

-keep class com.alibaba.fastjson.**{*;}
-keep class com.bumptech.glide.**{*;}

-keep class com.alimm.tanx.**{*;}


#### 有进程间通信,保证service相关不被混淆
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver


#### 自动曝光数据的防混淆
-keep class * implements java.io.Serializable{
     <fields>;
    <methods>;
}
# Octopus混淆
-dontwarn com.octopus.ad.**
-keep class com.octopus.ad.** {*;}

# yd_sdk_ad_xxx.aar
-keep class com.fl.** {*;}

-keep class com.anythink.tp.adapter.** { *;}
-keepclassmembers public class com.anythink.tp.adapter.** {
public *;
}
#tradplus
-keep public class com.tradplus.** { *; }
-keep class com.tradplus.ads.** { *; }


#oaid
-keep class com.asus.msa.**{*;}
-keep class com.bun.**{*;}
-keep class com.huawei.hms.ads.identifier.**{*;}
-keep class com.netease.nis.sdkwrapper.**{*;}
-keep class com.samsung.android.deviceidservice.**{*;}
-keep class com.zui.**{*;}
-keep class XI.**{*;}
#oaid

#优推
-keep class com.alliance.ssp.ad.** {*;}
#优推

#奇运
-keep class cn.jy.ad.sdk.**{*;}
#奇运

#多盟
-dontwarn com.domob.sdk.**
-keep class com.domob.sdk.**{*;}
-keep interface com.domob.sdk.**{*;}
#多盟

#聚合
-keep class cj.mobile.**{*;}
-keep interface cj.mobile.**{*;}
#聚合

-keep class com.customsigmobadapter.**{*;}
-keep class com.yt.**{*;}


#阿里妈妈
-dontwarn com.alibaba.fastjson.**

-keep class com.alibaba.fastjson.**{*;}
-keep class com.bumptech.glide.**{*;}

-keep class com.alimm.tanx.**{*;}

# 自动曝光数据的防混淆
-keep class * implements java.io.Serializable{
     <fields>;
    <methods>;
}
#-------------- AdSet start-------------
-keep class com.kc.openset.**{*;}
-keep class com.od.**{*;}
-dontwarn com.kc.openset.**

-keep @com.qihoo.SdkProtected.OSETSDK.Keep class **{*;}
-keep,allowobfuscation interface com.qihoo.SdkProtected.OSETSDK.Keep
#-------------- AdSet end-------------


#-------------- gromoe start-------------
-keep class com.bytedance.sdk.openadsdk.** { *; }
-keep public interface com.bytedance.sdk.openadsdk.downloadnew.** {*;}
-keep class com.ss.**{*;}
-dontwarn com.ss.**

-keep class bykvm*.**
-keep class com.bytedance.msdk.adapter.**{ public *; }
-keep class com.bytedance.msdk.api.** {
 public *;
}
-keep class com.bytedance.msdk.base.TTBaseAd{*;}
-keep class com.bytedance.msdk.adapter.TTAbsAdLoaderAdapter{
    public *;
    protected <fields>;
}
#-keep class com.bykv.**{*;}
#-keep class com.byted.live.lite.**{*;}
#-keep class com.bytedance.**{*;}
#-keep class com.pandora.common.**{*;}
#-keep class com.ss.**{*;}
#-------------- gromoe end -------------


#-------------- 快手 start-------------
-keep class org.chromium.** {*;}
-keep class org.chromium.** { *; }
-keep class aegon.chrome.** { *; }
-keep class com.kwai.**{ *; }

-dontwarn com.kwai.**
-dontwarn com.kwad.**
-dontwarn com.ksad.**
-dontwarn aegon.chrome.**
#-------------- 快手 end-------------


#-------------- sigmob start-------------
-dontoptimize

-keep class sun.misc.Unsafe { *; }
-keep class com.sigmob.**.**{*;}
-keep interface com.sigmob.**.**{*;}
-keep class com.czhj.**{*;}
-keep interface com.czhj.**{*;}

# androidx
-keep class com.google.android.material.** {*;}
-keep class androidx.** {*;}
-keep public class * extends androidx.**
-keep interface androidx.** {*;}
-dontwarn com.google.android.material.**
-dontnote com.google.android.material.**
-dontwarn androidx.**

# android.support.v4
-dontwarn android.support.v4.**
-keep class android.support.v4.** { *; }
-keep interface android.support.v4.** { *; }
-keep public class * extends android.support.v4.**
#-------------- sigmob end-------------


#-------------- oaid start-------------
# 注意不同版本混淆不一样，如果你接入的是sdk默认的1.0.25版本就用下面的，其他版本自行检查
-keep class com.bun.supplier.** {*;}
-dontwarn com.bun.supplier.core.**
-keep class XI.**{*;}
-keep class com.bun.miitmdid.**{*;}

-keep class com.asus.msa.**{*;}
-keep class com.bun.**{*;}
-keep class com.huawei.hms.ads.identifier.**{*;}
-keep class com.netease.nis.sdkwrapper.**{*;}
-keep class com.samsung.android.deviceidservice.**{*;}
-keep class com.zui.**{*;}
-keep class XI.**{*;}
#-------------- oaid end-------------


#-------------- 广点通 start-------------
-keep class com.qq.e.** {*;}
-dontwarn com.qq.e.**
#-------------- 广点通 end-------------


#-------------- 百度 start-------------
-ignorewarnings
-dontwarn com.baidu.mobads.sdk.api.**
-keepclassmembers class * extends android.app.Activity {
   public void *(android.view.View);
}

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

-keep class com.baidu.mobads.** { *; }
-keep class com.style.widget.** {*;}
-keep class com.component.** {*;}
-keep class com.baidu.ad.magic.flute.** {*;}
-keep class com.baidu.mobstat.forbes.** {*;}
#-------------- 百度 end-------------


#-------------- okhttp3 start-------------
# OkHttp3
# https://github.com/square/okhttp
# okhttp
-keepattributes Signature
-keepattributes *Annotation*
-keep class com.squareup.okhttp.* { *; }
-keep interface com.squareup.okhttp.** { *; }
-dontwarn com.squareup.okhttp.**

# okhttp 3
-keepattributes Signature
-keepattributes *Annotation*
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**

-keepattributes InnerClasses

# Okio
-dontwarn com.squareup.**
-dontwarn okio.**
-keep public class org.codehaus.* { *; }
-keep public class java.nio.* { *; }
#----------okhttp end--------------


#----------log start--------------
-keep class com.aliyun.sls.android.producer.** { *; }
-keep interface com.aliyun.sls.android.producer.* { *; }
#----------log end--------------


#----------倍孜 start--------------
-dontwarn com.beizi.fusion.**
-dontwarn com.beizi.ad.**
-keep class com.beizi.fusion.** {*; }
-keep class com.beizi.ad.** {*; }

-keep class com.qq.e.** {
    public protected *;
}

-keepattributes Exceptions,InnerClasses,Signature,Deprecated,SourceFile,LineNumberTable,*Annotation*,EnclosingMethod

-dontwarn  org.apache.**
#----------倍孜 end--------------


#----------Glide start--------------
-dontwarn com.bumptech.glide.**
-keep class com.bumptech.glide.**{*;}
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public class * extends com.bumptech.glide.module.AppGlideModule
-keep public enum com.bumptech.glide.load.resource.bitmap.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}
#----------Glide end--------------


#----------阿里TanxAd start--------------
-dontwarn com.alibaba.fastjson.**

-keep class com.alibaba.fastjson.**{*;}
-keep class com.bumptech.glide.**{*;}

-keep class com.alimm.tanx.**{*;}

# 有进程间通信,保证service相关不被混淆
#-keep public class * extends android.app.Service
#-keep public class * extends android.content.BroadcastReceiver

# 自动曝光数据的防混淆
-keep class * implements java.io.Serializable{
     <fields>;
    <methods>;
}
#----------阿里TanxAd end--------------

#----------华为荣耀 start--------------
-keep class com.hihonor.ads.** {*; }
#----------华为荣耀 end--------------

#-------------- 章鱼 start-------------
-dontwarn com.octopus.ad.**
-keep class com.octopus.ad.** {*;}
#-------------- 章鱼 end-------------