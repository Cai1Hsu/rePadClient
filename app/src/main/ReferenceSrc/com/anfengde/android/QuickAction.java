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

/* loaded from: classes.dex */
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

    /* loaded from: classes.dex */
    public interface OnActionItemClickListener {
        void onItemClick(QuickAction quickAction, int i, int i2);
    }

    /* loaded from: classes.dex */
    public interface OnDismissListener {
        void onDismiss();
    }

    public QuickAction(Context context) {
        this(context, 1);
    }

    public QuickAction(Context context, int orientation) {
        super(context);
        this.actionItems = new ArrayList();
        this.rootWidth = 0;
        this.mOrientation = orientation;
        this.mInflater = (LayoutInflater) context.getSystemService("layout_inflater");
        setRootViewId(R.layout.popup_horizontal);
        this.mAnimStyle = 5;
        this.mChildPos = 0;
    }

    public ActionItem getActionItem(int index) {
        return this.actionItems.get(index);
    }

    public void setRootViewId(int id) {
        this.mRootView = (ViewGroup) this.mInflater.inflate(id, (ViewGroup) null);
        this.mTrack = (ViewGroup) this.mRootView.findViewById(R.id.tracks);
        this.mArrowDown = (ImageView) this.mRootView.findViewById(R.id.arrow_down);
        this.mArrowUp = (ImageView) this.mRootView.findViewById(R.id.arrow_up);
        this.mScroller = (ScrollView) this.mRootView.findViewById(R.id.scroller);
        this.mRootView.setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
        setContentView(this.mRootView);
    }

    public void setAnimStyle(int mAnimStyle) {
        this.mAnimStyle = mAnimStyle;
    }

    public void setOnActionItemClickListener(OnActionItemClickListener listener) {
        this.mItemClickListener = listener;
    }

    public void addActionItem(ActionItem action) {
        View container;
        this.actionItems.add(action);
        String title = action.getTitle();
        Drawable icon = action.getIcon();
        if (this.mOrientation == 0) {
            container = this.mInflater.inflate(R.layout.action_item_horizontal, (ViewGroup) null);
        } else {
            container = this.mInflater.inflate(R.layout.action_item_vertical, (ViewGroup) null);
        }
        ImageView img = (ImageView) container.findViewById(R.id.iv_icon);
        TextView text = (TextView) container.findViewById(R.id.tv_title);
        if (icon != null) {
            img.setImageDrawable(icon);
        } else {
            img.setVisibility(8);
        }
        if (title != null) {
            text.setText(title);
        } else {
            text.setVisibility(8);
        }
        final int pos = this.mChildPos;
        final int actionId = action.getActionId();
        container.setOnClickListener(new View.OnClickListener() { // from class: com.anfengde.android.QuickAction.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (QuickAction.this.mItemClickListener != null) {
                    QuickAction.this.mItemClickListener.onItemClick(QuickAction.this, pos, actionId);
                }
                if (!QuickAction.this.getActionItem(pos).isSticky()) {
                    QuickAction.this.mDidAction = true;
                    QuickAction.this.dismiss();
                }
            }
        });
        container.setOnTouchListener(new View.OnTouchListener() { // from class: com.anfengde.android.QuickAction.2
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View v, MotionEvent event) {
                if (event.getAction() == 0) {
                    v.setBackgroundResource(R.drawable.action_item_selected);
                    return false;
                } else if (event.getAction() == 1 || event.getAction() == 3 || event.getAction() == 4) {
                    v.setBackgroundResource(17170445);
                    return false;
                } else {
                    return false;
                }
            }
        });
        container.setFocusable(true);
        container.setClickable(true);
        if (this.mOrientation == 0 && this.mChildPos != 0) {
            View separator = this.mInflater.inflate(R.layout.horiz_separator, (ViewGroup) null);
            RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(-2, -1);
            separator.setLayoutParams(params);
            separator.setPadding(5, 0, 5, 0);
            this.mTrack.addView(separator, this.mInsertPos);
            this.mInsertPos++;
        }
        this.mTrack.addView(container, this.mInsertPos);
        this.mChildPos++;
        this.mInsertPos++;
    }

    public void show(View parent, Rect rect) {
        int xPos;
        int yPos;
        preShow();
        this.mDidAction = false;
        int[] location = new int[2];
        parent.getLocationOnScreen(location);
        int parentXPos = location[0];
        int parentYPos = location[1];
        Rect anchorRect = new Rect(rect.left + parentXPos, rect.top + parentYPos, rect.left + parentXPos + rect.width(), rect.top + parentYPos + rect.height());
        int width = anchorRect.width();
        int height = anchorRect.height();
        this.mRootView.measure(-2, -2);
        int rootHeight = this.mRootView.getMeasuredHeight();
        if (this.rootWidth == 0) {
            this.rootWidth = this.mRootView.getMeasuredWidth();
        }
        int screenWidth = this.mWindowManager.getDefaultDisplay().getWidth();
        int screenHeight = this.mWindowManager.getDefaultDisplay().getHeight();
        if (anchorRect.left + parentXPos + this.rootWidth > screenWidth) {
            xPos = anchorRect.left - (this.rootWidth - width);
            if (xPos < 0) {
                xPos = 0;
            }
            int centerX = anchorRect.centerX() - xPos;
        } else {
            if (width > this.rootWidth) {
                xPos = anchorRect.centerX() - (this.rootWidth / 2);
            } else {
                xPos = anchorRect.left;
            }
            int centerX2 = anchorRect.centerX() - xPos;
        }
        int dyTop = anchorRect.top;
        int dyBottom = screenHeight - anchorRect.bottom;
        boolean onTop = dyTop > dyBottom;
        if (onTop) {
            if (rootHeight > dyTop) {
                yPos = 15;
                ViewGroup.LayoutParams l = this.mScroller.getLayoutParams();
                l.height = dyTop - height;
            } else {
                yPos = anchorRect.top - rootHeight;
            }
        } else {
            yPos = anchorRect.bottom;
            if (rootHeight > dyBottom) {
                ViewGroup.LayoutParams l2 = this.mScroller.getLayoutParams();
                l2.height = dyBottom;
            }
        }
        this.mArrowUp.setVisibility(4);
        this.mArrowDown.setVisibility(4);
        setAnimationStyle(screenWidth, anchorRect.centerX(), onTop);
        this.mWindow.showAtLocation(parent, 0, xPos, yPos);
    }

    public void show(View anchor) {
        int xPos;
        int arrowPos;
        int yPos;
        preShow();
        this.mDidAction = false;
        int[] location = new int[2];
        anchor.getLocationOnScreen(location);
        Rect anchorRect = new Rect(location[0], location[1], location[0] + anchor.getWidth(), location[1] + anchor.getHeight());
        this.mRootView.measure(-2, -2);
        int rootHeight = this.mRootView.getMeasuredHeight();
        if (this.rootWidth == 0) {
            this.rootWidth = this.mRootView.getMeasuredWidth();
        }
        int screenWidth = this.mWindowManager.getDefaultDisplay().getWidth();
        int screenHeight = this.mWindowManager.getDefaultDisplay().getHeight();
        if (anchorRect.left + this.rootWidth > screenWidth) {
            xPos = anchorRect.left - (this.rootWidth - anchor.getWidth());
            if (xPos < 0) {
                xPos = 0;
            }
            arrowPos = anchorRect.centerX() - xPos;
        } else {
            if (anchor.getWidth() > this.rootWidth) {
                xPos = anchorRect.centerX() - (this.rootWidth / 2);
            } else {
                xPos = anchorRect.left;
            }
            arrowPos = anchorRect.centerX() - xPos;
        }
        int dyTop = anchorRect.top;
        int dyBottom = screenHeight - anchorRect.bottom;
        boolean onTop = dyTop > dyBottom;
        if (onTop) {
            if (rootHeight > dyTop) {
                yPos = 15;
                ViewGroup.LayoutParams l = this.mScroller.getLayoutParams();
                l.height = dyTop - anchor.getHeight();
            } else {
                yPos = anchorRect.top - rootHeight;
            }
        } else {
            yPos = anchorRect.bottom;
            if (rootHeight > dyBottom) {
                ViewGroup.LayoutParams l2 = this.mScroller.getLayoutParams();
                l2.height = dyBottom;
            }
        }
        showArrow(onTop ? R.id.arrow_down : R.id.arrow_up, arrowPos);
        setAnimationStyle(screenWidth, anchorRect.centerX(), onTop);
        this.mWindow.showAtLocation(anchor, 0, xPos, yPos);
    }

    private void setAnimationStyle(int screenWidth, int requestedX, boolean onTop) {
        int arrowPos = requestedX - (this.mArrowUp.getMeasuredWidth() / 2);
        switch (this.mAnimStyle) {
            case 1:
                this.mWindow.setAnimationStyle(onTop ? R.style.Animations_PopUpMenu_Left : R.style.Animations_PopDownMenu_Left);
                return;
            case 2:
                this.mWindow.setAnimationStyle(onTop ? R.style.Animations_PopUpMenu_Right : R.style.Animations_PopDownMenu_Right);
                return;
            case 3:
                this.mWindow.setAnimationStyle(onTop ? R.style.Animations_PopUpMenu_Center : R.style.Animations_PopDownMenu_Center);
                return;
            case 4:
                this.mWindow.setAnimationStyle(onTop ? R.style.Animations_PopUpMenu_Reflect : R.style.Animations_PopDownMenu_Reflect);
                return;
            case 5:
                if (arrowPos <= screenWidth / 4) {
                    this.mWindow.setAnimationStyle(onTop ? R.style.Animations_PopUpMenu_Left : R.style.Animations_PopDownMenu_Left);
                    return;
                } else if (arrowPos > screenWidth / 4 && arrowPos < (screenWidth / 4) * 3) {
                    this.mWindow.setAnimationStyle(onTop ? R.style.Animations_PopUpMenu_Center : R.style.Animations_PopDownMenu_Center);
                    return;
                } else {
                    this.mWindow.setAnimationStyle(onTop ? R.style.Animations_PopUpMenu_Right : R.style.Animations_PopDownMenu_Right);
                    return;
                }
            default:
                return;
        }
    }

    private void showArrow(int whichArrow, int requestedX) {
        View showArrow = whichArrow == R.id.arrow_up ? this.mArrowUp : this.mArrowDown;
        View hideArrow = whichArrow == R.id.arrow_up ? this.mArrowDown : this.mArrowUp;
        int arrowWidth = this.mArrowUp.getMeasuredWidth();
        showArrow.setVisibility(0);
        ViewGroup.MarginLayoutParams param = (ViewGroup.MarginLayoutParams) showArrow.getLayoutParams();
        param.leftMargin = requestedX - (arrowWidth / 2);
        hideArrow.setVisibility(4);
    }

    public void setOnDismissListener(OnDismissListener listener) {
        setOnDismissListener(this);
        this.mDismissListener = listener;
    }

    @Override // com.anfengde.android.PopupWindows, android.widget.PopupWindow.OnDismissListener
    public void onDismiss() {
        if (!this.mDidAction && this.mDismissListener != null) {
            this.mDismissListener.onDismiss();
        }
    }
}
