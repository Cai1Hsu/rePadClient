package com.blahti.drag;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RemoteViews;
@RemoteViews.RemoteView
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class MyAbsoluteLayout extends ViewGroup {
    public MyAbsoluteLayout(Context context) {
        super(context);
    }

    public MyAbsoluteLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public MyAbsoluteLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int count = getChildCount();
        int maxHeight = 0;
        int maxWidth = 0;
        measureChildren(widthMeasureSpec, heightMeasureSpec);
        for (int i = 0; i < count; i++) {
            View child = getChildAt(i);
            if (child.getVisibility() != 8) {
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                int childRight = lp.x + child.getMeasuredWidth();
                int childBottom = lp.y + child.getMeasuredHeight();
                maxWidth = Math.max(maxWidth, childRight);
                maxHeight = Math.max(maxHeight, childBottom);
            }
        }
        setMeasuredDimension(resolveSize(Math.max(maxWidth + getPaddingLeft() + getPaddingRight(), getSuggestedMinimumWidth()), widthMeasureSpec), resolveSize(Math.max(maxHeight + getPaddingTop() + getPaddingBottom(), getSuggestedMinimumHeight()), heightMeasureSpec));
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams(-2, -2, 0, 0);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int count = getChildCount();
        int paddingL = getPaddingLeft();
        int paddingT = getPaddingTop();
        for (int i = 0; i < count; i++) {
            View child = getChildAt(i);
            if (child.getVisibility() != 8) {
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                int childLeft = paddingL + lp.x;
                int childTop = paddingT + lp.y;
                child.layout(childLeft, childTop, child.getMeasuredWidth() + childLeft, child.getMeasuredHeight() + childTop);
            }
        }
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(AttributeSet attrs) {
        return new LayoutParams(getContext(), attrs);
    }

    @Override // android.view.ViewGroup
    protected boolean checkLayoutParams(ViewGroup.LayoutParams p) {
        return p instanceof LayoutParams;
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams p) {
        return new LayoutParams(p);
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    public static class LayoutParams extends ViewGroup.LayoutParams {
        public int x;
        public int y;

        public LayoutParams(int width, int height, int x, int y) {
            super(width, height);
            this.x = x;
            this.y = y;
        }

        public LayoutParams(Context c, AttributeSet attrs) {
            super(c, attrs);
        }

        public LayoutParams(ViewGroup.LayoutParams source) {
            super(source);
        }

        public String debug(String output) {
            return String.valueOf(output) + "Absolute.LayoutParams={width=" + sizeToString(this.width) + ", height=" + sizeToString(this.height) + " x=" + this.x + " y=" + this.y + "}";
        }

        protected static String sizeToString(int size) {
            if (size == -2) {
                return "wrap-content";
            }
            if (size == -1) {
                return "match-parent";
            }
            return String.valueOf(size);
        }
    }
}
