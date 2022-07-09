.class public Lorg/apache/tools/ant/helper/ProjectHelper2$ProjectHandler;
.super Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;
.source "ProjectHelper2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/helper/ProjectHelper2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ProjectHandler"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 701
    invoke-direct {p0}, Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onStartChild(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;Lorg/apache/tools/ant/helper/AntXMLContext;)Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "qname"    # Ljava/lang/String;
    .param p4, "attrs"    # Lorg/xml/sax/Attributes;
    .param p5, "context"    # Lorg/apache/tools/ant/helper/AntXMLContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXParseException;
        }
    .end annotation

    .prologue
    .line 882
    const-string/jumbo v0, "target"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "extension-point"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    const-string/jumbo v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "antlib:org.apache.tools.ant"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    invoke-static {}, Lorg/apache/tools/ant/helper/ProjectHelper2;->access$300()Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_2
    invoke-static {}, Lorg/apache/tools/ant/helper/ProjectHelper2;->access$400()Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    move-result-object v0

    goto :goto_0
.end method

.method public onStartElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;Lorg/apache/tools/ant/helper/AntXMLContext;)V
    .locals 18
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "qname"    # Ljava/lang/String;
    .param p4, "attrs"    # Lorg/xml/sax/Attributes;
    .param p5, "context"    # Lorg/apache/tools/ant/helper/AntXMLContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXParseException;
        }
    .end annotation

    .prologue
    .line 724
    const/4 v3, 0x0

    .line 725
    .local v3, "baseDir":Ljava/lang/String;
    const/4 v11, 0x0

    .line 727
    .local v11, "nameAttributeSet":Z
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v12

    .line 729
    .local v12, "project":Lorg/apache/tools/ant/Project;
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getImplicitTarget()Lorg/apache/tools/ant/Target;

    move-result-object v15

    new-instance v16, Lorg/apache/tools/ant/Location;

    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getLocator()Lorg/xml/sax/Locator;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Lorg/apache/tools/ant/Location;-><init>(Lorg/xml/sax/Locator;)V

    invoke-virtual/range {v15 .. v16}, Lorg/apache/tools/ant/Target;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 742
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    invoke-interface/range {p4 .. p4}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v15

    if-ge v8, v15, :cond_8

    .line 743
    move-object/from16 v0, p4

    invoke-interface {v0, v8}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v2

    .line 744
    .local v2, "attrUri":Ljava/lang/String;
    if-eqz v2, :cond_1

    const-string/jumbo v15, ""

    invoke-virtual {v2, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_1

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_1

    .line 742
    :cond_0
    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 747
    :cond_1
    move-object/from16 v0, p4

    invoke-interface {v0, v8}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v9

    .line 748
    .local v9, "key":Ljava/lang/String;
    move-object/from16 v0, p4

    invoke-interface {v0, v8}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v14

    .line 750
    .local v14, "value":Ljava/lang/String;
    const-string/jumbo v15, "default"

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_2

    .line 751
    if-eqz v14, :cond_0

    const-string/jumbo v15, ""

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_0

    .line 752
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->isIgnoringProjectTag()Z

    move-result v15

    if-nez v15, :cond_0

    .line 753
    invoke-virtual {v12, v14}, Lorg/apache/tools/ant/Project;->setDefault(Ljava/lang/String;)V

    goto :goto_1

    .line 756
    :cond_2
    const-string/jumbo v15, "name"

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_5

    .line 757
    if-eqz v14, :cond_0

    .line 758
    move-object/from16 v0, p5

    invoke-virtual {v0, v14}, Lorg/apache/tools/ant/helper/AntXMLContext;->setCurrentProjectName(Ljava/lang/String;)V

    .line 759
    const/4 v11, 0x1

    .line 760
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->isIgnoringProjectTag()Z

    move-result v15

    if-nez v15, :cond_3

    .line 761
    invoke-virtual {v12, v14}, Lorg/apache/tools/ant/Project;->setName(Ljava/lang/String;)V

    .line 762
    invoke-virtual {v12, v14, v12}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 763
    :cond_3
    invoke-static {}, Lorg/apache/tools/ant/ProjectHelper;->isInIncludeMode()Z

    move-result v15

    if-eqz v15, :cond_0

    .line 764
    const-string/jumbo v15, ""

    invoke-virtual {v15, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_0

    invoke-static {}, Lorg/apache/tools/ant/ProjectHelper;->getCurrentTargetPrefix()Ljava/lang/String;

    move-result-object v15

    if-eqz v15, :cond_4

    invoke-static {}, Lorg/apache/tools/ant/ProjectHelper;->getCurrentTargetPrefix()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v15

    if-nez v15, :cond_0

    .line 769
    :cond_4
    invoke-static {v14}, Lorg/apache/tools/ant/ProjectHelper;->setCurrentTargetPrefix(Ljava/lang/String;)V

    goto :goto_1

    .line 773
    :cond_5
    const-string/jumbo v15, "id"

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_6

    .line 774
    if-eqz v14, :cond_0

    .line 776
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->isIgnoringProjectTag()Z

    move-result v15

    if-nez v15, :cond_0

    .line 777
    invoke-virtual {v12, v14, v12}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 780
    :cond_6
    const-string/jumbo v15, "basedir"

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_7

    .line 781
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->isIgnoringProjectTag()Z

    move-result v15

    if-nez v15, :cond_0

    .line 782
    move-object v3, v14

    goto/16 :goto_1

    .line 786
    :cond_7
    new-instance v15, Lorg/xml/sax/SAXParseException;

    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v17, "Unexpected attribute \""

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    move-object/from16 v0, p4

    invoke-interface {v0, v8}, Lorg/xml/sax/Attributes;->getQName(I)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    const-string/jumbo v17, "\""

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getLocator()Lorg/xml/sax/Locator;

    move-result-object v17

    invoke-direct/range {v15 .. v17}, Lorg/xml/sax/SAXParseException;-><init>(Ljava/lang/String;Lorg/xml/sax/Locator;)V

    throw v15

    .line 792
    .end local v2    # "attrUri":Ljava/lang/String;
    .end local v9    # "key":Ljava/lang/String;
    .end local v14    # "value":Ljava/lang/String;
    :cond_8
    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "ant.file."

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getCurrentProjectName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 794
    .local v1, "antFileProp":Ljava/lang/String;
    invoke-virtual {v12, v1}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 795
    .local v5, "dup":Ljava/lang/String;
    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "ant.file.type."

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getCurrentProjectName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    .line 797
    .local v13, "typeProp":Ljava/lang/String;
    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 798
    .local v7, "dupType":Ljava/lang/String;
    if-eqz v5, :cond_9

    if-eqz v11, :cond_9

    .line 799
    const/4 v6, 0x0

    .line 800
    .local v6, "dupFile":Ljava/lang/Object;
    const/4 v4, 0x0

    .line 801
    .local v4, "contextFile":Ljava/lang/Object;
    const-string/jumbo v15, "url"

    invoke-virtual {v15, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_b

    .line 803
    :try_start_0
    new-instance v6, Ljava/net/URL;

    .end local v6    # "dupFile":Ljava/lang/Object;
    invoke-direct {v6, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 810
    .local v6, "dupFile":Ljava/net/URL;
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getBuildFileURL()Ljava/net/URL;

    move-result-object v4

    .line 816
    .end local v4    # "contextFile":Ljava/lang/Object;
    .end local v6    # "dupFile":Ljava/net/URL;
    :goto_2
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->isIgnoringProjectTag()Z

    move-result v15

    if-eqz v15, :cond_9

    invoke-virtual {v6, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_9

    .line 817
    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "Duplicated project name in import. Project "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getCurrentProjectName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    const-string/jumbo v16, " defined first in "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    const-string/jumbo v16, " and again in "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v12, v15, v0}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 822
    :cond_9
    if-eqz v11, :cond_a

    .line 823
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getBuildFile()Ljava/io/File;

    move-result-object v15

    if-eqz v15, :cond_c

    .line 824
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getBuildFile()Ljava/io/File;

    move-result-object v15

    invoke-virtual {v15}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v1, v15}, Lorg/apache/tools/ant/Project;->setUserProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 826
    const-string/jumbo v15, "file"

    invoke-virtual {v12, v13, v15}, Lorg/apache/tools/ant/Project;->setUserProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 835
    :cond_a
    :goto_3
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->isIgnoringProjectTag()Z

    move-result v15

    if-eqz v15, :cond_d

    .line 858
    :goto_4
    return-void

    .line 804
    .restart local v4    # "contextFile":Ljava/lang/Object;
    :catch_0
    move-exception v10

    .line 805
    .local v10, "mue":Ljava/net/MalformedURLException;
    new-instance v15, Lorg/apache/tools/ant/BuildException;

    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v17, "failed to parse "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    const-string/jumbo v17, " as URL while looking"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    const-string/jumbo v17, " at a duplicate project"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    const-string/jumbo v17, " name."

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v15

    .line 812
    .end local v10    # "mue":Ljava/net/MalformedURLException;
    .local v6, "dupFile":Ljava/lang/Object;
    :cond_b
    new-instance v6, Ljava/io/File;

    .end local v6    # "dupFile":Ljava/lang/Object;
    invoke-direct {v6, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 813
    .local v6, "dupFile":Ljava/io/File;
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getBuildFile()Ljava/io/File;

    move-result-object v4

    .local v4, "contextFile":Ljava/io/File;
    goto/16 :goto_2

    .line 828
    .end local v4    # "contextFile":Ljava/io/File;
    .end local v6    # "dupFile":Ljava/io/File;
    :cond_c
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getBuildFileURL()Ljava/net/URL;

    move-result-object v15

    if-eqz v15, :cond_a

    .line 829
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getBuildFileURL()Ljava/net/URL;

    move-result-object v15

    invoke-virtual {v15}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v1, v15}, Lorg/apache/tools/ant/Project;->setUserProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 831
    const-string/jumbo v15, "url"

    invoke-virtual {v12, v13, v15}, Lorg/apache/tools/ant/Project;->setUserProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 840
    :cond_d
    const-string/jumbo v15, "basedir"

    invoke-virtual {v12, v15}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    if-eqz v15, :cond_e

    .line 841
    const-string/jumbo v15, "basedir"

    invoke-virtual {v12, v15}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v15}, Lorg/apache/tools/ant/Project;->setBasedir(Ljava/lang/String;)V

    .line 856
    :goto_5
    const-string/jumbo v15, ""

    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getImplicitTarget()Lorg/apache/tools/ant/Target;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v12, v15, v0}, Lorg/apache/tools/ant/Project;->addTarget(Ljava/lang/String;Lorg/apache/tools/ant/Target;)V

    .line 857
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getImplicitTarget()Lorg/apache/tools/ant/Target;

    move-result-object v15

    move-object/from16 v0, p5

    invoke-virtual {v0, v15}, Lorg/apache/tools/ant/helper/AntXMLContext;->setCurrentTarget(Lorg/apache/tools/ant/Target;)V

    goto :goto_4

    .line 844
    :cond_e
    if-nez v3, :cond_f

    .line 845
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getBuildFileParent()Ljava/io/File;

    move-result-object v15

    invoke-virtual {v15}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v15}, Lorg/apache/tools/ant/Project;->setBasedir(Ljava/lang/String;)V

    goto :goto_5

    .line 848
    :cond_f
    new-instance v15, Ljava/io/File;

    invoke-direct {v15, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljava/io/File;->isAbsolute()Z

    move-result v15

    if-eqz v15, :cond_10

    .line 849
    invoke-virtual {v12, v3}, Lorg/apache/tools/ant/Project;->setBasedir(Ljava/lang/String;)V

    goto :goto_5

    .line 851
    :cond_10
    invoke-static {}, Lorg/apache/tools/ant/helper/ProjectHelper2;->access$100()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v15

    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getBuildFileParent()Ljava/io/File;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v15, v0, v3}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v15

    invoke-virtual {v12, v15}, Lorg/apache/tools/ant/Project;->setBaseDir(Ljava/io/File;)V

    goto :goto_5
.end method
