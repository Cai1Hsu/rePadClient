.class public Lorg/apache/tools/ant/types/PropertySet$PropertyRef;
.super Ljava/lang/Object;
.source "PropertySet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/PropertySet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PropertyRef"
.end annotation


# instance fields
.field private builtin:Ljava/lang/String;

.field private count:I

.field private name:Ljava/lang/String;

.field private prefix:Ljava/lang/String;

.field private regex:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/PropertySet$PropertyRef;

    .prologue
    .line 58
    iget-object v0, p0, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->name:Ljava/lang/String;

    return-object v0
.end method

.method static access$100(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/PropertySet$PropertyRef;

    .prologue
    .line 58
    iget-object v0, p0, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->prefix:Ljava/lang/String;

    return-object v0
.end method

.method static access$200(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/PropertySet$PropertyRef;

    .prologue
    .line 58
    iget-object v0, p0, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->regex:Ljava/lang/String;

    return-object v0
.end method

.method static access$300(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/PropertySet$PropertyRef;

    .prologue
    .line 58
    iget-object v0, p0, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->builtin:Ljava/lang/String;

    return-object v0
.end method

.method private assertValid(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "attr"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 104
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v0, v1, :cond_1

    .line 105
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Invalid attribute: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :cond_1
    iget v0, p0, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->count:I

    if-eq v0, v1, :cond_2

    .line 109
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Attributes name, regex, and prefix are mutually exclusive"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_2
    return-void
.end method


# virtual methods
.method public setBuiltin(Lorg/apache/tools/ant/types/PropertySet$BuiltinPropertySetName;)V
    .locals 2
    .param p1, "b"    # Lorg/apache/tools/ant/types/PropertySet$BuiltinPropertySetName;

    .prologue
    .line 98
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/PropertySet$BuiltinPropertySetName;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 99
    .local v0, "pBuiltIn":Ljava/lang/String;
    const-string/jumbo v1, "builtin"

    invoke-direct {p0, v1, v0}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->assertValid(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    iput-object v0, p0, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->builtin:Ljava/lang/String;

    .line 101
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 71
    const-string/jumbo v0, "name"

    invoke-direct {p0, v0, p1}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->assertValid(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    iput-object p1, p0, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->name:Ljava/lang/String;

    .line 73
    return-void
.end method

.method public setPrefix(Ljava/lang/String;)V
    .locals 1
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 89
    const-string/jumbo v0, "prefix"

    invoke-direct {p0, v0, p1}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->assertValid(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    iput-object p1, p0, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->prefix:Ljava/lang/String;

    .line 91
    return-void
.end method

.method public setRegex(Ljava/lang/String;)V
    .locals 1
    .param p1, "regex"    # Ljava/lang/String;

    .prologue
    .line 80
    const-string/jumbo v0, "regex"

    invoke-direct {p0, v0, p1}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->assertValid(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    iput-object p1, p0, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->regex:Ljava/lang/String;

    .line 82
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 119
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, ", regex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->regex:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, ", prefix="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->prefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, ", builtin="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->builtin:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
