package android.support.v4.widget;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.widget.ListView;

@RequiresApi(19)
@TargetApi(19)
/* loaded from: classes.jar:android/support/v4/widget/ListViewCompatKitKat.class */
class ListViewCompatKitKat {
    ListViewCompatKitKat() {
    }

    static void scrollListBy(ListView listView, int i) {
        listView.scrollListBy(i);
    }
}
