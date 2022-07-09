.class public Lorg/apache/tools/ant/taskdefs/Definer$OnError;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "Definer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Definer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OnError"
.end annotation


# static fields
.field public static final FAIL:I = 0x0

.field public static final FAIL_ALL:I = 0x3

.field public static final IGNORE:I = 0x2

.field public static final POLICY_FAIL:Ljava/lang/String; = "fail"

.field public static final POLICY_FAILALL:Ljava/lang/String; = "failall"

.field public static final POLICY_IGNORE:Ljava/lang/String; = "ignore"

.field public static final POLICY_REPORT:Ljava/lang/String; = "report"

.field public static final REPORT:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 110
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 111
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 117
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 118
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Definer$OnError;->setValue(Ljava/lang/String;)V

    .line 119
    return-void
.end method


# virtual methods
.method public getValues()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 126
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "fail"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "report"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "ignore"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "failall"

    aput-object v2, v0, v1

    return-object v0
.end method
