.class public Lcom/anfengde/android/QuickAction;
.super Lcom/anfengde/android/PopupWindows;
.source "QuickAction.java"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/anfengde/android/QuickAction$OnActionItemClickListener;,
        Lcom/anfengde/android/QuickAction$OnDismissListener;
    }
.end annotation


# static fields
.field public static final ANIM_AUTO:I = 0x5

.field public static final ANIM_GROW_FROM_CENTER:I = 0x3

.field public static final ANIM_GROW_FROM_LEFT:I = 0x1

.field public static final ANIM_GROW_FROM_RIGHT:I = 0x2

.field public static final ANIM_REFLECT:I = 0x4

.field public static final HORIZONTAL:I = 0x0

.field public static final VERTICAL:I = 0x1


# instance fields
.field private actionItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/anfengde/android/ActionItem;",
            ">;"
        }
    .end annotation
.end field

.field private mAnimStyle:I

.field private mArrowDown:Landroid/widget/ImageView;

.field private mArrowUp:Landroid/widget/ImageView;

.field private mChildPos:I

.field private mDidAction:Z

.field private mDismissListener:Lcom/anfengde/android/QuickAction$OnDismissListener;

.field private mInflater:Landroid/view/LayoutInflater;

.field private mInsertPos:I

.field private mItemClickListener:Lcom/anfengde/android/QuickAction$OnActionItemClickListener;

.field private mOrientation:I

.field private mRootView:Landroid/view/View;

.field private mScroller:Landroid/widget/ScrollView;

.field private mTrack:Landroid/view/ViewGroup;

.field private rootWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 69
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/anfengde/android/QuickAction;-><init>(Landroid/content/Context;I)V

    .line 70
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "orientation"    # I

    .prologue
    const/4 v1, 0x0

    .line 79
    invoke-direct {p0, p1}, Lcom/anfengde/android/PopupWindows;-><init>(Landroid/content/Context;)V

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/anfengde/android/QuickAction;->actionItems:Ljava/util/List;

    .line 52
    iput v1, p0, Lcom/anfengde/android/QuickAction;->rootWidth:I

    .line 81
    iput p2, p0, Lcom/anfengde/android/QuickAction;->mOrientation:I

    .line 83
    const-string/jumbo v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/anfengde/android/QuickAction;->mInflater:Landroid/view/LayoutInflater;

    .line 85
    sget v0, Lcom/anfengde/epub/ui/R$layout;->popup_horizontal:I

    invoke-virtual {p0, v0}, Lcom/anfengde/android/QuickAction;->setRootViewId(I)V

    .line 92
    const/4 v0, 0x5

    iput v0, p0, Lcom/anfengde/android/QuickAction;->mAnimStyle:I

    .line 93
    iput v1, p0, Lcom/anfengde/android/QuickAction;->mChildPos:I

    .line 95
    return-void
.end method

.method static synthetic access$0(Lcom/anfengde/android/QuickAction;)Lcom/anfengde/android/QuickAction$OnActionItemClickListener;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/anfengde/android/QuickAction;->mItemClickListener:Lcom/anfengde/android/QuickAction$OnActionItemClickListener;

    return-object v0
.end method

.method static synthetic access$1(Lcom/anfengde/android/QuickAction;Z)V
    .locals 0

    .prologue
    .line 46
    iput-boolean p1, p0, Lcom/anfengde/android/QuickAction;->mDidAction:Z

    return-void
.end method

.method private setAnimationStyle(IIZ)V
    .locals 3
    .param p1, "screenWidth"    # I
    .param p2, "requestedX"    # I
    .param p3, "onTop"    # Z

    .prologue
    .line 426
    iget-object v1, p0, Lcom/anfengde/android/QuickAction;->mArrowUp:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    sub-int v0, p2, v1

    .line 428
    .local v0, "arrowPos":I
    iget v1, p0, Lcom/anfengde/android/QuickAction;->mAnimStyle:I

    packed-switch v1, :pswitch_data_0

    .line 456
    :goto_0
    return-void

    .line 430
    :pswitch_0
    iget-object v2, p0, Lcom/anfengde/android/QuickAction;->mWindow:Landroid/widget/PopupWindow;

    if-eqz p3, :cond_0

    sget v1, Lcom/anfengde/epub/ui/R$style;->Animations_PopUpMenu_Left:I

    :goto_1
    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    goto :goto_0

    :cond_0
    sget v1, Lcom/anfengde/epub/ui/R$style;->Animations_PopDownMenu_Left:I

    goto :goto_1

    .line 434
    :pswitch_1
    iget-object v2, p0, Lcom/anfengde/android/QuickAction;->mWindow:Landroid/widget/PopupWindow;

    if-eqz p3, :cond_1

    sget v1, Lcom/anfengde/epub/ui/R$style;->Animations_PopUpMenu_Right:I

    :goto_2
    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    goto :goto_0

    :cond_1
    sget v1, Lcom/anfengde/epub/ui/R$style;->Animations_PopDownMenu_Right:I

    goto :goto_2

    .line 438
    :pswitch_2
    iget-object v2, p0, Lcom/anfengde/android/QuickAction;->mWindow:Landroid/widget/PopupWindow;

    if-eqz p3, :cond_2

    sget v1, Lcom/anfengde/epub/ui/R$style;->Animations_PopUpMenu_Center:I

    :goto_3
    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    goto :goto_0

    :cond_2
    sget v1, Lcom/anfengde/epub/ui/R$style;->Animations_PopDownMenu_Center:I

    goto :goto_3

    .line 442
    :pswitch_3
    iget-object v2, p0, Lcom/anfengde/android/QuickAction;->mWindow:Landroid/widget/PopupWindow;

    if-eqz p3, :cond_3

    sget v1, Lcom/anfengde/epub/ui/R$style;->Animations_PopUpMenu_Reflect:I

    :goto_4
    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    goto :goto_0

    :cond_3
    sget v1, Lcom/anfengde/epub/ui/R$style;->Animations_PopDownMenu_Reflect:I

    goto :goto_4

    .line 446
    :pswitch_4
    div-int/lit8 v1, p1, 0x4

    if-gt v0, v1, :cond_5

    .line 447
    iget-object v2, p0, Lcom/anfengde/android/QuickAction;->mWindow:Landroid/widget/PopupWindow;

    if-eqz p3, :cond_4

    sget v1, Lcom/anfengde/epub/ui/R$style;->Animations_PopUpMenu_Left:I

    :goto_5
    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    goto :goto_0

    :cond_4
    sget v1, Lcom/anfengde/epub/ui/R$style;->Animations_PopDownMenu_Left:I

    goto :goto_5

    .line 448
    :cond_5
    div-int/lit8 v1, p1, 0x4

    if-le v0, v1, :cond_7

    div-int/lit8 v1, p1, 0x4

    mul-int/lit8 v1, v1, 0x3

    if-ge v0, v1, :cond_7

    .line 449
    iget-object v2, p0, Lcom/anfengde/android/QuickAction;->mWindow:Landroid/widget/PopupWindow;

    if-eqz p3, :cond_6

    sget v1, Lcom/anfengde/epub/ui/R$style;->Animations_PopUpMenu_Center:I

    :goto_6
    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    goto :goto_0

    :cond_6
    sget v1, Lcom/anfengde/epub/ui/R$style;->Animations_PopDownMenu_Center:I

    goto :goto_6

    .line 451
    :cond_7
    iget-object v2, p0, Lcom/anfengde/android/QuickAction;->mWindow:Landroid/widget/PopupWindow;

    if-eqz p3, :cond_8

    sget v1, Lcom/anfengde/epub/ui/R$style;->Animations_PopUpMenu_Right:I

    :goto_7
    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    goto :goto_0

    :cond_8
    sget v1, Lcom/anfengde/epub/ui/R$style;->Animations_PopDownMenu_Right:I

    goto :goto_7

    .line 428
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private showArrow(II)V
    .locals 5
    .param p1, "whichArrow"    # I
    .param p2, "requestedX"    # I

    .prologue
    .line 465
    sget v4, Lcom/anfengde/epub/ui/R$id;->arrow_up:I

    if-ne p1, v4, :cond_0

    iget-object v3, p0, Lcom/anfengde/android/QuickAction;->mArrowUp:Landroid/widget/ImageView;

    .line 466
    .local v3, "showArrow":Landroid/view/View;
    :goto_0
    sget v4, Lcom/anfengde/epub/ui/R$id;->arrow_up:I

    if-ne p1, v4, :cond_1

    iget-object v1, p0, Lcom/anfengde/android/QuickAction;->mArrowDown:Landroid/widget/ImageView;

    .line 468
    .local v1, "hideArrow":Landroid/view/View;
    :goto_1
    iget-object v4, p0, Lcom/anfengde/android/QuickAction;->mArrowUp:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v0

    .line 470
    .local v0, "arrowWidth":I
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 472
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 474
    .local v2, "param":Landroid/view/ViewGroup$MarginLayoutParams;
    div-int/lit8 v4, v0, 0x2

    sub-int v4, p2, v4

    iput v4, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 476
    const/4 v4, 0x4

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 477
    return-void

    .line 465
    .end local v0    # "arrowWidth":I
    .end local v1    # "hideArrow":Landroid/view/View;
    .end local v2    # "param":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v3    # "showArrow":Landroid/view/View;
    :cond_0
    iget-object v3, p0, Lcom/anfengde/android/QuickAction;->mArrowDown:Landroid/widget/ImageView;

    goto :goto_0

    .line 466
    .restart local v3    # "showArrow":Landroid/view/View;
    :cond_1
    iget-object v1, p0, Lcom/anfengde/android/QuickAction;->mArrowUp:Landroid/widget/ImageView;

    goto :goto_1
.end method


# virtual methods
.method public addActionItem(Lcom/anfengde/android/ActionItem;)V
    .locals 13
    .param p1, "action"    # Lcom/anfengde/android/ActionItem;

    .prologue
    .line 154
    iget-object v9, p0, Lcom/anfengde/android/QuickAction;->actionItems:Ljava/util/List;

    invoke-interface {v9, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    invoke-virtual {p1}, Lcom/anfengde/android/ActionItem;->getTitle()Ljava/lang/String;

    move-result-object v8

    .line 157
    .local v8, "title":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/anfengde/android/ActionItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 161
    .local v2, "icon":Landroid/graphics/drawable/Drawable;
    iget v9, p0, Lcom/anfengde/android/QuickAction;->mOrientation:I

    if-nez v9, :cond_1

    .line 162
    iget-object v9, p0, Lcom/anfengde/android/QuickAction;->mInflater:Landroid/view/LayoutInflater;

    sget v10, Lcom/anfengde/epub/ui/R$layout;->action_item_horizontal:I

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 167
    .local v1, "container":Landroid/view/View;
    :goto_0
    sget v9, Lcom/anfengde/epub/ui/R$id;->iv_icon:I

    invoke-virtual {v1, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 168
    .local v3, "img":Landroid/widget/ImageView;
    sget v9, Lcom/anfengde/epub/ui/R$id;->tv_title:I

    invoke-virtual {v1, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 170
    .local v7, "text":Landroid/widget/TextView;
    if-eqz v2, :cond_2

    .line 171
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 176
    :goto_1
    if-eqz v8, :cond_3

    .line 177
    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 182
    :goto_2
    iget v5, p0, Lcom/anfengde/android/QuickAction;->mChildPos:I

    .line 183
    .local v5, "pos":I
    invoke-virtual {p1}, Lcom/anfengde/android/ActionItem;->getActionId()I

    move-result v0

    .line 185
    .local v0, "actionId":I
    new-instance v9, Lcom/anfengde/android/QuickAction$1;

    invoke-direct {v9, p0, v5, v0}, Lcom/anfengde/android/QuickAction$1;-><init>(Lcom/anfengde/android/QuickAction;II)V

    invoke-virtual {v1, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 202
    new-instance v9, Lcom/anfengde/android/QuickAction$2;

    invoke-direct {v9, p0}, Lcom/anfengde/android/QuickAction$2;-><init>(Lcom/anfengde/android/QuickAction;)V

    invoke-virtual {v1, v9}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 225
    const/4 v9, 0x1

    invoke-virtual {v1, v9}, Landroid/view/View;->setFocusable(Z)V

    .line 226
    const/4 v9, 0x1

    invoke-virtual {v1, v9}, Landroid/view/View;->setClickable(Z)V

    .line 229
    iget v9, p0, Lcom/anfengde/android/QuickAction;->mOrientation:I

    if-nez v9, :cond_0

    iget v9, p0, Lcom/anfengde/android/QuickAction;->mChildPos:I

    if-eqz v9, :cond_0

    .line 230
    iget-object v9, p0, Lcom/anfengde/android/QuickAction;->mInflater:Landroid/view/LayoutInflater;

    sget v10, Lcom/anfengde/epub/ui/R$layout;->horiz_separator:I

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    .line 232
    .local v6, "separator":Landroid/view/View;
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v9, -0x2

    const/4 v10, -0x1

    invoke-direct {v4, v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 234
    .local v4, "params":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {v6, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 235
    const/4 v9, 0x5

    const/4 v10, 0x0

    const/4 v11, 0x5

    const/4 v12, 0x0

    invoke-virtual {v6, v9, v10, v11, v12}, Landroid/view/View;->setPadding(IIII)V

    .line 237
    iget-object v9, p0, Lcom/anfengde/android/QuickAction;->mTrack:Landroid/view/ViewGroup;

    iget v10, p0, Lcom/anfengde/android/QuickAction;->mInsertPos:I

    invoke-virtual {v9, v6, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 239
    iget v9, p0, Lcom/anfengde/android/QuickAction;->mInsertPos:I

    add-int/lit8 v9, v9, 0x1

    iput v9, p0, Lcom/anfengde/android/QuickAction;->mInsertPos:I

    .line 242
    .end local v4    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v6    # "separator":Landroid/view/View;
    :cond_0
    iget-object v9, p0, Lcom/anfengde/android/QuickAction;->mTrack:Landroid/view/ViewGroup;

    iget v10, p0, Lcom/anfengde/android/QuickAction;->mInsertPos:I

    invoke-virtual {v9, v1, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 244
    iget v9, p0, Lcom/anfengde/android/QuickAction;->mChildPos:I

    add-int/lit8 v9, v9, 0x1

    iput v9, p0, Lcom/anfengde/android/QuickAction;->mChildPos:I

    .line 245
    iget v9, p0, Lcom/anfengde/android/QuickAction;->mInsertPos:I

    add-int/lit8 v9, v9, 0x1

    iput v9, p0, Lcom/anfengde/android/QuickAction;->mInsertPos:I

    .line 246
    return-void

    .line 164
    .end local v0    # "actionId":I
    .end local v1    # "container":Landroid/view/View;
    .end local v3    # "img":Landroid/widget/ImageView;
    .end local v5    # "pos":I
    .end local v7    # "text":Landroid/widget/TextView;
    :cond_1
    iget-object v9, p0, Lcom/anfengde/android/QuickAction;->mInflater:Landroid/view/LayoutInflater;

    sget v10, Lcom/anfengde/epub/ui/R$layout;->action_item_vertical:I

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .restart local v1    # "container":Landroid/view/View;
    goto/16 :goto_0

    .line 173
    .restart local v3    # "img":Landroid/widget/ImageView;
    .restart local v7    # "text":Landroid/widget/TextView;
    :cond_2
    const/16 v9, 0x8

    invoke-virtual {v3, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1

    .line 179
    :cond_3
    const/16 v9, 0x8

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2
.end method

.method public getActionItem(I)Lcom/anfengde/android/ActionItem;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 105
    iget-object v0, p0, Lcom/anfengde/android/QuickAction;->actionItems:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/anfengde/android/ActionItem;

    return-object v0
.end method

.method public onDismiss()V
    .locals 1

    .prologue
    .line 491
    iget-boolean v0, p0, Lcom/anfengde/android/QuickAction;->mDidAction:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/anfengde/android/QuickAction;->mDismissListener:Lcom/anfengde/android/QuickAction$OnDismissListener;

    if-eqz v0, :cond_0

    .line 492
    iget-object v0, p0, Lcom/anfengde/android/QuickAction;->mDismissListener:Lcom/anfengde/android/QuickAction$OnDismissListener;

    invoke-interface {v0}, Lcom/anfengde/android/QuickAction$OnDismissListener;->onDismiss()V

    .line 494
    :cond_0
    return-void
.end method

.method public setAnimStyle(I)V
    .locals 0
    .param p1, "mAnimStyle"    # I

    .prologue
    .line 136
    iput p1, p0, Lcom/anfengde/android/QuickAction;->mAnimStyle:I

    .line 137
    return-void
.end method

.method public setOnActionItemClickListener(Lcom/anfengde/android/QuickAction$OnActionItemClickListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/anfengde/android/QuickAction$OnActionItemClickListener;

    .prologue
    .line 145
    iput-object p1, p0, Lcom/anfengde/android/QuickAction;->mItemClickListener:Lcom/anfengde/android/QuickAction$OnActionItemClickListener;

    .line 146
    return-void
.end method

.method public setOnDismissListener(Lcom/anfengde/android/QuickAction$OnDismissListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/anfengde/android/QuickAction$OnDismissListener;

    .prologue
    .line 484
    invoke-virtual {p0, p0}, Lcom/anfengde/android/QuickAction;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 486
    iput-object p1, p0, Lcom/anfengde/android/QuickAction;->mDismissListener:Lcom/anfengde/android/QuickAction$OnDismissListener;

    .line 487
    return-void
.end method

.method public setRootViewId(I)V
    .locals 3
    .param p1, "id"    # I

    .prologue
    const/4 v2, -0x2

    .line 114
    iget-object v0, p0, Lcom/anfengde/android/QuickAction;->mInflater:Landroid/view/LayoutInflater;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/anfengde/android/QuickAction;->mRootView:Landroid/view/View;

    .line 115
    iget-object v0, p0, Lcom/anfengde/android/QuickAction;->mRootView:Landroid/view/View;

    sget v1, Lcom/anfengde/epub/ui/R$id;->tracks:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/anfengde/android/QuickAction;->mTrack:Landroid/view/ViewGroup;

    .line 117
    iget-object v0, p0, Lcom/anfengde/android/QuickAction;->mRootView:Landroid/view/View;

    sget v1, Lcom/anfengde/epub/ui/R$id;->arrow_down:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/anfengde/android/QuickAction;->mArrowDown:Landroid/widget/ImageView;

    .line 118
    iget-object v0, p0, Lcom/anfengde/android/QuickAction;->mRootView:Landroid/view/View;

    sget v1, Lcom/anfengde/epub/ui/R$id;->arrow_up:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/anfengde/android/QuickAction;->mArrowUp:Landroid/widget/ImageView;

    .line 120
    iget-object v0, p0, Lcom/anfengde/android/QuickAction;->mRootView:Landroid/view/View;

    sget v1, Lcom/anfengde/epub/ui/R$id;->scroller:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    iput-object v0, p0, Lcom/anfengde/android/QuickAction;->mScroller:Landroid/widget/ScrollView;

    .line 125
    iget-object v0, p0, Lcom/anfengde/android/QuickAction;->mRootView:Landroid/view/View;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 127
    iget-object v0, p0, Lcom/anfengde/android/QuickAction;->mRootView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/anfengde/android/QuickAction;->setContentView(Landroid/view/View;)V

    .line 128
    return-void
.end method

.method public show(Landroid/view/View;)V
    .locals 18
    .param p1, "anchor"    # Landroid/view/View;

    .prologue
    .line 345
    invoke-virtual/range {p0 .. p0}, Lcom/anfengde/android/QuickAction;->preShow()V

    .line 349
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/anfengde/android/QuickAction;->mDidAction:Z

    .line 351
    const/4 v13, 0x2

    new-array v6, v13, [I

    .line 353
    .local v6, "location":[I
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 355
    new-instance v1, Landroid/graphics/Rect;

    const/4 v13, 0x0

    aget v13, v6, v13

    const/4 v14, 0x1

    aget v14, v6, v14

    const/4 v15, 0x0

    aget v15, v6, v15

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getWidth()I

    move-result v16

    add-int v15, v15, v16

    const/16 v16, 0x1

    aget v16, v6, v16

    .line 356
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getHeight()I

    move-result v17

    add-int v16, v16, v17

    .line 355
    move/from16 v0, v16

    invoke-direct {v1, v13, v14, v15, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 360
    .local v1, "anchorRect":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/anfengde/android/QuickAction;->mRootView:Landroid/view/View;

    const/4 v14, -0x2

    const/4 v15, -0x2

    invoke-virtual {v13, v14, v15}, Landroid/view/View;->measure(II)V

    .line 362
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/anfengde/android/QuickAction;->mRootView:Landroid/view/View;

    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    .line 364
    .local v8, "rootHeight":I
    move-object/from16 v0, p0

    iget v13, v0, Lcom/anfengde/android/QuickAction;->rootWidth:I

    if-nez v13, :cond_0

    .line 365
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/anfengde/android/QuickAction;->mRootView:Landroid/view/View;

    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    move-result v13

    move-object/from16 v0, p0

    iput v13, v0, Lcom/anfengde/android/QuickAction;->rootWidth:I

    .line 368
    :cond_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/anfengde/android/QuickAction;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v13}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v13

    invoke-virtual {v13}, Landroid/view/Display;->getWidth()I

    move-result v10

    .line 369
    .local v10, "screenWidth":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/anfengde/android/QuickAction;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v13}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v13

    invoke-virtual {v13}, Landroid/view/Display;->getHeight()I

    move-result v9

    .line 372
    .local v9, "screenHeight":I
    iget v13, v1, Landroid/graphics/Rect;->left:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/anfengde/android/QuickAction;->rootWidth:I

    add-int/2addr v13, v14

    if-le v13, v10, :cond_3

    .line 373
    iget v13, v1, Landroid/graphics/Rect;->left:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/anfengde/android/QuickAction;->rootWidth:I

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getWidth()I

    move-result v15

    sub-int/2addr v14, v15

    sub-int v11, v13, v14

    .line 374
    .local v11, "xPos":I
    if-gez v11, :cond_1

    const/4 v11, 0x0

    .line 376
    :cond_1
    invoke-virtual {v1}, Landroid/graphics/Rect;->centerX()I

    move-result v13

    sub-int v2, v13, v11

    .line 388
    .local v2, "arrowPos":I
    :goto_0
    iget v4, v1, Landroid/graphics/Rect;->top:I

    .line 389
    .local v4, "dyTop":I
    iget v13, v1, Landroid/graphics/Rect;->bottom:I

    sub-int v3, v9, v13

    .line 391
    .local v3, "dyBottom":I
    if-le v4, v3, :cond_5

    const/4 v7, 0x1

    .line 393
    .local v7, "onTop":Z
    :goto_1
    if-eqz v7, :cond_7

    .line 394
    if-le v8, v4, :cond_6

    .line 395
    const/16 v12, 0xf

    .line 396
    .local v12, "yPos":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/anfengde/android/QuickAction;->mScroller:Landroid/widget/ScrollView;

    invoke-virtual {v13}, Landroid/widget/ScrollView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    .line 397
    .local v5, "l":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getHeight()I

    move-result v13

    sub-int v13, v4, v13

    iput v13, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 410
    .end local v5    # "l":Landroid/view/ViewGroup$LayoutParams;
    :cond_2
    :goto_2
    if-eqz v7, :cond_8

    sget v13, Lcom/anfengde/epub/ui/R$id;->arrow_down:I

    :goto_3
    move-object/from16 v0, p0

    invoke-direct {v0, v13, v2}, Lcom/anfengde/android/QuickAction;->showArrow(II)V

    .line 412
    invoke-virtual {v1}, Landroid/graphics/Rect;->centerX()I

    move-result v13

    move-object/from16 v0, p0

    invoke-direct {v0, v10, v13, v7}, Lcom/anfengde/android/QuickAction;->setAnimationStyle(IIZ)V

    .line 414
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/anfengde/android/QuickAction;->mWindow:Landroid/widget/PopupWindow;

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v13, v0, v14, v11, v12}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 415
    return-void

    .line 379
    .end local v2    # "arrowPos":I
    .end local v3    # "dyBottom":I
    .end local v4    # "dyTop":I
    .end local v7    # "onTop":Z
    .end local v11    # "xPos":I
    .end local v12    # "yPos":I
    :cond_3
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getWidth()I

    move-result v13

    move-object/from16 v0, p0

    iget v14, v0, Lcom/anfengde/android/QuickAction;->rootWidth:I

    if-le v13, v14, :cond_4

    .line 380
    invoke-virtual {v1}, Landroid/graphics/Rect;->centerX()I

    move-result v13

    move-object/from16 v0, p0

    iget v14, v0, Lcom/anfengde/android/QuickAction;->rootWidth:I

    div-int/lit8 v14, v14, 0x2

    sub-int v11, v13, v14

    .line 385
    .restart local v11    # "xPos":I
    :goto_4
    invoke-virtual {v1}, Landroid/graphics/Rect;->centerX()I

    move-result v13

    sub-int v2, v13, v11

    .restart local v2    # "arrowPos":I
    goto :goto_0

    .line 382
    .end local v2    # "arrowPos":I
    .end local v11    # "xPos":I
    :cond_4
    iget v11, v1, Landroid/graphics/Rect;->left:I

    .restart local v11    # "xPos":I
    goto :goto_4

    .line 391
    .restart local v2    # "arrowPos":I
    .restart local v3    # "dyBottom":I
    .restart local v4    # "dyTop":I
    :cond_5
    const/4 v7, 0x0

    goto :goto_1

    .line 399
    .restart local v7    # "onTop":Z
    :cond_6
    iget v13, v1, Landroid/graphics/Rect;->top:I

    sub-int v12, v13, v8

    .line 401
    .restart local v12    # "yPos":I
    goto :goto_2

    .line 402
    .end local v12    # "yPos":I
    :cond_7
    iget v12, v1, Landroid/graphics/Rect;->bottom:I

    .line 404
    .restart local v12    # "yPos":I
    if-le v8, v3, :cond_2

    .line 405
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/anfengde/android/QuickAction;->mScroller:Landroid/widget/ScrollView;

    invoke-virtual {v13}, Landroid/widget/ScrollView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    .line 406
    .restart local v5    # "l":Landroid/view/ViewGroup$LayoutParams;
    iput v3, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_2

    .line 410
    .end local v5    # "l":Landroid/view/ViewGroup$LayoutParams;
    :cond_8
    sget v13, Lcom/anfengde/epub/ui/R$id;->arrow_up:I

    goto :goto_3
.end method

.method public show(Landroid/view/View;Landroid/graphics/Rect;)V
    .locals 26
    .param p1, "parent"    # Landroid/view/View;
    .param p2, "rect"    # Landroid/graphics/Rect;

    .prologue
    .line 255
    invoke-virtual/range {p0 .. p0}, Lcom/anfengde/android/QuickAction;->preShow()V

    .line 259
    const/16 v21, 0x0

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/anfengde/android/QuickAction;->mDidAction:Z

    .line 261
    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v11, v0, [I

    .line 262
    .local v11, "location":[I
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 264
    const/16 v21, 0x0

    aget v13, v11, v21

    .line 265
    .local v13, "parentXPos":I
    const/16 v21, 0x1

    aget v14, v11, v21

    .line 267
    .local v14, "parentYPos":I
    new-instance v5, Landroid/graphics/Rect;

    move-object/from16 v0, p2

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v21, v0

    add-int v21, v21, v13

    move-object/from16 v0, p2

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v22, v0

    add-int v22, v22, v14

    move-object/from16 v0, p2

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v23, v0

    add-int v23, v23, v13

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Rect;->width()I

    move-result v24

    add-int v23, v23, v24

    move-object/from16 v0, p2

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v24, v0

    add-int v24, v24, v14

    .line 268
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Rect;->height()I

    move-result v25

    add-int v24, v24, v25

    .line 267
    move/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    invoke-direct {v5, v0, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 269
    .local v5, "anchorRect":Landroid/graphics/Rect;
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v18

    .line 270
    .local v18, "width":I
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v9

    .line 274
    .local v9, "height":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/anfengde/android/QuickAction;->mRootView:Landroid/view/View;

    move-object/from16 v21, v0

    const/16 v22, -0x2

    const/16 v23, -0x2

    invoke-virtual/range {v21 .. v23}, Landroid/view/View;->measure(II)V

    .line 276
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/anfengde/android/QuickAction;->mRootView:Landroid/view/View;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/view/View;->getMeasuredHeight()I

    move-result v15

    .line 278
    .local v15, "rootHeight":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/anfengde/android/QuickAction;->rootWidth:I

    move/from16 v21, v0

    if-nez v21, :cond_0

    .line 279
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/anfengde/android/QuickAction;->mRootView:Landroid/view/View;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/view/View;->getMeasuredWidth()I

    move-result v21

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/anfengde/android/QuickAction;->rootWidth:I

    .line 282
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/anfengde/android/QuickAction;->mWindowManager:Landroid/view/WindowManager;

    move-object/from16 v21, v0

    invoke-interface/range {v21 .. v21}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/view/Display;->getWidth()I

    move-result v17

    .line 283
    .local v17, "screenWidth":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/anfengde/android/QuickAction;->mWindowManager:Landroid/view/WindowManager;

    move-object/from16 v21, v0

    invoke-interface/range {v21 .. v21}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/view/Display;->getHeight()I

    move-result v16

    .line 286
    .local v16, "screenHeight":I
    iget v0, v5, Landroid/graphics/Rect;->left:I

    move/from16 v21, v0

    add-int v21, v21, v13

    move-object/from16 v0, p0

    iget v0, v0, Lcom/anfengde/android/QuickAction;->rootWidth:I

    move/from16 v22, v0

    add-int v21, v21, v22

    move/from16 v0, v21

    move/from16 v1, v17

    if-le v0, v1, :cond_3

    .line 287
    iget v0, v5, Landroid/graphics/Rect;->left:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/anfengde/android/QuickAction;->rootWidth:I

    move/from16 v22, v0

    sub-int v22, v22, v18

    sub-int v19, v21, v22

    .line 288
    .local v19, "xPos":I
    if-gez v19, :cond_1

    const/16 v19, 0x0

    .line 291
    :cond_1
    invoke-virtual {v5}, Landroid/graphics/Rect;->centerX()I

    move-result v21

    sub-int v6, v21, v19

    .line 305
    .local v6, "arrowPos":I
    :goto_0
    iget v8, v5, Landroid/graphics/Rect;->top:I

    .line 306
    .local v8, "dyTop":I
    iget v0, v5, Landroid/graphics/Rect;->bottom:I

    move/from16 v21, v0

    sub-int v7, v16, v21

    .line 308
    .local v7, "dyBottom":I
    if-le v8, v7, :cond_5

    const/4 v12, 0x1

    .line 310
    .local v12, "onTop":Z
    :goto_1
    if-eqz v12, :cond_7

    .line 311
    if-le v15, v8, :cond_6

    .line 312
    const/16 v20, 0xf

    .line 313
    .local v20, "yPos":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/anfengde/android/QuickAction;->mScroller:Landroid/widget/ScrollView;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/widget/ScrollView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    .line 314
    .local v10, "l":Landroid/view/ViewGroup$LayoutParams;
    sub-int v21, v8, v9

    move/from16 v0, v21

    iput v0, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 331
    .end local v10    # "l":Landroid/view/ViewGroup$LayoutParams;
    :cond_2
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/anfengde/android/QuickAction;->mArrowUp:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    const/16 v22, 0x4

    invoke-virtual/range {v21 .. v22}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 332
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/anfengde/android/QuickAction;->mArrowDown:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    const/16 v22, 0x4

    invoke-virtual/range {v21 .. v22}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 334
    invoke-virtual {v5}, Landroid/graphics/Rect;->centerX()I

    move-result v21

    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v21

    invoke-direct {v0, v1, v2, v12}, Lcom/anfengde/android/QuickAction;->setAnimationStyle(IIZ)V

    .line 336
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/anfengde/android/QuickAction;->mWindow:Landroid/widget/PopupWindow;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    move/from16 v2, v22

    move/from16 v3, v19

    move/from16 v4, v20

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 338
    return-void

    .line 294
    .end local v6    # "arrowPos":I
    .end local v7    # "dyBottom":I
    .end local v8    # "dyTop":I
    .end local v12    # "onTop":Z
    .end local v19    # "xPos":I
    .end local v20    # "yPos":I
    :cond_3
    move-object/from16 v0, p0

    iget v0, v0, Lcom/anfengde/android/QuickAction;->rootWidth:I

    move/from16 v21, v0

    move/from16 v0, v18

    move/from16 v1, v21

    if-le v0, v1, :cond_4

    .line 295
    invoke-virtual {v5}, Landroid/graphics/Rect;->centerX()I

    move-result v21

    move-object/from16 v0, p0

    iget v0, v0, Lcom/anfengde/android/QuickAction;->rootWidth:I

    move/from16 v22, v0

    div-int/lit8 v22, v22, 0x2

    sub-int v19, v21, v22

    .line 301
    .restart local v19    # "xPos":I
    :goto_3
    invoke-virtual {v5}, Landroid/graphics/Rect;->centerX()I

    move-result v21

    sub-int v6, v21, v19

    .restart local v6    # "arrowPos":I
    goto :goto_0

    .line 297
    .end local v6    # "arrowPos":I
    .end local v19    # "xPos":I
    :cond_4
    iget v0, v5, Landroid/graphics/Rect;->left:I

    move/from16 v19, v0

    .restart local v19    # "xPos":I
    goto :goto_3

    .line 308
    .restart local v6    # "arrowPos":I
    .restart local v7    # "dyBottom":I
    .restart local v8    # "dyTop":I
    :cond_5
    const/4 v12, 0x0

    goto :goto_1

    .line 316
    .restart local v12    # "onTop":Z
    :cond_6
    iget v0, v5, Landroid/graphics/Rect;->top:I

    move/from16 v21, v0

    sub-int v20, v21, v15

    .line 318
    .restart local v20    # "yPos":I
    goto :goto_2

    .line 319
    .end local v20    # "yPos":I
    :cond_7
    iget v0, v5, Landroid/graphics/Rect;->bottom:I

    move/from16 v20, v0

    .line 321
    .restart local v20    # "yPos":I
    if-le v15, v7, :cond_2

    .line 322
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/anfengde/android/QuickAction;->mScroller:Landroid/widget/ScrollView;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/widget/ScrollView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    .line 323
    .restart local v10    # "l":Landroid/view/ViewGroup$LayoutParams;
    iput v7, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_2
.end method
