package com.blahti.drag;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RemoteViews;

@RemoteViews.RemoteView
/* loaded from: classes.jar:com/blahti/drag/MyAbsoluteLayout.class */
public class MyAbsoluteLayout extends ViewGroup {

    /* loaded from: classes.jar:com/blahti/drag/MyAbsoluteLayout$LayoutParams.class */
    public static class LayoutParams extends ViewGroup.LayoutParams {
        public int x;
        public int y;

        public LayoutParams(int i, int i2, int i3, int i4) {
            super(i, i2);
            this.x = i3;
            this.y = i4;
        }

        public LayoutParams(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
        }

        public LayoutParams(ViewGroup.LayoutParams layoutParams) {
            super(layoutParams);
        }

        protected static String sizeToString(int i) {
            return i == -2 ? "wrap-content" : i == -1 ? "match-parent" : String.valueOf(i);
        }

        public String debug(String str) {
            return String.valueOf(str) + "Absolute.LayoutParams={width=" + sizeToString(this.width) + ", height=" + sizeToString(this.height) + " x=" + this.x + " y=" + this.y + "}";
        }
    }

    public MyAbsoluteLayout(Context context) {
        super(context);
    }

    public MyAbsoluteLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public MyAbsoluteLayout(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    @Override // android.view.ViewGroup
    protected boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof LayoutParams;
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams(-2, -2, 0, 0);
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new LayoutParams(getContext(), attributeSet);
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return new LayoutParams(layoutParams);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int childCount = getChildCount();
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = getChildAt(i5);
            if (childAt.getVisibility() != 8) {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                int i6 = paddingLeft + layoutParams.x;
                int i7 = paddingTop + layoutParams.y;
                childAt.layout(i6, i7, childAt.getMeasuredWidth() + i6, childAt.getMeasuredHeight() + i7);
            }
        }
    }

    @Override // android.view.View
    protected void onMeasure(int i, int i2) {
        int childCount = getChildCount();
        int i3 = 0;
        int i4 = 0;
        measureChildren(i, i2);
        int i5 = 0;
        while (i5 < childCount) {
            View childAt = getChildAt(i5);
            int i6 = i3;
            int i7 = i4;
            if (childAt.getVisibility() != 8) {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                int i8 = layoutParams.x;
                int measuredWidth = childAt.getMeasuredWidth();
                int i9 = layoutParams.y;
                int measuredHeight = childAt.getMeasuredHeight();
                i7 = Math.max(i4, i8 + measuredWidth);
                i6 = Math.max(i3, i9 + measuredHeight);
            }
            i5++;
            i3 = i6;
            i4 = i7;
        }
        setMeasuredDimension(resolveSize(Math.max(i4 + getPaddingLeft() + getPaddingRight(), getSuggestedMinimumWidth()), i), resolveSize(Math.max(i3 + getPaddingTop() + getPaddingBottom(), getSuggestedMinimumHeight()), i2));
    }
}
