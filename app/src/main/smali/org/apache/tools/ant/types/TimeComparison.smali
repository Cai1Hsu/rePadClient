.class public Lorg/apache/tools/ant/types/TimeComparison;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "TimeComparison.java"


# static fields
.field public static final AFTER:Lorg/apache/tools/ant/types/TimeComparison;

.field public static final BEFORE:Lorg/apache/tools/ant/types/TimeComparison;

.field public static final EQUAL:Lorg/apache/tools/ant/types/TimeComparison;

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final VALUES:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 29
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "before"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "after"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "equal"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/types/TimeComparison;->VALUES:[Ljava/lang/String;

    .line 32
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/TimeComparison;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    .line 35
    new-instance v0, Lorg/apache/tools/ant/types/TimeComparison;

    const-string/jumbo v1, "before"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/TimeComparison;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/types/TimeComparison;->BEFORE:Lorg/apache/tools/ant/types/TimeComparison;

    .line 38
    new-instance v0, Lorg/apache/tools/ant/types/TimeComparison;

    const-string/jumbo v1, "after"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/TimeComparison;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/types/TimeComparison;->AFTER:Lorg/apache/tools/ant/types/TimeComparison;

    .line 41
    new-instance v0, Lorg/apache/tools/ant/types/TimeComparison;

    const-string/jumbo v1, "equal"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/TimeComparison;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/types/TimeComparison;->EQUAL:Lorg/apache/tools/ant/types/TimeComparison;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 47
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 54
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/TimeComparison;->setValue(Ljava/lang/String;)V

    .line 55
    return-void
.end method

.method public static compare(JJ)I
    .locals 6
    .param p0, "t1"    # J
    .param p2, "t2"    # J

    .prologue
    .line 104
    sget-object v0, Lorg/apache/tools/ant/types/TimeComparison;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/FileUtils;->getFileTimestampGranularity()J

    move-result-wide v4

    move-wide v0, p0

    move-wide v2, p2

    invoke-static/range {v0 .. v5}, Lorg/apache/tools/ant/types/TimeComparison;->compare(JJJ)I

    move-result v0

    return v0
.end method

.method public static compare(JJJ)I
    .locals 6
    .param p0, "t1"    # J
    .param p2, "t2"    # J
    .param p4, "g"    # J

    .prologue
    .line 116
    sub-long v2, p0, p2

    .line 117
    .local v2, "diff":J
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    .line 118
    .local v0, "abs":J
    invoke-static {p4, p5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    cmp-long v4, v0, v4

    if-lez v4, :cond_0

    div-long v4, v2, v0

    long-to-int v4, v4

    :goto_0
    return v4

    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method


# virtual methods
.method public evaluate(JJ)Z
    .locals 9
    .param p1, "t1"    # J
    .param p3, "t2"    # J

    .prologue
    .line 72
    sget-object v0, Lorg/apache/tools/ant/types/TimeComparison;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/FileUtils;->getFileTimestampGranularity()J

    move-result-wide v6

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    invoke-virtual/range {v1 .. v7}, Lorg/apache/tools/ant/types/TimeComparison;->evaluate(JJJ)Z

    move-result v0

    return v0
.end method

.method public evaluate(JJJ)Z
    .locals 7
    .param p1, "t1"    # J
    .param p3, "t2"    # J
    .param p5, "g"    # J

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 83
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/TimeComparison;->getIndex()I

    move-result v0

    .line 84
    .local v0, "cmp":I
    const/4 v3, -0x1

    if-ne v0, v3, :cond_0

    .line 85
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "TimeComparison value not set."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 87
    :cond_0
    if-nez v0, :cond_3

    .line 88
    sub-long v4, p1, p5

    cmp-long v3, v4, p3

    if-gez v3, :cond_2

    .line 93
    :cond_1
    :goto_0
    return v1

    :cond_2
    move v1, v2

    .line 88
    goto :goto_0

    .line 90
    :cond_3
    if-ne v0, v1, :cond_4

    .line 91
    add-long v4, p1, p5

    cmp-long v3, v4, p3

    if-gtz v3, :cond_1

    move v1, v2

    goto :goto_0

    .line 93
    :cond_4
    sub-long v4, p1, p3

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    cmp-long v3, v4, p5

    if-lez v3, :cond_1

    move v1, v2

    goto :goto_0
.end method

.method public getValues()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    sget-object v0, Lorg/apache/tools/ant/types/TimeComparison;->VALUES:[Ljava/lang/String;

    return-object v0
.end method
