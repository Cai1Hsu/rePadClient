.class public Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;
.super Ljava/lang/Object;
.source "Javadoc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Javadoc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GroupArgument"
.end annotation


# instance fields
.field private packages:Ljava/util/Vector;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Javadoc;

.field private title:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/Javadoc;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Javadoc;

    .prologue
    .line 1456
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;->this$0:Lorg/apache/tools/ant/taskdefs/Javadoc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1453
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;->packages:Ljava/util/Vector;

    .line 1458
    return-void
.end method


# virtual methods
.method public addPackage(Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;)V
    .locals 1
    .param p1, "pn"    # Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;

    .prologue
    .line 1503
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;->packages:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1504
    return-void
.end method

.method public addTitle(Lorg/apache/tools/ant/taskdefs/Javadoc$Html;)V
    .locals 0
    .param p1, "text"    # Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    .prologue
    .line 1474
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;->title:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    .line 1475
    return-void
.end method

.method public getPackages()Ljava/lang/String;
    .locals 4

    .prologue
    .line 1511
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 1512
    .local v1, "p":Ljava/lang/StringBuffer;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;->packages:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v2

    .line 1513
    .local v2, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v2, :cond_1

    .line 1514
    if-lez v0, :cond_0

    .line 1515
    const-string/jumbo v3, ":"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1517
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;->packages:Ljava/util/Vector;

    invoke-virtual {v3, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1513
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1519
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1482
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;->title:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;->title:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;->getText()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setPackages(Ljava/lang/String;)V
    .locals 4
    .param p1, "src"    # Ljava/lang/String;

    .prologue
    .line 1490
    new-instance v2, Ljava/util/StringTokenizer;

    const-string/jumbo v3, ","

    invoke-direct {v2, p1, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1491
    .local v2, "tok":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1492
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v0

    .line 1493
    .local v0, "p":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;-><init>()V

    .line 1494
    .local v1, "pn":Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;
    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;->setName(Ljava/lang/String;)V

    .line 1495
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;->addPackage(Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;)V

    goto :goto_0

    .line 1497
    .end local v0    # "p":Ljava/lang/String;
    .end local v1    # "pn":Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;
    :cond_0
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 1
    .param p1, "src"    # Ljava/lang/String;

    .prologue
    .line 1465
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;-><init>()V

    .line 1466
    .local v0, "h":Lorg/apache/tools/ant/taskdefs/Javadoc$Html;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;->addText(Ljava/lang/String;)V

    .line 1467
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;->addTitle(Lorg/apache/tools/ant/taskdefs/Javadoc$Html;)V

    .line 1468
    return-void
.end method
