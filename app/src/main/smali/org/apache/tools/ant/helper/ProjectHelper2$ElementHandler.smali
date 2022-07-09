.class public Lorg/apache/tools/ant/helper/ProjectHelper2$ElementHandler;
.super Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;
.source "ProjectHelper2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/helper/ProjectHelper2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ElementHandler"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1115
    invoke-direct {p0}, Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;-><init>()V

    .line 1116
    return-void
.end method


# virtual methods
.method public characters([CIILorg/apache/tools/ant/helper/AntXMLContext;)V
    .locals 1
    .param p1, "buf"    # [C
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "context"    # Lorg/apache/tools/ant/helper/AntXMLContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXParseException;
        }
    .end annotation

    .prologue
    .line 1224
    invoke-virtual {p4}, Lorg/apache/tools/ant/helper/AntXMLContext;->currentWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v0

    .line 1225
    .local v0, "wrapper":Lorg/apache/tools/ant/RuntimeConfigurable;
    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/tools/ant/RuntimeConfigurable;->addText([CII)V

    .line 1226
    return-void
.end method

.method public onEndElement(Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/helper/AntXMLContext;)V
    .locals 0
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "context"    # Lorg/apache/tools/ant/helper/AntXMLContext;

    .prologue
    .line 1259
    invoke-virtual {p3}, Lorg/apache/tools/ant/helper/AntXMLContext;->popWrapper()V

    .line 1260
    return-void
.end method

.method public onStartChild(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;Lorg/apache/tools/ant/helper/AntXMLContext;)Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;
    .locals 1
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
    .line 1247
    invoke-static {}, Lorg/apache/tools/ant/helper/ProjectHelper2;->access$400()Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    move-result-object v0

    return-object v0
.end method

.method public onStartElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;Lorg/apache/tools/ant/helper/AntXMLContext;)V
    .locals 17
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
    .line 1138
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->currentWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v9

    .line 1139
    .local v9, "parentWrapper":Lorg/apache/tools/ant/RuntimeConfigurable;
    const/4 v8, 0x0

    .line 1141
    .local v8, "parent":Ljava/lang/Object;
    if-eqz v9, :cond_0

    .line 1142
    invoke-virtual {v9}, Lorg/apache/tools/ant/RuntimeConfigurable;->getProxy()Ljava/lang/Object;

    move-result-object v8

    .line 1147
    .end local v8    # "parent":Ljava/lang/Object;
    :cond_0
    new-instance v11, Lorg/apache/tools/ant/UnknownElement;

    move-object/from16 v0, p2

    invoke-direct {v11, v0}, Lorg/apache/tools/ant/UnknownElement;-><init>(Ljava/lang/String;)V

    .line 1148
    .local v11, "task":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v14

    invoke-virtual {v11, v14}, Lorg/apache/tools/ant/UnknownElement;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 1149
    move-object/from16 v0, p1

    invoke-virtual {v11, v0}, Lorg/apache/tools/ant/UnknownElement;->setNamespace(Ljava/lang/String;)V

    .line 1150
    move-object/from16 v0, p3

    invoke-virtual {v11, v0}, Lorg/apache/tools/ant/UnknownElement;->setQName(Ljava/lang/String;)V

    .line 1151
    invoke-virtual {v11}, Lorg/apache/tools/ant/UnknownElement;->getNamespace()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-static {v14, v0}, Lorg/apache/tools/ant/ProjectHelper;->genComponentName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v14}, Lorg/apache/tools/ant/UnknownElement;->setTaskType(Ljava/lang/String;)V

    .line 1152
    move-object/from16 v0, p3

    invoke-virtual {v11, v0}, Lorg/apache/tools/ant/UnknownElement;->setTaskName(Ljava/lang/String;)V

    .line 1154
    new-instance v5, Lorg/apache/tools/ant/Location;

    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getLocator()Lorg/xml/sax/Locator;

    move-result-object v14

    invoke-interface {v14}, Lorg/xml/sax/Locator;->getSystemId()Ljava/lang/String;

    move-result-object v14

    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getLocator()Lorg/xml/sax/Locator;

    move-result-object v15

    invoke-interface {v15}, Lorg/xml/sax/Locator;->getLineNumber()I

    move-result v15

    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getLocator()Lorg/xml/sax/Locator;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Lorg/xml/sax/Locator;->getColumnNumber()I

    move-result v16

    move/from16 v0, v16

    invoke-direct {v5, v14, v15, v0}, Lorg/apache/tools/ant/Location;-><init>(Ljava/lang/String;II)V

    .line 1156
    .local v5, "location":Lorg/apache/tools/ant/Location;
    invoke-virtual {v11, v5}, Lorg/apache/tools/ant/UnknownElement;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 1157
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getCurrentTarget()Lorg/apache/tools/ant/Target;

    move-result-object v14

    invoke-virtual {v11, v14}, Lorg/apache/tools/ant/UnknownElement;->setOwningTarget(Lorg/apache/tools/ant/Target;)V

    .line 1159
    if-eqz v8, :cond_3

    .line 1161
    check-cast v8, Lorg/apache/tools/ant/UnknownElement;

    invoke-virtual {v8, v11}, Lorg/apache/tools/ant/UnknownElement;->addChild(Lorg/apache/tools/ant/UnknownElement;)V

    .line 1167
    :goto_0
    move-object/from16 v0, p5

    move-object/from16 v1, p4

    invoke-virtual {v0, v11, v1}, Lorg/apache/tools/ant/helper/AntXMLContext;->configureId(Ljava/lang/Object;Lorg/xml/sax/Attributes;)V

    .line 1172
    new-instance v13, Lorg/apache/tools/ant/RuntimeConfigurable;

    invoke-virtual {v11}, Lorg/apache/tools/ant/UnknownElement;->getTaskName()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v11, v14}, Lorg/apache/tools/ant/RuntimeConfigurable;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1174
    .local v13, "wrapper":Lorg/apache/tools/ant/RuntimeConfigurable;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    invoke-interface/range {p4 .. p4}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v14

    if-ge v3, v14, :cond_6

    .line 1175
    move-object/from16 v0, p4

    invoke-interface {v0, v3}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v7

    .line 1176
    .local v7, "name":Ljava/lang/String;
    move-object/from16 v0, p4

    invoke-interface {v0, v3}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v2

    .line 1177
    .local v2, "attrUri":Ljava/lang/String;
    if-eqz v2, :cond_1

    const-string/jumbo v14, ""

    invoke-virtual {v2, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_1

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_1

    .line 1178
    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v14, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string/jumbo v15, ":"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    move-object/from16 v0, p4

    invoke-interface {v0, v3}, Lorg/xml/sax/Attributes;->getQName(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    .line 1180
    :cond_1
    move-object/from16 v0, p4

    invoke-interface {v0, v3}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v12

    .line 1185
    .local v12, "value":Ljava/lang/String;
    const-string/jumbo v14, "ant-type"

    invoke-virtual {v14, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_2

    const-string/jumbo v14, "antlib:org.apache.tools.ant"

    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_5

    const-string/jumbo v14, "ant-type"

    move-object/from16 v0, p4

    invoke-interface {v0, v3}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_5

    .line 1188
    :cond_2
    const-string/jumbo v7, "ant-type"

    .line 1189
    const-string/jumbo v14, ":"

    invoke-virtual {v12, v14}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 1190
    .local v4, "index":I
    if-ltz v4, :cond_5

    .line 1191
    const/4 v14, 0x0

    invoke-virtual {v12, v14, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 1192
    .local v10, "prefix":Ljava/lang/String;
    move-object/from16 v0, p5

    invoke-virtual {v0, v10}, Lorg/apache/tools/ant/helper/AntXMLContext;->getPrefixMapping(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1193
    .local v6, "mappedUri":Ljava/lang/String;
    if-nez v6, :cond_4

    .line 1194
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "Unable to find XML NS prefix \""

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    const-string/jumbo v16, "\""

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 1164
    .end local v2    # "attrUri":Ljava/lang/String;
    .end local v3    # "i":I
    .end local v4    # "index":I
    .end local v6    # "mappedUri":Ljava/lang/String;
    .end local v7    # "name":Ljava/lang/String;
    .end local v10    # "prefix":Ljava/lang/String;
    .end local v12    # "value":Ljava/lang/String;
    .end local v13    # "wrapper":Lorg/apache/tools/ant/RuntimeConfigurable;
    :cond_3
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getCurrentTarget()Lorg/apache/tools/ant/Target;

    move-result-object v14

    invoke-virtual {v14, v11}, Lorg/apache/tools/ant/Target;->addTask(Lorg/apache/tools/ant/Task;)V

    goto/16 :goto_0

    .line 1197
    .restart local v2    # "attrUri":Ljava/lang/String;
    .restart local v3    # "i":I
    .restart local v4    # "index":I
    .restart local v6    # "mappedUri":Ljava/lang/String;
    .restart local v7    # "name":Ljava/lang/String;
    .restart local v10    # "prefix":Ljava/lang/String;
    .restart local v12    # "value":Ljava/lang/String;
    .restart local v13    # "wrapper":Lorg/apache/tools/ant/RuntimeConfigurable;
    :cond_4
    add-int/lit8 v14, v4, 0x1

    invoke-virtual {v12, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-static {v6, v14}, Lorg/apache/tools/ant/ProjectHelper;->genComponentName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 1201
    .end local v4    # "index":I
    .end local v6    # "mappedUri":Ljava/lang/String;
    .end local v10    # "prefix":Ljava/lang/String;
    :cond_5
    invoke-virtual {v13, v7, v12}, Lorg/apache/tools/ant/RuntimeConfigurable;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 1174
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1

    .line 1203
    .end local v2    # "attrUri":Ljava/lang/String;
    .end local v7    # "name":Ljava/lang/String;
    .end local v12    # "value":Ljava/lang/String;
    :cond_6
    if-eqz v9, :cond_7

    .line 1204
    invoke-virtual {v9, v13}, Lorg/apache/tools/ant/RuntimeConfigurable;->addChild(Lorg/apache/tools/ant/RuntimeConfigurable;)V

    .line 1206
    :cond_7
    move-object/from16 v0, p5

    invoke-virtual {v0, v13}, Lorg/apache/tools/ant/helper/AntXMLContext;->pushWrapper(Lorg/apache/tools/ant/RuntimeConfigurable;)V

    .line 1207
    return-void
.end method
