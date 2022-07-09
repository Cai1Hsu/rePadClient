package com.anfengde.android;

import android.content.Context;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.PopupWindow;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import com.anfengde.epub.ui.R;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.jar:com/anfengde/android/QuickAction.class */
public class QuickAction extends PopupWindows implements PopupWindow.OnDismissListener {
    public static final int ANIM_AUTO = 5;
    public static final int ANIM_GROW_FROM_CENTER = 3;
    public static final int ANIM_GROW_FROM_LEFT = 1;
    public static final int ANIM_GROW_FROM_RIGHT = 2;
    public static final int ANIM_REFLECT = 4;
    public static final int HORIZONTAL = 0;
    public static final int VERTICAL = 1;
    private List<ActionItem> actionItems;
    private int mAnimStyle;
    private ImageView mArrowDown;
    private ImageView mArrowUp;
    private int mChildPos;
    private boolean mDidAction;
    private OnDismissListener mDismissListener;
    private LayoutInflater mInflater;
    private int mInsertPos;
    private OnActionItemClickListener mItemClickListener;
    private int mOrientation;
    private View mRootView;
    private ScrollView mScroller;
    private ViewGroup mTrack;
    private int rootWidth;

    /* loaded from: classes.jar:com/anfengde/android/QuickAction$OnActionItemClickListener.class */
    public interface OnActionItemClickListener {
        void onItemClick(QuickAction quickAction, int i, int i2);
    }

    /* loaded from: classes.jar:com/anfengde/android/QuickAction$OnDismissListener.class */
    public interface OnDismissListener {
        void onDismiss();
    }

    public QuickAction(Context context) {
        this(context, 1);
    }

    public QuickAction(Context context, int i) {
        super(context);
        this.actionItems = new ArrayList();
        this.rootWidth = 0;
        this.mOrientation = i;
        this.mInflater = (LayoutInflater) context.getSystemService("layout_inflater");
        setRootViewId(R.layout.popup_horizontal);
        this.mAnimStyle = 5;
        this.mChildPos = 0;
    }

    private void setAnimationStyle(int i, int i2, boolean z) {
        int measuredWidth = i2 - (this.mArrowUp.getMeasuredWidth() / 2);
        switch (this.mAnimStyle) {
            case 1:
                this.mWindow.setAnimationStyle(z ? R.style.Animations_PopUpMenu_Left : R.style.Animations_PopDownMenu_Left);
                return;
            case 2:
                this.mWindow.setAnimationStyle(z ? R.style.Animations_PopUpMenu_Right : R.style.Animations_PopDownMenu_Right);
                return;
            case 3:
                this.mWindow.setAnimationStyle(z ? R.style.Animations_PopUpMenu_Center : R.style.Animations_PopDownMenu_Center);
                return;
            case 4:
                this.mWindow.setAnimationStyle(z ? R.style.Animations_PopUpMenu_Reflect : R.style.Animations_PopDownMenu_Reflect);
                return;
            case 5:
                if (measuredWidth <= i / 4) {
                    this.mWindow.setAnimationStyle(z ? R.style.Animations_PopUpMenu_Left : R.style.Animations_PopDownMenu_Left);
                    return;
                } else if (measuredWidth <= i / 4 || measuredWidth >= (i / 4) * 3) {
                    this.mWindow.setAnimationStyle(z ? R.style.Animations_PopUpMenu_Right : R.style.Animations_PopDownMenu_Right);
                    return;
                } else {
                    this.mWindow.setAnimationStyle(z ? R.style.Animations_PopUpMenu_Center : R.style.Animations_PopDownMenu_Center);
                    return;
                }
            default:
                return;
        }
    }

    private void showArrow(int i, int i2) {
        ImageView imageView = i == R.id.arrow_up ? this.mArrowUp : this.mArrowDown;
        ImageView imageView2 = i == R.id.arrow_up ? this.mArrowDown : this.mArrowUp;
        int measuredWidth = this.mArrowUp.getMeasuredWidth();
        imageView.setVisibility(0);
        ((ViewGroup.MarginLayoutParams) imageView.getLayoutParams()).leftMargin = i2 - (measuredWidth / 2);
        imageView2.setVisibility(4);
    }

    public void addActionItem(ActionItem actionItem) {
        this.actionItems.add(actionItem);
        String title = actionItem.getTitle();
        Drawable icon = actionItem.getIcon();
        View inflate = this.mOrientation == 0 ? this.mInflater.inflate(R.layout.action_item_horizontal, (ViewGroup) null) : this.mInflater.inflate(R.layout.action_item_vertical, (ViewGroup) null);
        ImageView imageView = (ImageView) inflate.findViewById(R.id.iv_icon);
        TextView textView = (TextView) inflate.findViewById(R.id.tv_title);
        if (icon != null) {
            imageView.setImageDrawable(icon);
        } else {
            imageView.setVisibility(8);
        }
        if (title != null) {
            textView.setText(title);
        } else {
            textView.setVisibility(8);
        }
        final int i = this.mChildPos;
        final int actionId = actionItem.getActionId();
        inflate.setOnClickListener(new View.OnClickListener() { // from class: com.anfengde.android.QuickAction.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (QuickAction.this.mItemClickListener != null) {
                    QuickAction.this.mItemClickListener.onItemClick(QuickAction.this, i, actionId);
                }
                if (!QuickAction.this.getActionItem(i).isSticky()) {
                    QuickAction.this.mDidAction = true;
                    QuickAction.this.dismiss();
                }
            }
        });
        inflate.setOnTouchListener(new View.OnTouchListener() { // from class: com.anfengde.android.QuickAction.2
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View view, MotionEvent motionEvent) {
                if (motionEvent.getAction() == 0) {
                    view.setBackgroundResource(R.drawable.action_item_selected);
                    return false;
                } else if (motionEvent.getAction() != 1 && motionEvent.getAction() != 3 && motionEvent.getAction() != 4) {
                    return false;
                } else {
                    view.setBackgroundResource(17170445);
                    return false;
                }
            }
        });
        inflate.setFocusable(true);
        inflate.setClickable(true);
        if (this.mOrientation == 0 && this.mChildPos != 0) {
            View inflate2 = this.mInflater.inflate(R.layout.horiz_separator, (ViewGroup) null);
            inflate2.setLayoutParams(new RelativeLayout.LayoutParams(-2, -1));
            inflate2.setPadding(5, 0, 5, 0);
            this.mTrack.addView(inflate2, this.mInsertPos);
            this.mInsertPos++;
        }
        this.mTrack.addView(inflate, this.mInsertPos);
        this.mChildPos++;
        this.mInsertPos++;
    }

    public ActionItem getActionItem(int i) {
        return this.actionItems.get(i);
    }

    @Override // com.anfengde.android.PopupWindows, android.widget.PopupWindow.OnDismissListener
    public void onDismiss() {
        if (this.mDidAction || this.mDismissListener == null) {
            return;
        }
        this.mDismissListener.onDismiss();
    }

    public void setAnimStyle(int i) {
        this.mAnimStyle = i;
    }

    public void setOnActionItemClickListener(OnActionItemClickListener onActionItemClickListener) {
        this.mItemClickListener = onActionItemClickListener;
    }

    public void setOnDismissListener(OnDismissListener onDismissListener) {
        setOnDismissListener(this);
        this.mDismissListener = onDismissListener;
    }

    public void setRootViewId(int i) {
        this.mRootView = (ViewGroup) this.mInflater.inflate(i, (ViewGroup) null);
        this.mTrack = (ViewGroup) this.mRootView.findViewById(R.id.tracks);
        this.mArrowDown = (ImageView) this.mRootView.findViewById(R.id.arrow_down);
        this.mArrowUp = (ImageView) this.mRootView.findViewById(R.id.arrow_up);
        this.mScroller = (ScrollView) this.mRootView.findViewById(R.id.scroller);
        this.mRootView.setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
        setContentView(this.mRootView);
    }

    public void show(View view) {
        int centerX;
        int i;
        int i2;
        preShow();
        this.mDidAction = false;
        int[] iArr = new int[2];
        view.getLocationOnScreen(iArr);
        Rect rect = new Rect(iArr[0], iArr[1], iArr[0] + view.getWidth(), iArr[1] + view.getHeight());
        this.mRootView.measure(-2, -2);
        int measuredHeight = this.mRootView.getMeasuredHeight();
        if (this.rootWidth == 0) {
            this.rootWidth = this.mRootView.getMeasuredWidth();
        }
        int width = this.mWindowManager.getDefaultDisplay().getWidth();
        int height = this.mWindowManager.getDefaultDisplay().getHeight();
        if (rect.left + this.rootWidth > width) {
            int width2 = rect.left - (this.rootWidth - view.getWidth());
            int i3 = width2;
            if (width2 < 0) {
                i3 = 0;
            }
            centerX = rect.centerX() - i3;
            i = i3;
        } else {
            int centerX2 = view.getWidth() > this.rootWidth ? rect.centerX() - (this.rootWidth / 2) : rect.left;
            centerX = rect.centerX() - centerX2;
            i = centerX2;
        }
        int i4 = rect.top;
        int i5 = height - rect.bottom;
        boolean z = i4 > i5;
        if (!z) {
            int i6 = rect.bottom;
            i2 = i6;
            if (measuredHeight > i5) {
                this.mScroller.getLayoutParams().height = i5;
                i2 = i6;
            }
        } else if (measuredHeight > i4) {
            i2 = 15;
            this.mScroller.getLayoutParams().height = i4 - view.getHeight();
        } else {
            i2 = rect.top - measuredHeight;
        }
        showArrow(z ? R.id.arrow_down : R.id.arrow_up, centerX);
        setAnimationStyle(width, rect.centerX(), z);
        this.mWindow.showAtLocation(view, 0, i, i2);
    }

    public void show(View view, Rect rect) {
        int i;
        int i2;
        preShow();
        this.mDidAction = false;
        int[] iArr = new int[2];
        view.getLocationOnScreen(iArr);
        int i3 = iArr[0];
        int i4 = iArr[1];
        Rect rect2 = new Rect(rect.left + i3, rect.top + i4, rect.left + i3 + rect.width(), rect.top + i4 + rect.height());
        int width = rect2.width();
        int height = rect2.height();
        this.mRootView.measure(-2, -2);
        int measuredHeight = this.mRootView.getMeasuredHeight();
        if (this.rootWidth == 0) {
            this.rootWidth = this.mRootView.getMeasuredWidth();
        }
        int width2 = this.mWindowManager.getDefaultDisplay().getWidth();
        int height2 = this.mWindowManager.getDefaultDisplay().getHeight();
        if (rect2.left + i3 + this.rootWidth > width2) {
            int i5 = rect2.left - (this.rootWidth - width);
            int i6 = i5;
            if (i5 < 0) {
                i6 = 0;
            }
            rect2.centerX();
            i = i6;
        } else {
            int centerX = width > this.rootWidth ? rect2.centerX() - (this.rootWidth / 2) : rect2.left;
            rect2.centerX();
            i = centerX;
        }
        int i7 = rect2.top;
        int i8 = height2 - rect2.bottom;
        boolean z = i7 > i8;
        if (!z) {
            int i9 = rect2.bottom;
            i2 = i9;
            if (measuredHeight > i8) {
                this.mScroller.getLayoutParams().height = i8;
                i2 = i9;
            }
        } else if (measuredHeight > i7) {
            i2 = 15;
            this.mScroller.getLayoutParams().height = i7 - height;
        } else {
            i2 = rect2.top - measuredHeight;
        }
        this.mArrowUp.setVisibility(4);
        this.mArrowDown.setVisibility(4);
        setAnimationStyle(width2, rect2.centerX(), z);
        this.mWindow.showAtLocation(view, 0, i, i2);
    }
}
