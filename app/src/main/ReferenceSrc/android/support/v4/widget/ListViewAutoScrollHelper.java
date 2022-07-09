package android.support.v4.widget;

import android.widget.ListView;

/* loaded from: classes.jar:android/support/v4/widget/ListViewAutoScrollHelper.class */
public class ListViewAutoScrollHelper extends AutoScrollHelper {
    private final ListView mTarget;

    public ListViewAutoScrollHelper(ListView listView) {
        super(listView);
        this.mTarget = listView;
    }

    @Override // android.support.v4.widget.AutoScrollHelper
    public boolean canTargetScrollHorizontally(int i) {
        return false;
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0044, code lost:
        if (r0.getChildAt(r0 - 1).getBottom() > r0.getHeight()) goto L13;
     */
    @Override // android.support.v4.widget.AutoScrollHelper
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean canTargetScrollVertically(int i) {
        boolean z;
        ListView listView = this.mTarget;
        int count = listView.getCount();
        if (count == 0) {
            z = false;
        } else {
            int childCount = listView.getChildCount();
            int firstVisiblePosition = listView.getFirstVisiblePosition();
            if (i > 0) {
                if (firstVisiblePosition + childCount >= count) {
                    z = false;
                }
                z = true;
            } else {
                z = false;
                if (i < 0) {
                    if (firstVisiblePosition <= 0 && listView.getChildAt(0).getTop() >= 0) {
                        z = false;
                    }
                    z = true;
                }
            }
        }
        return z;
    }

    @Override // android.support.v4.widget.AutoScrollHelper
    public void scrollTargetBy(int i, int i2) {
        ListViewCompat.scrollListBy(this.mTarget, i2);
    }
}
