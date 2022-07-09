.class public final Lcom/pgyersdk/feedback/l;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/hardware/SensorListener;


# static fields
.field private static a:Ljava/lang/String;


# instance fields
.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:Landroid/hardware/SensorManager;

.field private h:F

.field private i:F

.field private j:F

.field private k:J

.field private l:Lcom/pgyersdk/feedback/m;

.field private m:Landroid/content/Context;

.field private n:I

.field private o:J

.field private p:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string/jumbo v0, "ShakeListener"

    sput-object v0, Lcom/pgyersdk/feedback/l;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/high16 v1, -0x40800000    # -1.0f

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x3b6

    iput v0, p0, Lcom/pgyersdk/feedback/l;->b:I

    const/16 v0, 0x6e

    iput v0, p0, Lcom/pgyersdk/feedback/l;->c:I

    const/16 v0, 0x1f4

    iput v0, p0, Lcom/pgyersdk/feedback/l;->d:I

    const/16 v0, 0x3e8

    iput v0, p0, Lcom/pgyersdk/feedback/l;->e:I

    const/4 v0, 0x4

    iput v0, p0, Lcom/pgyersdk/feedback/l;->f:I

    iput v1, p0, Lcom/pgyersdk/feedback/l;->h:F

    iput v1, p0, Lcom/pgyersdk/feedback/l;->i:F

    iput v1, p0, Lcom/pgyersdk/feedback/l;->j:F

    const/4 v0, 0x0

    iput v0, p0, Lcom/pgyersdk/feedback/l;->n:I

    iput-object p1, p0, Lcom/pgyersdk/feedback/l;->m:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/pgyersdk/feedback/l;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    const/4 v2, 0x2

    iget-object v0, p0, Lcom/pgyersdk/feedback/l;->m:Landroid/content/Context;

    const-string/jumbo v1, "sensor"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lcom/pgyersdk/feedback/l;->g:Landroid/hardware/SensorManager;

    iget-object v0, p0, Lcom/pgyersdk/feedback/l;->g:Landroid/hardware/SensorManager;

    if-nez v0, :cond_0

    sget-object v0, Lcom/pgyersdk/feedback/l;->a:Ljava/lang/String;

    const-string/jumbo v1, "\u4e0d\u652f\u6301\u6447\u4e00\u6447"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Lcom/pgyersdk/feedback/l;->g:Landroid/hardware/SensorManager;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v2, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorListener;II)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/pgyersdk/feedback/l;->g:Landroid/hardware/SensorManager;

    invoke-virtual {v0, p0, v2}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorListener;I)V

    sget-object v0, Lcom/pgyersdk/feedback/l;->a:Ljava/lang/String;

    const-string/jumbo v1, "\u4e0d\u652f\u6301\u6447\u4e00\u6447"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    return-void
.end method

.method public final a(Lcom/pgyersdk/feedback/m;)V
    .locals 0

    iput-object p1, p0, Lcom/pgyersdk/feedback/l;->l:Lcom/pgyersdk/feedback/m;

    return-void
.end method

.method public final b()V
    .locals 2

    iget-object v0, p0, Lcom/pgyersdk/feedback/l;->g:Landroid/hardware/SensorManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pgyersdk/feedback/l;->g:Landroid/hardware/SensorManager;

    const/4 v1, 0x2

    invoke-virtual {v0, p0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorListener;I)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pgyersdk/feedback/l;->g:Landroid/hardware/SensorManager;

    :cond_0
    return-void
.end method

.method public final onAccuracyChanged(II)V
    .locals 0

    return-void
.end method

.method public final onSensorChanged(I[F)V
    .locals 9
    .param p1, "sensor"    # I
    .param p2, "values"    # [F

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x2

    const/4 v6, 0x0

    if-eq p1, v7, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/pgyersdk/feedback/l;->p:J

    sub-long v2, v0, v2

    iget v4, p0, Lcom/pgyersdk/feedback/l;->d:I

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_2

    iput v6, p0, Lcom/pgyersdk/feedback/l;->n:I

    :cond_2
    iget-wide v2, p0, Lcom/pgyersdk/feedback/l;->k:J

    sub-long v2, v0, v2

    iget v4, p0, Lcom/pgyersdk/feedback/l;->c:I

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    iget-wide v2, p0, Lcom/pgyersdk/feedback/l;->k:J

    sub-long v2, v0, v2

    aget v4, p2, v6

    aget v5, p2, v8

    add-float/2addr v4, v5

    aget v5, p2, v7

    add-float/2addr v4, v5

    iget v5, p0, Lcom/pgyersdk/feedback/l;->h:F

    sub-float/2addr v4, v5

    iget v5, p0, Lcom/pgyersdk/feedback/l;->i:F

    sub-float/2addr v4, v5

    iget v5, p0, Lcom/pgyersdk/feedback/l;->j:F

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    long-to-float v2, v2

    div-float v2, v4, v2

    const v3, 0x461c4000    # 10000.0f

    mul-float/2addr v2, v3

    iget v3, p0, Lcom/pgyersdk/feedback/l;->b:I

    int-to-float v3, v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_4

    iget v2, p0, Lcom/pgyersdk/feedback/l;->n:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/pgyersdk/feedback/l;->n:I

    iget v3, p0, Lcom/pgyersdk/feedback/l;->f:I

    if-lt v2, v3, :cond_3

    iget-wide v2, p0, Lcom/pgyersdk/feedback/l;->o:J

    sub-long v2, v0, v2

    iget v4, p0, Lcom/pgyersdk/feedback/l;->e:I

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_3

    iput-wide v0, p0, Lcom/pgyersdk/feedback/l;->o:J

    iput v6, p0, Lcom/pgyersdk/feedback/l;->n:I

    iget-object v2, p0, Lcom/pgyersdk/feedback/l;->l:Lcom/pgyersdk/feedback/m;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/pgyersdk/feedback/l;->l:Lcom/pgyersdk/feedback/m;

    invoke-interface {v2}, Lcom/pgyersdk/feedback/m;->a()V

    :cond_3
    iput-wide v0, p0, Lcom/pgyersdk/feedback/l;->p:J

    :cond_4
    iput-wide v0, p0, Lcom/pgyersdk/feedback/l;->k:J

    aget v0, p2, v6

    iput v0, p0, Lcom/pgyersdk/feedback/l;->h:F

    aget v0, p2, v8

    iput v0, p0, Lcom/pgyersdk/feedback/l;->i:F

    aget v0, p2, v7

    iput v0, p0, Lcom/pgyersdk/feedback/l;->j:F

    goto :goto_0
.end method
