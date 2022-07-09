.class public final Lcom/pgyersdk/feedback/c;
.super Ljava/lang/Object;


# static fields
.field private static a:Lcom/pgyersdk/feedback/c;

.field private static i:Lcom/pgyersdk/feedback/b;


# instance fields
.field private b:Lcom/pgyersdk/d/a;

.field private c:I

.field private d:Lcom/pgyersdk/feedback/a;

.field private e:Z

.field private f:Landroid/os/Handler;

.field private g:Landroid/content/Context;

.field private h:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/pgyersdk/feedback/c;->a:Lcom/pgyersdk/feedback/c;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pgyersdk/feedback/c;->d:Lcom/pgyersdk/feedback/a;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pgyersdk/feedback/c;->e:Z

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pgyersdk/feedback/c;->h:Ljava/lang/String;

    return-void
.end method

.method static synthetic a(Lcom/pgyersdk/feedback/c;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/pgyersdk/feedback/c;->g:Landroid/content/Context;

    return-object v0
.end method

.method public static a()Lcom/pgyersdk/feedback/c;
    .locals 1

    sget-object v0, Lcom/pgyersdk/feedback/c;->a:Lcom/pgyersdk/feedback/c;

    if-nez v0, :cond_0

    new-instance v0, Lcom/pgyersdk/feedback/c;

    invoke-direct {v0}, Lcom/pgyersdk/feedback/c;-><init>()V

    sput-object v0, Lcom/pgyersdk/feedback/c;->a:Lcom/pgyersdk/feedback/c;

    :cond_0
    sget-object v0, Lcom/pgyersdk/feedback/c;->a:Lcom/pgyersdk/feedback/c;

    return-object v0
.end method

.method static synthetic a(Landroid/content/DialogInterface;Ljava/lang/Boolean;)V
    .locals 2

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    const-string/jumbo v1, "mShowing"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_0
    return-void

    :catch_0
    move-exception v0

    :try_start_2
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/NoSuchFieldException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/NoSuchFieldException;->printStackTrace()V

    goto :goto_0

    :catch_2
    move-exception v0

    :try_start_3
    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->printStackTrace()V
    :try_end_3
    .catch Ljava/lang/NoSuchFieldException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0
.end method

.method public static a(Lcom/pgyersdk/feedback/b;)V
    .locals 0

    sput-object p0, Lcom/pgyersdk/feedback/c;->i:Lcom/pgyersdk/feedback/b;

    return-void
.end method

.method static synthetic b()Lcom/pgyersdk/feedback/b;
    .locals 1

    sget-object v0, Lcom/pgyersdk/feedback/c;->i:Lcom/pgyersdk/feedback/b;

    return-object v0
.end method

.method static synthetic b(Lcom/pgyersdk/feedback/c;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/pgyersdk/feedback/c;->h:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic b(Landroid/content/Context;)Z
    .locals 1

    const-string/jumbo v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {p0, v0}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic c(Lcom/pgyersdk/feedback/c;)Lcom/pgyersdk/d/a;
    .locals 1

    iget-object v0, p0, Lcom/pgyersdk/feedback/c;->b:Lcom/pgyersdk/d/a;

    return-object v0
.end method

.method static synthetic d(Lcom/pgyersdk/feedback/c;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/pgyersdk/feedback/c;->e:Z

    return v0
.end method

.method static synthetic e(Lcom/pgyersdk/feedback/c;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/pgyersdk/feedback/c;->f:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic f(Lcom/pgyersdk/feedback/c;)V
    .locals 2

    const/4 v1, 0x0

    invoke-static {}, Lcom/pgyersdk/c/e;->a()Lcom/pgyersdk/c/e;

    invoke-static {}, Lcom/pgyersdk/c/e;->b()V

    invoke-static {}, Lcom/pgyersdk/c/f;->a()Lcom/pgyersdk/c/f;

    invoke-static {}, Lcom/pgyersdk/c/f;->b()V

    iget-object v0, p0, Lcom/pgyersdk/feedback/c;->d:Lcom/pgyersdk/feedback/a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pgyersdk/feedback/c;->d:Lcom/pgyersdk/feedback/a;

    invoke-interface {v0}, Lcom/pgyersdk/feedback/a;->b()V

    :cond_0
    iput-object v1, p0, Lcom/pgyersdk/feedback/c;->b:Lcom/pgyersdk/d/a;

    sput-object v1, Lcom/pgyersdk/feedback/c;->a:Lcom/pgyersdk/feedback/c;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Lcom/pgyersdk/d/a;
    .locals 3

    iput-object p1, p0, Lcom/pgyersdk/feedback/c;->g:Landroid/content/Context;

    new-instance v0, Lcom/pgyersdk/feedback/i;

    invoke-direct {v0, p0}, Lcom/pgyersdk/feedback/i;-><init>(Lcom/pgyersdk/feedback/c;)V

    iput-object v0, p0, Lcom/pgyersdk/feedback/c;->f:Landroid/os/Handler;

    iget-object v0, p0, Lcom/pgyersdk/feedback/c;->b:Lcom/pgyersdk/d/a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pgyersdk/feedback/c;->b:Lcom/pgyersdk/d/a;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/pgyersdk/feedback/c;->d:Lcom/pgyersdk/feedback/a;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/pgyersdk/feedback/c;->d:Lcom/pgyersdk/feedback/a;

    invoke-interface {v0}, Lcom/pgyersdk/feedback/a;->a()V

    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_4

    iget v0, p0, Lcom/pgyersdk/feedback/c;->c:I

    if-nez v0, :cond_2

    const/4 v0, 0x3

    iput v0, p0, Lcom/pgyersdk/feedback/c;->c:I

    :cond_2
    new-instance v0, Lcom/pgyersdk/d/a;

    iget v1, p0, Lcom/pgyersdk/feedback/c;->c:I

    invoke-direct {v0, p1, v1}, Lcom/pgyersdk/d/a;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/pgyersdk/feedback/c;->b:Lcom/pgyersdk/d/a;

    :goto_1
    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/pgyersdk/feedback/c;->e:Z

    if-nez v0, :cond_5

    invoke-static {}, Lcom/pgyersdk/c/e;->a()Lcom/pgyersdk/c/e;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/pgyersdk/c/e;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pgyersdk/feedback/c;->h:Ljava/lang/String;

    iget-object v1, p0, Lcom/pgyersdk/feedback/c;->h:Ljava/lang/String;

    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    invoke-virtual {v0}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    move-result-object v0

    const-string/jumbo v2, "takeScreenshot filepath"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v2, Lcom/pgyersdk/feedback/h;

    invoke-direct {v2, p0, v0, v1}, Lcom/pgyersdk/feedback/h;-><init>(Lcom/pgyersdk/feedback/c;Landroid/graphics/Bitmap;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/pgyersdk/c/a;->a(Landroid/os/AsyncTask;)V

    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/pgyersdk/feedback/c;->b:Lcom/pgyersdk/d/a;

    const-string/jumbo v1, "\u63d0\u4ea4"

    new-instance v2, Lcom/pgyersdk/feedback/d;

    invoke-direct {v2, p0, p1}, Lcom/pgyersdk/feedback/d;-><init>(Lcom/pgyersdk/feedback/c;Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Lcom/pgyersdk/d/a;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/pgyersdk/feedback/c;->b:Lcom/pgyersdk/d/a;

    const-string/jumbo v1, "\u53d6\u6d88"

    new-instance v2, Lcom/pgyersdk/feedback/e;

    invoke-direct {v2, p0, p1}, Lcom/pgyersdk/feedback/e;-><init>(Lcom/pgyersdk/feedback/c;Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Lcom/pgyersdk/d/a;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/pgyersdk/feedback/c;->b:Lcom/pgyersdk/d/a;

    new-instance v1, Lcom/pgyersdk/feedback/f;

    invoke-direct {v1, p0}, Lcom/pgyersdk/feedback/f;-><init>(Lcom/pgyersdk/feedback/c;)V

    invoke-virtual {v0, v1}, Lcom/pgyersdk/d/a;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/pgyersdk/feedback/c;->b:Lcom/pgyersdk/d/a;

    invoke-virtual {v0}, Lcom/pgyersdk/d/a;->create()Landroid/app/AlertDialog;

    move-result-object v0

    new-instance v1, Lcom/pgyersdk/feedback/g;

    invoke-direct {v1, p0}, Lcom/pgyersdk/feedback/g;-><init>(Lcom/pgyersdk/feedback/c;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    iget-object v0, p0, Lcom/pgyersdk/feedback/c;->b:Lcom/pgyersdk/d/a;

    goto/16 :goto_0

    :cond_4
    new-instance v0, Lcom/pgyersdk/d/a;

    invoke-direct {v0, p1}, Lcom/pgyersdk/d/a;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pgyersdk/feedback/c;->b:Lcom/pgyersdk/d/a;

    goto :goto_1

    :cond_5
    invoke-static {}, Lcom/pgyersdk/c/f;->a()Lcom/pgyersdk/c/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/pgyersdk/c/f;->a(Landroid/content/Context;)V

    invoke-static {}, Lcom/pgyersdk/c/f;->a()Lcom/pgyersdk/c/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/pgyersdk/c/f;->c()V

    goto :goto_2
.end method

.method public final a(Lcom/pgyersdk/feedback/a;)Lcom/pgyersdk/feedback/c;
    .locals 1

    iput-object p1, p0, Lcom/pgyersdk/feedback/c;->d:Lcom/pgyersdk/feedback/a;

    sget-object v0, Lcom/pgyersdk/feedback/c;->a:Lcom/pgyersdk/feedback/c;

    return-object v0
.end method

.method public final a(Z)Lcom/pgyersdk/feedback/c;
    .locals 1

    iput-boolean p1, p0, Lcom/pgyersdk/feedback/c;->e:Z

    sget-object v0, Lcom/pgyersdk/feedback/c;->a:Lcom/pgyersdk/feedback/c;

    return-object v0
.end method
