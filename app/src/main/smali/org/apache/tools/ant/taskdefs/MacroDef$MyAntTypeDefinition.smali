.class Lorg/apache/tools/ant/taskdefs/MacroDef$MyAntTypeDefinition;
.super Lorg/apache/tools/ant/AntTypeDefinition;
.source "MacroDef.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/MacroDef;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MyAntTypeDefinition"
.end annotation


# instance fields
.field private macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/MacroDef;)V
    .locals 0
    .param p1, "macroDef"    # Lorg/apache/tools/ant/taskdefs/MacroDef;

    .prologue
    .line 794
    invoke-direct {p0}, Lorg/apache/tools/ant/AntTypeDefinition;-><init>()V

    .line 795
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$MyAntTypeDefinition;->macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;

    .line 796
    return-void
.end method


# virtual methods
.method public create(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;
    .locals 3
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 805
    invoke-super {p0, p1}, Lorg/apache/tools/ant/AntTypeDefinition;->create(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v0

    .line 806
    .local v0, "o":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 807
    const/4 v0, 0x0

    .line 810
    .end local v0    # "o":Ljava/lang/Object;
    :goto_0
    return-object v0

    .restart local v0    # "o":Ljava/lang/Object;
    :cond_0
    move-object v1, v0

    .line 809
    check-cast v1, Lorg/apache/tools/ant/taskdefs/MacroInstance;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$MyAntTypeDefinition;->macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->setMacroDef(Lorg/apache/tools/ant/taskdefs/MacroDef;)V

    goto :goto_0
.end method

.method public sameDefinition(Lorg/apache/tools/ant/AntTypeDefinition;Lorg/apache/tools/ant/Project;)Z
    .locals 3
    .param p1, "other"    # Lorg/apache/tools/ant/AntTypeDefinition;
    .param p2, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 821
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/AntTypeDefinition;->sameDefinition(Lorg/apache/tools/ant/AntTypeDefinition;Lorg/apache/tools/ant/Project;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 822
    const/4 v1, 0x0

    .line 825
    :goto_0
    return v1

    :cond_0
    move-object v0, p1

    .line 824
    check-cast v0, Lorg/apache/tools/ant/taskdefs/MacroDef$MyAntTypeDefinition;

    .line 825
    .local v0, "otherDef":Lorg/apache/tools/ant/taskdefs/MacroDef$MyAntTypeDefinition;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$MyAntTypeDefinition;->macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/MacroDef$MyAntTypeDefinition;->macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/MacroDef;->sameDefinition(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public similarDefinition(Lorg/apache/tools/ant/AntTypeDefinition;Lorg/apache/tools/ant/Project;)Z
    .locals 3
    .param p1, "other"    # Lorg/apache/tools/ant/AntTypeDefinition;
    .param p2, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 837
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/AntTypeDefinition;->similarDefinition(Lorg/apache/tools/ant/AntTypeDefinition;Lorg/apache/tools/ant/Project;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 838
    const/4 v1, 0x0

    .line 841
    :goto_0
    return v1

    :cond_0
    move-object v0, p1

    .line 840
    check-cast v0, Lorg/apache/tools/ant/taskdefs/MacroDef$MyAntTypeDefinition;

    .line 841
    .local v0, "otherDef":Lorg/apache/tools/ant/taskdefs/MacroDef$MyAntTypeDefinition;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$MyAntTypeDefinition;->macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/MacroDef$MyAntTypeDefinition;->macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/MacroDef;->similar(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method
