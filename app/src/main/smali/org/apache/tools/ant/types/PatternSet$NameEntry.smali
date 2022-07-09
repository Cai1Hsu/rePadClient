.class public Lorg/apache/tools/ant/types/PatternSet$NameEntry;
.super Ljava/lang/Object;
.source "PatternSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/PatternSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "NameEntry"
.end annotation


# instance fields
.field private ifCond:Ljava/lang/Object;

.field private name:Ljava/lang/String;

.field private final this$0:Lorg/apache/tools/ant/types/PatternSet;

.field private unlessCond:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/types/PatternSet;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/types/PatternSet;

    .prologue
    .line 51
    iput-object p1, p0, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->this$0:Lorg/apache/tools/ant/types/PatternSet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private valid(Lorg/apache/tools/ant/Project;)Z
    .locals 2
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 144
    invoke-static {p1}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    .line 145
    .local v0, "ph":Lorg/apache/tools/ant/PropertyHelper;
    iget-object v1, p0, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->ifCond:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/PropertyHelper;->testIfCondition(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->unlessCond:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/PropertyHelper;->testUnlessCondition(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public evalName(Lorg/apache/tools/ant/Project;)Ljava/lang/String;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 140
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->valid(Lorg/apache/tools/ant/Project;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->name:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->name:Ljava/lang/String;

    return-object v0
.end method

.method public setIf(Ljava/lang/Object;)V
    .locals 0
    .param p1, "cond"    # Ljava/lang/Object;

    .prologue
    .line 77
    iput-object p1, p0, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->ifCond:Ljava/lang/Object;

    .line 78
    return-void
.end method

.method public setIf(Ljava/lang/String;)V
    .locals 0
    .param p1, "cond"    # Ljava/lang/String;

    .prologue
    .line 91
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setIf(Ljava/lang/Object;)V

    .line 92
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 62
    iput-object p1, p0, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->name:Ljava/lang/String;

    .line 63
    return-void
.end method

.method public setUnless(Ljava/lang/Object;)V
    .locals 0
    .param p1, "cond"    # Ljava/lang/Object;

    .prologue
    .line 106
    iput-object p1, p0, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->unlessCond:Ljava/lang/Object;

    .line 107
    return-void
.end method

.method public setUnless(Ljava/lang/String;)V
    .locals 0
    .param p1, "cond"    # Ljava/lang/String;

    .prologue
    .line 120
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setUnless(Ljava/lang/Object;)V

    .line 121
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 153
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 154
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-object v2, p0, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->name:Ljava/lang/String;

    if-nez v2, :cond_3

    .line 155
    const-string/jumbo v2, "noname"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 159
    :goto_0
    iget-object v2, p0, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->ifCond:Ljava/lang/Object;

    if-nez v2, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->unlessCond:Ljava/lang/Object;

    if-eqz v2, :cond_2

    .line 160
    :cond_0
    const-string/jumbo v2, ":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 161
    const-string/jumbo v1, ""

    .line 163
    .local v1, "connector":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->ifCond:Ljava/lang/Object;

    if-eqz v2, :cond_1

    .line 164
    const-string/jumbo v2, "if->"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 165
    iget-object v2, p0, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->ifCond:Ljava/lang/Object;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 166
    const-string/jumbo v1, ";"

    .line 168
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->unlessCond:Ljava/lang/Object;

    if-eqz v2, :cond_2

    .line 169
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 170
    const-string/jumbo v2, "unless->"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 171
    iget-object v2, p0, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->unlessCond:Ljava/lang/Object;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 174
    .end local v1    # "connector":Ljava/lang/String;
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 157
    :cond_3
    iget-object v2, p0, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->name:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0
.end method
