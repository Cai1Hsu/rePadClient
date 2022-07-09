.class public Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "Native2Ascii.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii$1;,
        Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii$ExtMapper;
    }
.end annotation


# instance fields
.field private destDir:Ljava/io/File;

.field private encoding:Ljava/lang/String;

.field private extension:Ljava/lang/String;

.field private facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

.field private mapper:Lorg/apache/tools/ant/types/Mapper;

.field private nestedAdapter:Lorg/apache/tools/ant/taskdefs/optional/native2ascii/Native2AsciiAdapter;

.field private reverse:Z

.field private srcDir:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 54
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->reverse:Z

    .line 44
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->encoding:Ljava/lang/String;

    .line 45
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->srcDir:Ljava/io/File;

    .line 46
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->destDir:Ljava/io/File;

    .line 47
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->extension:Ljava/lang/String;

    .line 50
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    .line 51
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/optional/native2ascii/Native2AsciiAdapter;

    .line 55
    new-instance v0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-static {}, Lorg/apache/tools/ant/taskdefs/optional/native2ascii/Native2AsciiAdapterFactory;->getDefault()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    .line 56
    return-void
.end method

.method static access$100(Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;

    .prologue
    .line 41
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->extension:Ljava/lang/String;

    return-object v0
.end method

.method private convert(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "srcName"    # Ljava/lang/String;
    .param p2, "destName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 267
    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->srcDir:Ljava/io/File;

    invoke-direct {v4, v5, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 268
    .local v4, "srcFile":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->destDir:Ljava/io/File;

    invoke-direct {v1, v5, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 271
    .local v1, "destFile":Ljava/io/File;
    invoke-virtual {v4, v1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 272
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "file "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " would overwrite its self"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 278
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v3

    .line 279
    .local v3, "parentName":Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 280
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 282
    .local v2, "parentFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_1

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v5

    if-nez v5, :cond_1

    .line 283
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "cannot create parent directory "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 288
    .end local v2    # "parentFile":Ljava/io/File;
    :cond_1
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "converting "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->log(Ljava/lang/String;I)V

    .line 289
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/optional/native2ascii/Native2AsciiAdapter;

    if-eqz v5, :cond_2

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/optional/native2ascii/Native2AsciiAdapter;

    .line 294
    .local v0, "ad":Lorg/apache/tools/ant/taskdefs/optional/native2ascii/Native2AsciiAdapter;
    :goto_0
    invoke-interface {v0, p0, v4, v1}, Lorg/apache/tools/ant/taskdefs/optional/native2ascii/Native2AsciiAdapter;->convert(Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;Ljava/io/File;Ljava/io/File;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 295
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "conversion failed"

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 289
    .end local v0    # "ad":Lorg/apache/tools/ant/taskdefs/optional/native2ascii/Native2AsciiAdapter;
    :cond_2
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v5}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->getImplementation()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->createImplementationClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v6

    invoke-static {v5, p0, v6}, Lorg/apache/tools/ant/taskdefs/optional/native2ascii/Native2AsciiAdapterFactory;->getAdapter(Ljava/lang/String;Lorg/apache/tools/ant/ProjectComponent;Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/taskdefs/optional/native2ascii/Native2AsciiAdapter;

    move-result-object v0

    goto :goto_0

    .line 297
    .restart local v0    # "ad":Lorg/apache/tools/ant/taskdefs/optional/native2ascii/Native2AsciiAdapter;
    :cond_3
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/taskdefs/optional/native2ascii/Native2AsciiAdapter;)V
    .locals 2
    .param p1, "adapter"    # Lorg/apache/tools/ant/taskdefs/optional/native2ascii/Native2AsciiAdapter;

    .prologue
    .line 193
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/optional/native2ascii/Native2AsciiAdapter;

    if-eqz v0, :cond_0

    .line 194
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Can\'t have more than one native2ascii adapter"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 197
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/optional/native2ascii/Native2AsciiAdapter;

    .line 198
    return-void
.end method

.method public add(Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 1
    .param p1, "fileNameMapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 162
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->createMapper()Lorg/apache/tools/ant/types/Mapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Mapper;->add(Lorg/apache/tools/ant/util/FileNameMapper;)V

    .line 163
    return-void
.end method

.method public createArg()Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;
    .locals 2

    .prologue
    .line 172
    new-instance v0, Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;-><init>()V

    .line 174
    .local v0, "arg":Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->addImplementationArgument(Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;)V

    .line 175
    return-object v0
.end method

.method public createImplementationClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 185
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->getImplementationClasspath(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createMapper()Lorg/apache/tools/ant/types/Mapper;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 148
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->mapper:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_0

    .line 149
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot define more than one mapper"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 152
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Mapper;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->mapper:Lorg/apache/tools/ant/types/Mapper;

    .line 153
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->mapper:Lorg/apache/tools/ant/types/Mapper;

    return-object v0
.end method

.method public execute()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 207
    const/4 v5, 0x0

    .line 211
    .local v5, "scanner":Lorg/apache/tools/ant/DirectoryScanner;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->srcDir:Ljava/io/File;

    if-nez v7, :cond_0

    .line 212
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    const-string/jumbo v8, "."

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v7

    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->srcDir:Ljava/io/File;

    .line 216
    :cond_0
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->destDir:Ljava/io/File;

    if-nez v7, :cond_1

    .line 217
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "The dest attribute must be set."

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 223
    :cond_1
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->srcDir:Ljava/io/File;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->destDir:Ljava/io/File;

    invoke-virtual {v7, v8}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->extension:Ljava/lang/String;

    if-nez v7, :cond_2

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->mapper:Lorg/apache/tools/ant/types/Mapper;

    if-nez v7, :cond_2

    .line 224
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "The ext attribute or a mapper must be set if src and dest dirs are the same."

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 228
    :cond_2
    const/4 v3, 0x0

    .line 229
    .local v3, "m":Lorg/apache/tools/ant/util/FileNameMapper;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->mapper:Lorg/apache/tools/ant/types/Mapper;

    if-nez v7, :cond_5

    .line 230
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->extension:Ljava/lang/String;

    if-nez v7, :cond_4

    .line 231
    new-instance v3, Lorg/apache/tools/ant/util/IdentityMapper;

    .end local v3    # "m":Lorg/apache/tools/ant/util/FileNameMapper;
    invoke-direct {v3}, Lorg/apache/tools/ant/util/IdentityMapper;-><init>()V

    .line 239
    .restart local v3    # "m":Lorg/apache/tools/ant/util/FileNameMapper;
    :goto_0
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->srcDir:Ljava/io/File;

    invoke-virtual {p0, v7}, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->getDirectoryScanner(Ljava/io/File;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v5

    .line 240
    invoke-virtual {v5}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v1

    .line 241
    .local v1, "files":[Ljava/lang/String;
    new-instance v6, Lorg/apache/tools/ant/util/SourceFileScanner;

    invoke-direct {v6, p0}, Lorg/apache/tools/ant/util/SourceFileScanner;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 242
    .local v6, "sfs":Lorg/apache/tools/ant/util/SourceFileScanner;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->srcDir:Ljava/io/File;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->destDir:Ljava/io/File;

    invoke-virtual {v6, v1, v7, v8, v3}, Lorg/apache/tools/ant/util/SourceFileScanner;->restrict([Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/util/FileNameMapper;)[Ljava/lang/String;

    move-result-object v1

    .line 243
    array-length v0, v1

    .line 244
    .local v0, "count":I
    if-nez v0, :cond_6

    .line 253
    :cond_3
    return-void

    .line 233
    .end local v0    # "count":I
    .end local v1    # "files":[Ljava/lang/String;
    .end local v6    # "sfs":Lorg/apache/tools/ant/util/SourceFileScanner;
    :cond_4
    new-instance v3, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii$ExtMapper;

    .end local v3    # "m":Lorg/apache/tools/ant/util/FileNameMapper;
    const/4 v7, 0x0

    invoke-direct {v3, p0, v7}, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii$ExtMapper;-><init>(Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii$1;)V

    .restart local v3    # "m":Lorg/apache/tools/ant/util/FileNameMapper;
    goto :goto_0

    .line 236
    :cond_5
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->mapper:Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {v7}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v3

    goto :goto_0

    .line 247
    .restart local v0    # "count":I
    .restart local v1    # "files":[Ljava/lang/String;
    .restart local v6    # "sfs":Lorg/apache/tools/ant/util/SourceFileScanner;
    :cond_6
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Converting "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " file"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const/4 v7, 0x1

    if-eq v0, v7, :cond_7

    const-string/jumbo v7, "s"

    :goto_1
    invoke-virtual {v8, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " from "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 249
    .local v4, "message":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->srcDir:Ljava/io/File;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->destDir:Ljava/io/File;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->log(Ljava/lang/String;)V

    .line 250
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    array-length v7, v1

    if-ge v2, v7, :cond_3

    .line 251
    aget-object v7, v1, v2

    aget-object v8, v1, v2

    invoke-interface {v3, v8}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    aget-object v8, v8, v9

    invoke-direct {p0, v7, v8}, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->convert(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 247
    .end local v2    # "i":I
    .end local v4    # "message":Ljava/lang/String;
    :cond_7
    const-string/jumbo v7, ""

    goto :goto_1
.end method

.method public getCurrentArgs()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 306
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->getArgs()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method public getReverse()Z
    .locals 1

    .prologue
    .line 75
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->reverse:Z

    return v0
.end method

.method public setDest(Ljava/io/File;)V
    .locals 0
    .param p1, "destDir"    # Ljava/io/File;

    .prologue
    .line 114
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->destDir:Ljava/io/File;

    .line 115
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 86
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->encoding:Ljava/lang/String;

    .line 87
    return-void
.end method

.method public setExt(Ljava/lang/String;)V
    .locals 0
    .param p1, "ext"    # Ljava/lang/String;

    .prologue
    .line 124
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->extension:Ljava/lang/String;

    .line 125
    return-void
.end method

.method public setImplementation(Ljava/lang/String;)V
    .locals 2
    .param p1, "impl"    # Ljava/lang/String;

    .prologue
    .line 133
    const-string/jumbo v0, "default"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 134
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-static {}, Lorg/apache/tools/ant/taskdefs/optional/native2ascii/Native2AsciiAdapterFactory;->getDefault()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->setImplementation(Ljava/lang/String;)V

    .line 138
    :goto_0
    return-void

    .line 136
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->setImplementation(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setReverse(Z)V
    .locals 0
    .param p1, "reverse"    # Z

    .prologue
    .line 66
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->reverse:Z

    .line 67
    return-void
.end method

.method public setSrc(Ljava/io/File;)V
    .locals 0
    .param p1, "srcDir"    # Ljava/io/File;

    .prologue
    .line 104
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->srcDir:Ljava/io/File;

    .line 105
    return-void
.end method
