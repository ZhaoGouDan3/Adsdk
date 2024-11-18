package com.yiyou.mylibrary;

import android.content.Context;
import android.widget.Toast;


public class SbTest2 {
    public static void test(Context context){
        Toast.makeText(context, "傻逼", Toast.LENGTH_SHORT).show();
//        if (BuildConfig.DEBUG) {
//            ATSDK.setNetworkLogDebug(true);
//            /**
//             * 注意：不要在提交上架审核的包中带上此API，否则可能影响上架
//             */
//            ATSDK.integrationChecking(context.getApplicationContext());
//        }
//        ATSDK.setPersonalizedAdStatus(ATAdConst.PRIVACY.PERSIONALIZED_ALLOW_STATUS);
//        ATSDK.init(context,"", "");
//        ATSDK.start();
    }
}
