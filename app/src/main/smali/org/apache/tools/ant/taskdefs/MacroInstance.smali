.class public Lorg/apache/tools/ant/taskdefs/MacroInstance;
.super Lorg/apache/tools/ant/Task;
.source "MacroInstance.java"

# interfaces
.implements Lorg/apache/tools/ant/DynamicAttribute;
.implements Lorg/apache/tools/ant/TaskContainer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/MacroInstance$Element;
    }
.end annotation


# static fields
.field private static final STATE_EXPECT_BRACKET:I = 0x1

.field private static final STATE_EXPECT_NAME:I = 0x2

.field private static final STATE_NORMAL:I


# instance fields
.field private implicitTag:Ljava/lang/String;

.field private localAttributes:Ljava/util/Hashtable;

.field private macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;

.field private map:Ljava/util/Map;

.field private nsElements:Ljava/util/Map;

.field private presentElements:Ljava/util/Map;

.field private text:Ljava/lang/String;

.field private unknownElements:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 49
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 51
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->map:Ljava/util/Map;

    .line 52
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->nsElements:Ljava/util/Map;

    .line 55
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->text:Ljava/lang/String;

    .line 56
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->implicitTag:Ljava/lang/String;

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->unknownElements:Ljava/util/List;

    .line 144
    return-void
.end method

.method private copy(Lorg/apache/tools/ant/UnknownElement;Z)Lorg/apache/tools/ant/UnknownElement;
    .locals 21
    .param p1, "ue"    # Lorg/apache/tools/ant/UnknownElement;
    .param p2, "nested"    # Z

    .prologue
    .line 247
    new-instance v13, Lorg/apache/tools/ant/UnknownElement;

    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/UnknownElement;->getTag()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-direct {v13, v0}, Lorg/apache/tools/ant/UnknownElement;-><init>(Ljava/lang/String;)V

    .line 248
    .local v13, "ret":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/UnknownElement;->getNamespace()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lorg/apache/tools/ant/UnknownElement;->setNamespace(Ljava/lang/String;)V

    .line 249
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lorg/apache/tools/ant/UnknownElement;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 250
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/UnknownElement;->getQName()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lorg/apache/tools/ant/UnknownElement;->setQName(Ljava/lang/String;)V

    .line 251
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/UnknownElement;->getTaskType()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lorg/apache/tools/ant/UnknownElement;->setTaskType(Ljava/lang/String;)V

    .line 252
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/UnknownElement;->getTaskName()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lorg/apache/tools/ant/UnknownElement;->setTaskName(Ljava/lang/String;)V

    .line 253
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getBackTrace()Z

    move-result v18

    if-eqz v18, :cond_0

    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/UnknownElement;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v18

    :goto_0
    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lorg/apache/tools/ant/UnknownElement;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 255
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v18

    if-nez v18, :cond_1

    .line 256
    new-instance v14, Lorg/apache/tools/ant/Target;

    invoke-direct {v14}, Lorg/apache/tools/ant/Target;-><init>()V

    .line 257
    .local v14, "t":Lorg/apache/tools/ant/Target;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Lorg/apache/tools/ant/Target;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 258
    invoke-virtual {v13, v14}, Lorg/apache/tools/ant/UnknownElement;->setOwningTarget(Lorg/apache/tools/ant/Target;)V

    .line 262
    .end local v14    # "t":Lorg/apache/tools/ant/Target;
    :goto_1
    new-instance v12, Lorg/apache/tools/ant/RuntimeConfigurable;

    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/UnknownElement;->getTaskName()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-direct {v12, v13, v0}, Lorg/apache/tools/ant/RuntimeConfigurable;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    .line 264
    .local v12, "rc":Lorg/apache/tools/ant/RuntimeConfigurable;
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lorg/apache/tools/ant/RuntimeConfigurable;->getPolyType()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Lorg/apache/tools/ant/RuntimeConfigurable;->setPolyType(Ljava/lang/String;)V

    .line 265
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lorg/apache/tools/ant/RuntimeConfigurable;->getAttributeMap()Ljava/util/Hashtable;

    move-result-object v8

    .line 266
    .local v8, "m":Ljava/util/Map;
    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_2

    .line 267
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 268
    .local v5, "entry":Ljava/util/Map$Entry;
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->localAttributes:Ljava/util/Hashtable;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->macroSubs(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v12, v0, v1}, Lorg/apache/tools/ant/RuntimeConfigurable;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 253
    .end local v5    # "entry":Ljava/util/Map$Entry;
    .end local v6    # "i":Ljava/util/Iterator;
    .end local v8    # "m":Ljava/util/Map;
    .end local v12    # "rc":Lorg/apache/tools/ant/RuntimeConfigurable;
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v18

    goto :goto_0

    .line 260
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lorg/apache/tools/ant/UnknownElement;->setOwningTarget(Lorg/apache/tools/ant/Target;)V

    goto :goto_1

    .line 272
    .restart local v6    # "i":Ljava/util/Iterator;
    .restart local v8    # "m":Ljava/util/Map;
    .restart local v12    # "rc":Lorg/apache/tools/ant/RuntimeConfigurable;
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lorg/apache/tools/ant/RuntimeConfigurable;->getText()Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->localAttributes:Ljava/util/Hashtable;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->macroSubs(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Lorg/apache/tools/ant/RuntimeConfigurable;->addText(Ljava/lang/String;)V

    .line 275
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lorg/apache/tools/ant/RuntimeConfigurable;->getChildren()Ljava/util/Enumeration;

    move-result-object v4

    .line 276
    .local v4, "e":Ljava/util/Enumeration;
    :cond_3
    :goto_3
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v18

    if-eqz v18, :cond_b

    .line 277
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/apache/tools/ant/RuntimeConfigurable;

    .line 278
    .local v11, "r":Lorg/apache/tools/ant/RuntimeConfigurable;
    invoke-virtual {v11}, Lorg/apache/tools/ant/RuntimeConfigurable;->getProxy()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lorg/apache/tools/ant/UnknownElement;

    .line 279
    .local v17, "unknownElement":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual/range {v17 .. v17}, Lorg/apache/tools/ant/UnknownElement;->getTaskType()Ljava/lang/String;

    move-result-object v15

    .line 280
    .local v15, "tag":Ljava/lang/String;
    if-eqz v15, :cond_4

    .line 281
    sget-object v18, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v15

    .line 283
    :cond_4
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->getNsElements()Ljava/util/Map;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v0, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;

    .line 285
    .local v16, "templateElement":Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;
    if-eqz v16, :cond_5

    if-eqz p2, :cond_6

    .line 286
    :cond_5
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, p2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->copy(Lorg/apache/tools/ant/UnknownElement;Z)Lorg/apache/tools/ant/UnknownElement;

    move-result-object v3

    .line 287
    .local v3, "child":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual {v3}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Lorg/apache/tools/ant/RuntimeConfigurable;->addChild(Lorg/apache/tools/ant/RuntimeConfigurable;)V

    .line 288
    invoke-virtual {v13, v3}, Lorg/apache/tools/ant/UnknownElement;->addChild(Lorg/apache/tools/ant/UnknownElement;)V

    goto :goto_3

    .line 289
    .end local v3    # "child":Lorg/apache/tools/ant/UnknownElement;
    :cond_6
    invoke-virtual/range {v16 .. v16}, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->isImplicit()Z

    move-result v18

    if-eqz v18, :cond_8

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->unknownElements:Ljava/util/List;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/List;->size()I

    move-result v18

    if-nez v18, :cond_7

    invoke-virtual/range {v16 .. v16}, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->isOptional()Z

    move-result v18

    if-nez v18, :cond_7

    .line 291
    new-instance v18, Lorg/apache/tools/ant/BuildException;

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v20, "Missing nested elements for implicit element "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v16 .. v16}, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->getName()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 295
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->unknownElements:Ljava/util/List;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 296
    :goto_4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_3

    .line 297
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lorg/apache/tools/ant/UnknownElement;

    const/16 v19, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->copy(Lorg/apache/tools/ant/UnknownElement;Z)Lorg/apache/tools/ant/UnknownElement;

    move-result-object v3

    .line 299
    .restart local v3    # "child":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual {v3}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Lorg/apache/tools/ant/RuntimeConfigurable;->addChild(Lorg/apache/tools/ant/RuntimeConfigurable;)V

    .line 300
    invoke-virtual {v13, v3}, Lorg/apache/tools/ant/UnknownElement;->addChild(Lorg/apache/tools/ant/UnknownElement;)V

    goto :goto_4

    .line 303
    .end local v3    # "child":Lorg/apache/tools/ant/UnknownElement;
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->presentElements:Ljava/util/Map;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/apache/tools/ant/UnknownElement;

    .line 305
    .local v9, "presentElement":Lorg/apache/tools/ant/UnknownElement;
    if-nez v9, :cond_9

    .line 306
    invoke-virtual/range {v16 .. v16}, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->isOptional()Z

    move-result v18

    if-nez v18, :cond_3

    .line 307
    new-instance v18, Lorg/apache/tools/ant/BuildException;

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v20, "Required nested element "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v16 .. v16}, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->getName()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, " missing"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 313
    :cond_9
    invoke-virtual {v9}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lorg/apache/tools/ant/RuntimeConfigurable;->getText()Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    .line 315
    .local v10, "presentText":Ljava/lang/String;
    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_a

    .line 316
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->localAttributes:Ljava/util/Hashtable;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v10, v1}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->macroSubs(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Lorg/apache/tools/ant/RuntimeConfigurable;->addText(Ljava/lang/String;)V

    .line 318
    :cond_a
    invoke-virtual {v9}, Lorg/apache/tools/ant/UnknownElement;->getChildren()Ljava/util/List;

    move-result-object v7

    .line 319
    .local v7, "list":Ljava/util/List;
    if-eqz v7, :cond_3

    .line 320
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 321
    :goto_5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_3

    .line 322
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lorg/apache/tools/ant/UnknownElement;

    const/16 v19, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->copy(Lorg/apache/tools/ant/UnknownElement;Z)Lorg/apache/tools/ant/UnknownElement;

    move-result-object v3

    .line 324
    .restart local v3    # "child":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual {v3}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Lorg/apache/tools/ant/RuntimeConfigurable;->addChild(Lorg/apache/tools/ant/RuntimeConfigurable;)V

    .line 325
    invoke-virtual {v13, v3}, Lorg/apache/tools/ant/UnknownElement;->addChild(Lorg/apache/tools/ant/UnknownElement;)V

    goto :goto_5

    .line 330
    .end local v3    # "child":Lorg/apache/tools/ant/UnknownElement;
    .end local v7    # "list":Ljava/util/List;
    .end local v9    # "presentElement":Lorg/apache/tools/ant/UnknownElement;
    .end local v10    # "presentText":Ljava/lang/String;
    .end local v11    # "r":Lorg/apache/tools/ant/RuntimeConfigurable;
    .end local v15    # "tag":Ljava/lang/String;
    .end local v16    # "templateElement":Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;
    .end local v17    # "unknownElement":Lorg/apache/tools/ant/UnknownElement;
    :cond_b
    return-object v13
.end method

.method private getNsElements()Ljava/util/Map;
    .locals 6

    .prologue
    .line 97
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->nsElements:Ljava/util/Map;

    if-nez v3, :cond_1

    .line 98
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->nsElements:Ljava/util/Map;

    .line 99
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getElements()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 100
    .local v1, "i":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 101
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 102
    .local v0, "entry":Ljava/util/Map$Entry;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->nsElements:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;

    .line 106
    .local v2, "te":Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->isImplicit()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 107
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->getName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->implicitTag:Ljava/lang/String;

    goto :goto_0

    .line 111
    .end local v0    # "entry":Ljava/util/Map$Entry;
    .end local v1    # "i":Ljava/util/Iterator;
    .end local v2    # "te":Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->nsElements:Ljava/util/Map;

    return-object v3
.end method

.method private macroSubs(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 10
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "macroMapping"    # Ljava/util/Map;

    .prologue
    const/16 v9, 0x40

    .line 169
    if-nez p1, :cond_0

    .line 170
    const/4 v7, 0x0

    .line 234
    :goto_0
    return-object v7

    .line 172
    :cond_0
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 173
    .local v4, "ret":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .line 175
    .local v2, "macroName":Ljava/lang/StringBuffer;
    const/4 v5, 0x0

    .line 176
    .local v5, "state":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v1, v7, :cond_6

    .line 177
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 178
    .local v0, "ch":C
    packed-switch v5, :pswitch_data_0

    .line 176
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 180
    :pswitch_0
    if-ne v0, v9, :cond_1

    .line 181
    const/4 v5, 0x1

    goto :goto_2

    .line 183
    :cond_1
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 187
    :pswitch_1
    const/16 v7, 0x7b

    if-ne v0, v7, :cond_2

    .line 188
    const/4 v5, 0x2

    .line 189
    new-instance v2, Ljava/lang/StringBuffer;

    .end local v2    # "macroName":Ljava/lang/StringBuffer;
    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .restart local v2    # "macroName":Ljava/lang/StringBuffer;
    goto :goto_2

    .line 190
    :cond_2
    if-ne v0, v9, :cond_3

    .line 191
    const/4 v5, 0x0

    .line 192
    invoke-virtual {v4, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 194
    :cond_3
    const/4 v5, 0x0

    .line 195
    invoke-virtual {v4, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 196
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 200
    :pswitch_2
    const/16 v7, 0x7d

    if-ne v0, v7, :cond_5

    .line 201
    const/4 v5, 0x0

    .line 202
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    sget-object v8, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v7, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    .line 203
    .local v3, "name":Ljava/lang/String;
    invoke-interface {p2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 204
    .local v6, "value":Ljava/lang/String;
    if-nez v6, :cond_4

    .line 205
    const-string/jumbo v7, "@{"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 206
    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 207
    const-string/jumbo v7, "}"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 211
    :goto_3
    const/4 v2, 0x0

    goto :goto_2

    .line 209
    :cond_4
    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_3

    .line 213
    .end local v3    # "name":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    :cond_5
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 220
    .end local v0    # "ch":C
    :cond_6
    packed-switch v5, :pswitch_data_1

    .line 234
    :goto_4
    :pswitch_3
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 224
    :pswitch_4
    invoke-virtual {v4, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_4

    .line 227
    :pswitch_5
    const-string/jumbo v7, "@{"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 228
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_4

    .line 178
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 220
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method private processTasks()V
    .locals 6

    .prologue
    .line 124
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->implicitTag:Ljava/lang/String;

    if-eqz v3, :cond_1

    .line 139
    :cond_0
    return-void

    .line 127
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->unknownElements:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 128
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/UnknownElement;

    .line 129
    .local v2, "ue":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual {v2}, Lorg/apache/tools/ant/UnknownElement;->getTag()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/tools/ant/ProjectHelper;->extractNameFromComponentName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 131
    .local v1, "name":Ljava/lang/String;
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->getNsElements()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_2

    .line 132
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "unsupported element "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 134
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->presentElements:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 135
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Element "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " already present"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 137
    :cond_3
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->presentElements:Ljava/util/Map;

    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method


# virtual methods
.method public addTask(Lorg/apache/tools/ant/Task;)V
    .locals 1
    .param p1, "nestedTask"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 120
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->unknownElements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    return-void
.end method

.method public addText(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 243
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->text:Ljava/lang/String;

    .line 244
    return-void
.end method

.method public createDynamicElement(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 93
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Not implemented any more"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public execute()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    .line 340
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    iput-object v8, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->presentElements:Ljava/util/Map;

    .line 341
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->getNsElements()Ljava/util/Map;

    .line 342
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->processTasks()V

    .line 343
    new-instance v8, Ljava/util/Hashtable;

    invoke-direct {v8}, Ljava/util/Hashtable;-><init>()V

    iput-object v8, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->localAttributes:Ljava/util/Hashtable;

    .line 344
    new-instance v2, Ljava/util/HashSet;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->map:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-direct {v2, v8}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 345
    .local v2, "copyKeys":Ljava/util/Set;
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getAttributes()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 346
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;

    .line 347
    .local v0, "attribute":Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->map:Ljava/util/Map;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 348
    .local v7, "value":Ljava/lang/String;
    if-nez v7, :cond_0

    const-string/jumbo v8, "description"

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 349
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->getDescription()Ljava/lang/String;

    move-result-object v7

    .line 351
    :cond_0
    if-nez v7, :cond_1

    .line 352
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->getDefault()Ljava/lang/String;

    move-result-object v7

    .line 353
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->localAttributes:Ljava/util/Hashtable;

    invoke-direct {p0, v7, v8}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->macroSubs(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v7

    .line 355
    :cond_1
    if-nez v7, :cond_2

    .line 356
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "required attribute "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " not set"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 359
    :cond_2
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->localAttributes:Ljava/util/Hashtable;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9, v7}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 360
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v2, v8}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 362
    .end local v0    # "attribute":Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;
    .end local v7    # "value":Ljava/lang/String;
    :cond_3
    const-string/jumbo v8, "id"

    invoke-interface {v2, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 363
    const-string/jumbo v8, "id"

    invoke-interface {v2, v8}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 365
    :cond_4
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getText()Lorg/apache/tools/ant/taskdefs/MacroDef$Text;

    move-result-object v8

    if-eqz v8, :cond_a

    .line 366
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->text:Ljava/lang/String;

    if-nez v8, :cond_7

    .line 367
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getText()Lorg/apache/tools/ant/taskdefs/MacroDef$Text;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->getDefault()Ljava/lang/String;

    move-result-object v3

    .line 368
    .local v3, "defaultText":Ljava/lang/String;
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getText()Lorg/apache/tools/ant/taskdefs/MacroDef$Text;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->getOptional()Z

    move-result v8

    if-nez v8, :cond_5

    if-nez v3, :cond_5

    .line 369
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v9, "required text missing"

    invoke-direct {v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 372
    :cond_5
    if-nez v3, :cond_6

    const-string/jumbo v3, ""

    .end local v3    # "defaultText":Ljava/lang/String;
    :cond_6
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->text:Ljava/lang/String;

    .line 374
    :cond_7
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getText()Lorg/apache/tools/ant/taskdefs/MacroDef$Text;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->getTrim()Z

    move-result v8

    if-eqz v8, :cond_8

    .line 375
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->text:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->text:Ljava/lang/String;

    .line 377
    :cond_8
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->localAttributes:Ljava/util/Hashtable;

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getText()Lorg/apache/tools/ant/taskdefs/MacroDef$Text;

    move-result-object v9

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->getName()Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->text:Ljava/lang/String;

    invoke-virtual {v8, v9, v10}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 385
    :cond_9
    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v8

    if-eqz v8, :cond_c

    .line 386
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Unknown attribute"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v8

    const/4 v11, 0x1

    if-le v8, v11, :cond_b

    const-string/jumbo v8, "s "

    :goto_1
    invoke-virtual {v10, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 379
    :cond_a
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->text:Ljava/lang/String;

    if-eqz v8, :cond_9

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->text:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, ""

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_9

    .line 380
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "The \""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->getTaskName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\" macro does not support"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " nested text data."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 386
    :cond_b
    const-string/jumbo v8, " "

    goto :goto_1

    .line 392
    :cond_c
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getNestedTask()Lorg/apache/tools/ant/UnknownElement;

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->copy(Lorg/apache/tools/ant/UnknownElement;Z)Lorg/apache/tools/ant/UnknownElement;

    move-result-object v1

    .line 393
    .local v1, "c":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual {v1}, Lorg/apache/tools/ant/UnknownElement;->init()V

    .line 394
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-static {v8}, Lorg/apache/tools/ant/property/LocalProperties;->get(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/property/LocalProperties;

    move-result-object v6

    .line 396
    .local v6, "localProperties":Lorg/apache/tools/ant/property/LocalProperties;
    invoke-virtual {v6}, Lorg/apache/tools/ant/property/LocalProperties;->enterScope()V

    .line 398
    :try_start_0
    invoke-virtual {v1}, Lorg/apache/tools/ant/UnknownElement;->perform()V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 408
    iput-object v11, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->presentElements:Ljava/util/Map;

    .line 409
    iput-object v11, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->localAttributes:Ljava/util/Hashtable;

    .line 410
    invoke-virtual {v6}, Lorg/apache/tools/ant/property/LocalProperties;->exitScope()V

    .line 412
    return-void

    .line 399
    :catch_0
    move-exception v4

    .line 400
    .local v4, "ex":Lorg/apache/tools/ant/BuildException;
    :try_start_1
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getBackTrace()Z

    move-result v8

    if-eqz v8, :cond_d

    .line 401
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v8

    invoke-static {v4, v8}, Lorg/apache/tools/ant/ProjectHelper;->addLocationToBuildException(Lorg/apache/tools/ant/BuildException;Lorg/apache/tools/ant/Location;)Lorg/apache/tools/ant/BuildException;

    move-result-object v8

    throw v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 408
    .end local v4    # "ex":Lorg/apache/tools/ant/BuildException;
    :catchall_0
    move-exception v8

    iput-object v11, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->presentElements:Ljava/util/Map;

    .line 409
    iput-object v11, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->localAttributes:Ljava/util/Hashtable;

    .line 410
    invoke-virtual {v6}, Lorg/apache/tools/ant/property/LocalProperties;->exitScope()V

    .line 408
    throw v8

    .line 404
    .restart local v4    # "ex":Lorg/apache/tools/ant/BuildException;
    :cond_d
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v8

    invoke-virtual {v4, v8}, Lorg/apache/tools/ant/BuildException;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 405
    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method

.method public getMacroDef()Lorg/apache/tools/ant/taskdefs/MacroDef;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;

    return-object v0
.end method

.method public setDynamicAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 82
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->map:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    return-void
.end method

.method public setMacroDef(Lorg/apache/tools/ant/taskdefs/MacroDef;)V
    .locals 0
    .param p1, "macroDef"    # Lorg/apache/tools/ant/taskdefs/MacroDef;

    .prologue
    .line 65
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance;->macroDef:Lorg/apache/tools/ant/taskdefs/MacroDef;

    .line 66
    return-void
.end method
