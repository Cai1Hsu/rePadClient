.class public Lcom/blahti/drag/MyAbsoluteLayout;
.super Landroid/view/ViewGroup;
.source "MyAbsoluteLayout.java"


# annotations
.annotation runtime Landroid/widget/RemoteViews$RemoteView;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 44
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 52
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 53
    return-void
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 146
    instance-of v0, p1, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;

    return v0
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x2

    .line 107
    new-instance v0, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;

    invoke-direct {v0, v1, v1, v2, v2}, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;-><init>(IIII)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 2
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 140
    new-instance v0, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/blahti/drag/MyAbsoluteLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 151
    new-instance v0, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;

    invoke-direct {v0, p1}, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method protected onLayout(ZIIII)V
    .locals 10
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 113
    invoke-virtual {p0}, Lcom/blahti/drag/MyAbsoluteLayout;->getChildCount()I

    move-result v3

    .line 115
    .local v3, "count":I
    invoke-virtual {p0}, Lcom/blahti/drag/MyAbsoluteLayout;->getPaddingLeft()I

    move-result v6

    .line 116
    .local v6, "paddingL":I
    invoke-virtual {p0}, Lcom/blahti/drag/MyAbsoluteLayout;->getPaddingTop()I

    move-result v7

    .line 117
    .local v7, "paddingT":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-lt v4, v3, :cond_0

    .line 136
    return-void

    .line 118
    :cond_0
    invoke-virtual {p0, v4}, Lcom/blahti/drag/MyAbsoluteLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 119
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v8

    const/16 v9, 0x8

    if-eq v8, v9, :cond_1

    .line 122
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;

    .line 124
    .local v5, "lp":Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;
    iget v8, v5, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->x:I

    add-int v1, v6, v8

    .line 125
    .local v1, "childLeft":I
    iget v8, v5, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->y:I

    add-int v2, v7, v8

    .line 131
    .local v2, "childTop":I
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    add-int/2addr v8, v1

    .line 132
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    add-int/2addr v9, v2

    .line 130
    invoke-virtual {v0, v1, v2, v8, v9}, Landroid/view/View;->layout(IIII)V

    .line 117
    .end local v1    # "childLeft":I
    .end local v2    # "childTop":I
    .end local v5    # "lp":Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 10
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 57
    invoke-virtual {p0}, Lcom/blahti/drag/MyAbsoluteLayout;->getChildCount()I

    move-result v3

    .line 59
    .local v3, "count":I
    const/4 v6, 0x0

    .line 60
    .local v6, "maxHeight":I
    const/4 v7, 0x0

    .line 63
    .local v7, "maxWidth":I
    invoke-virtual {p0, p1, p2}, Lcom/blahti/drag/MyAbsoluteLayout;->measureChildren(II)V

    .line 66
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-lt v4, v3, :cond_0

    .line 84
    invoke-virtual {p0}, Lcom/blahti/drag/MyAbsoluteLayout;->getPaddingLeft()I

    move-result v8

    invoke-virtual {p0}, Lcom/blahti/drag/MyAbsoluteLayout;->getPaddingRight()I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v7, v8

    .line 85
    invoke-virtual {p0}, Lcom/blahti/drag/MyAbsoluteLayout;->getPaddingTop()I

    move-result v8

    invoke-virtual {p0}, Lcom/blahti/drag/MyAbsoluteLayout;->getPaddingBottom()I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v6, v8

    .line 92
    invoke-virtual {p0}, Lcom/blahti/drag/MyAbsoluteLayout;->getSuggestedMinimumHeight()I

    move-result v8

    invoke-static {v6, v8}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 93
    invoke-virtual {p0}, Lcom/blahti/drag/MyAbsoluteLayout;->getSuggestedMinimumWidth()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 95
    invoke-static {v7, p1}, Lcom/blahti/drag/MyAbsoluteLayout;->resolveSize(II)I

    move-result v8

    .line 96
    invoke-static {v6, p2}, Lcom/blahti/drag/MyAbsoluteLayout;->resolveSize(II)I

    move-result v9

    .line 95
    invoke-virtual {p0, v8, v9}, Lcom/blahti/drag/MyAbsoluteLayout;->setMeasuredDimension(II)V

    .line 97
    return-void

    .line 67
    :cond_0
    invoke-virtual {p0, v4}, Lcom/blahti/drag/MyAbsoluteLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 68
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v8

    const/16 v9, 0x8

    if-eq v8, v9, :cond_1

    .line 73
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;

    .line 75
    .local v5, "lp":Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;
    iget v8, v5, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->x:I

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    add-int v2, v8, v9

    .line 76
    .local v2, "childRight":I
    iget v8, v5, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->y:I

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    add-int v1, v8, v9

    .line 78
    .local v1, "childBottom":I
    invoke-static {v7, v2}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 79
    invoke-static {v6, v1}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 66
    .end local v1    # "childBottom":I
    .end local v2    # "childRight":I
    .end local v5    # "lp":Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method
