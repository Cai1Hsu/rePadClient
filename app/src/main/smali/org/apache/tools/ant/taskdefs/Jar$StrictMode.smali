.class public Lorg/apache/tools/ant/taskdefs/Jar$StrictMode;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "Jar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Jar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "StrictMode"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1207
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 1208
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 1213
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 1214
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Jar$StrictMode;->setValue(Ljava/lang/String;)V

    .line 1215
    return-void
.end method


# virtual methods
.method public getLogLevel()I
    .locals 2

    .prologue
    .line 1227
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar$StrictMode;->getValue()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "ignore"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getValues()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 1221
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "fail"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "warn"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "ignore"

    aput-object v2, v0, v1

    return-object v0
.end method
