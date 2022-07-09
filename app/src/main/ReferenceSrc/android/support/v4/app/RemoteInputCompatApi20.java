package android.support.v4.app;

import android.annotation.TargetApi;
import android.app.RemoteInput;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.RequiresApi;
import android.support.v4.app.RemoteInputCompatBase;

@RequiresApi(20)
@TargetApi(20)
/* loaded from: classes.jar:android/support/v4/app/RemoteInputCompatApi20.class */
class RemoteInputCompatApi20 {
    RemoteInputCompatApi20() {
    }

    static void addResultsToIntent(RemoteInputCompatBase.RemoteInput[] remoteInputArr, Intent intent, Bundle bundle) {
        android.app.RemoteInput.addResultsToIntent(fromCompat(remoteInputArr), intent, bundle);
    }

    static android.app.RemoteInput[] fromCompat(RemoteInputCompatBase.RemoteInput[] remoteInputArr) {
        android.app.RemoteInput[] remoteInputArr2;
        if (remoteInputArr != null) {
            android.app.RemoteInput[] remoteInputArr3 = new android.app.RemoteInput[remoteInputArr.length];
            int i = 0;
            while (true) {
                remoteInputArr2 = remoteInputArr3;
                if (i >= remoteInputArr.length) {
                    break;
                }
                RemoteInputCompatBase.RemoteInput remoteInput = remoteInputArr[i];
                remoteInputArr3[i] = new RemoteInput.Builder(remoteInput.getResultKey()).setLabel(remoteInput.getLabel()).setChoices(remoteInput.getChoices()).setAllowFreeFormInput(remoteInput.getAllowFreeFormInput()).addExtras(remoteInput.getExtras()).build();
                i++;
            }
        } else {
            remoteInputArr2 = null;
        }
        return remoteInputArr2;
    }

    static Bundle getResultsFromIntent(Intent intent) {
        return android.app.RemoteInput.getResultsFromIntent(intent);
    }

    static RemoteInputCompatBase.RemoteInput[] toCompat(android.app.RemoteInput[] remoteInputArr, RemoteInputCompatBase.RemoteInput.Factory factory) {
        RemoteInputCompatBase.RemoteInput[] remoteInputArr2;
        if (remoteInputArr != null) {
            RemoteInputCompatBase.RemoteInput[] newArray = factory.newArray(remoteInputArr.length);
            int i = 0;
            while (true) {
                remoteInputArr2 = newArray;
                if (i >= remoteInputArr.length) {
                    break;
                }
                android.app.RemoteInput remoteInput = remoteInputArr[i];
                newArray[i] = factory.build(remoteInput.getResultKey(), remoteInput.getLabel(), remoteInput.getChoices(), remoteInput.getAllowFreeFormInput(), remoteInput.getExtras());
                i++;
            }
        } else {
            remoteInputArr2 = null;
        }
        return remoteInputArr2;
    }
}
