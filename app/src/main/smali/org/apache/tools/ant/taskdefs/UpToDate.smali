.class public Lorg/apache/tools/ant/taskdefs/UpToDate;
.super Lorg/apache/tools/ant/Task;
.source "UpToDate.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# instance fields
.field protected mapperElement:Lorg/apache/tools/ant/types/Mapper;

.field private property:Ljava/lang/String;

.field private sourceFile:Ljava/io/File;

.field private sourceFileSets:Ljava/util/Vector;

.field private sourceResources:Lorg/apache/tools/ant/types/resources/Union;

.field private targetFile:Ljava/io/File;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 53
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceFileSets:Ljava/util/Vector;

    .line 54
    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceResources:Lorg/apache/tools/ant/types/resources/Union;

    .line 57
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    return-void
.end method

.method private getMapper()Lorg/apache/tools/ant/util/FileNameMapper;
    .locals 3

    .prologue
    .line 266
    const/4 v0, 0x0

    .line 267
    .local v0, "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-nez v2, :cond_0

    .line 268
    new-instance v1, Lorg/apache/tools/ant/util/MergingMapper;

    invoke-direct {v1}, Lorg/apache/tools/ant/util/MergingMapper;-><init>()V

    .line 269
    .local v1, "mm":Lorg/apache/tools/ant/util/MergingMapper;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->targetFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/util/MergingMapper;->setTo(Ljava/lang/String;)V

    .line 270
    move-object v0, v1

    .line 274
    .end local v1    # "mm":Lorg/apache/tools/ant/util/MergingMapper;
    :goto_0
    return-object v0

    .line 272
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v0

    goto :goto_0
.end method

.method private getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->value:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->value:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "true"

    goto :goto_0
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 1
    .param p1, "fileNameMapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 144
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/UpToDate;->createMapper()Lorg/apache/tools/ant/types/Mapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Mapper;->add(Lorg/apache/tools/ant/util/FileNameMapper;)V

    .line 145
    return-void
.end method

.method public addSrcfiles(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "fs"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 112
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceFileSets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 113
    return-void
.end method

.method public createMapper()Lorg/apache/tools/ant/types/Mapper;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 130
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_0

    .line 131
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot define more than one mapper"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/UpToDate;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 134
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/UpToDate;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Mapper;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    .line 135
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    return-object v0
.end method

.method public createSrcResources()Lorg/apache/tools/ant/types/resources/Union;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceResources:Lorg/apache/tools/ant/types/resources/Union;

    return-object v0
.end method

.method public eval()Z
    .locals 13

    .prologue
    const/4 v10, 0x0

    const/4 v12, 0x3

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 153
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceFileSets:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->size()I

    move-result v8

    if-nez v8, :cond_0

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceResources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v8}, Lorg/apache/tools/ant/types/resources/Union;->size()I

    move-result v8

    if-nez v8, :cond_0

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceFile:Ljava/io/File;

    if-nez v8, :cond_0

    .line 155
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v7, "At least one srcfile or a nested <srcfiles> or <srcresources> element must be set."

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 160
    :cond_0
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceFileSets:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->size()I

    move-result v8

    if-gtz v8, :cond_1

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceResources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v8}, Lorg/apache/tools/ant/types/resources/Union;->size()I

    move-result v8

    if-lez v8, :cond_2

    :cond_1
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceFile:Ljava/io/File;

    if-eqz v8, :cond_2

    .line 162
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v7, "Cannot specify both the srcfile attribute and a nested <srcfiles> or <srcresources> element."

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 167
    :cond_2
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->targetFile:Ljava/io/File;

    if-nez v8, :cond_3

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-nez v8, :cond_3

    .line 168
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v7, "The targetfile attribute or a nested mapper element must be set."

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 173
    :cond_3
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->targetFile:Ljava/io/File;

    if-eqz v8, :cond_4

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->targetFile:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_4

    .line 174
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "The targetfile \""

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->targetFile:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v8, "\" does not exist."

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, v12}, Lorg/apache/tools/ant/taskdefs/UpToDate;->log(Ljava/lang/String;I)V

    .line 222
    :goto_0
    return v7

    .line 180
    :cond_4
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceFile:Ljava/io/File;

    if-eqz v8, :cond_5

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceFile:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_5

    .line 181
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceFile:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " not found."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 185
    :cond_5
    const/4 v5, 0x1

    .line 186
    .local v5, "upToDate":Z
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceFile:Ljava/io/File;

    if-eqz v8, :cond_6

    .line 187
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-nez v8, :cond_8

    .line 188
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->targetFile:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->lastModified()J

    move-result-wide v8

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceFile:Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->lastModified()J

    move-result-wide v10

    cmp-long v8, v8, v10

    if-ltz v8, :cond_7

    move v5, v6

    .line 195
    :goto_1
    if-nez v5, :cond_6

    .line 196
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " is newer than (one of) its target(s)."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v12}, Lorg/apache/tools/ant/taskdefs/UpToDate;->log(Ljava/lang/String;I)V

    .line 206
    :cond_6
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceFileSets:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 207
    .local v1, "e":Ljava/util/Enumeration;
    :goto_2
    if-eqz v5, :cond_a

    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_a

    .line 208
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/FileSet;

    .line 209
    .local v2, "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/UpToDate;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v2, v8}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v0

    .line 210
    .local v0, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/UpToDate;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v2, v8}, Lorg/apache/tools/ant/types/FileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v8

    invoke-virtual {v0}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/UpToDate;->scanDir(Ljava/io/File;[Ljava/lang/String;)Z

    move-result v5

    goto :goto_2

    .end local v0    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v2    # "fs":Lorg/apache/tools/ant/types/FileSet;
    :cond_7
    move v5, v7

    .line 188
    goto :goto_1

    .line 190
    :cond_8
    new-instance v4, Lorg/apache/tools/ant/util/SourceFileScanner;

    invoke-direct {v4, p0}, Lorg/apache/tools/ant/util/SourceFileScanner;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 191
    .local v4, "sfs":Lorg/apache/tools/ant/util/SourceFileScanner;
    new-array v8, v6, [Ljava/lang/String;

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v7

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {v9}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v9

    invoke-virtual {v4, v8, v10, v10, v9}, Lorg/apache/tools/ant/util/SourceFileScanner;->restrict([Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/util/FileNameMapper;)[Ljava/lang/String;

    move-result-object v8

    array-length v8, v8

    if-nez v8, :cond_9

    move v5, v6

    :goto_3
    goto :goto_1

    :cond_9
    move v5, v7

    goto :goto_3

    .line 214
    .end local v4    # "sfs":Lorg/apache/tools/ant/util/SourceFileScanner;
    .restart local v1    # "e":Ljava/util/Enumeration;
    :cond_a
    if-eqz v5, :cond_b

    .line 215
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceResources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v8}, Lorg/apache/tools/ant/types/resources/Union;->listResources()[Lorg/apache/tools/ant/types/Resource;

    move-result-object v3

    .line 216
    .local v3, "r":[Lorg/apache/tools/ant/types/Resource;
    array-length v8, v3

    if-lez v8, :cond_b

    .line 217
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/UpToDate;->getMapper()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v8

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/UpToDate;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v9

    invoke-static {p0, v3, v8, v9}, Lorg/apache/tools/ant/util/ResourceUtils;->selectOutOfDateSources(Lorg/apache/tools/ant/ProjectComponent;[Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/util/FileNameMapper;Lorg/apache/tools/ant/types/ResourceFactory;)[Lorg/apache/tools/ant/types/Resource;

    move-result-object v8

    array-length v8, v8

    if-nez v8, :cond_c

    move v5, v6

    .end local v3    # "r":[Lorg/apache/tools/ant/types/Resource;
    :cond_b
    :goto_4
    move v7, v5

    .line 222
    goto/16 :goto_0

    .restart local v3    # "r":[Lorg/apache/tools/ant/types/Resource;
    :cond_c
    move v5, v7

    .line 217
    goto :goto_4
.end method

.method public execute()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x3

    .line 232
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->property:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 233
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "property attribute is required."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/UpToDate;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 236
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/UpToDate;->eval()Z

    move-result v0

    .line 237
    .local v0, "upToDate":Z
    if-eqz v0, :cond_1

    .line 238
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/UpToDate;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->property:Ljava/lang/String;

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/UpToDate;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-nez v1, :cond_2

    .line 240
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "File \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->targetFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\" is up-to-date."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v4}, Lorg/apache/tools/ant/taskdefs/UpToDate;->log(Ljava/lang/String;I)V

    .line 247
    :cond_1
    :goto_0
    return-void

    .line 243
    :cond_2
    const-string/jumbo v1, "All target files are up-to-date."

    invoke-virtual {p0, v1, v4}, Lorg/apache/tools/ant/taskdefs/UpToDate;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method protected scanDir(Ljava/io/File;[Ljava/lang/String;)Z
    .locals 4
    .param p1, "srcDir"    # Ljava/io/File;
    .param p2, "files"    # [Ljava/lang/String;

    .prologue
    .line 256
    new-instance v2, Lorg/apache/tools/ant/util/SourceFileScanner;

    invoke-direct {v2, p0}, Lorg/apache/tools/ant/util/SourceFileScanner;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 257
    .local v2, "sfs":Lorg/apache/tools/ant/util/SourceFileScanner;
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/UpToDate;->getMapper()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v1

    .line 258
    .local v1, "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    move-object v0, p1

    .line 259
    .local v0, "dir":Ljava/io/File;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-nez v3, :cond_0

    .line 260
    const/4 v0, 0x0

    .line 262
    :cond_0
    invoke-virtual {v2, p2, p1, v0, v1}, Lorg/apache/tools/ant/util/SourceFileScanner;->restrict([Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/util/FileNameMapper;)[Ljava/lang/String;

    move-result-object v3

    array-length v3, v3

    if-nez v3, :cond_1

    const/4 v3, 0x1

    :goto_0
    return v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public setProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 67
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->property:Ljava/lang/String;

    .line 68
    return-void
.end method

.method public setSrcfile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 104
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->sourceFile:Ljava/io/File;

    .line 105
    return-void
.end method

.method public setTargetFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 94
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->targetFile:Ljava/io/File;

    .line 95
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 77
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/UpToDate;->value:Ljava/lang/String;

    .line 78
    return-void
.end method
