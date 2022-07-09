.class public final Lcom/pgyersdk/d/a;
.super Landroid/app/AlertDialog$Builder;

# interfaces
.implements Lcom/pgyersdk/feedback/b;


# instance fields
.field a:Landroid/view/View$OnTouchListener;

.field private b:Landroid/content/Context;

.field private c:Landroid/app/Activity;

.field private d:Landroid/widget/ScrollView;

.field private e:Landroid/widget/EditText;

.field private f:Landroid/widget/ImageView;

.field private g:Landroid/widget/CheckBox;

.field private h:I

.field private i:Ljava/lang/String;

.field private j:Ljava/lang/String;

.field private k:Ljava/lang/String;

.field private l:I

.field private m:I

.field private n:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v0, Lcom/pgyersdk/d/b;

    invoke-direct {v0, p0}, Lcom/pgyersdk/d/b;-><init>(Lcom/pgyersdk/d/a;)V

    iput-object v0, p0, Lcom/pgyersdk/d/a;->n:Landroid/os/Handler;

    new-instance v0, Lcom/pgyersdk/d/c;

    invoke-direct {v0, p0}, Lcom/pgyersdk/d/c;-><init>(Lcom/pgyersdk/d/a;)V

    iput-object v0, p0, Lcom/pgyersdk/d/a;->a:Landroid/view/View$OnTouchListener;

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    iput-object v0, p0, Lcom/pgyersdk/d/a;->c:Landroid/app/Activity;

    :cond_0
    iput-object p1, p0, Lcom/pgyersdk/d/a;->b:Landroid/content/Context;

    invoke-static {p0}, Lcom/pgyersdk/feedback/c;->a(Lcom/pgyersdk/feedback/b;)V

    invoke-static {p0}, Lcom/pgyersdk/c/f;->a(Lcom/pgyersdk/feedback/b;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    invoke-direct {p0, p1, p2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    new-instance v0, Lcom/pgyersdk/d/b;

    invoke-direct {v0, p0}, Lcom/pgyersdk/d/b;-><init>(Lcom/pgyersdk/d/a;)V

    iput-object v0, p0, Lcom/pgyersdk/d/a;->n:Landroid/os/Handler;

    new-instance v0, Lcom/pgyersdk/d/c;

    invoke-direct {v0, p0}, Lcom/pgyersdk/d/c;-><init>(Lcom/pgyersdk/d/a;)V

    iput-object v0, p0, Lcom/pgyersdk/d/a;->a:Landroid/view/View$OnTouchListener;

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    iput-object v0, p0, Lcom/pgyersdk/d/a;->c:Landroid/app/Activity;

    :cond_0
    const/4 v0, 0x2

    if-ne p2, v0, :cond_1

    new-instance v0, Landroid/view/ContextThemeWrapper;

    const v1, 0x103006b

    invoke-direct {v0, p1, v1}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/pgyersdk/d/a;->b:Landroid/content/Context;

    :goto_0
    iput p2, p0, Lcom/pgyersdk/d/a;->h:I

    invoke-static {p0}, Lcom/pgyersdk/feedback/c;->a(Lcom/pgyersdk/feedback/b;)V

    invoke-static {p0}, Lcom/pgyersdk/c/f;->a(Lcom/pgyersdk/feedback/b;)V

    return-void

    :cond_1
    const/4 v0, 0x3

    if-ne p2, v0, :cond_2

    new-instance v0, Landroid/view/ContextThemeWrapper;

    const v1, 0x103006e

    invoke-direct {v0, p1, v1}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/pgyersdk/d/a;->b:Landroid/content/Context;

    goto :goto_0

    :cond_2
    new-instance v0, Landroid/view/ContextThemeWrapper;

    const v1, 0x1030005

    invoke-direct {v0, p1, v1}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/pgyersdk/d/a;->b:Landroid/content/Context;

    goto :goto_0
.end method

.method private a(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/view/View;
    .locals 4

    const/16 v3, 0x14

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v1, 0x41b00000    # 22.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Lcom/pgyersdk/d/a;->i:Ljava/lang/String;

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v1, 0x1e

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v3, v2, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    const-string/jumbo v1, "#56bc94"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackgroundColor(I)V

    return-object v0
.end method

.method static synthetic a(Lcom/pgyersdk/d/a;)Landroid/widget/ImageView;
    .locals 1

    iget-object v0, p0, Lcom/pgyersdk/d/a;->f:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic b(Lcom/pgyersdk/d/a;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/pgyersdk/d/a;->n:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic c(Lcom/pgyersdk/d/a;)Landroid/app/Activity;
    .locals 1

    iget-object v0, p0, Lcom/pgyersdk/d/a;->c:Landroid/app/Activity;

    return-object v0
.end method

.method private static c()Landroid/widget/LinearLayout$LayoutParams;
    .locals 3

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method


# virtual methods
.method public final a()Landroid/widget/EditText;
    .locals 1

    iget-object v0, p0, Lcom/pgyersdk/d/a;->e:Landroid/widget/EditText;

    return-object v0
.end method

.method public final a(Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/pgyersdk/d/a;->f:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pgyersdk/d/a;->f:Landroid/widget/ImageView;

    invoke-static {p1}, Lcom/pgyersdk/c/i;->a(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :goto_0
    return-void

    :cond_0
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    const/16 v1, 0x4e22

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v1, p0, Lcom/pgyersdk/d/a;->n:Landroid/os/Handler;

    const-wide/16 v2, 0x64

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0
.end method

.method public final b()Landroid/widget/CheckBox;
    .locals 1

    iget-object v0, p0, Lcom/pgyersdk/d/a;->g:Landroid/widget/CheckBox;

    return-object v0
.end method

.method public final create()Landroid/app/AlertDialog;
    .locals 12

    const/16 v7, 0xa

    const/4 v11, -0x2

    const/4 v10, 0x1

    const/16 v9, 0x1e

    const/4 v8, 0x0

    iget v0, p0, Lcom/pgyersdk/d/a;->h:I

    const-string/jumbo v0, "#ffffff"

    iput-object v0, p0, Lcom/pgyersdk/d/a;->i:Ljava/lang/String;

    const-string/jumbo v0, "#56bc94"

    iput-object v0, p0, Lcom/pgyersdk/d/a;->j:Ljava/lang/String;

    const-string/jumbo v0, "#cccccc"

    iput-object v0, p0, Lcom/pgyersdk/d/a;->k:Ljava/lang/String;

    const/16 v0, 0xf5

    const/16 v1, 0xf5

    const/16 v2, 0xf5

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Lcom/pgyersdk/d/a;->l:I

    const/16 v0, 0xff

    const/16 v1, 0xff

    const/16 v2, 0xff

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Lcom/pgyersdk/d/a;->m:I

    invoke-super {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/app/AlertDialog;->requestWindowFeature(I)Z

    new-instance v1, Landroid/widget/ScrollView;

    iget-object v2, p0, Lcom/pgyersdk/d/a;->b:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/pgyersdk/d/a;->d:Landroid/widget/ScrollView;

    iget-object v1, p0, Lcom/pgyersdk/d/a;->b:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    if-ne v1, v10, :cond_0

    iget-object v1, p0, Lcom/pgyersdk/d/a;->d:Landroid/widget/ScrollView;

    iget-object v2, p0, Lcom/pgyersdk/d/a;->b:Landroid/content/Context;

    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iget-object v4, p0, Lcom/pgyersdk/d/a;->a:Landroid/view/View$OnTouchListener;

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    invoke-virtual {v3, v10}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-static {}, Lcom/pgyersdk/d/a;->c()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v4

    const-string/jumbo v5, "\u53cd\u9988"

    invoke-direct {p0, v2, v5}, Lcom/pgyersdk/d/a;->a(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string/jumbo v6, "\u63cf\u8ff0"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v6, p0, Lcom/pgyersdk/d/a;->j:Ljava/lang/String;

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v6, 0x41900000    # 18.0f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    iget v6, p0, Lcom/pgyersdk/d/a;->l:I

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setBackgroundColor(I)V

    invoke-virtual {v5, v9, v9, v8, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v3, v5, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/EditText;

    invoke-direct {v5, v2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/pgyersdk/d/a;->e:Landroid/widget/EditText;

    iget-object v5, p0, Lcom/pgyersdk/d/a;->e:Landroid/widget/EditText;

    const-string/jumbo v6, "\u8bf7\u8f93\u5165\u4f60\u8981\u53cd\u9988\u7684\u5185\u5bb9..."

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    iget-object v5, p0, Lcom/pgyersdk/d/a;->e:Landroid/widget/EditText;

    iget-object v6, p0, Lcom/pgyersdk/d/a;->k:Ljava/lang/String;

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setHintTextColor(I)V

    iget-object v5, p0, Lcom/pgyersdk/d/a;->e:Landroid/widget/EditText;

    const/4 v6, 0x6

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setMinLines(I)V

    iget-object v5, p0, Lcom/pgyersdk/d/a;->e:Landroid/widget/EditText;

    const/high16 v6, 0x41600000    # 14.0f

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setTextSize(F)V

    iget-object v5, p0, Lcom/pgyersdk/d/a;->e:Landroid/widget/EditText;

    const/16 v6, 0x33

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setGravity(I)V

    iget-object v5, p0, Lcom/pgyersdk/d/a;->e:Landroid/widget/EditText;

    iget v6, p0, Lcom/pgyersdk/d/a;->m:I

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setBackgroundColor(I)V

    iget-object v5, p0, Lcom/pgyersdk/d/a;->e:Landroid/widget/EditText;

    invoke-virtual {v3, v5, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string/jumbo v6, "\u622a\u56fe"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v6, p0, Lcom/pgyersdk/d/a;->j:Ljava/lang/String;

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v6, 0x41900000    # 18.0f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    iget v6, p0, Lcom/pgyersdk/d/a;->l:I

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setBackgroundColor(I)V

    invoke-virtual {v5, v9, v9, v8, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v3, v5, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v11, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x42700000    # 60.0f

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    invoke-static {v10, v6, v7}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v6

    float-to-int v6, v6

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->width:I

    iget v6, v5, Landroid/widget/LinearLayout$LayoutParams;->width:I

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v7, v7, Landroid/util/DisplayMetrics;->heightPixels:I

    mul-int/2addr v6, v7

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v7, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/2addr v6, v7

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->height:I

    invoke-virtual {v5, v9, v8, v8, v8}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    const/4 v6, 0x3

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    new-instance v6, Landroid/widget/ImageView;

    invoke-direct {v6, v2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/pgyersdk/d/a;->f:Landroid/widget/ImageView;

    iget-object v6, p0, Lcom/pgyersdk/d/a;->f:Landroid/widget/ImageView;

    invoke-virtual {v3, v6, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v11, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v6, 0x3

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    invoke-virtual {v5, v9, v8, v8, v8}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    new-instance v6, Landroid/widget/CheckBox;

    invoke-direct {v6, v2}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/pgyersdk/d/a;->g:Landroid/widget/CheckBox;

    iget-object v6, p0, Lcom/pgyersdk/d/a;->g:Landroid/widget/CheckBox;

    const-string/jumbo v7, "\u4e0a\u4f20\u5c4f\u5e55\u622a\u56fe"

    invoke-virtual {v6, v7}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    iget-object v6, p0, Lcom/pgyersdk/d/a;->g:Landroid/widget/CheckBox;

    invoke-virtual {v6, v10}, Landroid/widget/CheckBox;->setChecked(Z)V

    iget-object v6, p0, Lcom/pgyersdk/d/a;->g:Landroid/widget/CheckBox;

    new-instance v7, Lcom/pgyersdk/d/d;

    invoke-direct {v7, p0}, Lcom/pgyersdk/d/d;-><init>(Lcom/pgyersdk/d/a;)V

    invoke-virtual {v6, v7}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object v6, p0, Lcom/pgyersdk/d/a;->g:Landroid/widget/CheckBox;

    invoke-virtual {v3, v6, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "\u8bbe\u5907\u8be6\u60c5\uff1a"

    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v6, Lcom/pgyersdk/a/a;->g:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v6, "\t"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v6, Lcom/pgyersdk/a/a;->f:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Lcom/pgyersdk/d/a;->j:Ljava/lang/String;

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 v2, 0x14

    const/16 v6, 0x14

    invoke-virtual {v5, v9, v2, v8, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v3, v5, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {}, Lcom/pgyersdk/d/a;->c()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_0
    iget-object v1, p0, Lcom/pgyersdk/d/a;->d:Landroid/widget/ScrollView;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setView(Landroid/view/View;)V

    invoke-virtual {v0, v8}, Landroid/app/AlertDialog;->setCancelable(Z)V

    return-object v0

    :cond_0
    iget-object v1, p0, Lcom/pgyersdk/d/a;->d:Landroid/widget/ScrollView;

    iget-object v2, p0, Lcom/pgyersdk/d/a;->b:Landroid/content/Context;

    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v10}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v4, p0, Lcom/pgyersdk/d/a;->a:Landroid/view/View$OnTouchListener;

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-static {}, Lcom/pgyersdk/d/a;->c()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v4

    const-string/jumbo v5, "\u53cd\u9988"

    invoke-direct {p0, v2, v5}, Lcom/pgyersdk/d/a;->a(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v5, Landroid/widget/EditText;

    invoke-direct {v5, v2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/pgyersdk/d/a;->e:Landroid/widget/EditText;

    iget-object v5, p0, Lcom/pgyersdk/d/a;->e:Landroid/widget/EditText;

    const-string/jumbo v6, "\u8bf7\u8f93\u5165\u4f60\u8981\u53cd\u9988\u7684\u5185\u5bb9..."

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    iget-object v5, p0, Lcom/pgyersdk/d/a;->e:Landroid/widget/EditText;

    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setMinLines(I)V

    iget-object v5, p0, Lcom/pgyersdk/d/a;->e:Landroid/widget/EditText;

    iget-object v6, p0, Lcom/pgyersdk/d/a;->k:Ljava/lang/String;

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setHintTextColor(I)V

    iget-object v5, p0, Lcom/pgyersdk/d/a;->e:Landroid/widget/EditText;

    const/16 v6, 0x33

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setGravity(I)V

    iget-object v5, p0, Lcom/pgyersdk/d/a;->e:Landroid/widget/EditText;

    iget v6, p0, Lcom/pgyersdk/d/a;->m:I

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setBackgroundColor(I)V

    iget-object v5, p0, Lcom/pgyersdk/d/a;->e:Landroid/widget/EditText;

    invoke-virtual {v3, v5, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string/jumbo v6, "#f0f0f0"

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setBackgroundColor(I)V

    invoke-static {v2}, Lcom/pgyersdk/c/d;->a(Landroid/content/Context;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setHeight(I)V

    invoke-virtual {v3, v5, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v11, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v9, v7, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    new-instance v6, Landroid/widget/CheckBox;

    invoke-direct {v6, v2}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/pgyersdk/d/a;->g:Landroid/widget/CheckBox;

    iget-object v6, p0, Lcom/pgyersdk/d/a;->g:Landroid/widget/CheckBox;

    const-string/jumbo v7, "\u4e0a\u4f20\u5c4f\u5e55\u622a\u56fe"

    invoke-virtual {v6, v7}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    iget-object v6, p0, Lcom/pgyersdk/d/a;->g:Landroid/widget/CheckBox;

    invoke-virtual {v6, v10}, Landroid/widget/CheckBox;->setChecked(Z)V

    iget-object v6, p0, Lcom/pgyersdk/d/a;->g:Landroid/widget/CheckBox;

    iget v7, p0, Lcom/pgyersdk/d/a;->l:I

    invoke-virtual {v6, v7}, Landroid/widget/CheckBox;->setBackgroundColor(I)V

    iget-object v6, p0, Lcom/pgyersdk/d/a;->g:Landroid/widget/CheckBox;

    new-instance v7, Lcom/pgyersdk/d/e;

    invoke-direct {v7, p0}, Lcom/pgyersdk/d/e;-><init>(Lcom/pgyersdk/d/a;)V

    invoke-virtual {v6, v7}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object v6, p0, Lcom/pgyersdk/d/a;->g:Landroid/widget/CheckBox;

    invoke-virtual {v3, v6, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string/jumbo v6, "#f0f0f0"

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setBackgroundColor(I)V

    invoke-static {v2}, Lcom/pgyersdk/c/d;->a(Landroid/content/Context;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setHeight(I)V

    invoke-virtual {v3, v5, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "\u8bbe\u5907\u8be6\u60c5\uff1a"

    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v6, Lcom/pgyersdk/a/a;->g:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v6, "\t"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v6, Lcom/pgyersdk/a/a;->f:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Lcom/pgyersdk/d/a;->j:Ljava/lang/String;

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v2, -0x1

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setBackgroundColor(I)V

    const/16 v2, 0x14

    const/16 v6, 0x14

    invoke-virtual {v5, v9, v2, v8, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v3, v5, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {}, Lcom/pgyersdk/d/a;->c()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_0
.end method

.method public final setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    .locals 1
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    iget-object v0, p0, Lcom/pgyersdk/d/a;->b:Landroid/content/Context;

    invoke-direct {p0, v0, p1}, Lcom/pgyersdk/d/a;->a(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/pgyersdk/d/a;->setCustomTitle(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    invoke-super {p0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public final show()Landroid/app/AlertDialog;
    .locals 4

    invoke-super {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    const/4 v3, 0x7

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->gravity:I

    invoke-virtual {v1, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    return-object v0
.end method
