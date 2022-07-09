package android.support.v4.app;

import android.app.Activity;
import android.support.annotation.RestrictTo;
import android.support.v4.util.SimpleArrayMap;

@RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
/* loaded from: classes.jar:android/support/v4/app/SupportActivity.class */
public class SupportActivity extends Activity {
    private SimpleArrayMap<Class<? extends ExtraData>, ExtraData> mExtraDataMap = new SimpleArrayMap<>();

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    /* loaded from: classes.jar:android/support/v4/app/SupportActivity$ExtraData.class */
    public static class ExtraData {
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public <T extends ExtraData> T getExtraData(Class<T> cls) {
        return (T) this.mExtraDataMap.get(cls);
    }

    /* JADX DEBUG: Multi-variable search result rejected for r0v1, resolved type: android.support.v4.util.SimpleArrayMap<java.lang.Class<? extends android.support.v4.app.SupportActivity$ExtraData>, android.support.v4.app.SupportActivity$ExtraData> */
    /* JADX WARN: Multi-variable type inference failed */
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void putExtraData(ExtraData extraData) {
        this.mExtraDataMap.put(extraData.getClass(), extraData);
    }
}
