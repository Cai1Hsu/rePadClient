.class public Lorg/apache/tools/ant/types/selectors/TypeSelector;
.super Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;
.source "TypeSelector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/selectors/TypeSelector$FileType;
    }
.end annotation


# static fields
.field public static final TYPE_KEY:Ljava/lang/String; = "type"


# instance fields
.field private type:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/TypeSelector;->type:Ljava/lang/String;

    .line 43
    return-void
.end method


# virtual methods
.method public isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
    .locals 2
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;

    .prologue
    .line 108
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/TypeSelector;->validate()V

    .line 110
    invoke-virtual {p3}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 111
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/TypeSelector;->type:Ljava/lang/String;

    const-string/jumbo v1, "dir"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 113
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/TypeSelector;->type:Ljava/lang/String;

    const-string/jumbo v1, "file"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public setParameters([Lorg/apache/tools/ant/types/Parameter;)V
    .locals 5
    .param p1, "parameters"    # [Lorg/apache/tools/ant/types/Parameter;

    .prologue
    .line 70
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;->setParameters([Lorg/apache/tools/ant/types/Parameter;)V

    .line 71
    if-eqz p1, :cond_1

    .line 72
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, p1

    if-ge v0, v3, :cond_1

    .line 73
    aget-object v3, p1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v1

    .line 74
    .local v1, "paramname":Ljava/lang/String;
    const-string/jumbo v3, "type"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 75
    new-instance v2, Lorg/apache/tools/ant/types/selectors/TypeSelector$FileType;

    invoke-direct {v2}, Lorg/apache/tools/ant/types/selectors/TypeSelector$FileType;-><init>()V

    .line 76
    .local v2, "t":Lorg/apache/tools/ant/types/selectors/TypeSelector$FileType;
    aget-object v3, p1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/selectors/TypeSelector$FileType;->setValue(Ljava/lang/String;)V

    .line 77
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/TypeSelector;->setType(Lorg/apache/tools/ant/types/selectors/TypeSelector$FileType;)V

    .line 72
    .end local v2    # "t":Lorg/apache/tools/ant/types/selectors/TypeSelector$FileType;
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 79
    :cond_0
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Invalid parameter "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/selectors/TypeSelector;->setError(Ljava/lang/String;)V

    goto :goto_1

    .line 83
    .end local v0    # "i":I
    .end local v1    # "paramname":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method public setType(Lorg/apache/tools/ant/types/selectors/TypeSelector$FileType;)V
    .locals 1
    .param p1, "fileTypes"    # Lorg/apache/tools/ant/types/selectors/TypeSelector$FileType;

    .prologue
    .line 60
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/selectors/TypeSelector$FileType;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/TypeSelector;->type:Ljava/lang/String;

    .line 61
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 49
    new-instance v0, Ljava/lang/StringBuffer;

    const-string/jumbo v1, "{typeselector type: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 50
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/TypeSelector;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 51
    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public verifySettings()V
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/TypeSelector;->type:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 92
    const-string/jumbo v0, "The type attribute is required"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/TypeSelector;->setError(Ljava/lang/String;)V

    .line 94
    :cond_0
    return-void
.end method
