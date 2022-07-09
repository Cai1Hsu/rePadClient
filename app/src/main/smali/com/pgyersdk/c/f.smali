.class public final Lcom/pgyersdk/c/f;
.super Ljava/lang/Object;


# static fields
.field private static a:Ljava/lang/String;

.field private static b:Lcom/pgyersdk/c/f;

.field private static f:Lcom/pgyersdk/feedback/b;


# instance fields
.field private c:Z

.field private d:Landroid/content/Context;

.field private e:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string/jumbo v0, "GLSurfaceUtils"

    sput-object v0, Lcom/pgyersdk/c/f;->a:Ljava/lang/String;

    const/4 v0, 0x0

    sput-object v0, Lcom/pgyersdk/c/f;->b:Lcom/pgyersdk/c/f;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v0, p0, Lcom/pgyersdk/c/f;->c:Z

    iput v0, p0, Lcom/pgyersdk/c/f;->e:I

    return-void
.end method

.method public static a()Lcom/pgyersdk/c/f;
    .locals 1

    sget-object v0, Lcom/pgyersdk/c/f;->b:Lcom/pgyersdk/c/f;

    if-nez v0, :cond_0

    new-instance v0, Lcom/pgyersdk/c/f;

    invoke-direct {v0}, Lcom/pgyersdk/c/f;-><init>()V

    sput-object v0, Lcom/pgyersdk/c/f;->b:Lcom/pgyersdk/c/f;

    :cond_0
    sget-object v0, Lcom/pgyersdk/c/f;->b:Lcom/pgyersdk/c/f;

    return-object v0
.end method

.method public static a(Lcom/pgyersdk/feedback/b;)V
    .locals 0

    sput-object p0, Lcom/pgyersdk/c/f;->f:Lcom/pgyersdk/feedback/b;

    return-void
.end method

.method public static b()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/pgyersdk/c/f;->b:Lcom/pgyersdk/c/f;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/pgyersdk/c/f;->d:Landroid/content/Context;

    return-void
.end method

.method public final c()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pgyersdk/c/f;->c:Z

    return-void
.end method
