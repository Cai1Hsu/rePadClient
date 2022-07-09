.class public Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;
.super Ljava/lang/Object;
.source "GenerateKey.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/GenerateKey;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DistinguishedName"
.end annotation


# instance fields
.field private params:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;->params:Ljava/util/Vector;

    return-void
.end method


# virtual methods
.method public createParam()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 88
    new-instance v0, Lorg/apache/tools/ant/taskdefs/GenerateKey$DnameParam;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/GenerateKey$DnameParam;-><init>()V

    .line 89
    .local v0, "param":Lorg/apache/tools/ant/taskdefs/GenerateKey$DnameParam;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;->params:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 91
    return-object v0
.end method

.method public encode(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x2c

    const/4 v4, -0x1

    .line 137
    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 139
    .local v0, "end":I
    if-ne v4, v0, :cond_0

    .line 156
    .end local p1    # "string":Ljava/lang/String;
    :goto_0
    return-object p1

    .line 143
    .restart local p1    # "string":Ljava/lang/String;
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 145
    .local v1, "sb":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .line 147
    .local v2, "start":I
    :goto_1
    if-eq v4, v0, :cond_1

    .line 148
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 149
    const-string/jumbo v3, "\\,"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 150
    add-int/lit8 v2, v0, 0x1

    .line 151
    invoke-virtual {p1, v5, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    goto :goto_1

    .line 154
    :cond_1
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 156
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method public getParams()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;->params:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 110
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;->params:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v4

    .line 111
    .local v4, "size":I
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 112
    .local v3, "sb":Ljava/lang/StringBuffer;
    const/4 v0, 0x1

    .line 114
    .local v0, "firstPass":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v4, :cond_1

    .line 115
    if-nez v0, :cond_0

    .line 116
    const-string/jumbo v5, " ,"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 118
    :cond_0
    const/4 v0, 0x0

    .line 120
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;->params:Ljava/util/Vector;

    invoke-virtual {v5, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/taskdefs/GenerateKey$DnameParam;

    .line 121
    .local v2, "param":Lorg/apache/tools/ant/taskdefs/GenerateKey$DnameParam;
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/GenerateKey$DnameParam;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 122
    const/16 v5, 0x3d

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 123
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/GenerateKey$DnameParam;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 114
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 126
    .end local v2    # "param":Lorg/apache/tools/ant/taskdefs/GenerateKey$DnameParam;
    :cond_1
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method
