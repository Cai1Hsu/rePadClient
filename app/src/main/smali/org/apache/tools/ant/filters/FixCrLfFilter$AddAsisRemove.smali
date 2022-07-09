.class public Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "FixCrLfFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/filters/FixCrLfFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AddAsisRemove"
.end annotation


# static fields
.field private static final ADD:Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

.field private static final ASIS:Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

.field private static final REMOVE:Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 874
    const-string/jumbo v0, "asis"

    invoke-static {v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->newInstance(Ljava/lang/String;)Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->ASIS:Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    .line 876
    const-string/jumbo v0, "add"

    invoke-static {v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->newInstance(Ljava/lang/String;)Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->ADD:Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    .line 878
    const-string/jumbo v0, "remove"

    invoke-static {v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->newInstance(Ljava/lang/String;)Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->REMOVE:Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 873
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    return-void
.end method

.method static access$000()Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;
    .locals 1

    .prologue
    .line 873
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->ASIS:Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    return-object v0
.end method

.method static access$100()Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;
    .locals 1

    .prologue
    .line 873
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->REMOVE:Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    return-object v0
.end method

.method static access$1000()Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;
    .locals 1

    .prologue
    .line 873
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->ADD:Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    return-object v0
.end method

.method static access$500(Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;)Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    .prologue
    .line 873
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->newInstance()Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    move-result-object v0

    return-object v0
.end method

.method private newInstance()Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;
    .locals 1

    .prologue
    .line 918
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->newInstance(Ljava/lang/String;)Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance(Ljava/lang/String;)Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;
    .locals 1
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 927
    new-instance v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    invoke-direct {v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;-><init>()V

    .line 928
    .local v0, "a":Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;
    invoke-virtual {v0, p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->setValue(Ljava/lang/String;)V

    .line 929
    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 891
    instance-of v0, p1, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->getIndex()I

    move-result v0

    check-cast p1, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    .end local p1    # "other":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->getIndex()I

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
    .line 882
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "add"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "asis"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "remove"

    aput-object v2, v0, v1

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 900
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->getIndex()I

    move-result v0

    return v0
.end method

.method resolve()Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 904
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->ASIS:Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 905
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->ASIS:Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    .line 911
    :goto_0
    return-object v0

    .line 907
    :cond_0
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->ADD:Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 908
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->ADD:Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    goto :goto_0

    .line 910
    :cond_1
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->REMOVE:Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 911
    sget-object v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->REMOVE:Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    goto :goto_0

    .line 913
    :cond_2
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
