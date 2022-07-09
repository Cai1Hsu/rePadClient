.class Lorg/apache/tools/ant/helper/ProjectHelperImpl$DescriptionHandler;
.super Lorg/apache/tools/ant/helper/ProjectHelperImpl$AbstractHandler;
.source "ProjectHelperImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/helper/ProjectHelperImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DescriptionHandler"
.end annotation


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;)V
    .locals 0
    .param p1, "helperImpl"    # Lorg/apache/tools/ant/helper/ProjectHelperImpl;
    .param p2, "parentHandler"    # Lorg/xml/sax/DocumentHandler;

    .prologue
    .line 624
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$AbstractHandler;-><init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;)V

    .line 625
    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 4
    .param p1, "buf"    # [C
    .param p2, "start"    # I
    .param p3, "count"    # I

    .prologue
    .line 636
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    .line 637
    .local v1, "text":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DescriptionHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/Project;->getDescription()Ljava/lang/String;

    move-result-object v0

    .line 638
    .local v0, "currentDescription":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 639
    iget-object v2, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DescriptionHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/apache/tools/ant/Project;->setDescription(Ljava/lang/String;)V

    .line 643
    :goto_0
    return-void

    .line 641
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DescriptionHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/Project;->setDescription(Ljava/lang/String;)V

    goto :goto_0
.end method
