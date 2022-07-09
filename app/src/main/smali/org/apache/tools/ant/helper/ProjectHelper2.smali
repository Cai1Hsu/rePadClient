.class public Lorg/apache/tools/ant/helper/ProjectHelper2;
.super Lorg/apache/tools/ant/ProjectHelper;
.source "ProjectHelper2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/helper/ProjectHelper2$ElementHandler;,
        Lorg/apache/tools/ant/helper/ProjectHelper2$TargetHandler;,
        Lorg/apache/tools/ant/helper/ProjectHelper2$ProjectHandler;,
        Lorg/apache/tools/ant/helper/ProjectHelper2$MainHandler;,
        Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;,
        Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;
    }
.end annotation


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final REFID_CONTEXT:Ljava/lang/String; = "ant.parsing.context"

.field public static final REFID_TARGETS:Ljava/lang/String; = "ant.targets"

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

.field private static elementHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

.field private static mainHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

.field private static projectHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

.field private static targetHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 69
    new-instance v0, Lorg/apache/tools/ant/helper/ProjectHelper2$ElementHandler;

    invoke-direct {v0}, Lorg/apache/tools/ant/helper/ProjectHelper2$ElementHandler;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/helper/ProjectHelper2;->elementHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    .line 70
    new-instance v0, Lorg/apache/tools/ant/helper/ProjectHelper2$TargetHandler;

    invoke-direct {v0}, Lorg/apache/tools/ant/helper/ProjectHelper2$TargetHandler;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/helper/ProjectHelper2;->targetHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    .line 71
    new-instance v0, Lorg/apache/tools/ant/helper/ProjectHelper2$MainHandler;

    invoke-direct {v0}, Lorg/apache/tools/ant/helper/ProjectHelper2$MainHandler;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/helper/ProjectHelper2;->mainHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    .line 72
    new-instance v0, Lorg/apache/tools/ant/helper/ProjectHelper2$ProjectHandler;

    invoke-direct {v0}, Lorg/apache/tools/ant/helper/ProjectHelper2$ProjectHandler;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/helper/ProjectHelper2;->projectHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    .line 80
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/helper/ProjectHelper2;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 61
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectHelper;-><init>()V

    .line 1110
    return-void
.end method

.method static access$100()Lorg/apache/tools/ant/util/FileUtils;
    .locals 1

    .prologue
    .line 61
    sget-object v0, Lorg/apache/tools/ant/helper/ProjectHelper2;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-object v0
.end method

.method static access$200()Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;
    .locals 1

    .prologue
    .line 61
    sget-object v0, Lorg/apache/tools/ant/helper/ProjectHelper2;->projectHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    return-object v0
.end method

.method static access$300()Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;
    .locals 1

    .prologue
    .line 61
    sget-object v0, Lorg/apache/tools/ant/helper/ProjectHelper2;->targetHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    return-object v0
.end method

.method static access$400()Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;
    .locals 1

    .prologue
    .line 61
    sget-object v0, Lorg/apache/tools/ant/helper/ProjectHelper2;->elementHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    return-object v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 107
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method protected static getElementHandler()Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;
    .locals 1

    .prologue
    .line 394
    sget-object v0, Lorg/apache/tools/ant/helper/ProjectHelper2;->elementHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    return-object v0
.end method

.method protected static getMainHandler()Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;
    .locals 1

    .prologue
    .line 346
    sget-object v0, Lorg/apache/tools/ant/helper/ProjectHelper2;->mainHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    return-object v0
.end method

.method protected static getProjectHandler()Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;
    .locals 1

    .prologue
    .line 362
    sget-object v0, Lorg/apache/tools/ant/helper/ProjectHelper2;->projectHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    return-object v0
.end method

.method protected static getTargetHandler()Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;
    .locals 1

    .prologue
    .line 378
    sget-object v0, Lorg/apache/tools/ant/helper/ProjectHelper2;->targetHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    return-object v0
.end method

.method protected static setElementHandler(Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;)V
    .locals 0
    .param p0, "handler"    # Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    .prologue
    .line 402
    sput-object p0, Lorg/apache/tools/ant/helper/ProjectHelper2;->elementHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    .line 403
    return-void
.end method

.method protected static setMainHandler(Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;)V
    .locals 0
    .param p0, "handler"    # Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    .prologue
    .line 354
    sput-object p0, Lorg/apache/tools/ant/helper/ProjectHelper2;->mainHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    .line 355
    return-void
.end method

.method protected static setProjectHandler(Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;)V
    .locals 0
    .param p0, "handler"    # Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    .prologue
    .line 370
    sput-object p0, Lorg/apache/tools/ant/helper/ProjectHelper2;->projectHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    .line 371
    return-void
.end method

.method protected static setTargetHandler(Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;)V
    .locals 0
    .param p0, "handler"    # Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    .prologue
    .line 386
    sput-object p0, Lorg/apache/tools/ant/helper/ProjectHelper2;->targetHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    .line 387
    return-void
.end method


# virtual methods
.method public canParseAntlibDescriptor(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 1
    .param p1, "resource"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 92
    const/4 v0, 0x1

    return v0
.end method

.method public parse(Lorg/apache/tools/ant/Project;Ljava/lang/Object;)V
    .locals 21
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "source"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 147
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/helper/ProjectHelper2;->getImportStack()Ljava/util/Vector;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 148
    const/4 v4, 0x0

    .line 149
    .local v4, "context":Lorg/apache/tools/ant/helper/AntXMLContext;
    const-string/jumbo v18, "ant.parsing.context"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "context":Lorg/apache/tools/ant/helper/AntXMLContext;
    check-cast v4, Lorg/apache/tools/ant/helper/AntXMLContext;

    .line 150
    .restart local v4    # "context":Lorg/apache/tools/ant/helper/AntXMLContext;
    if-nez v4, :cond_0

    .line 151
    new-instance v4, Lorg/apache/tools/ant/helper/AntXMLContext;

    .end local v4    # "context":Lorg/apache/tools/ant/helper/AntXMLContext;
    move-object/from16 v0, p1

    invoke-direct {v4, v0}, Lorg/apache/tools/ant/helper/AntXMLContext;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 152
    .restart local v4    # "context":Lorg/apache/tools/ant/helper/AntXMLContext;
    const-string/jumbo v18, "ant.parsing.context"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v4}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    .line 153
    const-string/jumbo v18, "ant.targets"

    invoke-virtual {v4}, Lorg/apache/tools/ant/helper/AntXMLContext;->getTargets()Ljava/util/Vector;

    move-result-object v19

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    .line 155
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/helper/ProjectHelper2;->getImportStack()Ljava/util/Vector;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/util/Vector;->size()I

    move-result v18

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_2

    .line 157
    const/16 v18, 0x1

    move/from16 v0, v18

    invoke-virtual {v4, v0}, Lorg/apache/tools/ant/helper/AntXMLContext;->setIgnoreProjectTag(Z)V

    .line 158
    invoke-virtual {v4}, Lorg/apache/tools/ant/helper/AntXMLContext;->getCurrentTarget()Lorg/apache/tools/ant/Target;

    move-result-object v6

    .line 159
    .local v6, "currentTarget":Lorg/apache/tools/ant/Target;
    invoke-virtual {v4}, Lorg/apache/tools/ant/helper/AntXMLContext;->getImplicitTarget()Lorg/apache/tools/ant/Target;

    move-result-object v5

    .line 160
    .local v5, "currentImplicit":Lorg/apache/tools/ant/Target;
    invoke-virtual {v4}, Lorg/apache/tools/ant/helper/AntXMLContext;->getCurrentTargets()Ljava/util/Map;

    move-result-object v7

    .line 162
    .local v7, "currentTargets":Ljava/util/Map;
    :try_start_0
    new-instance v13, Lorg/apache/tools/ant/Target;

    invoke-direct {v13}, Lorg/apache/tools/ant/Target;-><init>()V

    .line 163
    .local v13, "newCurrent":Lorg/apache/tools/ant/Target;
    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Lorg/apache/tools/ant/Target;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 164
    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lorg/apache/tools/ant/Target;->setName(Ljava/lang/String;)V

    .line 165
    invoke-virtual {v4, v13}, Lorg/apache/tools/ant/helper/AntXMLContext;->setCurrentTarget(Lorg/apache/tools/ant/Target;)V

    .line 166
    new-instance v18, Ljava/util/HashMap;

    invoke-direct/range {v18 .. v18}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lorg/apache/tools/ant/helper/AntXMLContext;->setCurrentTargets(Ljava/util/Map;)V

    .line 167
    invoke-virtual {v4, v13}, Lorg/apache/tools/ant/helper/AntXMLContext;->setImplicitTarget(Lorg/apache/tools/ant/Target;)V

    .line 168
    new-instance v18, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;

    sget-object v19, Lorg/apache/tools/ant/helper/ProjectHelper2;->mainHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v0, v4, v1}, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;-><init>(Lorg/apache/tools/ant/helper/AntXMLContext;Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, v18

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/tools/ant/helper/ProjectHelper2;->parse(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;)V

    .line 169
    invoke-virtual {v13}, Lorg/apache/tools/ant/Target;->execute()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 171
    invoke-virtual {v4, v6}, Lorg/apache/tools/ant/helper/AntXMLContext;->setCurrentTarget(Lorg/apache/tools/ant/Target;)V

    .line 172
    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/helper/AntXMLContext;->setImplicitTarget(Lorg/apache/tools/ant/Target;)V

    .line 173
    invoke-virtual {v4, v7}, Lorg/apache/tools/ant/helper/AntXMLContext;->setCurrentTargets(Ljava/util/Map;)V

    .line 213
    .end local v5    # "currentImplicit":Lorg/apache/tools/ant/Target;
    .end local v6    # "currentTarget":Lorg/apache/tools/ant/Target;
    .end local v7    # "currentTargets":Ljava/util/Map;
    .end local v13    # "newCurrent":Lorg/apache/tools/ant/Target;
    :cond_1
    return-void

    .line 171
    .restart local v5    # "currentImplicit":Lorg/apache/tools/ant/Target;
    .restart local v6    # "currentTarget":Lorg/apache/tools/ant/Target;
    .restart local v7    # "currentTargets":Ljava/util/Map;
    :catchall_0
    move-exception v18

    invoke-virtual {v4, v6}, Lorg/apache/tools/ant/helper/AntXMLContext;->setCurrentTarget(Lorg/apache/tools/ant/Target;)V

    .line 172
    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/helper/AntXMLContext;->setImplicitTarget(Lorg/apache/tools/ant/Target;)V

    .line 173
    invoke-virtual {v4, v7}, Lorg/apache/tools/ant/helper/AntXMLContext;->setCurrentTargets(Ljava/util/Map;)V

    .line 171
    throw v18

    .line 177
    .end local v5    # "currentImplicit":Lorg/apache/tools/ant/Target;
    .end local v6    # "currentTarget":Lorg/apache/tools/ant/Target;
    .end local v7    # "currentTargets":Ljava/util/Map;
    :cond_2
    new-instance v18, Ljava/util/HashMap;

    invoke-direct/range {v18 .. v18}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lorg/apache/tools/ant/helper/AntXMLContext;->setCurrentTargets(Ljava/util/Map;)V

    .line 178
    new-instance v18, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;

    sget-object v19, Lorg/apache/tools/ant/helper/ProjectHelper2;->mainHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v0, v4, v1}, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;-><init>(Lorg/apache/tools/ant/helper/AntXMLContext;Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, v18

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/tools/ant/helper/ProjectHelper2;->parse(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;)V

    .line 180
    invoke-virtual {v4}, Lorg/apache/tools/ant/helper/AntXMLContext;->getImplicitTarget()Lorg/apache/tools/ant/Target;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lorg/apache/tools/ant/Target;->execute()V

    .line 183
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/helper/ProjectHelper2;->getExtensionStack()Ljava/util/List;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i":Ljava/util/Iterator;
    :cond_3
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_1

    .line 184
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/String;

    .line 185
    .local v8, "extensionInfo":[Ljava/lang/String;
    const/16 v18, 0x0

    aget-object v17, v8, v18

    .line 186
    .local v17, "tgName":Ljava/lang/String;
    const/16 v18, 0x1

    aget-object v12, v8, v18

    .line 187
    .local v12, "name":Ljava/lang/String;
    const/16 v18, 0x2

    aget-object v18, v8, v18

    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->valueOf(Ljava/lang/String;)Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    move-result-object v11

    .line 189
    .local v11, "missingBehaviour":Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/Project;->getTargets()Ljava/util/Hashtable;

    move-result-object v14

    .line 190
    .local v14, "projectTargets":Ljava/util/Hashtable;
    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_5

    .line 191
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v19, "can\'t add target "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, " to extension-point "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, " because the extension-point is unknown."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    .line 194
    .local v10, "message":Ljava/lang/String;
    sget-object v18, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->FAIL:Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    move-object/from16 v0, v18

    if-ne v11, v0, :cond_4

    .line 195
    new-instance v18, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v18

    invoke-direct {v0, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 196
    :cond_4
    sget-object v18, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->WARN:Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    move-object/from16 v0, v18

    if-ne v11, v0, :cond_3

    .line 197
    invoke-virtual {v14, v12}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/apache/tools/ant/Target;

    .line 198
    .local v16, "target":Lorg/apache/tools/ant/Target;
    invoke-virtual {v4}, Lorg/apache/tools/ant/helper/AntXMLContext;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v18

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v20, "Warning: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x1

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    move-object/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/tools/ant/Project;->log(Lorg/apache/tools/ant/Target;Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 203
    .end local v10    # "message":Ljava/lang/String;
    .end local v16    # "target":Lorg/apache/tools/ant/Target;
    :cond_5
    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/apache/tools/ant/Target;

    .line 204
    .local v15, "t":Lorg/apache/tools/ant/Target;
    instance-of v0, v15, Lorg/apache/tools/ant/ExtensionPoint;

    move/from16 v18, v0

    if-nez v18, :cond_6

    .line 205
    new-instance v18, Lorg/apache/tools/ant/BuildException;

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v20, "referenced target "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, " is not an extension-point"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 209
    :cond_6
    invoke-virtual {v15, v12}, Lorg/apache/tools/ant/Target;->addDependency(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public parse(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;)V
    .locals 27
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "source"    # Ljava/lang/Object;
    .param p3, "handler"    # Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 226
    invoke-static/range {p3 .. p3}, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->access$000(Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;)Lorg/apache/tools/ant/helper/AntXMLContext;

    move-result-object v6

    .line 228
    .local v6, "context":Lorg/apache/tools/ant/helper/AntXMLContext;
    const/4 v4, 0x0

    .line 229
    .local v4, "buildFile":Ljava/io/File;
    const/16 v21, 0x0

    .line 230
    .local v21, "url":Ljava/net/URL;
    const/4 v5, 0x0

    .line 232
    .local v5, "buildFileName":Ljava/lang/String;
    move-object/from16 v0, p2

    instance-of v0, v0, Ljava/io/File;

    move/from16 v24, v0

    if-eqz v24, :cond_2

    move-object/from16 v4, p2

    .line 233
    check-cast v4, Ljava/io/File;

    .line 249
    :cond_0
    :goto_0
    if-eqz v4, :cond_7

    .line 250
    sget-object v24, Lorg/apache/tools/ant/helper/ProjectHelper2;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    .line 251
    invoke-virtual {v6, v4}, Lorg/apache/tools/ant/helper/AntXMLContext;->setBuildFile(Ljava/io/File;)V

    .line 252
    invoke-virtual {v4}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v5

    .line 265
    :goto_1
    const/4 v13, 0x0

    .line 266
    .local v13, "inputStream":Ljava/io/InputStream;
    const/4 v11, 0x0

    .line 267
    .local v11, "inputSource":Lorg/xml/sax/InputSource;
    const/16 v22, 0x0

    .line 273
    .local v22, "zf":Lorg/apache/tools/zip/ZipFile;
    :try_start_0
    invoke-static {}, Lorg/apache/tools/ant/util/JAXPUtils;->getNamespaceXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v16

    .line 275
    .local v16, "parser":Lorg/xml/sax/XMLReader;
    const/16 v20, 0x0

    .line 276
    .local v20, "uri":Ljava/lang/String;
    if-eqz v4, :cond_9

    .line 277
    sget-object v24, Lorg/apache/tools/ant/helper/ProjectHelper2;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Lorg/apache/tools/ant/util/FileUtils;->toURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 278
    new-instance v14, Ljava/io/FileInputStream;

    invoke-direct {v14, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .end local v13    # "inputStream":Ljava/io/InputStream;
    .local v14, "inputStream":Ljava/io/InputStream;
    move-object v13, v14

    .line 293
    .end local v14    # "inputStream":Ljava/io/InputStream;
    .restart local v13    # "inputStream":Ljava/io/InputStream;
    :goto_2
    new-instance v12, Lorg/xml/sax/InputSource;

    invoke-direct {v12, v13}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXParseException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 294
    .end local v11    # "inputSource":Lorg/xml/sax/InputSource;
    .local v12, "inputSource":Lorg/xml/sax/InputSource;
    if-eqz v20, :cond_1

    .line 295
    :try_start_1
    move-object/from16 v0, v20

    invoke-virtual {v12, v0}, Lorg/xml/sax/InputSource;->setSystemId(Ljava/lang/String;)V

    .line 297
    :cond_1
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "parsing buildfile "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    const-string/jumbo v25, " with URI = "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    if-eqz v22, :cond_b

    const-string/jumbo v24, " from a zip file"

    :goto_3
    move-object/from16 v0, v25

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x3

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 301
    move-object/from16 v10, p3

    .line 303
    .local v10, "hb":Lorg/xml/sax/helpers/DefaultHandler;
    move-object/from16 v0, v16

    invoke-interface {v0, v10}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 304
    move-object/from16 v0, v16

    invoke-interface {v0, v10}, Lorg/xml/sax/XMLReader;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V

    .line 305
    move-object/from16 v0, v16

    invoke-interface {v0, v10}, Lorg/xml/sax/XMLReader;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    .line 306
    move-object/from16 v0, v16

    invoke-interface {v0, v10}, Lorg/xml/sax/XMLReader;->setDTDHandler(Lorg/xml/sax/DTDHandler;)V

    .line 307
    move-object/from16 v0, v16

    invoke-interface {v0, v12}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V
    :try_end_1
    .catch Lorg/xml/sax/SAXParseException; {:try_start_1 .. :try_end_1} :catch_f
    .catch Lorg/xml/sax/SAXException; {:try_start_1 .. :try_end_1} :catch_d
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_b
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_9
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_7
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 336
    invoke-static {v13}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 337
    invoke-static/range {v22 .. v22}, Lorg/apache/tools/zip/ZipFile;->closeQuietly(Lorg/apache/tools/zip/ZipFile;)V

    .line 339
    return-void

    .line 234
    .end local v10    # "hb":Lorg/xml/sax/helpers/DefaultHandler;
    .end local v12    # "inputSource":Lorg/xml/sax/InputSource;
    .end local v13    # "inputStream":Ljava/io/InputStream;
    .end local v16    # "parser":Lorg/xml/sax/XMLReader;
    .end local v20    # "uri":Ljava/lang/String;
    .end local v22    # "zf":Lorg/apache/tools/zip/ZipFile;
    :cond_2
    move-object/from16 v0, p2

    instance-of v0, v0, Ljava/net/URL;

    move/from16 v24, v0

    if-eqz v24, :cond_3

    move-object/from16 v21, p2

    .line 235
    check-cast v21, Ljava/net/URL;

    goto/16 :goto_0

    .line 236
    :cond_3
    move-object/from16 v0, p2

    instance-of v0, v0, Lorg/apache/tools/ant/types/Resource;

    move/from16 v24, v0

    if-eqz v24, :cond_0

    move-object/from16 v24, p2

    .line 237
    check-cast v24, Lorg/apache/tools/ant/types/Resource;

    sget-object v25, Lorg/apache/tools/ant/helper/ProjectHelper2;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v25, :cond_4

    const-string/jumbo v25, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static/range {v25 .. v25}, Lorg/apache/tools/ant/helper/ProjectHelper2;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v25

    sput-object v25, Lorg/apache/tools/ant/helper/ProjectHelper2;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_4
    invoke-virtual/range {v24 .. v25}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 239
    .local v9, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v9, :cond_5

    .line 240
    invoke-interface {v9}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v4

    goto/16 :goto_0

    .line 237
    .end local v9    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_4
    sget-object v25, Lorg/apache/tools/ant/helper/ProjectHelper2;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_4

    .restart local v9    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_5
    move-object/from16 v24, p2

    .line 242
    check-cast v24, Lorg/apache/tools/ant/types/Resource;

    sget-object v25, Lorg/apache/tools/ant/helper/ProjectHelper2;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    if-nez v25, :cond_6

    const-string/jumbo v25, "org.apache.tools.ant.types.resources.URLProvider"

    invoke-static/range {v25 .. v25}, Lorg/apache/tools/ant/helper/ProjectHelper2;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v25

    sput-object v25, Lorg/apache/tools/ant/helper/ProjectHelper2;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    :goto_5
    invoke-virtual/range {v24 .. v25}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/apache/tools/ant/types/resources/URLProvider;

    .line 244
    .local v19, "up":Lorg/apache/tools/ant/types/resources/URLProvider;
    if-eqz v19, :cond_0

    .line 245
    invoke-interface/range {v19 .. v19}, Lorg/apache/tools/ant/types/resources/URLProvider;->getURL()Ljava/net/URL;

    move-result-object v21

    goto/16 :goto_0

    .line 242
    .end local v19    # "up":Lorg/apache/tools/ant/types/resources/URLProvider;
    :cond_6
    sget-object v25, Lorg/apache/tools/ant/helper/ProjectHelper2;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    goto :goto_5

    .line 253
    .end local v9    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_7
    if-eqz v21, :cond_8

    .line 255
    const/16 v24, 0x0

    :try_start_2
    check-cast v24, Ljava/io/File;

    move-object/from16 v0, v24

    invoke-virtual {v6, v0}, Lorg/apache/tools/ant/helper/AntXMLContext;->setBuildFile(Ljava/io/File;)V

    .line 256
    move-object/from16 v0, v21

    invoke-virtual {v6, v0}, Lorg/apache/tools/ant/helper/AntXMLContext;->setBuildFile(Ljava/net/URL;)V
    :try_end_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_0

    .line 260
    invoke-virtual/range {v21 .. v21}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_1

    .line 257
    :catch_0
    move-exception v7

    .line 258
    .local v7, "ex":Ljava/net/MalformedURLException;
    new-instance v24, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v24

    invoke-direct {v0, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v24

    .line 262
    .end local v7    # "ex":Ljava/net/MalformedURLException;
    :cond_8
    new-instance v24, Lorg/apache/tools/ant/BuildException;

    new-instance v25, Ljava/lang/StringBuffer;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v26, "Source "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    const-string/jumbo v26, " not supported by this plugin"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 280
    .restart local v11    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v13    # "inputStream":Ljava/io/InputStream;
    .restart local v16    # "parser":Lorg/xml/sax/XMLReader;
    .restart local v20    # "uri":Ljava/lang/String;
    .restart local v22    # "zf":Lorg/apache/tools/zip/ZipFile;
    :cond_9
    :try_start_3
    invoke-virtual/range {v21 .. v21}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v20

    .line 281
    const/16 v17, -0x1

    .line 282
    .local v17, "pling":I
    const-string/jumbo v24, "jar:file"

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_a

    const-string/jumbo v24, "!/"

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v17

    const/16 v24, -0x1

    move/from16 v0, v17

    move/from16 v1, v24

    if-le v0, v1, :cond_a

    .line 284
    new-instance v23, Lorg/apache/tools/zip/ZipFile;

    invoke-static/range {v20 .. v20}, Lorg/apache/tools/ant/launch/Locator;->fromJarURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    const-string/jumbo v25, "UTF-8"

    invoke-direct/range {v23 .. v25}, Lorg/apache/tools/zip/ZipFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/xml/sax/SAXParseException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lorg/xml/sax/SAXException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_5
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 286
    .end local v22    # "zf":Lorg/apache/tools/zip/ZipFile;
    .local v23, "zf":Lorg/apache/tools/zip/ZipFile;
    add-int/lit8 v24, v17, 0x1

    :try_start_4
    move-object/from16 v0, v20

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lorg/apache/tools/zip/ZipFile;->getEntry(Ljava/lang/String;)Lorg/apache/tools/zip/ZipEntry;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lorg/apache/tools/zip/ZipFile;->getInputStream(Lorg/apache/tools/zip/ZipEntry;)Ljava/io/InputStream;
    :try_end_4
    .catch Lorg/xml/sax/SAXParseException; {:try_start_4 .. :try_end_4} :catch_e
    .catch Lorg/xml/sax/SAXException; {:try_start_4 .. :try_end_4} :catch_c
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_a
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_4} :catch_8
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_6
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-result-object v13

    move-object/from16 v22, v23

    .end local v23    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v22    # "zf":Lorg/apache/tools/zip/ZipFile;
    goto/16 :goto_2

    .line 289
    :cond_a
    :try_start_5
    invoke-virtual/range {v21 .. v21}, Ljava/net/URL;->openStream()Ljava/io/InputStream;
    :try_end_5
    .catch Lorg/xml/sax/SAXParseException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Lorg/xml/sax/SAXException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/io/FileNotFoundException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_5 .. :try_end_5} :catch_4
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result-object v13

    goto/16 :goto_2

    .line 297
    .end local v11    # "inputSource":Lorg/xml/sax/InputSource;
    .end local v17    # "pling":I
    .restart local v12    # "inputSource":Lorg/xml/sax/InputSource;
    :cond_b
    :try_start_6
    const-string/jumbo v24, ""
    :try_end_6
    .catch Lorg/xml/sax/SAXParseException; {:try_start_6 .. :try_end_6} :catch_f
    .catch Lorg/xml/sax/SAXException; {:try_start_6 .. :try_end_6} :catch_d
    .catch Ljava/io/FileNotFoundException; {:try_start_6 .. :try_end_6} :catch_b
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_6 .. :try_end_6} :catch_9
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_7
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    goto/16 :goto_3

    .line 308
    .end local v12    # "inputSource":Lorg/xml/sax/InputSource;
    .end local v16    # "parser":Lorg/xml/sax/XMLReader;
    .end local v20    # "uri":Ljava/lang/String;
    .restart local v11    # "inputSource":Lorg/xml/sax/InputSource;
    :catch_1
    move-exception v8

    .line 309
    .local v8, "exc":Lorg/xml/sax/SAXParseException;
    :goto_6
    :try_start_7
    new-instance v15, Lorg/apache/tools/ant/Location;

    invoke-virtual {v8}, Lorg/xml/sax/SAXParseException;->getSystemId()Ljava/lang/String;

    move-result-object v24

    invoke-virtual {v8}, Lorg/xml/sax/SAXParseException;->getLineNumber()I

    move-result v25

    invoke-virtual {v8}, Lorg/xml/sax/SAXParseException;->getColumnNumber()I

    move-result v26

    move-object/from16 v0, v24

    move/from16 v1, v25

    move/from16 v2, v26

    invoke-direct {v15, v0, v1, v2}, Lorg/apache/tools/ant/Location;-><init>(Ljava/lang/String;II)V

    .line 312
    .local v15, "location":Lorg/apache/tools/ant/Location;
    invoke-virtual {v8}, Lorg/xml/sax/SAXParseException;->getException()Ljava/lang/Exception;

    move-result-object v18

    .line 313
    .local v18, "t":Ljava/lang/Throwable;
    move-object/from16 v0, v18

    instance-of v0, v0, Lorg/apache/tools/ant/BuildException;

    move/from16 v24, v0

    if-eqz v24, :cond_d

    .line 314
    move-object/from16 v0, v18

    check-cast v0, Lorg/apache/tools/ant/BuildException;

    move-object v3, v0

    .line 315
    .local v3, "be":Lorg/apache/tools/ant/BuildException;
    invoke-virtual {v3}, Lorg/apache/tools/ant/BuildException;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v24

    sget-object v25, Lorg/apache/tools/ant/Location;->UNKNOWN_LOCATION:Lorg/apache/tools/ant/Location;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    if-ne v0, v1, :cond_c

    .line 316
    invoke-virtual {v3, v15}, Lorg/apache/tools/ant/BuildException;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 318
    :cond_c
    throw v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 336
    .end local v3    # "be":Lorg/apache/tools/ant/BuildException;
    .end local v8    # "exc":Lorg/xml/sax/SAXParseException;
    .end local v15    # "location":Lorg/apache/tools/ant/Location;
    .end local v18    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v24

    :goto_7
    invoke-static {v13}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 337
    invoke-static/range {v22 .. v22}, Lorg/apache/tools/zip/ZipFile;->closeQuietly(Lorg/apache/tools/zip/ZipFile;)V

    throw v24

    .line 320
    .restart local v8    # "exc":Lorg/xml/sax/SAXParseException;
    .restart local v15    # "location":Lorg/apache/tools/ant/Location;
    .restart local v18    # "t":Ljava/lang/Throwable;
    :cond_d
    :try_start_8
    new-instance v24, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v8}, Lorg/xml/sax/SAXParseException;->getMessage()Ljava/lang/String;

    move-result-object v25

    if-nez v18, :cond_e

    .end local v8    # "exc":Lorg/xml/sax/SAXParseException;
    :goto_8
    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-direct {v0, v1, v8, v15}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v24

    .restart local v8    # "exc":Lorg/xml/sax/SAXParseException;
    :cond_e
    move-object/from16 v8, v18

    goto :goto_8

    .line 321
    .end local v8    # "exc":Lorg/xml/sax/SAXParseException;
    .end local v15    # "location":Lorg/apache/tools/ant/Location;
    .end local v18    # "t":Ljava/lang/Throwable;
    :catch_2
    move-exception v8

    .line 322
    .local v8, "exc":Lorg/xml/sax/SAXException;
    :goto_9
    invoke-virtual {v8}, Lorg/xml/sax/SAXException;->getException()Ljava/lang/Exception;

    move-result-object v18

    .line 323
    .restart local v18    # "t":Ljava/lang/Throwable;
    move-object/from16 v0, v18

    instance-of v0, v0, Lorg/apache/tools/ant/BuildException;

    move/from16 v24, v0

    if-eqz v24, :cond_f

    .line 324
    check-cast v18, Lorg/apache/tools/ant/BuildException;

    .end local v18    # "t":Ljava/lang/Throwable;
    throw v18

    .line 326
    .restart local v18    # "t":Ljava/lang/Throwable;
    :cond_f
    new-instance v24, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v8}, Lorg/xml/sax/SAXException;->getMessage()Ljava/lang/String;

    move-result-object v25

    if-nez v18, :cond_10

    .end local v8    # "exc":Lorg/xml/sax/SAXException;
    :goto_a
    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-direct {v0, v1, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v24

    .restart local v8    # "exc":Lorg/xml/sax/SAXException;
    :cond_10
    move-object/from16 v8, v18

    goto :goto_a

    .line 327
    .end local v8    # "exc":Lorg/xml/sax/SAXException;
    .end local v18    # "t":Ljava/lang/Throwable;
    :catch_3
    move-exception v8

    .line 328
    .local v8, "exc":Ljava/io/FileNotFoundException;
    :goto_b
    new-instance v24, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v24

    invoke-direct {v0, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v24

    .line 329
    .end local v8    # "exc":Ljava/io/FileNotFoundException;
    :catch_4
    move-exception v8

    .line 330
    .local v8, "exc":Ljava/io/UnsupportedEncodingException;
    :goto_c
    new-instance v24, Lorg/apache/tools/ant/BuildException;

    new-instance v25, Ljava/lang/StringBuffer;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v26, "Encoding of project file "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    const-string/jumbo v26, " is invalid."

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-direct {v0, v1, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v24

    .line 332
    .end local v8    # "exc":Ljava/io/UnsupportedEncodingException;
    :catch_5
    move-exception v8

    .line 333
    .local v8, "exc":Ljava/io/IOException;
    :goto_d
    new-instance v24, Lorg/apache/tools/ant/BuildException;

    new-instance v25, Ljava/lang/StringBuffer;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v26, "Error reading project file "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    const-string/jumbo v26, ": "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-direct {v0, v1, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v24
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 336
    .end local v8    # "exc":Ljava/io/IOException;
    .end local v22    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v16    # "parser":Lorg/xml/sax/XMLReader;
    .restart local v17    # "pling":I
    .restart local v20    # "uri":Ljava/lang/String;
    .restart local v23    # "zf":Lorg/apache/tools/zip/ZipFile;
    :catchall_1
    move-exception v24

    move-object/from16 v22, v23

    .end local v23    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v22    # "zf":Lorg/apache/tools/zip/ZipFile;
    goto/16 :goto_7

    .end local v11    # "inputSource":Lorg/xml/sax/InputSource;
    .end local v17    # "pling":I
    .restart local v12    # "inputSource":Lorg/xml/sax/InputSource;
    :catchall_2
    move-exception v24

    move-object v11, v12

    .end local v12    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v11    # "inputSource":Lorg/xml/sax/InputSource;
    goto/16 :goto_7

    .line 332
    .end local v22    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v17    # "pling":I
    .restart local v23    # "zf":Lorg/apache/tools/zip/ZipFile;
    :catch_6
    move-exception v8

    move-object/from16 v22, v23

    .end local v23    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v22    # "zf":Lorg/apache/tools/zip/ZipFile;
    goto :goto_d

    .end local v11    # "inputSource":Lorg/xml/sax/InputSource;
    .end local v17    # "pling":I
    .restart local v12    # "inputSource":Lorg/xml/sax/InputSource;
    :catch_7
    move-exception v8

    move-object v11, v12

    .end local v12    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v11    # "inputSource":Lorg/xml/sax/InputSource;
    goto :goto_d

    .line 329
    .end local v22    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v17    # "pling":I
    .restart local v23    # "zf":Lorg/apache/tools/zip/ZipFile;
    :catch_8
    move-exception v8

    move-object/from16 v22, v23

    .end local v23    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v22    # "zf":Lorg/apache/tools/zip/ZipFile;
    goto :goto_c

    .end local v11    # "inputSource":Lorg/xml/sax/InputSource;
    .end local v17    # "pling":I
    .restart local v12    # "inputSource":Lorg/xml/sax/InputSource;
    :catch_9
    move-exception v8

    move-object v11, v12

    .end local v12    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v11    # "inputSource":Lorg/xml/sax/InputSource;
    goto :goto_c

    .line 327
    .end local v22    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v17    # "pling":I
    .restart local v23    # "zf":Lorg/apache/tools/zip/ZipFile;
    :catch_a
    move-exception v8

    move-object/from16 v22, v23

    .end local v23    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v22    # "zf":Lorg/apache/tools/zip/ZipFile;
    goto :goto_b

    .end local v11    # "inputSource":Lorg/xml/sax/InputSource;
    .end local v17    # "pling":I
    .restart local v12    # "inputSource":Lorg/xml/sax/InputSource;
    :catch_b
    move-exception v8

    move-object v11, v12

    .end local v12    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v11    # "inputSource":Lorg/xml/sax/InputSource;
    goto :goto_b

    .line 321
    .end local v22    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v17    # "pling":I
    .restart local v23    # "zf":Lorg/apache/tools/zip/ZipFile;
    :catch_c
    move-exception v8

    move-object/from16 v22, v23

    .end local v23    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v22    # "zf":Lorg/apache/tools/zip/ZipFile;
    goto/16 :goto_9

    .end local v11    # "inputSource":Lorg/xml/sax/InputSource;
    .end local v17    # "pling":I
    .restart local v12    # "inputSource":Lorg/xml/sax/InputSource;
    :catch_d
    move-exception v8

    move-object v11, v12

    .end local v12    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v11    # "inputSource":Lorg/xml/sax/InputSource;
    goto/16 :goto_9

    .line 308
    .end local v22    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v17    # "pling":I
    .restart local v23    # "zf":Lorg/apache/tools/zip/ZipFile;
    :catch_e
    move-exception v8

    move-object/from16 v22, v23

    .end local v23    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v22    # "zf":Lorg/apache/tools/zip/ZipFile;
    goto/16 :goto_6

    .end local v11    # "inputSource":Lorg/xml/sax/InputSource;
    .end local v17    # "pling":I
    .restart local v12    # "inputSource":Lorg/xml/sax/InputSource;
    :catch_f
    move-exception v8

    move-object v11, v12

    .end local v12    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v11    # "inputSource":Lorg/xml/sax/InputSource;
    goto/16 :goto_6
.end method

.method public parseAntlibDescriptor(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Resource;)Lorg/apache/tools/ant/UnknownElement;
    .locals 4
    .param p1, "containingProject"    # Lorg/apache/tools/ant/Project;
    .param p2, "resource"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 107
    sget-object v1, Lorg/apache/tools/ant/helper/ProjectHelper2;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    if-nez v1, :cond_0

    const-string/jumbo v1, "org.apache.tools.ant.types.resources.URLProvider"

    invoke-static {v1}, Lorg/apache/tools/ant/helper/ProjectHelper2;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/helper/ProjectHelper2;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {p2, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/URLProvider;

    .line 108
    .local v0, "up":Lorg/apache/tools/ant/types/resources/URLProvider;
    if-nez v0, :cond_1

    .line 109
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Unsupported resource type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 107
    .end local v0    # "up":Lorg/apache/tools/ant/types/resources/URLProvider;
    :cond_0
    sget-object v1, Lorg/apache/tools/ant/helper/ProjectHelper2;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    goto :goto_0

    .line 111
    .restart local v0    # "up":Lorg/apache/tools/ant/types/resources/URLProvider;
    :cond_1
    invoke-interface {v0}, Lorg/apache/tools/ant/types/resources/URLProvider;->getURL()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lorg/apache/tools/ant/helper/ProjectHelper2;->parseUnknownElement(Lorg/apache/tools/ant/Project;Ljava/net/URL;)Lorg/apache/tools/ant/UnknownElement;

    move-result-object v1

    return-object v1
.end method

.method public parseUnknownElement(Lorg/apache/tools/ant/Project;Ljava/net/URL;)Lorg/apache/tools/ant/UnknownElement;
    .locals 6
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "source"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 124
    new-instance v1, Lorg/apache/tools/ant/Target;

    invoke-direct {v1}, Lorg/apache/tools/ant/Target;-><init>()V

    .line 125
    .local v1, "dummyTarget":Lorg/apache/tools/ant/Target;
    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/Target;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 127
    new-instance v0, Lorg/apache/tools/ant/helper/AntXMLContext;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/helper/AntXMLContext;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 128
    .local v0, "context":Lorg/apache/tools/ant/helper/AntXMLContext;
    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/helper/AntXMLContext;->addTarget(Lorg/apache/tools/ant/Target;)V

    .line 129
    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/helper/AntXMLContext;->setImplicitTarget(Lorg/apache/tools/ant/Target;)V

    .line 131
    invoke-virtual {v0}, Lorg/apache/tools/ant/helper/AntXMLContext;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    new-instance v4, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;

    sget-object v5, Lorg/apache/tools/ant/helper/ProjectHelper2;->elementHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    invoke-direct {v4, v0, v5}, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;-><init>(Lorg/apache/tools/ant/helper/AntXMLContext;Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;)V

    invoke-virtual {p0, v3, p2, v4}, Lorg/apache/tools/ant/helper/ProjectHelper2;->parse(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;)V

    .line 132
    invoke-virtual {v1}, Lorg/apache/tools/ant/Target;->getTasks()[Lorg/apache/tools/ant/Task;

    move-result-object v2

    .line 133
    .local v2, "tasks":[Lorg/apache/tools/ant/Task;
    array-length v3, v2

    const/4 v4, 0x1

    if-eq v3, v4, :cond_0

    .line 134
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "No tasks defined"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 136
    :cond_0
    const/4 v3, 0x0

    aget-object v3, v2, v3

    check-cast v3, Lorg/apache/tools/ant/UnknownElement;

    return-object v3
.end method
