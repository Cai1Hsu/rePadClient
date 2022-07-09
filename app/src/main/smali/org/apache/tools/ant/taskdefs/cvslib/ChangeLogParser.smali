.class Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;
.super Ljava/lang/Object;
.source "ChangeLogParser.java"


# static fields
.field private static final CVS1129_INPUT_DATE:Ljava/text/SimpleDateFormat;

.field private static final GET_COMMENT:I = 0x3

.field private static final GET_DATE:I = 0x2

.field private static final GET_FILE:I = 0x1

.field private static final GET_PREVIOUS_REV:I = 0x5

.field private static final GET_REVISION:I = 0x4

.field private static final INPUT_DATE:Ljava/text/SimpleDateFormat;


# instance fields
.field private author:Ljava/lang/String;

.field private comment:Ljava/lang/String;

.field private date:Ljava/lang/String;

.field private final entries:Ljava/util/Hashtable;

.field private file:Ljava/lang/String;

.field private final moduleNameLengths:[I

.field private final moduleNames:[Ljava/lang/String;

.field private previousRevision:Ljava/lang/String;

.field private final remote:Z

.field private revision:Ljava/lang/String;

.field private status:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 49
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v2, "yyyy/MM/dd HH:mm:ss"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v1, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->INPUT_DATE:Ljava/text/SimpleDateFormat;

    .line 54
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v2, "yyyy-MM-dd HH:mm:ss Z"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v1, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->CVS1129_INPUT_DATE:Ljava/text/SimpleDateFormat;

    .line 58
    const-string/jumbo v1, "UTC"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    .line 59
    .local v0, "utc":Ljava/util/TimeZone;
    sget-object v1, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->INPUT_DATE:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 60
    sget-object v1, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->CVS1129_INPUT_DATE:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 61
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 81
    const/4 v0, 0x0

    const-string/jumbo v1, ""

    sget-object v2, Lorg/apache/tools/ant/util/CollectionUtils;->EMPTY_LIST:Ljava/util/List;

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;-><init>(ZLjava/lang/String;Ljava/util/List;)V

    .line 82
    return-void
.end method

.method public constructor <init>(ZLjava/lang/String;Ljava/util/List;)V
    .locals 7
    .param p1, "remote"    # Z
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "modules"    # Ljava/util/List;

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    const/4 v5, 0x1

    iput v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->status:I

    .line 74
    new-instance v5, Ljava/util/Hashtable;

    invoke-direct {v5}, Ljava/util/Hashtable;-><init>()V

    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->entries:Ljava/util/Hashtable;

    .line 85
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->remote:Z

    .line 87
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 88
    .local v3, "names":Ljava/util/ArrayList;
    if-eqz p2, :cond_0

    .line 89
    new-instance v4, Ljava/util/StringTokenizer;

    invoke-direct {v4, p2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 90
    .local v4, "tok":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 91
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 94
    .end local v4    # "tok":Ljava/util/StringTokenizer;
    :cond_0
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 95
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask$Module;

    .line 96
    .local v2, "m":Lorg/apache/tools/ant/taskdefs/AbstractCvsTask$Module;
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask$Module;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 99
    .end local v2    # "m":Lorg/apache/tools/ant/taskdefs/AbstractCvsTask$Module;
    :cond_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->moduleNames:[Ljava/lang/String;

    .line 100
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->moduleNames:[Ljava/lang/String;

    array-length v5, v5

    new-array v5, v5, [I

    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->moduleNameLengths:[I

    .line 101
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->moduleNames:[Ljava/lang/String;

    array-length v5, v5

    if-ge v0, v5, :cond_2

    .line 102
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->moduleNameLengths:[I

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->moduleNames:[Ljava/lang/String;

    aget-object v6, v6, v0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    aput v6, v5, v0

    .line 101
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 104
    :cond_2
    return-void
.end method

.method private parseDate(Ljava/lang/String;)Ljava/util/Date;
    .locals 5
    .param p1, "date"    # Ljava/lang/String;

    .prologue
    .line 299
    :try_start_0
    sget-object v2, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->INPUT_DATE:Ljava/text/SimpleDateFormat;

    invoke-virtual {v2, p1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 302
    :goto_0
    return-object v2

    .line 300
    :catch_0
    move-exception v0

    .line 302
    .local v0, "e":Ljava/text/ParseException;
    :try_start_1
    sget-object v2, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->CVS1129_INPUT_DATE:Ljava/text/SimpleDateFormat;

    invoke-virtual {v2, p1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    goto :goto_0

    .line 303
    :catch_1
    move-exception v1

    .line 304
    .local v1, "e2":Ljava/text/ParseException;
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Invalid date format: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private processComment(Ljava/lang/String;)V
    .locals 5
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 161
    const-string/jumbo v2, "line.separator"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 162
    .local v1, "lineSeparator":Ljava/lang/String;
    const-string/jumbo v2, "============================================================================="

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 166
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->comment:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int v0, v2, v3

    .line 168
    .local v0, "end":I
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->comment:Ljava/lang/String;

    invoke-virtual {v2, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->comment:Ljava/lang/String;

    .line 169
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->saveEntry()V

    .line 170
    const/4 v2, 0x1

    iput v2, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->status:I

    .line 179
    .end local v0    # "end":I
    :goto_0
    return-void

    .line 171
    :cond_0
    const-string/jumbo v2, "----------------------------"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 172
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->comment:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int v0, v2, v3

    .line 174
    .restart local v0    # "end":I
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->comment:Ljava/lang/String;

    invoke-virtual {v2, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->comment:Ljava/lang/String;

    .line 175
    const/4 v2, 0x5

    iput v2, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->status:I

    goto :goto_0

    .line 177
    .end local v0    # "end":I
    :cond_1
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->comment:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->comment:Ljava/lang/String;

    goto :goto_0
.end method

.method private processDate(Ljava/lang/String;)V
    .locals 6
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x3b

    .line 237
    const-string/jumbo v3, "date:"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 241
    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 242
    .local v1, "endOfDateIndex":I
    const-string/jumbo v3, "date: "

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->date:Ljava/lang/String;

    .line 244
    const-string/jumbo v3, "author: "

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .line 245
    .local v2, "startOfAuthorIndex":I
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p1, v5, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 246
    .local v0, "endOfAuthorIndex":I
    const-string/jumbo v3, "author: "

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v3, v2

    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->author:Ljava/lang/String;

    .line 248
    const/4 v3, 0x3

    iput v3, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->status:I

    .line 252
    const-string/jumbo v3, ""

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->comment:Ljava/lang/String;

    .line 254
    .end local v0    # "endOfAuthorIndex":I
    .end local v1    # "endOfDateIndex":I
    .end local v2    # "startOfAuthorIndex":I
    :cond_0
    return-void
.end method

.method private processFile(Ljava/lang/String;)V
    .locals 7
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x4

    .line 187
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->remote:Z

    if-nez v4, :cond_1

    const-string/jumbo v4, "Working file:"

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 189
    const/16 v4, 0xe

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->file:Ljava/lang/String;

    .line 191
    iput v6, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->status:I

    .line 211
    :cond_0
    :goto_0
    return-void

    .line 192
    :cond_1
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->remote:Z

    if-eqz v4, :cond_0

    const-string/jumbo v4, "RCS file:"

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 195
    const/4 v3, 0x0

    .line 196
    .local v3, "startOfFileName":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->moduleNames:[Ljava/lang/String;

    array-length v4, v4

    if-ge v1, v4, :cond_2

    .line 197
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->moduleNames:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 198
    .local v2, "index":I
    if-ltz v2, :cond_3

    .line 199
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->moduleNameLengths:[I

    aget v4, v4, v1

    add-int/2addr v4, v2

    add-int/lit8 v3, v4, 0x1

    .line 203
    .end local v2    # "index":I
    :cond_2
    const-string/jumbo v4, ",v"

    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 204
    .local v0, "endOfFileName":I
    const/4 v4, -0x1

    if-ne v0, v4, :cond_4

    .line 205
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->file:Ljava/lang/String;

    .line 209
    :goto_2
    iput v6, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->status:I

    goto :goto_0

    .line 196
    .end local v0    # "endOfFileName":I
    .restart local v2    # "index":I
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 207
    .end local v2    # "index":I
    .restart local v0    # "endOfFileName":I
    :cond_4
    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->file:Ljava/lang/String;

    goto :goto_2
.end method

.method private processGetPreviousRevision(Ljava/lang/String;)V
    .locals 3
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 262
    const-string/jumbo v0, "revision "

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 263
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Unexpected line from CVS: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 266
    :cond_0
    const-string/jumbo v0, "revision "

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->previousRevision:Ljava/lang/String;

    .line 268
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->saveEntry()V

    .line 270
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->previousRevision:Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->revision:Ljava/lang/String;

    .line 271
    const/4 v0, 0x2

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->status:I

    .line 272
    return-void
.end method

.method private processRevision(Ljava/lang/String;)V
    .locals 1
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 219
    const-string/jumbo v0, "revision"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 221
    const/16 v0, 0x9

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->revision:Ljava/lang/String;

    .line 223
    const/4 v0, 0x2

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->status:I

    .line 229
    :cond_0
    :goto_0
    return-void

    .line 224
    :cond_1
    const-string/jumbo v0, "======"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 227
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->status:I

    goto :goto_0
.end method

.method private saveEntry()V
    .locals 6

    .prologue
    .line 278
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->date:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->author:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->comment:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 280
    .local v2, "entryKey":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->entries:Ljava/util/Hashtable;

    invoke-virtual {v3, v2}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 281
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->date:Ljava/lang/String;

    invoke-direct {p0, v3}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 282
    .local v0, "dateObject":Ljava/util/Date;
    new-instance v1, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->author:Ljava/lang/String;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->comment:Ljava/lang/String;

    invoke-direct {v1, v0, v3, v4}, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;-><init>(Ljava/util/Date;Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    .local v1, "entry":Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->entries:Ljava/util/Hashtable;

    invoke-virtual {v3, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    .end local v0    # "dateObject":Ljava/util/Date;
    :goto_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->file:Ljava/lang/String;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->revision:Ljava/lang/String;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->previousRevision:Ljava/lang/String;

    invoke-virtual {v1, v3, v4, v5}, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->addFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 289
    return-void

    .line 285
    .end local v1    # "entry":Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->entries:Ljava/util/Hashtable;

    invoke-virtual {v3, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;

    .restart local v1    # "entry":Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
    goto :goto_0
.end method


# virtual methods
.method public getEntrySetAsArray()[Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
    .locals 5

    .prologue
    .line 112
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->entries:Ljava/util/Hashtable;

    invoke-virtual {v4}, Ljava/util/Hashtable;->size()I

    move-result v4

    new-array v0, v4, [Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;

    .line 113
    .local v0, "array":[Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
    const/4 v2, 0x0

    .line 114
    .local v2, "i":I
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->entries:Ljava/util/Hashtable;

    invoke-virtual {v4}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 115
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;

    aput-object v4, v0, v2

    move v2, v3

    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_0

    .line 117
    :cond_0
    return-object v0
.end method

.method public reset()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 313
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->file:Ljava/lang/String;

    .line 314
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->date:Ljava/lang/String;

    .line 315
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->author:Ljava/lang/String;

    .line 316
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->comment:Ljava/lang/String;

    .line 317
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->revision:Ljava/lang/String;

    .line 318
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->previousRevision:Ljava/lang/String;

    .line 319
    return-void
.end method

.method public stdout(Ljava/lang/String;)V
    .locals 1
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 126
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->status:I

    packed-switch v0, :pswitch_data_0

    .line 153
    :goto_0
    return-void

    .line 130
    :pswitch_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->reset()V

    .line 131
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->processFile(Ljava/lang/String;)V

    goto :goto_0

    .line 134
    :pswitch_1
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->processRevision(Ljava/lang/String;)V

    goto :goto_0

    .line 138
    :pswitch_2
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->processDate(Ljava/lang/String;)V

    goto :goto_0

    .line 142
    :pswitch_3
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->processComment(Ljava/lang/String;)V

    goto :goto_0

    .line 146
    :pswitch_4
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->processGetPreviousRevision(Ljava/lang/String;)V

    goto :goto_0

    .line 126
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_4
    .end packed-switch
.end method
