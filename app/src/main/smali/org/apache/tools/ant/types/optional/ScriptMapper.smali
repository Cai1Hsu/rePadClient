.class public Lorg/apache/tools/ant/types/optional/ScriptMapper;
.super Lorg/apache/tools/ant/types/optional/AbstractScriptComponent;
.source "ScriptMapper.java"

# interfaces
.implements Lorg/apache/tools/ant/util/FileNameMapper;


# static fields
.field static final EMPTY_STRING_ARRAY:[Ljava/lang/String;


# instance fields
.field private files:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lorg/apache/tools/ant/types/optional/ScriptMapper;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/apache/tools/ant/types/optional/AbstractScriptComponent;-><init>()V

    return-void
.end method


# virtual methods
.method public addMappedName(Ljava/lang/String;)V
    .locals 1
    .param p1, "mapping"    # Ljava/lang/String;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptMapper;->files:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    return-void
.end method

.method public clear()V
    .locals 2

    .prologue
    .line 57
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptMapper;->files:Ljava/util/ArrayList;

    .line 58
    return-void
.end method

.method public mapFileName(Ljava/lang/String;)[Ljava/lang/String;
    .locals 2
    .param p1, "sourceFileName"    # Ljava/lang/String;

    .prologue
    .line 83
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/optional/ScriptMapper;->initScriptRunner()V

    .line 84
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/optional/ScriptMapper;->getRunner()Lorg/apache/tools/ant/util/ScriptRunnerBase;

    move-result-object v0

    const-string/jumbo v1, "source"

    invoke-virtual {v0, v1, p1}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->addBean(Ljava/lang/String;Ljava/lang/Object;)V

    .line 85
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/optional/ScriptMapper;->clear()V

    .line 86
    const-string/jumbo v0, "ant_mapper"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/optional/ScriptMapper;->executeScript(Ljava/lang/String;)V

    .line 87
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptMapper;->files:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 88
    const/4 v0, 0x0

    .line 90
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptMapper;->files:Ljava/util/ArrayList;

    sget-object v1, Lorg/apache/tools/ant/types/optional/ScriptMapper;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    goto :goto_0
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 42
    return-void
.end method

.method public setTo(Ljava/lang/String;)V
    .locals 0
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 51
    return-void
.end method
