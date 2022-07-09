.class Lorg/apache/tools/ant/taskdefs/optional/extension/LibraryDisplayer;
.super Ljava/lang/Object;
.source "LibraryDisplayer.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private displaySpecification(Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;)V
    .locals 5
    .param p1, "specification"    # Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;

    .prologue
    .line 138
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getSections()[Ljava/lang/String;

    move-result-object v2

    .line 139
    .local v2, "sections":[Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 140
    new-instance v1, Ljava/lang/StringBuffer;

    const-string/jumbo v3, "Sections: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 141
    .local v1, "sb":Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v2

    if-ge v0, v3, :cond_0

    .line 142
    const-string/jumbo v3, " "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 143
    aget-object v3, v2, v0

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 141
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 145
    :cond_0
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v3, v1}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 147
    .end local v0    # "i":I
    .end local v1    # "sb":Ljava/lang/StringBuffer;
    :cond_1
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 148
    return-void
.end method

.method private getSpecifications(Ljava/util/jar/Manifest;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
    .locals 3
    .param p1, "manifest"    # Ljava/util/jar/Manifest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 126
    :try_start_0
    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getSpecifications(Ljava/util/jar/Manifest;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 127
    :catch_0
    move-exception v0

    .line 128
    .local v0, "pe":Ljava/text/ParseException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v0}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private printLine(I)V
    .locals 3
    .param p1, "size"    # I

    .prologue
    .line 110
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_0

    .line 111
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v2, "-"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 110
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 113
    :cond_0
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/io/PrintStream;->println()V

    .line 114
    return-void
.end method


# virtual methods
.method displayLibrary(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 41
    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionUtil;->getManifest(Ljava/io/File;)Ljava/util/jar/Manifest;

    move-result-object v0

    .line 42
    .local v0, "manifest":Ljava/util/jar/Manifest;
    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/LibraryDisplayer;->displayLibrary(Ljava/io/File;Ljava/util/jar/Manifest;)V

    .line 43
    return-void
.end method

.method displayLibrary(Ljava/io/File;Ljava/util/jar/Manifest;)V
    .locals 11
    .param p1, "file"    # Ljava/io/File;
    .param p2, "manifest"    # Ljava/util/jar/Manifest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 56
    invoke-static {p2}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getAvailable(Ljava/util/jar/Manifest;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v0

    .line 57
    .local v0, "available":[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    invoke-static {p2}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getRequired(Ljava/util/jar/Manifest;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v5

    .line 58
    .local v5, "required":[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    invoke-static {p2}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getOptions(Ljava/util/jar/Manifest;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v4

    .line 59
    .local v4, "options":[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    invoke-direct {p0, p2}, Lorg/apache/tools/ant/taskdefs/optional/extension/LibraryDisplayer;->getSpecifications(Ljava/util/jar/Manifest;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;

    move-result-object v8

    .line 61
    .local v8, "specifications":[Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
    array-length v9, v0

    if-nez v9, :cond_1

    array-length v9, v5

    if-nez v9, :cond_1

    array-length v9, v4

    if-nez v9, :cond_1

    array-length v9, v8

    if-nez v9, :cond_1

    .line 102
    :cond_0
    return-void

    .line 66
    :cond_1
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "File: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 67
    .local v3, "message":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    .line 68
    .local v6, "size":I
    invoke-direct {p0, v6}, Lorg/apache/tools/ant/taskdefs/optional/extension/LibraryDisplayer;->printLine(I)V

    .line 69
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v9, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 70
    invoke-direct {p0, v6}, Lorg/apache/tools/ant/taskdefs/optional/extension/LibraryDisplayer;->printLine(I)V

    .line 71
    array-length v9, v0

    if-eqz v9, :cond_2

    .line 72
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v10, "Extensions Supported By Library:"

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 73
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v9, v0

    if-ge v2, v9, :cond_2

    .line 74
    aget-object v1, v0, v2

    .line 75
    .local v1, "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 73
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 79
    .end local v1    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .end local v2    # "i":I
    :cond_2
    array-length v9, v5

    if-eqz v9, :cond_3

    .line 80
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v10, "Extensions Required By Library:"

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 81
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_1
    array-length v9, v5

    if-ge v2, v9, :cond_3

    .line 82
    aget-object v1, v5, v2

    .line 83
    .restart local v1    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 81
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 87
    .end local v1    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .end local v2    # "i":I
    :cond_3
    array-length v9, v4

    if-eqz v9, :cond_4

    .line 88
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v10, "Extensions that will be used by Library if present:"

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 89
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_2
    array-length v9, v4

    if-ge v2, v9, :cond_4

    .line 90
    aget-object v1, v4, v2

    .line 91
    .restart local v1    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 89
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 95
    .end local v1    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .end local v2    # "i":I
    :cond_4
    array-length v9, v8

    if-eqz v9, :cond_0

    .line 96
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v10, "Specifications Supported By Library:"

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 97
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_3
    array-length v9, v8

    if-ge v2, v9, :cond_0

    .line 98
    aget-object v7, v8, v2

    .line 99
    .local v7, "specification":Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
    invoke-direct {p0, v7}, Lorg/apache/tools/ant/taskdefs/optional/extension/LibraryDisplayer;->displaySpecification(Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;)V

    .line 97
    add-int/lit8 v2, v2, 0x1

    goto :goto_3
.end method
