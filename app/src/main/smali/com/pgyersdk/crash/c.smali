.class final Lcom/pgyersdk/crash/c;
.super Ljava/lang/Thread;


# instance fields
.field private final synthetic a:Ljava/lang/ref/WeakReference;

.field private final synthetic b:Lcom/pgyersdk/crash/g;


# direct methods
.method constructor <init>(Ljava/lang/ref/WeakReference;)V
    .locals 1

    iput-object p1, p0, Lcom/pgyersdk/crash/c;->a:Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pgyersdk/crash/c;->b:Lcom/pgyersdk/crash/g;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/pgyersdk/crash/c;->a:Ljava/lang/ref/WeakReference;

    iget-object v1, p0, Lcom/pgyersdk/crash/c;->b:Lcom/pgyersdk/crash/g;

    invoke-static {v0, v1}, Lcom/pgyersdk/crash/PgyCrashManager;->a(Ljava/lang/ref/WeakReference;Lcom/pgyersdk/crash/g;)V

    invoke-static {}, Lcom/pgyersdk/crash/PgyCrashManager;->a()V

    return-void
.end method
