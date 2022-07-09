.class public Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "FixCrLfFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/filters/FixCrLfFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CrLf"
.end annotation


# static fields
.field private static final ASIS:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

.field private static final CR:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

.field private static final CRLF:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

.field private static final DOS:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

.field private static final LF:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

.field private static final MAC:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

.field private static final UNIX:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 937
    const-string/jumbo v0, "asis"

    invoke-static {v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->newInstance(Ljava/lang/String;)Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->ASIS:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    .line 939
    const-string/jumbo v0, "cr"

    invoke-static {v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->newInstance(Ljava/lang/String;)Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->CR:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    .line 941
    const-string/jumbo v0, "crlf"

    invoke-static {v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->newInstance(Ljava/lang/String;)Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->CRLF:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    .line 943
    const-string/jumbo v0, "dos"

    invoke-static {v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->newInstance(Ljava/lang/String;)Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->DOS:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    .line 945
    const-string/jumbo v0, "lf"

    invoke-static {v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->newInstance(Ljava/lang/String;)Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->LF:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    .line 947
    const-string/jumbo v0, "mac"

    invoke-static {v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->newInstance(Ljava/lang/String;)Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->MAC:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    .line 949
    const-string/jumbo v0, "unix"

    invoke-static {v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->newInstance(Ljava/lang/String;)Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->UNIX:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 936
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    return-void
.end method

.method static access$200()Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;
    .locals 1

    .prologue
    .line 936
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->MAC:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    return-object v0
.end method

.method static access$300()Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;
    .locals 1

    .prologue
    .line 936
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->DOS:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    return-object v0
.end method

.method static access$400()Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;
    .locals 1

    .prologue
    .line 936
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->UNIX:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    return-object v0
.end method

.method static access$600(Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;)Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    .prologue
    .line 936
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->newInstance()Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    move-result-object v0

    return-object v0
.end method

.method static access$700()Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;
    .locals 1

    .prologue
    .line 936
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->ASIS:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    return-object v0
.end method

.method static access$800()Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;
    .locals 1

    .prologue
    .line 936
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->CR:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    return-object v0
.end method

.method static access$900()Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;
    .locals 1

    .prologue
    .line 936
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->CRLF:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    return-object v0
.end method

.method private newInstance()Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;
    .locals 1

    .prologue
    .line 994
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->newInstance(Ljava/lang/String;)Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance(Ljava/lang/String;)Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;
    .locals 1
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 1003
    new-instance v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    invoke-direct {v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;-><init>()V

    .line 1004
    .local v0, "c":Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;
    invoke-virtual {v0, p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->setValue(Ljava/lang/String;)V

    .line 1005
    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 965
    instance-of v0, p1, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->getIndex()I

    move-result v0

    check-cast p1, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    .end local p1    # "other":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->getIndex()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getValues()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 956
    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "asis"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "cr"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "lf"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "crlf"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "mac"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "unix"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "dos"

    aput-object v2, v0, v1

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 973
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->getIndex()I

    move-result v0

    return v0
.end method

.method resolve()Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;
    .locals 3

    .prologue
    .line 977
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->ASIS:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 978
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->ASIS:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    .line 987
    :goto_0
    return-object v0

    .line 980
    :cond_0
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->CR:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->MAC:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 981
    :cond_1
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->CR:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    goto :goto_0

    .line 983
    :cond_2
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->CRLF:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->DOS:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 984
    :cond_3
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->CRLF:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    goto :goto_0

    .line 986
    :cond_4
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->LF:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->UNIX:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 987
    :cond_5
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->LF:Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    goto :goto_0

    .line 989
    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "No replacement for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
