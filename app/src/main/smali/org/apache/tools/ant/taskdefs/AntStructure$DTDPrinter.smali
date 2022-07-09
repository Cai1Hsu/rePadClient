.class Lorg/apache/tools/ant/taskdefs/AntStructure$DTDPrinter;
.super Ljava/lang/Object;
.source "AntStructure.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/AntStructure$StructurePrinter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/AntStructure;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DTDPrinter"
.end annotation


# static fields
.field private static final BOOLEAN:Ljava/lang/String; = "%boolean;"

.field private static final TASKS:Ljava/lang/String; = "%tasks;"

.field private static final TYPES:Ljava/lang/String; = "%types;"


# instance fields
.field private visited:Ljava/util/Hashtable;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 181
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 187
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/AntStructure$DTDPrinter;->visited:Ljava/util/Hashtable;

    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/taskdefs/AntStructure$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/taskdefs/AntStructure$1;

    .prologue
    .line 181
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/AntStructure$DTDPrinter;-><init>()V

    return-void
.end method

.method public static final areNmtokens([Ljava/lang/String;)Z
    .locals 2
    .param p0, "s"    # [Ljava/lang/String;

    .prologue
    .line 459
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 460
    aget-object v1, p0, v0

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/AntStructure$DTDPrinter;->isNmtoken(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 461
    const/4 v1, 0x0

    .line 464
    :goto_1
    return v1

    .line 459
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 464
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method public static final isNmtoken(Ljava/lang/String;)Z
    .locals 4
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 438
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 439
    .local v2, "length":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 440
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 442
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v3

    if-nez v3, :cond_0

    const/16 v3, 0x2e

    if-eq v0, v3, :cond_0

    const/16 v3, 0x2d

    if-eq v0, v3, :cond_0

    const/16 v3, 0x5f

    if-eq v0, v3, :cond_0

    const/16 v3, 0x3a

    if-eq v0, v3, :cond_0

    .line 444
    const/4 v3, 0x0

    .line 447
    .end local v0    # "c":C
    :goto_1
    return v3

    .line 439
    .restart local v0    # "c":C
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 447
    .end local v0    # "c":C
    :cond_1
    const/4 v3, 0x1

    goto :goto_1
.end method

.method private printHead(Ljava/io/PrintWriter;Ljava/util/Enumeration;Ljava/util/Enumeration;)V
    .locals 4
    .param p1, "out"    # Ljava/io/PrintWriter;
    .param p2, "tasks"    # Ljava/util/Enumeration;
    .param p3, "types"    # Ljava/util/Enumeration;

    .prologue
    .line 206
    const-string/jumbo v3, "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>"

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 207
    const-string/jumbo v3, "<!ENTITY % boolean \"(true|false|on|off|yes|no)\">"

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 208
    const-string/jumbo v3, "<!ENTITY % tasks \""

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 209
    const/4 v0, 0x1

    .line 210
    .local v0, "first":Z
    :goto_0
    invoke-interface {p2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 211
    invoke-interface {p2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 212
    .local v1, "tName":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 213
    const-string/jumbo v3, " | "

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 217
    :goto_1
    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_0

    .line 215
    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    .line 219
    .end local v1    # "tName":Ljava/lang/String;
    :cond_1
    const-string/jumbo v3, "\">"

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 220
    const-string/jumbo v3, "<!ENTITY % types \""

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 221
    const/4 v0, 0x1

    .line 222
    :goto_2
    invoke-interface {p3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 223
    invoke-interface {p3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 224
    .local v2, "typeName":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 225
    const-string/jumbo v3, " | "

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 229
    :goto_3
    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_2

    .line 227
    :cond_2
    const/4 v0, 0x0

    goto :goto_3

    .line 231
    .end local v2    # "typeName":Ljava/lang/String;
    :cond_3
    const-string/jumbo v3, "\">"

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 233
    const-string/jumbo v3, ""

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 235
    const-string/jumbo v3, "<!ELEMENT project (target | extension-point | "

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 236
    const-string/jumbo v3, "%tasks;"

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 237
    const-string/jumbo v3, " | "

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 238
    const-string/jumbo v3, "%types;"

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 239
    const-string/jumbo v3, ")*>"

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 240
    const-string/jumbo v3, "<!ATTLIST project"

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 241
    const-string/jumbo v3, "          name    CDATA #IMPLIED"

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 242
    const-string/jumbo v3, "          default CDATA #IMPLIED"

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 243
    const-string/jumbo v3, "          basedir CDATA #IMPLIED>"

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 244
    const-string/jumbo v3, ""

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 245
    return-void
.end method

.method private printTargetAttrs(Ljava/io/PrintWriter;Ljava/lang/String;)V
    .locals 1
    .param p1, "out"    # Ljava/io/PrintWriter;
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 267
    const-string/jumbo v0, "<!ATTLIST "

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 268
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 269
    const-string/jumbo v0, "          id                      ID    #IMPLIED"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 270
    const-string/jumbo v0, "          name                    CDATA #REQUIRED"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 271
    const-string/jumbo v0, "          if                      CDATA #IMPLIED"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 272
    const-string/jumbo v0, "          unless                  CDATA #IMPLIED"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 273
    const-string/jumbo v0, "          depends                 CDATA #IMPLIED"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 274
    const-string/jumbo v0, "          extensionOf             CDATA #IMPLIED"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 275
    const-string/jumbo v0, "          onMissingExtensionPoint CDATA #IMPLIED"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 276
    const-string/jumbo v0, "          description             CDATA #IMPLIED>"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 277
    const-string/jumbo v0, ""

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 278
    return-void
.end method


# virtual methods
.method public printElementDecl(Ljava/io/PrintWriter;Lorg/apache/tools/ant/Project;Ljava/lang/String;Ljava/lang/Class;)V
    .locals 21
    .param p1, "out"    # Ljava/io/PrintWriter;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "element"    # Ljava/lang/Class;

    .prologue
    .line 286
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/AntStructure$DTDPrinter;->visited:Ljava/util/Hashtable;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_1

    .line 430
    :cond_0
    :goto_0
    return-void

    .line 289
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/AntStructure$DTDPrinter;->visited:Ljava/util/Hashtable;

    move-object/from16 v18, v0

    const-string/jumbo v19, ""

    move-object/from16 v0, v18

    move-object/from16 v1, p3

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    const/4 v10, 0x0

    .line 293
    .local v10, "ih":Lorg/apache/tools/ant/IntrospectionHelper;
    :try_start_0
    move-object/from16 v0, p2

    move-object/from16 v1, p4

    invoke-static {v0, v1}, Lorg/apache/tools/ant/IntrospectionHelper;->getHelper(Lorg/apache/tools/ant/Project;Ljava/lang/Class;)Lorg/apache/tools/ant/IntrospectionHelper;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v10

    .line 303
    new-instance v12, Ljava/lang/StringBuffer;

    const-string/jumbo v18, "<!ELEMENT "

    move-object/from16 v0, v18

    invoke-direct {v12, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 304
    .local v12, "sb":Ljava/lang/StringBuffer;
    move-object/from16 v0, p3

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 306
    sget-object v18, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$org$apache$tools$ant$types$Reference:Ljava/lang/Class;

    if-nez v18, :cond_2

    const-string/jumbo v18, "org.apache.tools.ant.types.Reference"

    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v18

    sput-object v18, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$org$apache$tools$ant$types$Reference:Ljava/lang/Class;

    :goto_1
    move-object/from16 v0, v18

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_3

    .line 307
    const-string/jumbo v18, "EMPTY>"

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-static {}, Lorg/apache/tools/ant/taskdefs/AntStructure;->access$100()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 308
    const-string/jumbo v18, "<!ATTLIST "

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 309
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/AntStructure;->access$100()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, "          id ID #IMPLIED"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 310
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/AntStructure;->access$100()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, "          refid IDREF #IMPLIED"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 311
    const-string/jumbo v18, ">"

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-static {}, Lorg/apache/tools/ant/taskdefs/AntStructure;->access$100()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 312
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 294
    .end local v12    # "sb":Ljava/lang/StringBuffer;
    :catch_0
    move-exception v13

    .line 300
    .local v13, "t":Ljava/lang/Throwable;
    goto/16 :goto_0

    .line 306
    .end local v13    # "t":Ljava/lang/Throwable;
    .restart local v12    # "sb":Ljava/lang/StringBuffer;
    :cond_2
    sget-object v18, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$org$apache$tools$ant$types$Reference:Ljava/lang/Class;

    goto :goto_1

    .line 316
    :cond_3
    new-instance v15, Ljava/util/Vector;

    invoke-direct {v15}, Ljava/util/Vector;-><init>()V

    .line 317
    .local v15, "v":Ljava/util/Vector;
    invoke-virtual {v10}, Lorg/apache/tools/ant/IntrospectionHelper;->supportsCharacters()Z

    move-result v18

    if-eqz v18, :cond_4

    .line 318
    const-string/jumbo v18, "#PCDATA"

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 321
    :cond_4
    sget-object v18, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$org$apache$tools$ant$TaskContainer:Ljava/lang/Class;

    if-nez v18, :cond_6

    const-string/jumbo v18, "org.apache.tools.ant.TaskContainer"

    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v18

    sput-object v18, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$org$apache$tools$ant$TaskContainer:Ljava/lang/Class;

    :goto_2
    move-object/from16 v0, v18

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v18

    if-eqz v18, :cond_5

    .line 322
    const-string/jumbo v18, "%tasks;"

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 325
    :cond_5
    invoke-virtual {v10}, Lorg/apache/tools/ant/IntrospectionHelper;->getNestedElements()Ljava/util/Enumeration;

    move-result-object v6

    .line 326
    .local v6, "e":Ljava/util/Enumeration;
    :goto_3
    invoke-interface {v6}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v18

    if-eqz v18, :cond_7

    .line 327
    invoke-interface {v6}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_3

    .line 321
    .end local v6    # "e":Ljava/util/Enumeration;
    :cond_6
    sget-object v18, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$org$apache$tools$ant$TaskContainer:Ljava/lang/Class;

    goto :goto_2

    .line 330
    .restart local v6    # "e":Ljava/util/Enumeration;
    :cond_7
    invoke-virtual {v15}, Ljava/util/Vector;->isEmpty()Z

    move-result v18

    if-eqz v18, :cond_b

    .line 331
    const-string/jumbo v18, "EMPTY"

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 346
    :cond_8
    :goto_4
    const-string/jumbo v18, ">"

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 347
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 349
    new-instance v12, Ljava/lang/StringBuffer;

    .end local v12    # "sb":Ljava/lang/StringBuffer;
    const-string/jumbo v18, "<!ATTLIST "

    move-object/from16 v0, v18

    invoke-direct {v12, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 350
    .restart local v12    # "sb":Ljava/lang/StringBuffer;
    move-object/from16 v0, p3

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 351
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/AntStructure;->access$100()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, "          id ID #IMPLIED"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 353
    invoke-virtual {v10}, Lorg/apache/tools/ant/IntrospectionHelper;->getAttributes()Ljava/util/Enumeration;

    move-result-object v6

    .line 354
    :cond_9
    :goto_5
    invoke-interface {v6}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v18

    if-eqz v18, :cond_1d

    .line 355
    invoke-interface {v6}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 356
    .local v4, "attrName":Ljava/lang/String;
    const-string/jumbo v18, "id"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_9

    .line 360
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/AntStructure;->access$100()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, "          "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 362
    invoke-virtual {v10, v4}, Lorg/apache/tools/ant/IntrospectionHelper;->getAttributeType(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v14

    .line 363
    .local v14, "type":Ljava/lang/Class;
    sget-object v18, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v18, :cond_f

    const-string/jumbo v18, "java.lang.Boolean"

    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v18

    sput-object v18, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$java$lang$Boolean:Ljava/lang/Class;

    :goto_6
    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_a

    sget-object v18, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_10

    .line 365
    :cond_a
    const-string/jumbo v18, "%boolean;"

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 416
    :goto_7
    const-string/jumbo v18, "#IMPLIED"

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5

    .line 333
    .end local v4    # "attrName":Ljava/lang/String;
    .end local v14    # "type":Ljava/lang/Class;
    :cond_b
    const-string/jumbo v18, "("

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 334
    invoke-virtual {v15}, Ljava/util/Vector;->size()I

    move-result v5

    .line 335
    .local v5, "count":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_8
    if-ge v8, v5, :cond_d

    .line 336
    if-eqz v8, :cond_c

    .line 337
    const-string/jumbo v18, " | "

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 339
    :cond_c
    invoke-virtual {v15, v8}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 335
    add-int/lit8 v8, v8, 0x1

    goto :goto_8

    .line 341
    :cond_d
    const-string/jumbo v18, ")"

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 342
    const/16 v18, 0x1

    move/from16 v0, v18

    if-gt v5, v0, :cond_e

    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v18

    const-string/jumbo v19, "#PCDATA"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_8

    .line 343
    :cond_e
    const-string/jumbo v18, "*"

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_4

    .line 363
    .end local v5    # "count":I
    .end local v8    # "i":I
    .restart local v4    # "attrName":Ljava/lang/String;
    .restart local v14    # "type":Ljava/lang/Class;
    :cond_f
    sget-object v18, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$java$lang$Boolean:Ljava/lang/Class;

    goto :goto_6

    .line 366
    :cond_10
    sget-object v18, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$org$apache$tools$ant$types$Reference:Ljava/lang/Class;

    if-nez v18, :cond_11

    const-string/jumbo v18, "org.apache.tools.ant.types.Reference"

    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v18

    sput-object v18, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$org$apache$tools$ant$types$Reference:Ljava/lang/Class;

    :goto_9
    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v18

    if-eqz v18, :cond_12

    .line 367
    const-string/jumbo v18, "IDREF "

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_7

    .line 366
    :cond_11
    sget-object v18, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$org$apache$tools$ant$types$Reference:Ljava/lang/Class;

    goto :goto_9

    .line 368
    :cond_12
    sget-object v18, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$org$apache$tools$ant$types$EnumeratedAttribute:Ljava/lang/Class;

    if-nez v18, :cond_14

    const-string/jumbo v18, "org.apache.tools.ant.types.EnumeratedAttribute"

    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v18

    sput-object v18, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$org$apache$tools$ant$types$EnumeratedAttribute:Ljava/lang/Class;

    :goto_a
    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v18

    if-eqz v18, :cond_18

    .line 370
    :try_start_1
    invoke-virtual {v14}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/tools/ant/types/EnumeratedAttribute;

    .line 372
    .local v7, "ea":Lorg/apache/tools/ant/types/EnumeratedAttribute;
    invoke-virtual {v7}, Lorg/apache/tools/ant/types/EnumeratedAttribute;->getValues()[Ljava/lang/String;

    move-result-object v16

    .line 373
    .local v16, "values":[Ljava/lang/String;
    if-eqz v16, :cond_13

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v18, v0

    if-eqz v18, :cond_13

    invoke-static/range {v16 .. v16}, Lorg/apache/tools/ant/taskdefs/AntStructure$DTDPrinter;->areNmtokens([Ljava/lang/String;)Z

    move-result v18

    if-nez v18, :cond_15

    .line 376
    :cond_13
    const-string/jumbo v18, "CDATA "

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_1
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_2

    goto/16 :goto_7

    .line 387
    .end local v7    # "ea":Lorg/apache/tools/ant/types/EnumeratedAttribute;
    .end local v16    # "values":[Ljava/lang/String;
    :catch_1
    move-exception v9

    .line 388
    .local v9, "ie":Ljava/lang/InstantiationException;
    const-string/jumbo v18, "CDATA "

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_7

    .line 368
    .end local v9    # "ie":Ljava/lang/InstantiationException;
    :cond_14
    sget-object v18, Lorg/apache/tools/ant/taskdefs/AntStructure;->class$org$apache$tools$ant$types$EnumeratedAttribute:Ljava/lang/Class;

    goto :goto_a

    .line 378
    .restart local v7    # "ea":Lorg/apache/tools/ant/types/EnumeratedAttribute;
    .restart local v16    # "values":[Ljava/lang/String;
    :cond_15
    :try_start_2
    const-string/jumbo v18, "("

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 379
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_b
    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v8, v0, :cond_17

    .line 380
    if-eqz v8, :cond_16

    .line 381
    const-string/jumbo v18, " | "

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 383
    :cond_16
    aget-object v18, v16, v8

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 379
    add-int/lit8 v8, v8, 0x1

    goto :goto_b

    .line 385
    :cond_17
    const-string/jumbo v18, ") "

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_2
    .catch Ljava/lang/InstantiationException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_7

    .line 389
    .end local v7    # "ea":Lorg/apache/tools/ant/types/EnumeratedAttribute;
    .end local v8    # "i":I
    .end local v16    # "values":[Ljava/lang/String;
    :catch_2
    move-exception v9

    .line 390
    .local v9, "ie":Ljava/lang/IllegalAccessException;
    const-string/jumbo v18, "CDATA "

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_7

    .line 392
    .end local v9    # "ie":Ljava/lang/IllegalAccessException;
    :cond_18
    invoke-virtual {v14}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v18

    if-eqz v18, :cond_1c

    invoke-virtual {v14}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v18

    const-string/jumbo v19, "java.lang.Enum"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_1c

    .line 395
    :try_start_3
    const-string/jumbo v19, "values"

    const/16 v18, 0x0

    check-cast v18, [Ljava/lang/Class;

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v19

    const/16 v20, 0x0

    const/16 v18, 0x0

    check-cast v18, [Ljava/lang/Object;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, [Ljava/lang/Object;

    .line 397
    .local v16, "values":[Ljava/lang/Object;
    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v18, v0

    if-nez v18, :cond_19

    .line 398
    const-string/jumbo v18, "CDATA "

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto/16 :goto_7

    .line 410
    .end local v16    # "values":[Ljava/lang/Object;
    :catch_3
    move-exception v17

    .line 411
    .local v17, "x":Ljava/lang/Exception;
    const-string/jumbo v18, "CDATA "

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_7

    .line 400
    .end local v17    # "x":Ljava/lang/Exception;
    .restart local v16    # "values":[Ljava/lang/Object;
    :cond_19
    const/16 v18, 0x28

    :try_start_4
    move/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 401
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_c
    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v8, v0, :cond_1b

    .line 402
    if-eqz v8, :cond_1a

    .line 403
    const-string/jumbo v18, " | "

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 405
    :cond_1a
    const-string/jumbo v19, "name"

    const/16 v18, 0x0

    check-cast v18, [Ljava/lang/Class;

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v19

    aget-object v20, v16, v8

    const/16 v18, 0x0

    check-cast v18, [Ljava/lang/Object;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 401
    add-int/lit8 v8, v8, 0x1

    goto :goto_c

    .line 408
    :cond_1b
    const-string/jumbo v18, ") "

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto/16 :goto_7

    .line 414
    .end local v8    # "i":I
    .end local v16    # "values":[Ljava/lang/Object;
    :cond_1c
    const-string/jumbo v18, "CDATA "

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_7

    .line 418
    .end local v4    # "attrName":Ljava/lang/String;
    .end local v14    # "type":Ljava/lang/Class;
    :cond_1d
    const-string/jumbo v18, ">"

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-static {}, Lorg/apache/tools/ant/taskdefs/AntStructure;->access$100()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 419
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 421
    invoke-virtual {v15}, Ljava/util/Vector;->size()I

    move-result v5

    .line 422
    .restart local v5    # "count":I
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_d
    if-ge v8, v5, :cond_0

    .line 423
    invoke-virtual {v15, v8}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 424
    .local v11, "nestedName":Ljava/lang/String;
    const-string/jumbo v18, "#PCDATA"

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_1e

    const-string/jumbo v18, "%tasks;"

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_1e

    const-string/jumbo v18, "%types;"

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_1e

    .line 427
    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/IntrospectionHelper;->getElementType(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, v18

    invoke-virtual {v0, v1, v2, v11, v3}, Lorg/apache/tools/ant/taskdefs/AntStructure$DTDPrinter;->printElementDecl(Ljava/io/PrintWriter;Lorg/apache/tools/ant/Project;Ljava/lang/String;Ljava/lang/Class;)V

    .line 422
    :cond_1e
    add-int/lit8 v8, v8, 0x1

    goto :goto_d
.end method

.method public printHead(Ljava/io/PrintWriter;Lorg/apache/tools/ant/Project;Ljava/util/Hashtable;Ljava/util/Hashtable;)V
    .locals 2
    .param p1, "out"    # Ljava/io/PrintWriter;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .param p3, "tasks"    # Ljava/util/Hashtable;
    .param p4, "types"    # Ljava/util/Hashtable;

    .prologue
    .line 194
    invoke-virtual {p3}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    invoke-virtual {p4}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/tools/ant/taskdefs/AntStructure$DTDPrinter;->printHead(Ljava/io/PrintWriter;Ljava/util/Enumeration;Ljava/util/Enumeration;)V

    .line 195
    return-void
.end method

.method public printTail(Ljava/io/PrintWriter;)V
    .locals 1
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 190
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AntStructure$DTDPrinter;->visited:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clear()V

    .line 191
    return-void
.end method

.method public printTargetDecl(Ljava/io/PrintWriter;)V
    .locals 1
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 251
    const-string/jumbo v0, "<!ELEMENT target ("

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 252
    const-string/jumbo v0, "%tasks;"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 253
    const-string/jumbo v0, " | "

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 254
    const-string/jumbo v0, "%types;"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 255
    const-string/jumbo v0, ")*>"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 256
    const-string/jumbo v0, ""

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 257
    const-string/jumbo v0, "target"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/AntStructure$DTDPrinter;->printTargetAttrs(Ljava/io/PrintWriter;Ljava/lang/String;)V

    .line 258
    const-string/jumbo v0, "<!ELEMENT extension-point EMPTY>"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 259
    const-string/jumbo v0, ""

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 260
    const-string/jumbo v0, "extension-point"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/AntStructure$DTDPrinter;->printTargetAttrs(Ljava/io/PrintWriter;Ljava/lang/String;)V

    .line 261
    return-void
.end method
