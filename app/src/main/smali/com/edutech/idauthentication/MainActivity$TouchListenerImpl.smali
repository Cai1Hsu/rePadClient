.class Lcom/edutech/idauthentication/MainActivity$TouchListenerImpl;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/idauthentication/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TouchListenerImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/idauthentication/MainActivity;


# direct methods
.method private constructor <init>(Lcom/edutech/idauthentication/MainActivity;)V
    .locals 0

    .prologue
    .line 1275
    iput-object p1, p0, Lcom/edutech/idauthentication/MainActivity$TouchListenerImpl;->this$0:Lcom/edutech/idauthentication/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/edutech/idauthentication/MainActivity;Lcom/edutech/idauthentication/MainActivity$TouchListenerImpl;)V
    .locals 0

    .prologue
    .line 1275
    invoke-direct {p0, p1}, Lcom/edutech/idauthentication/MainActivity$TouchListenerImpl;-><init>(Lcom/edutech/idauthentication/MainActivity;)V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "motionEvent"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v5, 0x0

    .line 1278
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 1303
    :cond_0
    :goto_0
    :pswitch_0
    return v5

    .line 1283
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    move-result v2

    .line 1284
    .local v2, "scrollY":I
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    .line 1285
    .local v0, "height":I
    iget-object v3, p0, Lcom/edutech/idauthentication/MainActivity$TouchListenerImpl;->this$0:Lcom/edutech/idauthentication/MainActivity;

    invoke-static {v3}, Lcom/edutech/idauthentication/MainActivity;->access$1(Lcom/edutech/idauthentication/MainActivity;)Landroid/widget/ScrollView;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/widget/ScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    .line 1292
    .local v1, "scrollViewMeasuredHeight":I
    const/16 v3, 0x14

    if-le v1, v3, :cond_1

    .line 1293
    add-int/lit8 v1, v1, -0x14

    .line 1294
    :cond_1
    add-int v3, v2, v0

    if-le v3, v1, :cond_0

    .line 1296
    iget-object v3, p0, Lcom/edutech/idauthentication/MainActivity$TouchListenerImpl;->this$0:Lcom/edutech/idauthentication/MainActivity;

    invoke-static {v3}, Lcom/edutech/idauthentication/MainActivity;->access$2(Lcom/edutech/idauthentication/MainActivity;)Landroid/widget/Button;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0

    .line 1278
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
