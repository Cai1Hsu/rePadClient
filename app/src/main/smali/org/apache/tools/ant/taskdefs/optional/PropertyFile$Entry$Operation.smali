.class public Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry$Operation;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "PropertyFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Operation"
.end annotation


# static fields
.field public static final DECREMENT_OPER:I = 0x1

.field public static final DELETE_OPER:I = 0x3

.field public static final EQUALS_OPER:I = 0x2

.field public static final INCREMENT_OPER:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 587
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    return-void
.end method

.method public static toOperation(Ljava/lang/String;)I
    .locals 1
    .param p0, "oper"    # Ljava/lang/String;

    .prologue
    .line 610
    const-string/jumbo v0, "+"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 611
    const/4 v0, 0x0

    .line 617
    :goto_0
    return v0

    .line 612
    :cond_0
    const-string/jumbo v0, "-"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 613
    const/4 v0, 0x1

    goto :goto_0

    .line 614
    :cond_1
    const-string/jumbo v0, "del"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 615
    const/4 v0, 0x3

    goto :goto_0

    .line 617
    :cond_2
    const/4 v0, 0x2

    goto :goto_0
.end method


# virtual methods
.method public getValues()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 601
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "+"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "-"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "="

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "del"

    aput-object v2, v0, v1

    return-object v0
.end method
