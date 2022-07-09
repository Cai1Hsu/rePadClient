.class public Lorg/apache/tools/ant/types/resources/StringResource;
.super Lorg/apache/tools/ant/types/Resource;
.source "StringResource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/resources/StringResource$StringResourceFilterOutputStream;
    }
.end annotation


# static fields
.field private static final STRING_MAGIC:I


# instance fields
.field private encoding:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    const-string/jumbo v0, "StringResource"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/types/Resource;->getMagicNumber([B)I

    move-result v0

    sput v0, Lorg/apache/tools/ant/types/resources/StringResource;->STRING_MAGIC:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Resource;-><init>()V

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/StringResource;->encoding:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 55
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/apache/tools/ant/types/resources/StringResource;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 64
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Resource;-><init>()V

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/StringResource;->encoding:Ljava/lang/String;

    .line 65
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/StringResource;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 66
    if-nez p1, :cond_0

    .end local p2    # "value":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/types/resources/StringResource;->setValue(Ljava/lang/String;)V

    .line 67
    return-void

    .line 66
    .restart local p2    # "value":Ljava/lang/String;
    :cond_0
    invoke-virtual {p1, p2}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0
.end method

.method static access$000(Lorg/apache/tools/ant/types/resources/StringResource;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/resources/StringResource;

    .prologue
    .line 36
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/StringResource;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method static access$100(Lorg/apache/tools/ant/types/resources/StringResource;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/types/resources/StringResource;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/resources/StringResource;->setValueFromOutputStream(Ljava/lang/String;)V

    return-void
.end method

.method private setValueFromOutputStream(Ljava/lang/String;)V
    .locals 2
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 236
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 237
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 241
    .local v0, "value":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/StringResource;->setValue(Ljava/lang/String;)V

    .line 242
    return-void

    .line 239
    .end local v0    # "value":Ljava/lang/String;
    :cond_0
    move-object v0, p1

    .restart local v0    # "value":Ljava/lang/String;
    goto :goto_0
.end method


# virtual methods
.method public addText(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 120
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->checkChildrenAllowed()V

    .line 121
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/StringResource;->setValue(Ljava/lang/String;)V

    .line 122
    return-void
.end method

.method protected declared-synchronized getContent()Ljava/lang/String;
    .locals 1

    .prologue
    .line 226
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->getValue()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 138
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/StringResource;->encoding:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getInputStream()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 181
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 182
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 188
    :goto_0
    monitor-exit p0

    return-object v1

    .line 184
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->getContent()Ljava/lang/String;

    move-result-object v0

    .line 185
    .local v0, "content":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 186
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "unset string value"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 181
    .end local v0    # "content":Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 188
    .restart local v0    # "content":Ljava/lang/String;
    :cond_1
    :try_start_2
    new-instance v1, Ljava/io/ByteArrayInputStream;

    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/StringResource;->encoding:Ljava/lang/String;

    if-nez v2, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    :goto_1
    invoke-direct {v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    goto :goto_0

    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/StringResource;->encoding:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v2

    goto :goto_1
.end method

.method public declared-synchronized getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 201
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 202
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getOutputStream()Ljava/io/OutputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 207
    :goto_0
    monitor-exit p0

    return-object v0

    .line 204
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->getValue()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 205
    new-instance v0, Lorg/apache/tools/ant/types/resources/ImmutableResourceException;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/ImmutableResourceException;-><init>()V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 201
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 207
    :cond_1
    :try_start_2
    new-instance v0, Lorg/apache/tools/ant/types/resources/StringResource$StringResourceFilterOutputStream;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/types/resources/StringResource$StringResourceFilterOutputStream;-><init>(Lorg/apache/tools/ant/types/resources/StringResource;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized getSize()J
    .locals 2

    .prologue
    .line 147
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getSize()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v0

    :goto_0
    monitor-exit p0

    return-wide v0

    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->getContent()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    int-to-long v0, v0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 101
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->getName()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized hashCode()I
    .locals 2

    .prologue
    .line 156
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 157
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 159
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    invoke-super {p0}, Lorg/apache/tools/ant/types/Resource;->hashCode()I

    move-result v0

    sget v1, Lorg/apache/tools/ant/types/resources/StringResource;->STRING_MAGIC:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    mul-int/2addr v0, v1

    goto :goto_0

    .line 156
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isExists()Z
    .locals 1

    .prologue
    .line 110
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->getValue()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public declared-synchronized setEncoding(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 129
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->checkAttributesAllowed()V

    .line 130
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/StringResource;->encoding:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 131
    monitor-exit p0

    return-void

    .line 129
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setName(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 74
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 75
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Lorg/apache/tools/ant/types/resources/ImmutableResourceException;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/resources/ImmutableResourceException;-><init>()V

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 77
    :cond_0
    :try_start_1
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/Resource;->setName(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 78
    monitor-exit p0

    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 215
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/StringResource;->encoding:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 216
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 218
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/Resource;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 219
    return-void
.end method

.method public declared-synchronized setValue(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 85
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/StringResource;->setName(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    monitor-exit p0

    return-void

    .line 85
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 169
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/StringResource;->getContent()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
