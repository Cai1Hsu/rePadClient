.class public Lorg/apache/tools/ant/taskdefs/Concat;
.super Lorg/apache/tools/ant/Task;
.source "Concat.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceCollection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;,
        Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;,
        Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;,
        Lorg/apache/tools/ant/taskdefs/Concat$TextElement;
    }
.end annotation


# static fields
.field private static final BUFFER_SIZE:I = 0x2000

.field private static final EXISTS:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final NOT_EXISTS:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;


# instance fields
.field private append:Z

.field private binary:Z

.field private dest:Lorg/apache/tools/ant/types/Resource;

.field private encoding:Ljava/lang/String;

.field private eolString:Ljava/lang/String;

.field private filterChains:Ljava/util/Vector;

.field private fixLastLine:Z

.field private footer:Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

.field private force:Z

.field private forceOverwrite:Z

.field private header:Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

.field private identityReaderFactory:Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;

.field private ignoreEmpty:Z

.field private outputEncoding:Ljava/lang/String;

.field private outputWriter:Ljava/io/Writer;

.field private rc:Lorg/apache/tools/ant/types/resources/Resources;

.field private resourceName:Ljava/lang/String;

.field private resourceReaderFactory:Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;

.field private textBuffer:Ljava/lang/StringBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 84
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Concat;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    .line 86
    new-instance v0, Lorg/apache/tools/ant/types/resources/selectors/Exists;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/selectors/Exists;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Concat;->EXISTS:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    .line 87
    new-instance v0, Lorg/apache/tools/ant/types/resources/selectors/Not;

    sget-object v1, Lorg/apache/tools/ant/taskdefs/Concat;->EXISTS:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/resources/selectors/Not;-><init>(Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Concat;->NOT_EXISTS:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 511
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 474
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->forceOverwrite:Z

    .line 476
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->force:Z

    .line 482
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->fixLastLine:Z

    .line 486
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->outputWriter:Ljava/io/Writer;

    .line 489
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->ignoreEmpty:Z

    .line 493
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Concat$1;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Concat$1;-><init>(Lorg/apache/tools/ant/taskdefs/Concat;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->resourceReaderFactory:Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;

    .line 502
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Concat$2;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Concat$2;-><init>(Lorg/apache/tools/ant/taskdefs/Concat;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->identityReaderFactory:Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;

    .line 512
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Concat;->reset()V

    .line 513
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/taskdefs/Concat;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Concat;

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->eolString:Ljava/lang/String;

    return-object v0
.end method

.method static access$100(Lorg/apache/tools/ant/taskdefs/Concat;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Concat;

    .prologue
    .line 79
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->fixLastLine:Z

    return v0
.end method

.method static access$1000(Lorg/apache/tools/ant/taskdefs/Concat;)Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Concat;

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->identityReaderFactory:Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;

    return-object v0
.end method

.method static access$1100(Lorg/apache/tools/ant/taskdefs/Concat;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Concat;

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->outputEncoding:Ljava/lang/String;

    return-object v0
.end method

.method static access$1200(Lorg/apache/tools/ant/taskdefs/Concat;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Concat;

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->resourceName:Ljava/lang/String;

    return-object v0
.end method

.method static access$1300(Lorg/apache/tools/ant/taskdefs/Concat;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Concat;

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method static access$200(Lorg/apache/tools/ant/taskdefs/Concat;)Ljava/lang/StringBuffer;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Concat;

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->textBuffer:Ljava/lang/StringBuffer;

    return-object v0
.end method

.method static access$300(Lorg/apache/tools/ant/taskdefs/Concat;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Concat;

    .prologue
    .line 79
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->binary:Z

    return v0
.end method

.method static access$400(Lorg/apache/tools/ant/taskdefs/Concat;)Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Concat;

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->resourceReaderFactory:Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;

    return-object v0
.end method

.method static access$600(Lorg/apache/tools/ant/taskdefs/Concat;Ljava/io/Reader;)Ljava/io/Reader;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Concat;
    .param p1, "x1"    # Ljava/io/Reader;

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Concat;->getFilteredReader(Ljava/io/Reader;)Ljava/io/Reader;

    move-result-object v0

    return-object v0
.end method

.method static access$700(Lorg/apache/tools/ant/taskdefs/Concat;)Lorg/apache/tools/ant/taskdefs/Concat$TextElement;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Concat;

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->header:Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    return-object v0
.end method

.method static access$800(Lorg/apache/tools/ant/taskdefs/Concat;)Lorg/apache/tools/ant/taskdefs/Concat$TextElement;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Concat;

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->footer:Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    return-object v0
.end method

.method private getFilteredReader(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 2
    .param p1, "r"    # Ljava/io/Reader;

    .prologue
    .line 943
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->filterChains:Ljava/util/Vector;

    if-nez v1, :cond_0

    .line 952
    .end local p1    # "r":Ljava/io/Reader;
    :goto_0
    return-object p1

    .line 946
    .restart local p1    # "r":Ljava/io/Reader;
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;

    invoke-direct {v0}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;-><init>()V

    .line 947
    .local v0, "helper":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    const/16 v1, 0x2000

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setBufferSize(I)V

    .line 948
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setPrimaryReader(Ljava/io/Reader;)V

    .line 949
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->filterChains:Ljava/util/Vector;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setFilterChains(Ljava/util/Vector;)V

    .line 950
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Concat;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 952
    invoke-virtual {v0}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->getAssembledReader()Ljava/io/Reader;

    move-result-object p1

    goto :goto_0
.end method

.method private getResources()Lorg/apache/tools/ant/types/ResourceCollection;
    .locals 7

    .prologue
    .line 892
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Concat;->rc:Lorg/apache/tools/ant/types/resources/Resources;

    if-nez v4, :cond_0

    .line 893
    new-instance v3, Lorg/apache/tools/ant/types/resources/StringResource;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Concat;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Concat;->textBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lorg/apache/tools/ant/types/resources/StringResource;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    .line 914
    :goto_0
    return-object v3

    .line 895
    :cond_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Concat;->dest:Lorg/apache/tools/ant/types/Resource;

    if-eqz v4, :cond_1

    .line 896
    new-instance v0, Lorg/apache/tools/ant/types/resources/Intersect;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Intersect;-><init>()V

    .line 897
    .local v0, "checkDestNotInSources":Lorg/apache/tools/ant/types/resources/Intersect;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Concat;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/types/resources/Intersect;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 898
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Concat;->rc:Lorg/apache/tools/ant/types/resources/Resources;

    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/types/resources/Intersect;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 899
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Concat;->dest:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/types/resources/Intersect;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 900
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/Intersect;->size()I

    move-result v4

    if-lez v4, :cond_1

    .line 901
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Destination resource "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Concat;->dest:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " was specified as an input resource."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 905
    .end local v0    # "checkDestNotInSources":Lorg/apache/tools/ant/types/resources/Intersect;
    :cond_1
    new-instance v2, Lorg/apache/tools/ant/types/resources/Restrict;

    invoke-direct {v2}, Lorg/apache/tools/ant/types/resources/Restrict;-><init>()V

    .line 906
    .local v2, "noexistRc":Lorg/apache/tools/ant/types/resources/Restrict;
    sget-object v4, Lorg/apache/tools/ant/taskdefs/Concat;->NOT_EXISTS:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/types/resources/Restrict;->add(Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V

    .line 907
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Concat;->rc:Lorg/apache/tools/ant/types/resources/Resources;

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/types/resources/Restrict;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 908
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/resources/Restrict;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 909
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " does not exist."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/Concat;->log(Ljava/lang/String;I)V

    goto :goto_1

    .line 911
    :cond_2
    new-instance v3, Lorg/apache/tools/ant/types/resources/Restrict;

    invoke-direct {v3}, Lorg/apache/tools/ant/types/resources/Restrict;-><init>()V

    .line 912
    .local v3, "result":Lorg/apache/tools/ant/types/resources/Restrict;
    sget-object v4, Lorg/apache/tools/ant/taskdefs/Concat;->EXISTS:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/resources/Restrict;->add(Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V

    .line 913
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Concat;->rc:Lorg/apache/tools/ant/types/resources/Resources;

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/resources/Restrict;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    goto/16 :goto_0
.end method

.method private isUpToDate(Lorg/apache/tools/ant/types/ResourceCollection;)Z
    .locals 6
    .param p1, "c"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    const/4 v2, 0x0

    .line 918
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Concat;->dest:Lorg/apache/tools/ant/types/Resource;

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Concat;->forceOverwrite:Z

    if-eqz v3, :cond_1

    .line 927
    :cond_0
    :goto_0
    return v2

    .line 921
    :cond_1
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 922
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Resource;

    .line 923
    .local v1, "r":Lorg/apache/tools/ant/types/Resource;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Concat;->dest:Lorg/apache/tools/ant/types/Resource;

    sget-object v4, Lorg/apache/tools/ant/taskdefs/Concat;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v4}, Lorg/apache/tools/ant/util/FileUtils;->getFileTimestampGranularity()J

    move-result-wide v4

    invoke-static {v1, v3, v4, v5}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->isOutOfDate(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;J)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    .line 927
    .end local v1    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_3
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private sanitizeText()V
    .locals 2

    .prologue
    .line 937
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->textBuffer:Ljava/lang/StringBuffer;

    if-eqz v0, :cond_0

    const-string/jumbo v0, ""

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->textBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 938
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->textBuffer:Ljava/lang/StringBuffer;

    .line 940
    :cond_0
    return-void
.end method

.method private validate()V
    .locals 2

    .prologue
    .line 844
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Concat;->sanitizeText()V

    .line 847
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->binary:Z

    if-eqz v0, :cond_6

    .line 848
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->textBuffer:Ljava/lang/StringBuffer;

    if-eqz v0, :cond_0

    .line 849
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Nested text is incompatible with binary concatenation"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 852
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->encoding:Ljava/lang/String;

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->outputEncoding:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 853
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Setting input or output encoding is incompatible with binary concatenation"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 857
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->filterChains:Ljava/util/Vector;

    if-eqz v0, :cond_3

    .line 858
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Setting filters is incompatible with binary concatenation"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 861
    :cond_3
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->fixLastLine:Z

    if-eqz v0, :cond_4

    .line 862
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Setting fixlastline is incompatible with binary concatenation"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 865
    :cond_4
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->header:Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    if-nez v0, :cond_5

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->footer:Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    if-eqz v0, :cond_6

    .line 866
    :cond_5
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Nested header or footer is incompatible with binary concatenation"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 870
    :cond_6
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->dest:Lorg/apache/tools/ant/types/Resource;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->outputWriter:Ljava/io/Writer;

    if-eqz v0, :cond_7

    .line 871
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot specify both a destination resource and an output writer"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 875
    :cond_7
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->rc:Lorg/apache/tools/ant/types/resources/Resources;

    if-nez v0, :cond_8

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->textBuffer:Ljava/lang/StringBuffer;

    if-nez v0, :cond_8

    .line 877
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "At least one resource must be provided, or some text."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 880
    :cond_8
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->rc:Lorg/apache/tools/ant/types/resources/Resources;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->textBuffer:Ljava/lang/StringBuffer;

    if-eqz v0, :cond_9

    .line 883
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot include inline text when using resources."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 886
    :cond_9
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 2
    .param p1, "c"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 677
    monitor-enter p0

    .line 678
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->rc:Lorg/apache/tools/ant/types/resources/Resources;

    if-nez v0, :cond_0

    .line 679
    new-instance v0, Lorg/apache/tools/ant/types/resources/Resources;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Resources;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->rc:Lorg/apache/tools/ant/types/resources/Resources;

    .line 680
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->rc:Lorg/apache/tools/ant/types/resources/Resources;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Concat;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/Resources;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 681
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->rc:Lorg/apache/tools/ant/types/resources/Resources;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/Resources;->setCache(Z)V

    .line 683
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 684
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->rc:Lorg/apache/tools/ant/types/resources/Resources;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Resources;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 685
    return-void

    .line 683
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public addFilelist(Lorg/apache/tools/ant/types/FileList;)V
    .locals 0
    .param p1, "list"    # Lorg/apache/tools/ant/types/FileList;

    .prologue
    .line 668
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Concat;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 669
    return-void
.end method

.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 0
    .param p1, "set"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 660
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Concat;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 661
    return-void
.end method

.method public addFilterChain(Lorg/apache/tools/ant/types/FilterChain;)V
    .locals 1
    .param p1, "filterChain"    # Lorg/apache/tools/ant/types/FilterChain;

    .prologue
    .line 693
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->filterChains:Ljava/util/Vector;

    if-nez v0, :cond_0

    .line 694
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->filterChains:Ljava/util/Vector;

    .line 696
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->filterChains:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 697
    return-void
.end method

.method public addFooter(Lorg/apache/tools/ant/taskdefs/Concat$TextElement;)V
    .locals 0
    .param p1, "footerToAdd"    # Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    .prologue
    .line 730
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->footer:Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    .line 731
    return-void
.end method

.method public addHeader(Lorg/apache/tools/ant/taskdefs/Concat$TextElement;)V
    .locals 0
    .param p1, "headerToAdd"    # Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    .prologue
    .line 721
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->header:Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    .line 722
    return-void
.end method

.method public addText(Ljava/lang/String;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 704
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->textBuffer:Ljava/lang/StringBuffer;

    if-nez v0, :cond_0

    .line 707
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->textBuffer:Ljava/lang/StringBuffer;

    .line 712
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->textBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 713
    return-void
.end method

.method public createPath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 650
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Concat;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 651
    .local v0, "path":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Concat;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 652
    return-object v0
.end method

.method public execute()V
    .locals 13

    .prologue
    .line 788
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Concat;->validate()V

    .line 789
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->binary:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->dest:Lorg/apache/tools/ant/types/Resource;

    if-nez v0, :cond_0

    .line 790
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "dest|destfile attribute is required for binary concatenation"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 793
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Concat;->getResources()Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v11

    .line 794
    .local v11, "c":Lorg/apache/tools/ant/types/ResourceCollection;
    invoke-direct {p0, v11}, Lorg/apache/tools/ant/taskdefs/Concat;->isUpToDate(Lorg/apache/tools/ant/types/ResourceCollection;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 795
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->dest:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " is up-to-date."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Concat;->log(Ljava/lang/String;I)V

    .line 811
    :cond_1
    :goto_0
    return-void

    .line 798
    :cond_2
    invoke-interface {v11}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v0

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->ignoreEmpty:Z

    if-nez v0, :cond_1

    .line 803
    :cond_3
    :try_start_0
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v11, v1}, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;-><init>(Lorg/apache/tools/ant/taskdefs/Concat;Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/ant/taskdefs/Concat$1;)V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->dest:Lorg/apache/tools/ant/types/Resource;

    if-nez v1, :cond_4

    new-instance v1, Lorg/apache/tools/ant/types/resources/LogOutputResource;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lorg/apache/tools/ant/types/resources/LogOutputResource;-><init>(Lorg/apache/tools/ant/ProjectComponent;I)V

    :goto_1
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Concat;->append:Z

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Concat;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v9

    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/Concat;->force:Z

    invoke-static/range {v0 .. v10}, Lorg/apache/tools/ant/util/ResourceUtils;->copyResource(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 808
    :catch_0
    move-exception v12

    .line 809
    .local v12, "e":Ljava/io/IOException;
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "error concatenating content to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Concat;->dest:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 803
    .end local v12    # "e":Ljava/io/IOException;
    :cond_4
    :try_start_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->dest:Lorg/apache/tools/ant/types/Resource;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public isFilesystemOnly()Z
    .locals 1

    .prologue
    .line 835
    const/4 v0, 0x0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 3

    .prologue
    .line 818
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Concat;->validate()V

    .line 819
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Concat;->getResources()Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;-><init>(Lorg/apache/tools/ant/taskdefs/Concat;Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/ant/taskdefs/Concat$1;)V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public reset()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 519
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Concat;->append:Z

    .line 520
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Concat;->forceOverwrite:Z

    .line 521
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->dest:Lorg/apache/tools/ant/types/Resource;

    .line 522
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->encoding:Ljava/lang/String;

    .line 523
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->outputEncoding:Ljava/lang/String;

    .line 524
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Concat;->fixLastLine:Z

    .line 525
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->filterChains:Ljava/util/Vector;

    .line 526
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->footer:Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    .line 527
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->header:Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    .line 528
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Concat;->binary:Z

    .line 529
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->outputWriter:Ljava/io/Writer;

    .line 530
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->textBuffer:Ljava/lang/StringBuffer;

    .line 531
    sget-object v0, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->eolString:Ljava/lang/String;

    .line 532
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->rc:Lorg/apache/tools/ant/types/resources/Resources;

    .line 533
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Concat;->ignoreEmpty:Z

    .line 534
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Concat;->force:Z

    .line 535
    return-void
.end method

.method public setAppend(Z)V
    .locals 0
    .param p1, "append"    # Z

    .prologue
    .line 564
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->append:Z

    .line 565
    return-void
.end method

.method public setBinary(Z)V
    .locals 0
    .param p1, "binary"    # Z

    .prologue
    .line 781
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->binary:Z

    .line 782
    return-void
.end method

.method public setDest(Lorg/apache/tools/ant/types/Resource;)V
    .locals 0
    .param p1, "dest"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 553
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->dest:Lorg/apache/tools/ant/types/Resource;

    .line 554
    return-void
.end method

.method public setDestfile(Ljava/io/File;)V
    .locals 1
    .param p1, "destinationFile"    # Ljava/io/File;

    .prologue
    .line 544
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Concat;->setDest(Lorg/apache/tools/ant/types/Resource;)V

    .line 545
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 1
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 573
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->encoding:Ljava/lang/String;

    .line 574
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat;->outputEncoding:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 575
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->outputEncoding:Ljava/lang/String;

    .line 577
    :cond_0
    return-void
.end method

.method public setEol(Lorg/apache/tools/ant/taskdefs/FixCRLF$CrLf;)V
    .locals 2
    .param p1, "crlf"    # Lorg/apache/tools/ant/taskdefs/FixCRLF$CrLf;

    .prologue
    .line 753
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/FixCRLF$CrLf;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 754
    .local v0, "s":Ljava/lang/String;
    const-string/jumbo v1, "cr"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "mac"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 755
    :cond_0
    const-string/jumbo v1, "\r"

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->eolString:Ljava/lang/String;

    .line 761
    :cond_1
    :goto_0
    return-void

    .line 756
    :cond_2
    const-string/jumbo v1, "lf"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string/jumbo v1, "unix"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 757
    :cond_3
    const-string/jumbo v1, "\n"

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->eolString:Ljava/lang/String;

    goto :goto_0

    .line 758
    :cond_4
    const-string/jumbo v1, "crlf"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string/jumbo v1, "dos"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 759
    :cond_5
    const-string/jumbo v1, "\r\n"

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->eolString:Ljava/lang/String;

    goto :goto_0
.end method

.method public setFixLastLine(Z)V
    .locals 0
    .param p1, "fixLastLine"    # Z

    .prologue
    .line 741
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->fixLastLine:Z

    .line 742
    return-void
.end method

.method public setForce(Z)V
    .locals 0
    .param p1, "forceOverwrite"    # Z

    .prologue
    .line 597
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->forceOverwrite:Z

    .line 598
    return-void
.end method

.method public setForceReadOnly(Z)V
    .locals 0
    .param p1, "f"    # Z

    .prologue
    .line 619
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->force:Z

    .line 620
    return-void
.end method

.method public setIgnoreEmpty(Z)V
    .locals 0
    .param p1, "ignoreEmpty"    # Z

    .prologue
    .line 630
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->ignoreEmpty:Z

    .line 631
    return-void
.end method

.method public setOutputEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "outputEncoding"    # Ljava/lang/String;

    .prologue
    .line 585
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->outputEncoding:Ljava/lang/String;

    .line 586
    return-void
.end method

.method public setOverwrite(Z)V
    .locals 0
    .param p1, "forceOverwrite"    # Z

    .prologue
    .line 608
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Concat;->setForce(Z)V

    .line 609
    return-void
.end method

.method public setResourceName(Ljava/lang/String;)V
    .locals 0
    .param p1, "resourceName"    # Ljava/lang/String;

    .prologue
    .line 639
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->resourceName:Ljava/lang/String;

    .line 640
    return-void
.end method

.method public setWriter(Ljava/io/Writer;)V
    .locals 0
    .param p1, "outputWriter"    # Ljava/io/Writer;

    .prologue
    .line 770
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Concat;->outputWriter:Ljava/io/Writer;

    .line 771
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 827
    const/4 v0, 0x1

    return v0
.end method
