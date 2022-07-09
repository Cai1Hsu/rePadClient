.class public Lorg/apache/tools/ant/types/FilterSet$OnMissing;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "FilterSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/FilterSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OnMissing"
.end annotation


# static fields
.field public static final FAIL:Lorg/apache/tools/ant/types/FilterSet$OnMissing;

.field private static final FAIL_INDEX:I = 0x0

.field public static final IGNORE:Lorg/apache/tools/ant/types/FilterSet$OnMissing;

.field private static final IGNORE_INDEX:I = 0x2

.field private static final VALUES:[Ljava/lang/String;

.field public static final WARN:Lorg/apache/tools/ant/types/FilterSet$OnMissing;

.field private static final WARN_INDEX:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 135
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

    sput-object v0, Lorg/apache/tools/ant/types/FilterSet$OnMissing;->VALUES:[Ljava/lang/String;

    .line 139
    new-instance v0, Lorg/apache/tools/ant/types/FilterSet$OnMissing;

    const-string/jumbo v1, "fail"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/FilterSet$OnMissing;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/types/FilterSet$OnMissing;->FAIL:Lorg/apache/tools/ant/types/FilterSet$OnMissing;

    .line 141
    new-instance v0, Lorg/apache/tools/ant/types/FilterSet$OnMissing;

    const-string/jumbo v1, "warn"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/FilterSet$OnMissing;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/types/FilterSet$OnMissing;->WARN:Lorg/apache/tools/ant/types/FilterSet$OnMissing;

    .line 143
    new-instance v0, Lorg/apache/tools/ant/types/FilterSet$OnMissing;

    const-string/jumbo v1, "ignore"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/FilterSet$OnMissing;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/types/FilterSet$OnMissing;->IGNORE:Lorg/apache/tools/ant/types/FilterSet$OnMissing;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 152
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 153
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 159
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 160
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/FilterSet$OnMissing;->setValue(Ljava/lang/String;)V

    .line 161
    return-void
.end method


# virtual methods
.method public getValues()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 166
    sget-object v0, Lorg/apache/tools/ant/types/FilterSet$OnMissing;->VALUES:[Ljava/lang/String;

    return-object v0
.end method
