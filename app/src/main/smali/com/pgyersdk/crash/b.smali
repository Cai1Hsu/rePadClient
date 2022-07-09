.class final Lcom/pgyersdk/crash/b;
.super Ljava/lang/Thread;


# instance fields
.field final synthetic a:Lcom/pgyersdk/crash/a;

.field private final synthetic b:Ljava/lang/Throwable;


# direct methods
.method constructor <init>(Lcom/pgyersdk/crash/a;Ljava/lang/Throwable;)V
    .locals 0

    iput-object p1, p0, Lcom/pgyersdk/crash/b;->a:Lcom/pgyersdk/crash/a;

    iput-object p2, p0, Lcom/pgyersdk/crash/b;->b:Ljava/lang/Throwable;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/pgyersdk/crash/b;->a:Lcom/pgyersdk/crash/a;

    iget-object v1, p0, Lcom/pgyersdk/crash/b;->b:Ljava/lang/Throwable;

    invoke-virtual {v0, v1}, Lcom/pgyersdk/crash/a;->a(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method
