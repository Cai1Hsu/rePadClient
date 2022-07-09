.class public Lorg/apache/tools/ant/helper/ProjectHelper2$TargetHandler;
.super Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;
.source "ProjectHelper2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/helper/ProjectHelper2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TargetHandler"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 891
    invoke-direct {p0}, Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;-><init>()V

    return-void
.end method

.method private getTargetPrefix(Lorg/apache/tools/ant/helper/AntXMLContext;)Ljava/lang/String;
    .locals 3
    .param p1, "context"    # Lorg/apache/tools/ant/helper/AntXMLContext;

    .prologue
    .line 1058
    invoke-static {}, Lorg/apache/tools/ant/ProjectHelper;->getCurrentTargetPrefix()Ljava/lang/String;

    move-result-object v0

    .line 1059
    .local v0, "configuredValue":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    .line 1060
    const/4 v0, 0x0

    .line 1062
    :cond_0
    if-eqz v0, :cond_1

    .line 1071
    .end local v0    # "configuredValue":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 1066
    .restart local v0    # "configuredValue":Ljava/lang/String;
    :cond_1
    invoke-virtual {p1}, Lorg/apache/tools/ant/helper/AntXMLContext;->getCurrentProjectName()Ljava/lang/String;

    move-result-object v1

    .line 1067
    .local v1, "projectName":Ljava/lang/String;
    const-string/jumbo v2, ""

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1068
    const/4 v1, 0x0

    :cond_2
    move-object v0, v1

    .line 1071
    goto :goto_0
.end method


# virtual methods
.method public onEndElement(Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/helper/AntXMLContext;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "context"    # Lorg/apache/tools/ant/helper/AntXMLContext;

    .prologue
    .line 1103
    invoke-virtual {p3}, Lorg/apache/tools/ant/helper/AntXMLContext;->getImplicitTarget()Lorg/apache/tools/ant/Target;

    move-result-object v0

    invoke-virtual {p3, v0}, Lorg/apache/tools/ant/helper/AntXMLContext;->setCurrentTarget(Lorg/apache/tools/ant/Target;)V

    .line 1104
    return-void
.end method

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
    .line 1091
    invoke-static {}, Lorg/apache/tools/ant/helper/ProjectHelper2;->access$400()Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    move-result-object v0

    return-object v0
.end method

.method public onStartElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;Lorg/apache/tools/ant/helper/AntXMLContext;)V
    .locals 28
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
    .line 915
    const/4 v13, 0x0

    .line 916
    .local v13, "name":Ljava/lang/String;
    const-string/jumbo v4, ""

    .line 917
    .local v4, "depends":Ljava/lang/String;
    const/4 v6, 0x0

    .line 918
    .local v6, "extensionPoint":Ljava/lang/String;
    const/4 v7, 0x0

    .line 920
    .local v7, "extensionPointMissing":Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v17

    .line 921
    .local v17, "project":Lorg/apache/tools/ant/Project;
    const-string/jumbo v24, "target"

    move-object/from16 v0, v24

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_1

    new-instance v20, Lorg/apache/tools/ant/Target;

    invoke-direct/range {v20 .. v20}, Lorg/apache/tools/ant/Target;-><init>()V

    .line 923
    .local v20, "target":Lorg/apache/tools/ant/Target;
    :goto_0
    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Target;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 924
    new-instance v24, Lorg/apache/tools/ant/Location;

    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getLocator()Lorg/xml/sax/Locator;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Lorg/apache/tools/ant/Location;-><init>(Lorg/xml/sax/Locator;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Target;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 925
    move-object/from16 v0, p5

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/helper/AntXMLContext;->addTarget(Lorg/apache/tools/ant/Target;)V

    .line 927
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_1
    invoke-interface/range {p4 .. p4}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v24

    move/from16 v0, v24

    if-ge v9, v0, :cond_b

    .line 928
    move-object/from16 v0, p4

    invoke-interface {v0, v9}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v3

    .line 929
    .local v3, "attrUri":Ljava/lang/String;
    if-eqz v3, :cond_2

    const-string/jumbo v24, ""

    move-object/from16 v0, v24

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_2

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_2

    .line 927
    :cond_0
    :goto_2
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 921
    .end local v3    # "attrUri":Ljava/lang/String;
    .end local v9    # "i":I
    .end local v20    # "target":Lorg/apache/tools/ant/Target;
    :cond_1
    new-instance v20, Lorg/apache/tools/ant/ExtensionPoint;

    invoke-direct/range {v20 .. v20}, Lorg/apache/tools/ant/ExtensionPoint;-><init>()V

    goto :goto_0

    .line 932
    .restart local v3    # "attrUri":Ljava/lang/String;
    .restart local v9    # "i":I
    .restart local v20    # "target":Lorg/apache/tools/ant/Target;
    :cond_2
    move-object/from16 v0, p4

    invoke-interface {v0, v9}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v12

    .line 933
    .local v12, "key":Ljava/lang/String;
    move-object/from16 v0, p4

    invoke-interface {v0, v9}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v23

    .line 935
    .local v23, "value":Ljava/lang/String;
    const-string/jumbo v24, "name"

    move-object/from16 v0, v24

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_3

    .line 936
    move-object/from16 v13, v23

    .line 937
    const-string/jumbo v24, ""

    move-object/from16 v0, v24

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_0

    .line 938
    new-instance v24, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v25, "name attribute must not be empty"

    invoke-direct/range {v24 .. v25}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 940
    :cond_3
    const-string/jumbo v24, "depends"

    move-object/from16 v0, v24

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_4

    .line 941
    move-object/from16 v4, v23

    goto :goto_2

    .line 942
    :cond_4
    const-string/jumbo v24, "if"

    move-object/from16 v0, v24

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_5

    .line 943
    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Target;->setIf(Ljava/lang/String;)V

    goto :goto_2

    .line 944
    :cond_5
    const-string/jumbo v24, "unless"

    move-object/from16 v0, v24

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_6

    .line 945
    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Target;->setUnless(Ljava/lang/String;)V

    goto :goto_2

    .line 946
    :cond_6
    const-string/jumbo v24, "id"

    move-object/from16 v0, v24

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_7

    .line 947
    if-eqz v23, :cond_0

    const-string/jumbo v24, ""

    invoke-virtual/range {v23 .. v24}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_0

    .line 948
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v23

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 950
    :cond_7
    const-string/jumbo v24, "description"

    move-object/from16 v0, v24

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_8

    .line 951
    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Target;->setDescription(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 952
    :cond_8
    const-string/jumbo v24, "extensionOf"

    move-object/from16 v0, v24

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_9

    .line 953
    move-object/from16 v6, v23

    goto/16 :goto_2

    .line 954
    :cond_9
    const-string/jumbo v24, "onMissingExtensionPoint"

    move-object/from16 v0, v24

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_a

    .line 956
    :try_start_0
    invoke-static/range {v23 .. v23}, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->valueOf(Ljava/lang/String;)Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    goto/16 :goto_2

    .line 957
    :catch_0
    move-exception v5

    .line 958
    .local v5, "e":Ljava/lang/IllegalArgumentException;
    new-instance v24, Lorg/apache/tools/ant/BuildException;

    new-instance v25, Ljava/lang/StringBuffer;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v26, "Invalid onMissingExtensionPoint "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 961
    .end local v5    # "e":Ljava/lang/IllegalArgumentException;
    :cond_a
    new-instance v24, Lorg/xml/sax/SAXParseException;

    new-instance v25, Ljava/lang/StringBuffer;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v26, "Unexpected attribute \""

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    const-string/jumbo v26, "\""

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getLocator()Lorg/xml/sax/Locator;

    move-result-object v26

    invoke-direct/range {v24 .. v26}, Lorg/xml/sax/SAXParseException;-><init>(Ljava/lang/String;Lorg/xml/sax/Locator;)V

    throw v24

    .line 966
    .end local v3    # "attrUri":Ljava/lang/String;
    .end local v12    # "key":Ljava/lang/String;
    .end local v23    # "value":Ljava/lang/String;
    :cond_b
    if-nez v13, :cond_c

    .line 967
    new-instance v24, Lorg/xml/sax/SAXParseException;

    const-string/jumbo v25, "target element appears without a name attribute"

    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getLocator()Lorg/xml/sax/Locator;

    move-result-object v26

    invoke-direct/range {v24 .. v26}, Lorg/xml/sax/SAXParseException;-><init>(Ljava/lang/String;Lorg/xml/sax/Locator;)V

    throw v24

    .line 971
    :cond_c
    const/16 v16, 0x0

    .line 972
    .local v16, "prefix":Ljava/lang/String;
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->isIgnoringProjectTag()Z

    move-result v24

    if-eqz v24, :cond_d

    invoke-static {}, Lorg/apache/tools/ant/ProjectHelper;->isInIncludeMode()Z

    move-result v24

    if-eqz v24, :cond_d

    const/4 v10, 0x1

    .line 974
    .local v10, "isInIncludeMode":Z
    :goto_3
    invoke-static {}, Lorg/apache/tools/ant/ProjectHelper;->getCurrentPrefixSeparator()Ljava/lang/String;

    move-result-object v19

    .line 976
    .local v19, "sep":Ljava/lang/String;
    if-eqz v10, :cond_f

    .line 977
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/helper/ProjectHelper2$TargetHandler;->getTargetPrefix(Lorg/apache/tools/ant/helper/AntXMLContext;)Ljava/lang/String;

    move-result-object v16

    .line 978
    if-nez v16, :cond_e

    .line 979
    new-instance v24, Lorg/apache/tools/ant/BuildException;

    new-instance v25, Ljava/lang/StringBuffer;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v26, "can\'t include build file "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getBuildFileURL()Ljava/net/URL;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v25

    const-string/jumbo v26, ", no as attribute has been given"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    const-string/jumbo v26, " and the project tag doesn\'t"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    const-string/jumbo v26, " specify a name attribute"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 972
    .end local v10    # "isInIncludeMode":Z
    .end local v19    # "sep":Ljava/lang/String;
    :cond_d
    const/4 v10, 0x0

    goto :goto_3

    .line 985
    .restart local v10    # "isInIncludeMode":Z
    .restart local v19    # "sep":Ljava/lang/String;
    :cond_e
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    .line 989
    :cond_f
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getCurrentTargets()Ljava/util/Map;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-interface {v0, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v24

    if-eqz v24, :cond_10

    .line 990
    new-instance v24, Lorg/apache/tools/ant/BuildException;

    new-instance v25, Ljava/lang/StringBuffer;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v26, "Duplicate target \'"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    const-string/jumbo v26, "\'"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v20 .. v20}, Lorg/apache/tools/ant/Target;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v26

    invoke-direct/range {v24 .. v26}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v24

    .line 993
    :cond_10
    invoke-virtual/range {v17 .. v17}, Lorg/apache/tools/ant/Project;->getTargets()Ljava/util/Hashtable;

    move-result-object v18

    .line 994
    .local v18, "projectTargets":Ljava/util/Hashtable;
    const/16 v22, 0x0

    .line 996
    .local v22, "usedTarget":Z
    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_13

    .line 997
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "Already defined in main or a previous import, ignore "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x3

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 1006
    :goto_4
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v24

    if-lez v24, :cond_11

    .line 1007
    if-nez v10, :cond_14

    .line 1008
    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/Target;->setDepends(Ljava/lang/String;)V

    .line 1018
    :cond_11
    if-nez v10, :cond_12

    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->isIgnoringProjectTag()Z

    move-result v24

    if-eqz v24, :cond_12

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/helper/ProjectHelper2$TargetHandler;->getTargetPrefix(Lorg/apache/tools/ant/helper/AntXMLContext;)Ljava/lang/String;

    move-result-object v16

    if-eqz v16, :cond_12

    .line 1022
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    .line 1023
    .local v14, "newName":Ljava/lang/String;
    if-eqz v22, :cond_15

    new-instance v15, Lorg/apache/tools/ant/Target;

    move-object/from16 v0, v20

    invoke-direct {v15, v0}, Lorg/apache/tools/ant/Target;-><init>(Lorg/apache/tools/ant/Target;)V

    .line 1024
    .local v15, "newTarget":Lorg/apache/tools/ant/Target;
    :goto_5
    invoke-virtual {v15, v14}, Lorg/apache/tools/ant/Target;->setName(Ljava/lang/String;)V

    .line 1025
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getCurrentTargets()Ljava/util/Map;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-interface {v0, v14, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1026
    move-object/from16 v0, v17

    invoke-virtual {v0, v14, v15}, Lorg/apache/tools/ant/Project;->addOrReplaceTarget(Ljava/lang/String;Lorg/apache/tools/ant/Target;)V

    .line 1028
    .end local v14    # "newName":Ljava/lang/String;
    .end local v15    # "newTarget":Lorg/apache/tools/ant/Target;
    :cond_12
    if-eqz v7, :cond_16

    if-nez v6, :cond_16

    .line 1029
    new-instance v24, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v25, "onMissingExtensionPoint attribute cannot be specified unless extensionOf is specified"

    invoke-virtual/range {v20 .. v20}, Lorg/apache/tools/ant/Target;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v26

    invoke-direct/range {v24 .. v26}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v24

    .line 1000
    :cond_13
    move-object/from16 v0, v20

    invoke-virtual {v0, v13}, Lorg/apache/tools/ant/Target;->setName(Ljava/lang/String;)V

    .line 1001
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getCurrentTargets()Ljava/util/Map;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v20

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1002
    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v13, v1}, Lorg/apache/tools/ant/Project;->addOrReplaceTarget(Ljava/lang/String;Lorg/apache/tools/ant/Target;)V

    .line 1003
    const/16 v22, 0x1

    goto/16 :goto_4

    .line 1010
    :cond_14
    const-string/jumbo v24, "depends"

    move-object/from16 v0, v24

    invoke-static {v4, v13, v0}, Lorg/apache/tools/ant/Target;->parseDepends(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .line 1013
    .local v11, "iter":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_11

    .line 1014
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Target;->addDependency(Ljava/lang/String;)V

    goto :goto_6

    .end local v11    # "iter":Ljava/util/Iterator;
    .restart local v14    # "newName":Ljava/lang/String;
    :cond_15
    move-object/from16 v15, v20

    .line 1023
    goto :goto_5

    .line 1034
    .end local v14    # "newName":Ljava/lang/String;
    :cond_16
    if-eqz v6, :cond_19

    .line 1035
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v24

    const-string/jumbo v25, "ant.projectHelper"

    invoke-virtual/range {v24 .. v25}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/tools/ant/ProjectHelper;

    .line 1038
    .local v8, "helper":Lorg/apache/tools/ant/ProjectHelper;
    const-string/jumbo v24, "extensionOf"

    move-object/from16 v0, v24

    invoke-static {v6, v13, v0}, Lorg/apache/tools/ant/Target;->parseDepends(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .line 1041
    .restart local v11    # "iter":Ljava/util/Iterator;
    :goto_7
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_19

    .line 1042
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/String;

    .line 1043
    .local v21, "tgName":Ljava/lang/String;
    invoke-static {}, Lorg/apache/tools/ant/ProjectHelper;->isInIncludeMode()Z

    move-result v24

    if-eqz v24, :cond_17

    .line 1044
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v21

    .line 1046
    :cond_17
    if-nez v7, :cond_18

    .line 1047
    sget-object v7, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->FAIL:Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    .line 1051
    :cond_18
    invoke-virtual {v8}, Lorg/apache/tools/ant/ProjectHelper;->getExtensionStack()Ljava/util/List;

    move-result-object v24

    const/16 v25, 0x3

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    aput-object v21, v25, v26

    const/16 v26, 0x1

    aput-object v13, v25, v26

    const/16 v26, 0x2

    invoke-virtual {v7}, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->name()Ljava/lang/String;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-interface/range {v24 .. v25}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_7

    .line 1055
    .end local v8    # "helper":Lorg/apache/tools/ant/ProjectHelper;
    .end local v11    # "iter":Ljava/util/Iterator;
    .end local v21    # "tgName":Ljava/lang/String;
    :cond_19
    return-void
.end method
