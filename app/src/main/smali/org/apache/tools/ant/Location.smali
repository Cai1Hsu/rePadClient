.class public Lorg/apache/tools/ant/Location;
.super Ljava/lang/Object;
.source "Location.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field public static final UNKNOWN_LOCATION:Lorg/apache/tools/ant/Location;


# instance fields
.field private final columnNumber:I

.field private final fileName:Ljava/lang/String;

.field private final lineNumber:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    new-instance v0, Lorg/apache/tools/ant/Location;

    invoke-direct {v0}, Lorg/apache/tools/ant/Location;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/Location;->UNKNOWN_LOCATION:Lorg/apache/tools/ant/Location;

    .line 43
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/Location;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 49
    const/4 v0, 0x0

    invoke-direct {p0, v0, v1, v1}, Lorg/apache/tools/ant/Location;-><init>(Ljava/lang/String;II)V

    .line 50
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 61
    invoke-direct {p0, p1, v0, v0}, Lorg/apache/tools/ant/Location;-><init>(Ljava/lang/String;II)V

    .line 62
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 1
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "lineNumber"    # I
    .param p3, "columnNumber"    # I

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    if-eqz p1, :cond_0

    const-string/jumbo v0, "file:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 90
    sget-object v0, Lorg/apache/tools/ant/Location;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/FileUtils;->fromURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/Location;->fileName:Ljava/lang/String;

    .line 94
    :goto_0
    iput p2, p0, Lorg/apache/tools/ant/Location;->lineNumber:I

    .line 95
    iput p3, p0, Lorg/apache/tools/ant/Location;->columnNumber:I

    .line 96
    return-void

    .line 92
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/Location;->fileName:Ljava/lang/String;

    goto :goto_0
.end method

.method public constructor <init>(Lorg/xml/sax/Locator;)V
    .locals 3
    .param p1, "loc"    # Lorg/xml/sax/Locator;

    .prologue
    .line 73
    invoke-interface {p1}, Lorg/xml/sax/Locator;->getSystemId()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lorg/xml/sax/Locator;->getLineNumber()I

    move-result v1

    invoke-interface {p1}, Lorg/xml/sax/Locator;->getColumnNumber()I

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/tools/ant/Location;-><init>(Ljava/lang/String;II)V

    .line 74
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 157
    if-ne p0, p1, :cond_1

    .line 158
    const/4 v0, 0x1

    .line 166
    :cond_0
    :goto_0
    return v0

    .line 160
    :cond_1
    if-eqz p1, :cond_0

    .line 163
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-ne v1, v2, :cond_0

    .line 166
    invoke-virtual {p0}, Lorg/apache/tools/ant/Location;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public getColumnNumber()I
    .locals 1

    .prologue
    .line 119
    iget v0, p0, Lorg/apache/tools/ant/Location;->columnNumber:I

    return v0
.end method

.method public getFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lorg/apache/tools/ant/Location;->fileName:Ljava/lang/String;

    return-object v0
.end method

.method public getLineNumber()I
    .locals 1

    .prologue
    .line 111
    iget v0, p0, Lorg/apache/tools/ant/Location;->lineNumber:I

    return v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 175
    invoke-virtual {p0}, Lorg/apache/tools/ant/Location;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 133
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 135
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lorg/apache/tools/ant/Location;->fileName:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 136
    iget-object v1, p0, Lorg/apache/tools/ant/Location;->fileName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 138
    iget v1, p0, Lorg/apache/tools/ant/Location;->lineNumber:I

    if-eqz v1, :cond_0

    .line 139
    const-string/jumbo v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 140
    iget v1, p0, Lorg/apache/tools/ant/Location;->lineNumber:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 143
    :cond_0
    const-string/jumbo v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 146
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
