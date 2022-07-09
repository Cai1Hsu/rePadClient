.class public Lorg/apache/tools/ant/types/selectors/TokenizedPath;
.super Ljava/lang/Object;
.source "TokenizedPath.java"


# static fields
.field private static final CS_SCAN_ONLY:[Z

.field private static final CS_THEN_NON_CS:[Z

.field public static final EMPTY_PATH:Lorg/apache/tools/ant/types/selectors/TokenizedPath;

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;


# instance fields
.field private final path:Ljava/lang/String;

.field private final tokenizedPath:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 36
    new-instance v0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    const-string/jumbo v1, ""

    new-array v2, v3, [Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->EMPTY_PATH:Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    .line 40
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    .line 42
    invoke-static {}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->getSymbolicLinkUtils()Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    .line 45
    new-array v0, v4, [Z

    aput-boolean v4, v0, v3

    sput-object v0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->CS_SCAN_ONLY:[Z

    .line 47
    const/4 v0, 0x2

    new-array v0, v0, [Z

    fill-array-data v0, :array_0

    sput-object v0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->CS_THEN_NON_CS:[Z

    return-void

    nop

    :array_0
    .array-data 1
        0x1t
        0x0t
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 58
    invoke-static {p1}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->tokenizePathAsArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 59
    return-void
.end method

.method constructor <init>(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "tokens"    # [Ljava/lang/String;

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->path:Ljava/lang/String;

    .line 83
    iput-object p2, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->tokenizedPath:[Ljava/lang/String;

    .line 84
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Ljava/lang/String;)V
    .locals 4
    .param p1, "parent"    # Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    .param p2, "child"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iget-object v0, p1, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->path:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p1, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->path:Ljava/lang/String;

    iget-object v1, p1, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->path:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    sget-char v1, Ljava/io/File;->separatorChar:C

    if-eq v0, v1, :cond_0

    .line 71
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p1, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->path:Ljava/lang/String;

    .line 75
    :goto_0
    iget-object v0, p1, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->tokenizedPath:[Ljava/lang/String;

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->tokenizedPath:[Ljava/lang/String;

    .line 76
    iget-object v0, p1, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->tokenizedPath:[Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->tokenizedPath:[Ljava/lang/String;

    iget-object v2, p1, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->tokenizedPath:[Ljava/lang/String;

    array-length v2, v2

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 78
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->tokenizedPath:[Ljava/lang/String;

    iget-object v1, p1, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->tokenizedPath:[Ljava/lang/String;

    array-length v1, v1

    aput-object p2, v0, v1

    .line 79
    return-void

    .line 73
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p1, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->path:Ljava/lang/String;

    goto :goto_0
.end method

.method private static findFile(Ljava/io/File;[Ljava/lang/String;Z)Ljava/io/File;
    .locals 10
    .param p0, "base"    # Ljava/io/File;
    .param p1, "pathElements"    # [Ljava/lang/String;
    .param p2, "cs"    # Z

    .prologue
    const/4 v7, 0x0

    .line 183
    const/4 v1, 0x0

    .local v1, "current":I
    :goto_0
    array-length v8, p1

    if-ge v1, v8, :cond_9

    .line 184
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-nez v8, :cond_1

    .line 208
    .end local p0    # "base":Ljava/io/File;
    :cond_0
    :goto_1
    return-object v7

    .line 187
    .restart local p0    # "base":Ljava/io/File;
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v2

    .line 188
    .local v2, "files":[Ljava/lang/String;
    if-nez v2, :cond_2

    .line 189
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "IO error scanning directory "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 192
    :cond_2
    const/4 v3, 0x0

    .line 193
    .local v3, "found":Z
    if-eqz p2, :cond_4

    sget-object v6, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->CS_SCAN_ONLY:[Z

    .line 194
    .local v6, "matchCase":[Z
    :goto_2
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_3
    if-nez v3, :cond_8

    array-length v8, v6

    if-ge v4, v8, :cond_8

    .line 195
    const/4 v5, 0x0

    .local v5, "j":I
    move-object v0, p0

    .end local p0    # "base":Ljava/io/File;
    .local v0, "base":Ljava/io/File;
    :goto_4
    if-nez v3, :cond_7

    array-length v8, v2

    if-ge v5, v8, :cond_7

    .line 196
    aget-boolean v8, v6, v4

    if-eqz v8, :cond_5

    aget-object v8, v2, v5

    aget-object v9, p1, v1

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 199
    :cond_3
    new-instance p0, Ljava/io/File;

    aget-object v8, v2, v5

    invoke-direct {p0, v0, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 200
    .end local v0    # "base":Ljava/io/File;
    .restart local p0    # "base":Ljava/io/File;
    const/4 v3, 0x1

    .line 195
    :goto_5
    add-int/lit8 v5, v5, 0x1

    move-object v0, p0

    .end local p0    # "base":Ljava/io/File;
    .restart local v0    # "base":Ljava/io/File;
    goto :goto_4

    .line 193
    .end local v0    # "base":Ljava/io/File;
    .end local v4    # "i":I
    .end local v5    # "j":I
    .end local v6    # "matchCase":[Z
    .restart local p0    # "base":Ljava/io/File;
    :cond_4
    sget-object v6, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->CS_THEN_NON_CS:[Z

    goto :goto_2

    .line 196
    .end local p0    # "base":Ljava/io/File;
    .restart local v0    # "base":Ljava/io/File;
    .restart local v4    # "i":I
    .restart local v5    # "j":I
    .restart local v6    # "matchCase":[Z
    :cond_5
    aget-object v8, v2, v5

    aget-object v9, p1, v1

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_3

    :cond_6
    move-object p0, v0

    .end local v0    # "base":Ljava/io/File;
    .restart local p0    # "base":Ljava/io/File;
    goto :goto_5

    .line 194
    .end local p0    # "base":Ljava/io/File;
    .restart local v0    # "base":Ljava/io/File;
    :cond_7
    add-int/lit8 v4, v4, 0x1

    move-object p0, v0

    .end local v0    # "base":Ljava/io/File;
    .restart local p0    # "base":Ljava/io/File;
    goto :goto_3

    .line 204
    .end local v5    # "j":I
    :cond_8
    if-eqz v3, :cond_0

    .line 183
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 208
    .end local v2    # "files":[Ljava/lang/String;
    .end local v3    # "found":Z
    .end local v4    # "i":I
    .end local v6    # "matchCase":[Z
    :cond_9
    array-length v8, p1

    if-nez v8, :cond_a

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-nez v8, :cond_a

    move-object p0, v7

    .end local p0    # "base":Ljava/io/File;
    :cond_a
    move-object v7, p0

    goto :goto_1
.end method


# virtual methods
.method public depth()I
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->tokenizedPath:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 164
    instance-of v0, p1, Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->path:Ljava/lang/String;

    check-cast p1, Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v1, p1, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public findFile(Ljava/io/File;Z)Ljava/io/File;
    .locals 5
    .param p1, "base"    # Ljava/io/File;
    .param p2, "cs"    # Z

    .prologue
    .line 113
    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->tokenizedPath:[Ljava/lang/String;

    .line 114
    .local v2, "tokens":[Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->path:Ljava/lang/String;

    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->isAbsolutePath(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 115
    if-nez p1, :cond_1

    .line 116
    sget-object v3, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-object v4, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->path:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/util/FileUtils;->dissect(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 117
    .local v1, "s":[Ljava/lang/String;
    new-instance p1, Ljava/io/File;

    .end local p1    # "base":Ljava/io/File;
    const/4 v3, 0x0

    aget-object v3, v1, v3

    invoke-direct {p1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 118
    .restart local p1    # "base":Ljava/io/File;
    const/4 v3, 0x1

    aget-object v3, v1, v3

    invoke-static {v3}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->tokenizePathAsArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 130
    .end local v1    # "s":[Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-static {p1, v2, p2}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->findFile(Ljava/io/File;[Ljava/lang/String;Z)Ljava/io/File;

    move-result-object v3

    :goto_1
    return-object v3

    .line 120
    :cond_1
    sget-object v3, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-object v4, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->path:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 121
    .local v0, "f":Ljava/io/File;
    sget-object v3, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v3, p1, v0}, Lorg/apache/tools/ant/util/FileUtils;->removeLeadingPath(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    .line 122
    .local v1, "s":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 125
    const/4 v3, 0x0

    goto :goto_1

    .line 127
    :cond_2
    invoke-static {v1}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->tokenizePathAsArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method getTokens()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->tokenizedPath:[Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 169
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->path:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isSymlink(Ljava/io/File;)Z
    .locals 6
    .param p1, "base"    # Ljava/io/File;

    .prologue
    .line 139
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v4, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->tokenizedPath:[Ljava/lang/String;

    array-length v4, v4

    if-ge v1, v4, :cond_3

    .line 141
    if-eqz p1, :cond_0

    :try_start_0
    sget-object v4, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    iget-object v5, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->tokenizedPath:[Ljava/lang/String;

    aget-object v5, v5, v1

    invoke-virtual {v4, p1, v5}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->isSymbolicLink(Ljava/io/File;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    :cond_0
    if-nez p1, :cond_2

    sget-object v4, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    iget-object v5, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->tokenizedPath:[Ljava/lang/String;

    aget-object v5, v5, v1

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->isSymbolicLink(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 147
    :cond_1
    const/4 v4, 0x1

    .line 157
    :goto_1
    return v4

    .line 149
    :cond_2
    new-instance v0, Ljava/io/File;

    iget-object v4, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->tokenizedPath:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-direct {v0, p1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .end local p1    # "base":Ljava/io/File;
    .local v0, "base":Ljava/io/File;
    move-object p1, v0

    .line 139
    .end local v0    # "base":Ljava/io/File;
    .restart local p1    # "base":Ljava/io/File;
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 150
    :catch_0
    move-exception v2

    .line 151
    .local v2, "ioe":Ljava/io/IOException;
    const-string/jumbo v3, "IOException caught while checking for links, couldn\'t get canonical path!"

    .line 154
    .local v3, "msg":Ljava/lang/String;
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v4, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2

    .line 157
    .end local v2    # "ioe":Ljava/io/IOException;
    .end local v3    # "msg":Ljava/lang/String;
    :cond_3
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public toPattern()Lorg/apache/tools/ant/types/selectors/TokenizedPattern;
    .locals 3

    .prologue
    .line 216
    new-instance v0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->path:Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->tokenizedPath:[Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->path:Ljava/lang/String;

    return-object v0
.end method
