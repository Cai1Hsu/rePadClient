package android.support.v4.app;

import android.annotation.TargetApi;
import android.os.Bundle;
import android.support.annotation.RequiresApi;

@RequiresApi(9)
@TargetApi(9)
/* loaded from: classes.jar:android/support/v4/app/RemoteInputCompatBase.class */
class RemoteInputCompatBase {

    /* loaded from: classes.jar:android/support/v4/app/RemoteInputCompatBase$RemoteInput.class */
    public static abstract class RemoteInput {

        /* loaded from: classes.jar:android/support/v4/app/RemoteInputCompatBase$RemoteInput$Factory.class */
        public interface Factory {
            RemoteInput build(String str, CharSequence charSequence, CharSequence[] charSequenceArr, boolean z, Bundle bundle);

            RemoteInput[] newArray(int i);
        }

        protected abstract boolean getAllowFreeFormInput();

        protected abstract CharSequence[] getChoices();

        protected abstract Bundle getExtras();

        protected abstract CharSequence getLabel();

        protected abstract String getResultKey();
    }

    RemoteInputCompatBase() {
    }
}
