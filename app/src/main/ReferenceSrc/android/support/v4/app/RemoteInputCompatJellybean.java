package android.support.v4.app;

import android.annotation.TargetApi;
import android.content.ClipData;
import android.content.ClipDescription;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.RequiresApi;
import android.support.v4.app.RemoteInputCompatBase;

@RequiresApi(16)
@TargetApi(16)
/* loaded from: classes.jar:android/support/v4/app/RemoteInputCompatJellybean.class */
class RemoteInputCompatJellybean {
    public static final String EXTRA_RESULTS_DATA = "android.remoteinput.resultsData";
    private static final String KEY_ALLOW_FREE_FORM_INPUT = "allowFreeFormInput";
    private static final String KEY_CHOICES = "choices";
    private static final String KEY_EXTRAS = "extras";
    private static final String KEY_LABEL = "label";
    private static final String KEY_RESULT_KEY = "resultKey";
    public static final String RESULTS_CLIP_LABEL = "android.remoteinput.results";

    RemoteInputCompatJellybean() {
    }

    static void addResultsToIntent(RemoteInputCompatBase.RemoteInput[] remoteInputArr, Intent intent, Bundle bundle) {
        Bundle bundle2 = new Bundle();
        for (RemoteInputCompatBase.RemoteInput remoteInput : remoteInputArr) {
            Object obj = bundle.get(remoteInput.getResultKey());
            if (obj instanceof CharSequence) {
                bundle2.putCharSequence(remoteInput.getResultKey(), (CharSequence) obj);
            }
        }
        Intent intent2 = new Intent();
        intent2.putExtra("android.remoteinput.resultsData", bundle2);
        intent.setClipData(ClipData.newIntent("android.remoteinput.results", intent2));
    }

    static RemoteInputCompatBase.RemoteInput fromBundle(Bundle bundle, RemoteInputCompatBase.RemoteInput.Factory factory) {
        return factory.build(bundle.getString(KEY_RESULT_KEY), bundle.getCharSequence(KEY_LABEL), bundle.getCharSequenceArray(KEY_CHOICES), bundle.getBoolean(KEY_ALLOW_FREE_FORM_INPUT), bundle.getBundle(KEY_EXTRAS));
    }

    static RemoteInputCompatBase.RemoteInput[] fromBundleArray(Bundle[] bundleArr, RemoteInputCompatBase.RemoteInput.Factory factory) {
        RemoteInputCompatBase.RemoteInput[] remoteInputArr;
        if (bundleArr != null) {
            RemoteInputCompatBase.RemoteInput[] newArray = factory.newArray(bundleArr.length);
            int i = 0;
            while (true) {
                remoteInputArr = newArray;
                if (i >= bundleArr.length) {
                    break;
                }
                newArray[i] = fromBundle(bundleArr[i], factory);
                i++;
            }
        } else {
            remoteInputArr = null;
        }
        return remoteInputArr;
    }

    static Bundle getResultsFromIntent(Intent intent) {
        Bundle bundle;
        ClipData clipData = intent.getClipData();
        if (clipData == null) {
            bundle = null;
        } else {
            ClipDescription description = clipData.getDescription();
            bundle = null;
            if (description.hasMimeType("text/vnd.android.intent")) {
                bundle = null;
                if (description.getLabel().equals("android.remoteinput.results")) {
                    bundle = (Bundle) clipData.getItemAt(0).getIntent().getExtras().getParcelable("android.remoteinput.resultsData");
                }
            }
        }
        return bundle;
    }

    static Bundle toBundle(RemoteInputCompatBase.RemoteInput remoteInput) {
        Bundle bundle = new Bundle();
        bundle.putString(KEY_RESULT_KEY, remoteInput.getResultKey());
        bundle.putCharSequence(KEY_LABEL, remoteInput.getLabel());
        bundle.putCharSequenceArray(KEY_CHOICES, remoteInput.getChoices());
        bundle.putBoolean(KEY_ALLOW_FREE_FORM_INPUT, remoteInput.getAllowFreeFormInput());
        bundle.putBundle(KEY_EXTRAS, remoteInput.getExtras());
        return bundle;
    }

    static Bundle[] toBundleArray(RemoteInputCompatBase.RemoteInput[] remoteInputArr) {
        Bundle[] bundleArr;
        if (remoteInputArr != null) {
            Bundle[] bundleArr2 = new Bundle[remoteInputArr.length];
            int i = 0;
            while (true) {
                bundleArr = bundleArr2;
                if (i >= remoteInputArr.length) {
                    break;
                }
                bundleArr2[i] = toBundle(remoteInputArr[i]);
                i++;
            }
        } else {
            bundleArr = null;
        }
        return bundleArr;
    }
}
