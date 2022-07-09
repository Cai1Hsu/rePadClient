.class public Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry$Type;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "PropertyFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Type"
.end annotation


# static fields
.field public static final DATE_TYPE:I = 0x1

.field public static final INTEGER_TYPE:I = 0x0

.field public static final STRING_TYPE:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 624
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    return-void
.end method

.method public static toType(Ljava/lang/String;)I
    .locals 1
    .param p0, "type"    # Ljava/lang/String;

    .prologue
    .line 645
    const-string/jumbo v0, "int"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 646
    const/4 v0, 0x0

    .line 650
    :goto_0
    return v0

    .line 647
    :cond_0
    const-string/jumbo v0, "date"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 648
    const/4 v0, 0x1

    goto :goto_0

    .line 650
    :cond_1
    const/4 v0, 0x2

    goto :goto_0
.end method


# virtual methods
.method public getValues()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 636
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "int"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "date"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "string"

    aput-object v2, v0, v1

    return-object v0
.end method
