.class public final Lorg/apache/tools/ant/IntrospectionHelper;
.super Ljava/lang/Object;
.source "IntrospectionHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;,
        Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;,
        Lorg/apache/tools/ant/IntrospectionHelper$AddNestedCreator;,
        Lorg/apache/tools/ant/IntrospectionHelper$CreateNestedCreator;,
        Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;,
        Lorg/apache/tools/ant/IntrospectionHelper$Creator;
    }
.end annotation


# static fields
.field private static final ELLIPSIS:Ljava/lang/String; = "..."

.field private static final HELPERS:Ljava/util/Map;

.field private static final MAX_REPORT_NESTED_TEXT:I = 0x14

.field protected static final NOT_SUPPORTED_CHILD_POSTFIX:Ljava/lang/String; = "\" element."

.field protected static final NOT_SUPPORTED_CHILD_PREFIX:Ljava/lang/String; = " doesn\'t support the nested \""

.field private static final PRIMITIVE_TYPE_MAP:Ljava/util/Map;

.field static class$java$io$File:Ljava/lang/Class;

.field static class$java$lang$Boolean:Ljava/lang/Class;

.field static class$java$lang$Byte:Ljava/lang/Class;

.field static class$java$lang$Character:Ljava/lang/Class;

.field static class$java$lang$Class:Ljava/lang/Class;

.field static class$java$lang$Double:Ljava/lang/Class;

.field static class$java$lang$Float:Ljava/lang/Class;

.field static class$java$lang$Integer:Ljava/lang/Class;

.field static class$java$lang$Long:Ljava/lang/Class;

.field static class$java$lang$Object:Ljava/lang/Class;

.field static class$java$lang$Short:Ljava/lang/Class;

.field static class$java$lang$String:Ljava/lang/Class;

.field static class$org$apache$tools$ant$DynamicElement:Ljava/lang/Class;

.field static class$org$apache$tools$ant$DynamicElementNS:Ljava/lang/Class;

.field static class$org$apache$tools$ant$Location:Ljava/lang/Class;

.field static class$org$apache$tools$ant$Project:Ljava/lang/Class;

.field static class$org$apache$tools$ant$ProjectComponent:Ljava/lang/Class;

.field static class$org$apache$tools$ant$Task:Ljava/lang/Class;

.field static class$org$apache$tools$ant$TaskContainer:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$EnumeratedAttribute:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$Resource:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private final addText:Ljava/lang/reflect/Method;

.field private final addTypeMethods:Ljava/util/List;

.field private final attributeSetters:Ljava/util/Hashtable;

.field private final attributeTypes:Ljava/util/Hashtable;

.field private final bean:Ljava/lang/Class;

.field private final nestedCreators:Ljava/util/Hashtable;

.field private final nestedTypes:Ljava/util/Hashtable;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    const/16 v5, 0x8

    .line 65
    new-instance v3, Ljava/util/Hashtable;

    invoke-direct {v3}, Ljava/util/Hashtable;-><init>()V

    sput-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->HELPERS:Ljava/util/Map;

    .line 73
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3, v5}, Ljava/util/HashMap;-><init>(I)V

    sput-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->PRIMITIVE_TYPE_MAP:Ljava/util/Map;

    .line 77
    new-array v1, v5, [Ljava/lang/Class;

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v3, v1, v6

    sget-object v3, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    aput-object v3, v1, v7

    sget-object v3, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    aput-object v3, v1, v8

    sget-object v3, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    aput-object v3, v1, v9

    const/4 v3, 0x4

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v1, v3

    const/4 v3, 0x5

    sget-object v4, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v4, v1, v3

    const/4 v3, 0x6

    sget-object v4, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v4, v1, v3

    const/4 v3, 0x7

    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    aput-object v4, v1, v3

    .line 79
    .local v1, "primitives":[Ljava/lang/Class;
    new-array v2, v5, [Ljava/lang/Class;

    sget-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v3, :cond_0

    const-string/jumbo v3, "java.lang.Boolean"

    invoke-static {v3}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Boolean:Ljava/lang/Class;

    :goto_0
    aput-object v3, v2, v6

    sget-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v3, :cond_1

    const-string/jumbo v3, "java.lang.Byte"

    invoke-static {v3}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_1
    aput-object v3, v2, v7

    sget-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Character:Ljava/lang/Class;

    if-nez v3, :cond_2

    const-string/jumbo v3, "java.lang.Character"

    invoke-static {v3}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Character:Ljava/lang/Class;

    :goto_2
    aput-object v3, v2, v8

    sget-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v3, :cond_3

    const-string/jumbo v3, "java.lang.Short"

    invoke-static {v3}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Short:Ljava/lang/Class;

    :goto_3
    aput-object v3, v2, v9

    const/4 v4, 0x4

    sget-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v3, :cond_4

    const-string/jumbo v3, "java.lang.Integer"

    invoke-static {v3}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Integer:Ljava/lang/Class;

    :goto_4
    aput-object v3, v2, v4

    const/4 v4, 0x5

    sget-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v3, :cond_5

    const-string/jumbo v3, "java.lang.Long"

    invoke-static {v3}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Long:Ljava/lang/Class;

    :goto_5
    aput-object v3, v2, v4

    const/4 v4, 0x6

    sget-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Float:Ljava/lang/Class;

    if-nez v3, :cond_6

    const-string/jumbo v3, "java.lang.Float"

    invoke-static {v3}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Float:Ljava/lang/Class;

    :goto_6
    aput-object v3, v2, v4

    const/4 v4, 0x7

    sget-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Double:Ljava/lang/Class;

    if-nez v3, :cond_7

    const-string/jumbo v3, "java.lang.Double"

    invoke-static {v3}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Double:Ljava/lang/Class;

    :goto_7
    aput-object v3, v2, v4

    .line 81
    .local v2, "wrappers":[Ljava/lang/Class;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    array-length v3, v1

    if-ge v0, v3, :cond_8

    .line 82
    sget-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->PRIMITIVE_TYPE_MAP:Ljava/util/Map;

    aget-object v4, v1, v0

    aget-object v5, v2, v0

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 79
    .end local v0    # "i":I
    .end local v2    # "wrappers":[Ljava/lang/Class;
    :cond_0
    sget-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Boolean:Ljava/lang/Class;

    goto/16 :goto_0

    :cond_1
    sget-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Byte:Ljava/lang/Class;

    goto :goto_1

    :cond_2
    sget-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Character:Ljava/lang/Class;

    goto :goto_2

    :cond_3
    sget-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Short:Ljava/lang/Class;

    goto :goto_3

    :cond_4
    sget-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Integer:Ljava/lang/Class;

    goto :goto_4

    :cond_5
    sget-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_5

    :cond_6
    sget-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Float:Ljava/lang/Class;

    goto :goto_6

    :cond_7
    sget-object v3, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Double:Ljava/lang/Class;

    goto :goto_7

    .line 84
    .restart local v0    # "i":I
    .restart local v2    # "wrappers":[Ljava/lang/Class;
    :cond_8
    return-void
.end method

.method private constructor <init>(Ljava/lang/Class;)V
    .locals 17
    .param p1, "bean"    # Ljava/lang/Class;

    .prologue
    .line 178
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 93
    new-instance v13, Ljava/util/Hashtable;

    invoke-direct {v13}, Ljava/util/Hashtable;-><init>()V

    move-object/from16 v0, p0

    iput-object v13, v0, Lorg/apache/tools/ant/IntrospectionHelper;->attributeTypes:Ljava/util/Hashtable;

    .line 99
    new-instance v13, Ljava/util/Hashtable;

    invoke-direct {v13}, Ljava/util/Hashtable;-><init>()V

    move-object/from16 v0, p0

    iput-object v13, v0, Lorg/apache/tools/ant/IntrospectionHelper;->attributeSetters:Ljava/util/Hashtable;

    .line 105
    new-instance v13, Ljava/util/Hashtable;

    invoke-direct {v13}, Ljava/util/Hashtable;-><init>()V

    move-object/from16 v0, p0

    iput-object v13, v0, Lorg/apache/tools/ant/IntrospectionHelper;->nestedTypes:Ljava/util/Hashtable;

    .line 111
    new-instance v13, Ljava/util/Hashtable;

    invoke-direct {v13}, Ljava/util/Hashtable;-><init>()V

    move-object/from16 v0, p0

    iput-object v13, v0, Lorg/apache/tools/ant/IntrospectionHelper;->nestedCreators:Ljava/util/Hashtable;

    .line 116
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v13, v0, Lorg/apache/tools/ant/IntrospectionHelper;->addTypeMethods:Ljava/util/List;

    .line 179
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/IntrospectionHelper;->bean:Ljava/lang/Class;

    .line 180
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v9

    .line 181
    .local v9, "methods":[Ljava/lang/reflect/Method;
    const/4 v2, 0x0

    .line 182
    .local v2, "addTextMethod":Ljava/lang/reflect/Method;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    array-length v13, v9

    if-ge v7, v13, :cond_15

    .line 183
    aget-object v8, v9, v7

    .line 184
    .local v8, "m":Ljava/lang/reflect/Method;
    invoke-virtual {v8}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v10

    .line 185
    .local v10, "name":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v12

    .line 186
    .local v12, "returnType":Ljava/lang/Class;
    invoke-virtual {v8}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v3

    .line 189
    .local v3, "args":[Ljava/lang/Class;
    array-length v13, v3

    const/4 v14, 0x1

    if-ne v13, v14, :cond_2

    sget-object v13, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-virtual {v13, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    const-string/jumbo v13, "add"

    invoke-virtual {v13, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_0

    const-string/jumbo v13, "addConfigured"

    invoke-virtual {v13, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 191
    :cond_0
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/apache/tools/ant/IntrospectionHelper;->insertAddTypeMethod(Ljava/lang/reflect/Method;)V

    .line 182
    :cond_1
    :goto_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 195
    :cond_2
    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$ProjectComponent:Ljava/lang/Class;

    if-nez v13, :cond_5

    const-string/jumbo v13, "org.apache.tools.ant.ProjectComponent"

    invoke-static {v13}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    sput-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$ProjectComponent:Ljava/lang/Class;

    :goto_2
    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v13

    if-eqz v13, :cond_3

    array-length v13, v3

    const/4 v14, 0x1

    if-ne v13, v14, :cond_3

    const/4 v13, 0x0

    aget-object v13, v3, v13

    move-object/from16 v0, p0

    invoke-direct {v0, v10, v13}, Lorg/apache/tools/ant/IntrospectionHelper;->isHiddenSetMethod(Ljava/lang/String;Ljava/lang/Class;)Z

    move-result v13

    if-nez v13, :cond_1

    .line 200
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/IntrospectionHelper;->isContainer()Z

    move-result v13

    if-eqz v13, :cond_4

    array-length v13, v3

    const/4 v14, 0x1

    if-ne v13, v14, :cond_4

    const-string/jumbo v13, "addTask"

    invoke-virtual {v13, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_4

    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    if-nez v13, :cond_6

    const-string/jumbo v13, "org.apache.tools.ant.Task"

    invoke-static {v13}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    sput-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    :goto_3
    const/4 v14, 0x0

    aget-object v14, v3, v14

    invoke-virtual {v13, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_1

    .line 204
    :cond_4
    const-string/jumbo v13, "addText"

    invoke-virtual {v13, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_8

    sget-object v13, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-virtual {v13, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_8

    array-length v13, v3

    const/4 v14, 0x1

    if-ne v13, v14, :cond_8

    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    if-nez v13, :cond_7

    const-string/jumbo v13, "java.lang.String"

    invoke-static {v13}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    sput-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    :goto_4
    const/4 v14, 0x0

    aget-object v14, v3, v14

    invoke-virtual {v13, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_8

    .line 206
    aget-object v2, v9, v7

    goto :goto_1

    .line 195
    :cond_5
    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$ProjectComponent:Ljava/lang/Class;

    goto :goto_2

    .line 200
    :cond_6
    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    goto :goto_3

    .line 204
    :cond_7
    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_4

    .line 207
    :cond_8
    const-string/jumbo v13, "set"

    invoke-virtual {v10, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_e

    sget-object v13, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-virtual {v13, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_e

    array-length v13, v3

    const/4 v14, 0x1

    if-ne v13, v14, :cond_e

    const/4 v13, 0x0

    aget-object v13, v3, v13

    invoke-virtual {v13}, Ljava/lang/Class;->isArray()Z

    move-result v13

    if-nez v13, :cond_e

    .line 209
    const-string/jumbo v13, "set"

    invoke-static {v10, v13}, Lorg/apache/tools/ant/IntrospectionHelper;->getPropertyName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 210
    .local v11, "propName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/IntrospectionHelper;->attributeSetters:Ljava/util/Hashtable;

    invoke-virtual {v13, v11}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;

    .line 211
    .local v4, "as":Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;
    if-eqz v4, :cond_9

    .line 212
    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    if-nez v13, :cond_a

    const-string/jumbo v13, "java.lang.String"

    invoke-static {v13}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    sput-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    :goto_5
    const/4 v14, 0x0

    aget-object v14, v3, v14

    invoke-virtual {v13, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_1

    .line 221
    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$io$File:Ljava/lang/Class;

    if-nez v13, :cond_b

    const-string/jumbo v13, "java.io.File"

    invoke-static {v13}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    sput-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$io$File:Ljava/lang/Class;

    :goto_6
    const/4 v14, 0x0

    aget-object v14, v3, v14

    invoke-virtual {v13, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9

    .line 223
    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$types$Resource:Ljava/lang/Class;

    if-nez v13, :cond_c

    const-string/jumbo v13, "org.apache.tools.ant.types.Resource"

    invoke-static {v13}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    sput-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$types$Resource:Ljava/lang/Class;

    :goto_7
    invoke-static {v4}, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;->access$000(Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;)Ljava/lang/Class;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_1

    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v13, :cond_d

    const-string/jumbo v13, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v13}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    sput-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_8
    invoke-static {v4}, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;->access$000(Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;)Ljava/lang/Class;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_1

    .line 237
    :cond_9
    const/4 v13, 0x0

    aget-object v13, v3, v13

    move-object/from16 v0, p0

    invoke-direct {v0, v8, v13, v11}, Lorg/apache/tools/ant/IntrospectionHelper;->createAttributeSetter(Ljava/lang/reflect/Method;Ljava/lang/Class;Ljava/lang/String;)Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;

    move-result-object v4

    .line 238
    if-eqz v4, :cond_1

    .line 239
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/IntrospectionHelper;->attributeTypes:Ljava/util/Hashtable;

    const/4 v14, 0x0

    aget-object v14, v3, v14

    invoke-virtual {v13, v11, v14}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/IntrospectionHelper;->attributeSetters:Ljava/util/Hashtable;

    invoke-virtual {v13, v11, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    .line 212
    :cond_a
    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_5

    .line 221
    :cond_b
    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$io$File:Ljava/lang/Class;

    goto :goto_6

    .line 223
    :cond_c
    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$types$Resource:Ljava/lang/Class;

    goto :goto_7

    :cond_d
    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_8

    .line 242
    .end local v4    # "as":Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;
    .end local v11    # "propName":Ljava/lang/String;
    :cond_e
    const-string/jumbo v13, "create"

    invoke-virtual {v10, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_f

    invoke-virtual {v12}, Ljava/lang/Class;->isArray()Z

    move-result v13

    if-nez v13, :cond_f

    invoke-virtual {v12}, Ljava/lang/Class;->isPrimitive()Z

    move-result v13

    if-nez v13, :cond_f

    array-length v13, v3

    if-nez v13, :cond_f

    .line 245
    const-string/jumbo v13, "create"

    invoke-static {v10, v13}, Lorg/apache/tools/ant/IntrospectionHelper;->getPropertyName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 248
    .restart local v11    # "propName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/IntrospectionHelper;->nestedCreators:Ljava/util/Hashtable;

    invoke-virtual {v13, v11}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    if-nez v13, :cond_1

    .line 249
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/IntrospectionHelper;->nestedTypes:Ljava/util/Hashtable;

    invoke-virtual {v13, v11, v12}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/IntrospectionHelper;->nestedCreators:Ljava/util/Hashtable;

    new-instance v14, Lorg/apache/tools/ant/IntrospectionHelper$CreateNestedCreator;

    invoke-direct {v14, v8}, Lorg/apache/tools/ant/IntrospectionHelper$CreateNestedCreator;-><init>(Ljava/lang/reflect/Method;)V

    invoke-virtual {v13, v11, v14}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    .line 252
    .end local v11    # "propName":Ljava/lang/String;
    :cond_f
    const-string/jumbo v13, "addConfigured"

    invoke-virtual {v10, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_12

    sget-object v13, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-virtual {v13, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_12

    array-length v13, v3

    const/4 v14, 0x1

    if-ne v13, v14, :cond_12

    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    if-nez v13, :cond_10

    const-string/jumbo v13, "java.lang.String"

    invoke-static {v13}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    sput-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    :goto_9
    const/4 v14, 0x0

    aget-object v14, v3, v14

    invoke-virtual {v13, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_12

    const/4 v13, 0x0

    aget-object v13, v3, v13

    invoke-virtual {v13}, Ljava/lang/Class;->isArray()Z

    move-result v13

    if-nez v13, :cond_12

    const/4 v13, 0x0

    aget-object v13, v3, v13

    invoke-virtual {v13}, Ljava/lang/Class;->isPrimitive()Z

    move-result v13

    if-nez v13, :cond_12

    .line 257
    const/4 v5, 0x0

    .line 259
    .local v5, "constructor":Ljava/lang/reflect/Constructor;
    const/4 v13, 0x0

    :try_start_0
    aget-object v13, v3, v13

    const/4 v14, 0x0

    new-array v14, v14, [Ljava/lang/Class;

    invoke-virtual {v13, v14}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v5

    .line 263
    :goto_a
    :try_start_1
    const-string/jumbo v13, "addConfigured"

    invoke-static {v10, v13}, Lorg/apache/tools/ant/IntrospectionHelper;->getPropertyName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 264
    .restart local v11    # "propName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/IntrospectionHelper;->nestedTypes:Ljava/util/Hashtable;

    const/4 v14, 0x0

    aget-object v14, v3, v14

    invoke-virtual {v13, v11, v14}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/IntrospectionHelper;->nestedCreators:Ljava/util/Hashtable;

    new-instance v14, Lorg/apache/tools/ant/IntrospectionHelper$AddNestedCreator;

    const/4 v15, 0x2

    invoke-direct {v14, v8, v5, v15}, Lorg/apache/tools/ant/IntrospectionHelper$AddNestedCreator;-><init>(Ljava/lang/reflect/Method;Ljava/lang/reflect/Constructor;I)V

    invoke-virtual {v13, v11, v14}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    .line 267
    .end local v11    # "propName":Ljava/lang/String;
    :catch_0
    move-exception v13

    goto/16 :goto_1

    .line 252
    .end local v5    # "constructor":Ljava/lang/reflect/Constructor;
    :cond_10
    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_9

    .line 260
    .restart local v5    # "constructor":Ljava/lang/reflect/Constructor;
    :catch_1
    move-exception v6

    .line 261
    .local v6, "ex":Ljava/lang/NoSuchMethodException;
    const/4 v13, 0x0

    :try_start_2
    aget-object v14, v3, v13

    const/4 v13, 0x1

    new-array v15, v13, [Ljava/lang/Class;

    const/16 v16, 0x0

    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    if-nez v13, :cond_11

    const-string/jumbo v13, "org.apache.tools.ant.Project"

    invoke-static {v13}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    sput-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    :goto_b
    aput-object v13, v15, v16

    invoke-virtual {v14, v15}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    goto :goto_a

    :cond_11
    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$Project:Ljava/lang/Class;
    :try_end_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_b

    .line 270
    .end local v5    # "constructor":Ljava/lang/reflect/Constructor;
    .end local v6    # "ex":Ljava/lang/NoSuchMethodException;
    :cond_12
    const-string/jumbo v13, "add"

    invoke-virtual {v10, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_1

    sget-object v13, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-virtual {v13, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    array-length v13, v3

    const/4 v14, 0x1

    if-ne v13, v14, :cond_1

    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    if-nez v13, :cond_13

    const-string/jumbo v13, "java.lang.String"

    invoke-static {v13}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    sput-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    :goto_c
    const/4 v14, 0x0

    aget-object v14, v3, v14

    invoke-virtual {v13, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_1

    const/4 v13, 0x0

    aget-object v13, v3, v13

    invoke-virtual {v13}, Ljava/lang/Class;->isArray()Z

    move-result v13

    if-nez v13, :cond_1

    const/4 v13, 0x0

    aget-object v13, v3, v13

    invoke-virtual {v13}, Ljava/lang/Class;->isPrimitive()Z

    move-result v13

    if-nez v13, :cond_1

    .line 275
    const/4 v5, 0x0

    .line 277
    .restart local v5    # "constructor":Ljava/lang/reflect/Constructor;
    const/4 v13, 0x0

    :try_start_3
    aget-object v13, v3, v13

    const/4 v14, 0x0

    new-array v14, v14, [Ljava/lang/Class;

    invoke-virtual {v13, v14}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3 .. :try_end_3} :catch_3

    move-result-object v5

    .line 281
    :goto_d
    :try_start_4
    const-string/jumbo v13, "add"

    invoke-static {v10, v13}, Lorg/apache/tools/ant/IntrospectionHelper;->getPropertyName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 282
    .restart local v11    # "propName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/IntrospectionHelper;->nestedTypes:Ljava/util/Hashtable;

    invoke-virtual {v13, v11}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    if-nez v13, :cond_1

    .line 290
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/IntrospectionHelper;->nestedTypes:Ljava/util/Hashtable;

    const/4 v14, 0x0

    aget-object v14, v3, v14

    invoke-virtual {v13, v11, v14}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/IntrospectionHelper;->nestedCreators:Ljava/util/Hashtable;

    new-instance v14, Lorg/apache/tools/ant/IntrospectionHelper$AddNestedCreator;

    const/4 v15, 0x1

    invoke-direct {v14, v8, v5, v15}, Lorg/apache/tools/ant/IntrospectionHelper$AddNestedCreator;-><init>(Ljava/lang/reflect/Method;Ljava/lang/reflect/Constructor;I)V

    invoke-virtual {v13, v11, v14}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_4 .. :try_end_4} :catch_2

    goto/16 :goto_1

    .line 293
    .end local v11    # "propName":Ljava/lang/String;
    :catch_2
    move-exception v13

    goto/16 :goto_1

    .line 270
    .end local v5    # "constructor":Ljava/lang/reflect/Constructor;
    :cond_13
    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_c

    .line 278
    .restart local v5    # "constructor":Ljava/lang/reflect/Constructor;
    :catch_3
    move-exception v6

    .line 279
    .restart local v6    # "ex":Ljava/lang/NoSuchMethodException;
    const/4 v13, 0x0

    :try_start_5
    aget-object v14, v3, v13

    const/4 v13, 0x1

    new-array v15, v13, [Ljava/lang/Class;

    const/16 v16, 0x0

    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    if-nez v13, :cond_14

    const-string/jumbo v13, "org.apache.tools.ant.Project"

    invoke-static {v13}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    sput-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    :goto_e
    aput-object v13, v15, v16

    invoke-virtual {v14, v15}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    goto :goto_d

    :cond_14
    sget-object v13, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$Project:Ljava/lang/Class;
    :try_end_5
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_e

    .line 298
    .end local v3    # "args":[Ljava/lang/Class;
    .end local v5    # "constructor":Ljava/lang/reflect/Constructor;
    .end local v6    # "ex":Ljava/lang/NoSuchMethodException;
    .end local v8    # "m":Ljava/lang/reflect/Method;
    .end local v10    # "name":Ljava/lang/String;
    .end local v12    # "returnType":Ljava/lang/Class;
    :cond_15
    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/apache/tools/ant/IntrospectionHelper;->addText:Ljava/lang/reflect/Method;

    .line 299
    return-void
.end method

.method static access$400(Ljava/lang/reflect/InvocationTargetException;)Lorg/apache/tools/ant/BuildException;
    .locals 1
    .param p0, "x0"    # Ljava/lang/reflect/InvocationTargetException;

    .prologue
    .line 60
    invoke-static {p0}, Lorg/apache/tools/ant/IntrospectionHelper;->extractBuildException(Ljava/lang/reflect/InvocationTargetException;)Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    return-object v0
.end method

.method static access$500(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 60
    invoke-static {p0, p1}, Lorg/apache/tools/ant/IntrospectionHelper;->getPropertyName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static access$600()Ljava/util/Map;
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lorg/apache/tools/ant/IntrospectionHelper;->PRIMITIVE_TYPE_MAP:Ljava/util/Map;

    return-object v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 79
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

.method public static clearCache()V
    .locals 1

    .prologue
    .line 1512
    sget-object v0, Lorg/apache/tools/ant/IntrospectionHelper;->HELPERS:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 1513
    return-void
.end method

.method private condenseText(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 1638
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x14

    if-gt v1, v2, :cond_0

    .line 1642
    .end local p1    # "text":Ljava/lang/String;
    :goto_0
    return-object p1

    .line 1641
    .restart local p1    # "text":Ljava/lang/String;
    :cond_0
    const-string/jumbo v1, "..."

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rsub-int/lit8 v1, v1, 0x14

    div-int/lit8 v0, v1, 0x2

    .line 1642
    .local v0, "ends":I
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1, p1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v0

    const-string/jumbo v3, "..."

    invoke-virtual {v1, v0, v2, v3}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method private createAddTypeCreator(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;)Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;
    .locals 10
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "parent"    # Ljava/lang/Object;
    .param p3, "elementName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 1526
    iget-object v8, p0, Lorg/apache/tools/ant/IntrospectionHelper;->addTypeMethods:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_1

    .line 1557
    :cond_0
    :goto_0
    return-object v7

    .line 1529
    :cond_1
    invoke-static {p1}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v0

    .line 1531
    .local v0, "helper":Lorg/apache/tools/ant/ComponentHelper;
    iget-object v8, p0, Lorg/apache/tools/ant/IntrospectionHelper;->addTypeMethods:Ljava/util/List;

    invoke-direct {p0, v0, p3, v8}, Lorg/apache/tools/ant/IntrospectionHelper;->createRestricted(Lorg/apache/tools/ant/ComponentHelper;Ljava/lang/String;Ljava/util/List;)Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;

    move-result-object v5

    .line 1533
    .local v5, "restricted":Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;
    iget-object v8, p0, Lorg/apache/tools/ant/IntrospectionHelper;->addTypeMethods:Ljava/util/List;

    invoke-direct {p0, v0, p3, v8}, Lorg/apache/tools/ant/IntrospectionHelper;->createTopLevel(Lorg/apache/tools/ant/ComponentHelper;Ljava/lang/String;Ljava/util/List;)Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;

    move-result-object v6

    .line 1536
    .local v6, "topLevel":Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;
    if-nez v5, :cond_2

    if-eqz v6, :cond_0

    .line 1540
    :cond_2
    if-eqz v5, :cond_3

    if-eqz v6, :cond_3

    .line 1541
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "ambiguous: type and component definitions for "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1546
    :cond_3
    if-eqz v5, :cond_5

    move-object v1, v5

    .line 1549
    .local v1, "methodAndObject":Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;
    :goto_1
    invoke-static {v1}, Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;->access$700(Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;)Ljava/lang/Object;

    move-result-object v3

    .line 1550
    .local v3, "rObject":Ljava/lang/Object;
    invoke-static {v1}, Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;->access$700(Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;)Ljava/lang/Object;

    move-result-object v7

    instance-of v7, v7, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;

    if-eqz v7, :cond_4

    .line 1551
    invoke-static {v1}, Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;->access$700(Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;

    invoke-virtual {v7, p1}, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->createObject(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v3

    .line 1554
    :cond_4
    invoke-static {v1}, Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;->access$700(Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;)Ljava/lang/Object;

    move-result-object v2

    .line 1555
    .local v2, "nestedObject":Ljava/lang/Object;
    move-object v4, v3

    .line 1557
    .local v4, "realObject":Ljava/lang/Object;
    new-instance v7, Lorg/apache/tools/ant/IntrospectionHelper$13;

    invoke-static {v1}, Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;->access$800(Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;)Ljava/lang/reflect/Method;

    move-result-object v8

    invoke-direct {v7, p0, v8, v4, v2}, Lorg/apache/tools/ant/IntrospectionHelper$13;-><init>(Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/reflect/Method;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .end local v1    # "methodAndObject":Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;
    .end local v2    # "nestedObject":Ljava/lang/Object;
    .end local v3    # "rObject":Ljava/lang/Object;
    .end local v4    # "realObject":Ljava/lang/Object;
    :cond_5
    move-object v1, v6

    .line 1546
    goto :goto_1
.end method

.method private createAttributeSetter(Ljava/lang/reflect/Method;Ljava/lang/Class;Ljava/lang/String;)Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;
    .locals 22
    .param p1, "m"    # Ljava/lang/reflect/Method;
    .param p2, "arg"    # Ljava/lang/Class;
    .param p3, "attrName"    # Ljava/lang/String;

    .prologue
    .line 1037
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->PRIMITIVE_TYPE_MAP:Ljava/util/Map;

    move-object/from16 v0, p2

    invoke-interface {v4, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->PRIMITIVE_TYPE_MAP:Ljava/util/Map;

    move-object/from16 v0, p2

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    move-object v8, v4

    .line 1041
    .local v8, "reflectedArg":Ljava/lang/Class;
    :goto_0
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v4, :cond_1

    const-string/jumbo v4, "java.lang.Object"

    invoke-static {v4}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Object:Ljava/lang/Class;

    :goto_1
    if-ne v4, v8, :cond_2

    .line 1042
    new-instance v4, Lorg/apache/tools/ant/IntrospectionHelper$2;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v4, v0, v1, v2}, Lorg/apache/tools/ant/IntrospectionHelper$2;-><init>(Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/reflect/Method;Ljava/lang/Class;)V

    .line 1179
    .end local v8    # "reflectedArg":Ljava/lang/Class;
    :goto_2
    return-object v4

    :cond_0
    move-object/from16 v8, p2

    .line 1037
    goto :goto_0

    .line 1041
    .restart local v8    # "reflectedArg":Ljava/lang/Class;
    :cond_1
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_1

    .line 1052
    :cond_2
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    if-nez v4, :cond_3

    const-string/jumbo v4, "java.lang.String"

    invoke-static {v4}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    :goto_3
    invoke-virtual {v4, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1053
    new-instance v4, Lorg/apache/tools/ant/IntrospectionHelper$3;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p1

    invoke-direct {v4, v0, v1, v2, v3}, Lorg/apache/tools/ant/IntrospectionHelper$3;-><init>(Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/reflect/Method;Ljava/lang/Class;Ljava/lang/reflect/Method;)V

    goto :goto_2

    .line 1052
    :cond_3
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_3

    .line 1061
    :cond_4
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Character:Ljava/lang/Class;

    if-nez v4, :cond_5

    const-string/jumbo v4, "java.lang.Character"

    invoke-static {v4}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Character:Ljava/lang/Class;

    :goto_4
    invoke-virtual {v4, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 1062
    new-instance v4, Lorg/apache/tools/ant/IntrospectionHelper$4;

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    move-object/from16 v9, p1

    invoke-direct/range {v4 .. v9}, Lorg/apache/tools/ant/IntrospectionHelper$4;-><init>(Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/reflect/Method;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/reflect/Method;)V

    goto :goto_2

    .line 1061
    :cond_5
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Character:Ljava/lang/Class;

    goto :goto_4

    .line 1074
    :cond_6
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v4, :cond_7

    const-string/jumbo v4, "java.lang.Boolean"

    invoke-static {v4}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Boolean:Ljava/lang/Class;

    :goto_5
    invoke-virtual {v4, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 1075
    new-instance v4, Lorg/apache/tools/ant/IntrospectionHelper$5;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p1

    invoke-direct {v4, v0, v1, v2, v3}, Lorg/apache/tools/ant/IntrospectionHelper$5;-><init>(Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/reflect/Method;Ljava/lang/Class;Ljava/lang/reflect/Method;)V

    goto :goto_2

    .line 1074
    :cond_7
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Boolean:Ljava/lang/Class;

    goto :goto_5

    .line 1084
    :cond_8
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Class:Ljava/lang/Class;

    if-nez v4, :cond_9

    const-string/jumbo v4, "java.lang.Class"

    invoke-static {v4}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Class:Ljava/lang/Class;

    :goto_6
    invoke-virtual {v4, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 1085
    new-instance v4, Lorg/apache/tools/ant/IntrospectionHelper$6;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p1

    invoke-direct {v4, v0, v1, v2, v3}, Lorg/apache/tools/ant/IntrospectionHelper$6;-><init>(Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/reflect/Method;Ljava/lang/Class;Ljava/lang/reflect/Method;)V

    goto/16 :goto_2

    .line 1084
    :cond_9
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Class:Ljava/lang/Class;

    goto :goto_6

    .line 1097
    :cond_a
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$io$File:Ljava/lang/Class;

    if-nez v4, :cond_b

    const-string/jumbo v4, "java.io.File"

    invoke-static {v4}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$io$File:Ljava/lang/Class;

    :goto_7
    invoke-virtual {v4, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 1098
    new-instance v4, Lorg/apache/tools/ant/IntrospectionHelper$7;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p1

    invoke-direct {v4, v0, v1, v2, v3}, Lorg/apache/tools/ant/IntrospectionHelper$7;-><init>(Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/reflect/Method;Ljava/lang/Class;Ljava/lang/reflect/Method;)V

    goto/16 :goto_2

    .line 1097
    :cond_b
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$io$File:Ljava/lang/Class;

    goto :goto_7

    .line 1106
    :cond_c
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$types$Resource:Ljava/lang/Class;

    if-nez v4, :cond_e

    const-string/jumbo v4, "org.apache.tools.ant.types.Resource"

    invoke-static {v4}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$types$Resource:Ljava/lang/Class;

    :goto_8
    invoke-virtual {v4, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_d

    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v4, :cond_f

    const-string/jumbo v4, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v4}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_9
    invoke-virtual {v4, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 1107
    :cond_d
    new-instance v4, Lorg/apache/tools/ant/IntrospectionHelper$8;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p1

    invoke-direct {v4, v0, v1, v2, v3}, Lorg/apache/tools/ant/IntrospectionHelper$8;-><init>(Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/reflect/Method;Ljava/lang/Class;Ljava/lang/reflect/Method;)V

    goto/16 :goto_2

    .line 1106
    :cond_e
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$types$Resource:Ljava/lang/Class;

    goto :goto_8

    :cond_f
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_9

    .line 1115
    :cond_10
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$types$EnumeratedAttribute:Ljava/lang/Class;

    if-nez v4, :cond_11

    const-string/jumbo v4, "org.apache.tools.ant.types.EnumeratedAttribute"

    invoke-static {v4}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$types$EnumeratedAttribute:Ljava/lang/Class;

    :goto_a
    invoke-virtual {v4, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 1116
    new-instance v4, Lorg/apache/tools/ant/IntrospectionHelper$9;

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    move-object/from16 v9, p1

    invoke-direct/range {v4 .. v9}, Lorg/apache/tools/ant/IntrospectionHelper$9;-><init>(Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/reflect/Method;Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/reflect/Method;)V

    goto/16 :goto_2

    .line 1115
    :cond_11
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$types$EnumeratedAttribute:Ljava/lang/Class;

    goto :goto_a

    .line 1130
    :cond_12
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v8, v1, v2}, Lorg/apache/tools/ant/IntrospectionHelper;->getEnumSetter(Ljava/lang/Class;Ljava/lang/reflect/Method;Ljava/lang/Class;)Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;

    move-result-object v21

    .line 1131
    .local v21, "setter":Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;
    if-eqz v21, :cond_13

    move-object/from16 v4, v21

    .line 1132
    goto/16 :goto_2

    .line 1135
    :cond_13
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v4, :cond_14

    const-string/jumbo v4, "java.lang.Long"

    invoke-static {v4}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Long:Ljava/lang/Class;

    :goto_b
    invoke-virtual {v4, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_15

    .line 1136
    new-instance v9, Lorg/apache/tools/ant/IntrospectionHelper$10;

    move-object/from16 v10, p0

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move-object/from16 v13, p1

    move-object/from16 v14, p3

    invoke-direct/range {v9 .. v14}, Lorg/apache/tools/ant/IntrospectionHelper$10;-><init>(Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/reflect/Method;Ljava/lang/Class;Ljava/lang/reflect/Method;Ljava/lang/String;)V

    move-object v4, v9

    goto/16 :goto_2

    .line 1135
    :cond_14
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_b

    .line 1164
    :cond_15
    const/4 v4, 0x2

    :try_start_0
    new-array v5, v4, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    if-nez v4, :cond_16

    const-string/jumbo v4, "org.apache.tools.ant.Project"

    invoke-static {v4}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    :goto_c
    aput-object v4, v5, v6

    const/4 v6, 0x1

    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    if-nez v4, :cond_17

    const-string/jumbo v4, "java.lang.String"

    invoke-static {v4}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    :goto_d
    aput-object v4, v5, v6

    invoke-virtual {v8, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v17

    .line 1165
    .local v17, "c":Ljava/lang/reflect/Constructor;
    const/16 v18, 0x1

    .line 1176
    .local v18, "includeProject":Z
    :goto_e
    move/from16 v13, v18

    .line 1177
    .local v13, "finalIncludeProject":Z
    move-object/from16 v14, v17

    .line 1179
    .local v14, "finalConstructor":Ljava/lang/reflect/Constructor;
    new-instance v9, Lorg/apache/tools/ant/IntrospectionHelper$11;

    move-object/from16 v10, p0

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move-object/from16 v15, p1

    move-object/from16 v16, p3

    invoke-direct/range {v9 .. v16}, Lorg/apache/tools/ant/IntrospectionHelper$11;-><init>(Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/reflect/Method;Ljava/lang/Class;ZLjava/lang/reflect/Constructor;Ljava/lang/reflect/Method;Ljava/lang/String;)V

    move-object v4, v9

    goto/16 :goto_2

    .line 1164
    .end local v13    # "finalIncludeProject":Z
    .end local v14    # "finalConstructor":Ljava/lang/reflect/Constructor;
    .end local v17    # "c":Ljava/lang/reflect/Constructor;
    .end local v18    # "includeProject":Z
    :cond_16
    :try_start_1
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    goto :goto_c

    :cond_17
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_d

    .line 1166
    :catch_0
    move-exception v19

    .line 1169
    .local v19, "nme":Ljava/lang/NoSuchMethodException;
    const/4 v4, 0x1

    :try_start_2
    new-array v5, v4, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    if-nez v4, :cond_18

    const-string/jumbo v4, "java.lang.String"

    invoke-static {v4}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    :goto_f
    aput-object v4, v5, v6

    invoke-virtual {v8, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v17

    .line 1170
    .restart local v17    # "c":Ljava/lang/reflect/Constructor;
    const/16 v18, 0x0

    .restart local v18    # "includeProject":Z
    goto :goto_e

    .line 1169
    .end local v17    # "c":Ljava/lang/reflect/Constructor;
    .end local v18    # "includeProject":Z
    :cond_18
    sget-object v4, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;
    :try_end_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_f

    .line 1171
    :catch_1
    move-exception v20

    .line 1173
    .local v20, "nme2":Ljava/lang/NoSuchMethodException;
    const/4 v4, 0x0

    goto/16 :goto_2
.end method

.method private createDynamicElement(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p1, "parent"    # Ljava/lang/Object;
    .param p2, "ns"    # Ljava/lang/String;
    .param p3, "localName"    # Ljava/lang/String;
    .param p4, "qName"    # Ljava/lang/String;

    .prologue
    .line 568
    const/4 v1, 0x0

    .line 569
    .local v1, "nestedElement":Ljava/lang/Object;
    instance-of v2, p1, Lorg/apache/tools/ant/DynamicElementNS;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 570
    check-cast v0, Lorg/apache/tools/ant/DynamicElementNS;

    .line 571
    .local v0, "dc":Lorg/apache/tools/ant/DynamicElementNS;
    invoke-interface {v0, p2, p3, p4}, Lorg/apache/tools/ant/DynamicElementNS;->createDynamicElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 573
    .end local v0    # "dc":Lorg/apache/tools/ant/DynamicElementNS;
    .end local v1    # "nestedElement":Ljava/lang/Object;
    :cond_0
    if-nez v1, :cond_1

    instance-of v2, p1, Lorg/apache/tools/ant/DynamicElement;

    if-eqz v2, :cond_1

    move-object v0, p1

    .line 574
    check-cast v0, Lorg/apache/tools/ant/DynamicElement;

    .line 575
    .local v0, "dc":Lorg/apache/tools/ant/DynamicElement;
    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p3, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lorg/apache/tools/ant/DynamicElement;->createDynamicElement(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 578
    .end local v0    # "dc":Lorg/apache/tools/ant/DynamicElement;
    :cond_1
    return-object v1
.end method

.method private createRestricted(Lorg/apache/tools/ant/ComponentHelper;Ljava/lang/String;Ljava/util/List;)Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;
    .locals 7
    .param p1, "helper"    # Lorg/apache/tools/ant/ComponentHelper;
    .param p2, "elementName"    # Ljava/lang/String;
    .param p3, "addTypeMethods"    # Ljava/util/List;

    .prologue
    .line 1695
    invoke-virtual {p1}, Lorg/apache/tools/ant/ComponentHelper;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    .line 1697
    .local v2, "project":Lorg/apache/tools/ant/Project;
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/tools/ant/IntrospectionHelper;->findRestrictedDefinition(Lorg/apache/tools/ant/ComponentHelper;Ljava/lang/String;Ljava/util/List;)Lorg/apache/tools/ant/AntTypeDefinition;

    move-result-object v3

    .line 1700
    .local v3, "restrictedDefinition":Lorg/apache/tools/ant/AntTypeDefinition;
    if-nez v3, :cond_0

    .line 1701
    const/4 v4, 0x0

    .line 1717
    :goto_0
    return-object v4

    .line 1704
    :cond_0
    invoke-virtual {v3, v2}, Lorg/apache/tools/ant/AntTypeDefinition;->getExposedClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v4

    invoke-direct {p0, v4, p3}, Lorg/apache/tools/ant/IntrospectionHelper;->findMatchingMethod(Ljava/lang/Class;Ljava/util/List;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1706
    .local v0, "addMethod":Ljava/lang/reflect/Method;
    if-nez v0, :cond_1

    .line 1707
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Ant Internal Error - contract mismatch for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1711
    :cond_1
    invoke-virtual {v3, v2}, Lorg/apache/tools/ant/AntTypeDefinition;->create(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v1

    .line 1712
    .local v1, "addedObject":Ljava/lang/Object;
    if-nez v1, :cond_2

    .line 1713
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Failed to create object "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " of type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v3, v2}, Lorg/apache/tools/ant/AntTypeDefinition;->getTypeClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1717
    :cond_2
    new-instance v4, Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;

    invoke-direct {v4, v0, v1}, Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;-><init>(Ljava/lang/reflect/Method;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private createTopLevel(Lorg/apache/tools/ant/ComponentHelper;Ljava/lang/String;Ljava/util/List;)Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;
    .locals 5
    .param p1, "helper"    # Lorg/apache/tools/ant/ComponentHelper;
    .param p2, "elementName"    # Ljava/lang/String;
    .param p3, "methods"    # Ljava/util/List;

    .prologue
    const/4 v3, 0x0

    .line 1722
    invoke-virtual {p1, p2}, Lorg/apache/tools/ant/ComponentHelper;->getComponentClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 1723
    .local v2, "clazz":Ljava/lang/Class;
    if-nez v2, :cond_1

    .line 1731
    :cond_0
    :goto_0
    return-object v3

    .line 1726
    :cond_1
    iget-object v4, p0, Lorg/apache/tools/ant/IntrospectionHelper;->addTypeMethods:Ljava/util/List;

    invoke-direct {p0, v2, v4}, Lorg/apache/tools/ant/IntrospectionHelper;->findMatchingMethod(Ljava/lang/Class;Ljava/util/List;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1727
    .local v0, "addMethod":Ljava/lang/reflect/Method;
    if-eqz v0, :cond_0

    .line 1730
    invoke-virtual {p1, p2}, Lorg/apache/tools/ant/ComponentHelper;->createComponent(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 1731
    .local v1, "addedObject":Ljava/lang/Object;
    new-instance v3, Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;

    invoke-direct {v3, v0, v1}, Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;-><init>(Ljava/lang/reflect/Method;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private static extractBuildException(Ljava/lang/reflect/InvocationTargetException;)Lorg/apache/tools/ant/BuildException;
    .locals 2
    .param p0, "ite"    # Ljava/lang/reflect/InvocationTargetException;

    .prologue
    .line 809
    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v0

    .line 810
    .local v0, "t":Ljava/lang/Throwable;
    instance-of v1, v0, Lorg/apache/tools/ant/BuildException;

    if-eqz v1, :cond_0

    .line 811
    check-cast v0, Lorg/apache/tools/ant/BuildException;

    .line 813
    .end local v0    # "t":Ljava/lang/Throwable;
    :goto_0
    return-object v0

    .restart local v0    # "t":Ljava/lang/Throwable;
    :cond_0
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v1

    goto :goto_0
.end method

.method private findMatchingMethod(Ljava/lang/Class;Ljava/util/List;)Ljava/lang/reflect/Method;
    .locals 9
    .param p1, "paramClass"    # Ljava/lang/Class;
    .param p2, "methods"    # Ljava/util/List;

    .prologue
    .line 1614
    if-nez p1, :cond_1

    .line 1615
    const/4 v2, 0x0

    .line 1634
    :cond_0
    return-object v2

    .line 1617
    :cond_1
    const/4 v1, 0x0

    .line 1618
    .local v1, "matchedClass":Ljava/lang/Class;
    const/4 v2, 0x0

    .line 1620
    .local v2, "matchedMethod":Ljava/lang/reflect/Method;
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v5

    .line 1621
    .local v5, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v5, :cond_0

    .line 1622
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/reflect/Method;

    .line 1623
    .local v3, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v6

    const/4 v7, 0x0

    aget-object v4, v6, v7

    .line 1624
    .local v4, "methodClass":Ljava/lang/Class;
    invoke-virtual {v4, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1625
    if-nez v1, :cond_3

    .line 1626
    move-object v1, v4

    .line 1627
    move-object v2, v3

    .line 1621
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1628
    :cond_3
    invoke-virtual {v4, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 1629
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "ambiguous: types "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " and "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " match "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method private findRestrictedDefinition(Lorg/apache/tools/ant/ComponentHelper;Ljava/lang/String;Ljava/util/List;)Lorg/apache/tools/ant/AntTypeDefinition;
    .locals 11
    .param p1, "helper"    # Lorg/apache/tools/ant/ComponentHelper;
    .param p2, "componentName"    # Ljava/lang/String;
    .param p3, "methods"    # Ljava/util/List;

    .prologue
    .line 1660
    const/4 v1, 0x0

    .line 1661
    .local v1, "definition":Lorg/apache/tools/ant/AntTypeDefinition;
    const/4 v5, 0x0

    .line 1663
    .local v5, "matchedDefinitionClass":Ljava/lang/Class;
    invoke-virtual {p1, p2}, Lorg/apache/tools/ant/ComponentHelper;->getRestrictedDefinitions(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 1664
    .local v2, "definitions":Ljava/util/List;
    if-nez v2, :cond_0

    .line 1665
    const/4 v8, 0x0

    .line 1689
    :goto_0
    return-object v8

    .line 1667
    :cond_0
    monitor-enter v2

    .line 1668
    :try_start_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v7

    .line 1669
    .local v7, "size":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    if-ge v4, v7, :cond_4

    .line 1670
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/AntTypeDefinition;

    .line 1671
    .local v0, "d":Lorg/apache/tools/ant/AntTypeDefinition;
    invoke-virtual {p1}, Lorg/apache/tools/ant/ComponentHelper;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v0, v8}, Lorg/apache/tools/ant/AntTypeDefinition;->getExposedClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v3

    .line 1672
    .local v3, "exposedClass":Ljava/lang/Class;
    if-nez v3, :cond_2

    .line 1669
    :cond_1
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1675
    :cond_2
    invoke-direct {p0, v3, p3}, Lorg/apache/tools/ant/IntrospectionHelper;->findMatchingMethod(Ljava/lang/Class;Ljava/util/List;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 1676
    .local v6, "method":Ljava/lang/reflect/Method;
    if-eqz v6, :cond_1

    .line 1679
    if-eqz v5, :cond_3

    .line 1680
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "ambiguous: restricted definitions for "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " and "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1688
    .end local v0    # "d":Lorg/apache/tools/ant/AntTypeDefinition;
    .end local v3    # "exposedClass":Ljava/lang/Class;
    .end local v4    # "i":I
    .end local v6    # "method":Ljava/lang/reflect/Method;
    .end local v7    # "size":I
    :catchall_0
    move-exception v8

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v8

    .line 1685
    .restart local v0    # "d":Lorg/apache/tools/ant/AntTypeDefinition;
    .restart local v3    # "exposedClass":Ljava/lang/Class;
    .restart local v4    # "i":I
    .restart local v6    # "method":Ljava/lang/reflect/Method;
    .restart local v7    # "size":I
    :cond_3
    move-object v5, v3

    .line 1686
    move-object v1, v0

    goto :goto_2

    .line 1688
    .end local v0    # "d":Lorg/apache/tools/ant/AntTypeDefinition;
    .end local v3    # "exposedClass":Ljava/lang/Class;
    .end local v6    # "method":Ljava/lang/reflect/Method;
    :cond_4
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v8, v1

    .line 1689
    goto :goto_0
.end method

.method private getElementName(Lorg/apache/tools/ant/Project;Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "element"    # Ljava/lang/Object;

    .prologue
    .line 1262
    invoke-virtual {p1, p2}, Lorg/apache/tools/ant/Project;->getElementName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getEnumSetter(Ljava/lang/Class;Ljava/lang/reflect/Method;Ljava/lang/Class;)Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;
    .locals 7
    .param p1, "reflectedArg"    # Ljava/lang/Class;
    .param p2, "m"    # Ljava/lang/reflect/Method;
    .param p3, "arg"    # Ljava/lang/Class;

    .prologue
    .line 1211
    const/4 v6, 0x0

    .line 1213
    .local v6, "enumClass":Ljava/lang/Class;
    :try_start_0
    const-string/jumbo v0, "java.lang.Enum"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 1217
    :goto_0
    if-eqz v6, :cond_0

    invoke-virtual {v6, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1218
    new-instance v0, Lorg/apache/tools/ant/IntrospectionHelper$12;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p2

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lorg/apache/tools/ant/IntrospectionHelper$12;-><init>(Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/reflect/Method;Ljava/lang/Class;Ljava/lang/reflect/Method;Ljava/lang/Class;)V

    .line 1247
    :goto_1
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    .line 1214
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static declared-synchronized getHelper(Ljava/lang/Class;)Lorg/apache/tools/ant/IntrospectionHelper;
    .locals 2
    .param p0, "c"    # Ljava/lang/Class;

    .prologue
    .line 329
    const-class v0, Lorg/apache/tools/ant/IntrospectionHelper;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    invoke-static {v1, p0}, Lorg/apache/tools/ant/IntrospectionHelper;->getHelper(Lorg/apache/tools/ant/Project;Ljava/lang/Class;)Lorg/apache/tools/ant/IntrospectionHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static getHelper(Lorg/apache/tools/ant/Project;Ljava/lang/Class;)Lorg/apache/tools/ant/IntrospectionHelper;
    .locals 3
    .param p0, "p"    # Lorg/apache/tools/ant/Project;
    .param p1, "c"    # Ljava/lang/Class;

    .prologue
    .line 346
    sget-object v1, Lorg/apache/tools/ant/IntrospectionHelper;->HELPERS:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/IntrospectionHelper;

    .line 349
    .local v0, "ih":Lorg/apache/tools/ant/IntrospectionHelper;
    if-eqz v0, :cond_0

    iget-object v1, v0, Lorg/apache/tools/ant/IntrospectionHelper;->bean:Ljava/lang/Class;

    if-eq v1, p1, :cond_1

    .line 350
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/IntrospectionHelper;

    .end local v0    # "ih":Lorg/apache/tools/ant/IntrospectionHelper;
    invoke-direct {v0, p1}, Lorg/apache/tools/ant/IntrospectionHelper;-><init>(Ljava/lang/Class;)V

    .line 351
    .restart local v0    # "ih":Lorg/apache/tools/ant/IntrospectionHelper;
    if-eqz p0, :cond_1

    .line 354
    sget-object v1, Lorg/apache/tools/ant/IntrospectionHelper;->HELPERS:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    :cond_1
    return-object v0
.end method

.method private getNestedCreator(Lorg/apache/tools/ant/Project;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Lorg/apache/tools/ant/UnknownElement;)Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;
    .locals 7
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "parentUri"    # Ljava/lang/String;
    .param p3, "parent"    # Ljava/lang/Object;
    .param p4, "elementName"    # Ljava/lang/String;
    .param p5, "child"    # Lorg/apache/tools/ant/UnknownElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 521
    invoke-static {p4}, Lorg/apache/tools/ant/ProjectHelper;->extractUriFromComponentName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 522
    .local v4, "uri":Ljava/lang/String;
    invoke-static {p4}, Lorg/apache/tools/ant/ProjectHelper;->extractNameFromComponentName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 524
    .local v0, "name":Ljava/lang/String;
    const-string/jumbo v5, "antlib:org.apache.tools.ant"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 525
    const-string/jumbo v4, ""

    .line 527
    :cond_0
    const-string/jumbo v5, "antlib:org.apache.tools.ant"

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 528
    const-string/jumbo p2, ""

    .line 530
    :cond_1
    const/4 v1, 0x0

    .line 531
    .local v1, "nc":Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;
    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_3

    .line 532
    :cond_2
    iget-object v5, p0, Lorg/apache/tools/ant/IntrospectionHelper;->nestedCreators:Ljava/util/Hashtable;

    sget-object v6, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "nc":Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;
    check-cast v1, Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;

    .line 534
    .restart local v1    # "nc":Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;
    :cond_3
    if-nez v1, :cond_4

    .line 535
    invoke-direct {p0, p1, p3, p4}, Lorg/apache/tools/ant/IntrospectionHelper;->createAddTypeCreator(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;)Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;

    move-result-object v1

    .line 537
    :cond_4
    if-nez v1, :cond_6

    instance-of v5, p3, Lorg/apache/tools/ant/DynamicElementNS;

    if-nez v5, :cond_5

    instance-of v5, p3, Lorg/apache/tools/ant/DynamicElement;

    if-eqz v5, :cond_6

    .line 541
    :cond_5
    if-nez p5, :cond_8

    move-object v3, v0

    .line 542
    .local v3, "qName":Ljava/lang/String;
    :goto_0
    if-nez p5, :cond_9

    const-string/jumbo v5, ""

    :goto_1
    invoke-direct {p0, p3, v5, v0, v3}, Lorg/apache/tools/ant/IntrospectionHelper;->createDynamicElement(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 546
    .local v2, "nestedElement":Ljava/lang/Object;
    if-eqz v2, :cond_6

    .line 547
    new-instance v1, Lorg/apache/tools/ant/IntrospectionHelper$1;

    .end local v1    # "nc":Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;
    const/4 v5, 0x0

    invoke-direct {v1, p0, v5, v2}, Lorg/apache/tools/ant/IntrospectionHelper$1;-><init>(Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/reflect/Method;Ljava/lang/Object;)V

    .line 554
    .end local v2    # "nestedElement":Ljava/lang/Object;
    .end local v3    # "qName":Ljava/lang/String;
    .restart local v1    # "nc":Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;
    :cond_6
    if-nez v1, :cond_7

    .line 555
    invoke-virtual {p0, p1, p3, p4}, Lorg/apache/tools/ant/IntrospectionHelper;->throwNotSupported(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;)V

    .line 557
    :cond_7
    return-object v1

    .line 541
    :cond_8
    invoke-virtual {p5}, Lorg/apache/tools/ant/UnknownElement;->getQName()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 542
    .restart local v3    # "qName":Ljava/lang/String;
    :cond_9
    invoke-virtual {p5}, Lorg/apache/tools/ant/UnknownElement;->getNamespace()Ljava/lang/String;

    move-result-object v5

    goto :goto_1
.end method

.method private static getPropertyName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "methodName"    # Ljava/lang/String;
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 1277
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private insertAddTypeMethod(Ljava/lang/reflect/Method;)V
    .locals 6
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .prologue
    const/4 v5, 0x0

    .line 1587
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    aget-object v0, v4, v5

    .line 1588
    .local v0, "argClass":Ljava/lang/Class;
    iget-object v4, p0, Lorg/apache/tools/ant/IntrospectionHelper;->addTypeMethods:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 1589
    .local v3, "size":I
    const/4 v1, 0x0

    .local v1, "c":I
    :goto_0
    if-ge v1, v3, :cond_3

    .line 1590
    iget-object v4, p0, Lorg/apache/tools/ant/IntrospectionHelper;->addTypeMethods:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/reflect/Method;

    .line 1591
    .local v2, "current":Ljava/lang/reflect/Method;
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    aget-object v4, v4, v5

    invoke-virtual {v4, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1592
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "addConfigured"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1594
    iget-object v4, p0, Lorg/apache/tools/ant/IntrospectionHelper;->addTypeMethods:Ljava/util/List;

    invoke-interface {v4, v1, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1604
    .end local v2    # "current":Ljava/lang/reflect/Method;
    :cond_0
    :goto_1
    return-void

    .line 1598
    .restart local v2    # "current":Ljava/lang/reflect/Method;
    :cond_1
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    aget-object v4, v4, v5

    invoke-virtual {v4, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1599
    iget-object v4, p0, Lorg/apache/tools/ant/IntrospectionHelper;->addTypeMethods:Ljava/util/List;

    invoke-interface {v4, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_1

    .line 1589
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1603
    .end local v2    # "current":Ljava/lang/reflect/Method;
    :cond_3
    iget-object v4, p0, Lorg/apache/tools/ant/IntrospectionHelper;->addTypeMethods:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method private isHiddenSetMethod(Ljava/lang/String;Ljava/lang/Class;)Z
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/Class;

    .prologue
    const/4 v1, 0x1

    .line 310
    const-string/jumbo v0, "setLocation"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$Location:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.Location"

    invoke-static {v0}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$Location:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    .line 316
    :goto_1
    return v0

    .line 310
    :cond_0
    sget-object v0, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$Location:Ljava/lang/Class;

    goto :goto_0

    .line 313
    :cond_1
    const-string/jumbo v0, "setTaskType"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    if-nez v0, :cond_2

    const-string/jumbo v0, "java.lang.String"

    invoke-static {v0}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    :goto_2
    invoke-virtual {v0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    move v0, v1

    .line 314
    goto :goto_1

    .line 313
    :cond_2
    sget-object v0, Lorg/apache/tools/ant/IntrospectionHelper;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_2

    .line 316
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method


# virtual methods
.method public addText(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 5
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "element"    # Ljava/lang/Object;
    .param p3, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 456
    iget-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper;->addText:Ljava/lang/reflect/Method;

    if-nez v2, :cond_1

    .line 457
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p3

    .line 459
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    .line 475
    :goto_0
    return-void

    .line 464
    :cond_0
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p1, p2}, Lorg/apache/tools/ant/Project;->getElementName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " doesn\'t support nested text data (\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-direct {p0, p3}, Lorg/apache/tools/ant/IntrospectionHelper;->condenseText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "\")."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 468
    :cond_1
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper;->addText:Ljava/lang/reflect/Method;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p3, v3, v4

    invoke-virtual {v2, p2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 469
    :catch_0
    move-exception v0

    .line 471
    .local v0, "ie":Ljava/lang/IllegalAccessException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 472
    .end local v0    # "ie":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v1

    .line 473
    .local v1, "ite":Ljava/lang/reflect/InvocationTargetException;
    invoke-static {v1}, Lorg/apache/tools/ant/IntrospectionHelper;->extractBuildException(Ljava/lang/reflect/InvocationTargetException;)Lorg/apache/tools/ant/BuildException;

    move-result-object v2

    throw v2
.end method

.method public createElement(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 11
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "parent"    # Ljava/lang/Object;
    .param p3, "elementName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 605
    const-string/jumbo v2, ""

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lorg/apache/tools/ant/IntrospectionHelper;->getNestedCreator(Lorg/apache/tools/ant/Project;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Lorg/apache/tools/ant/UnknownElement;)Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;

    move-result-object v9

    .line 607
    .local v9, "nc":Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {v9, p1, p2, v0}, Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;->create(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 608
    .local v10, "nestedElement":Ljava/lang/Object;
    if-eqz p1, :cond_0

    .line 609
    invoke-virtual {p1, v10}, Lorg/apache/tools/ant/Project;->setProjectReference(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2

    .line 611
    :cond_0
    return-object v10

    .line 612
    .end local v10    # "nestedElement":Ljava/lang/Object;
    :catch_0
    move-exception v6

    .line 614
    .local v6, "ie":Ljava/lang/IllegalAccessException;
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v0, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 615
    .end local v6    # "ie":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v7

    .line 617
    .local v7, "ine":Ljava/lang/InstantiationException;
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v0, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 618
    .end local v7    # "ine":Ljava/lang/InstantiationException;
    :catch_2
    move-exception v8

    .line 619
    .local v8, "ite":Ljava/lang/reflect/InvocationTargetException;
    invoke-static {v8}, Lorg/apache/tools/ant/IntrospectionHelper;->extractBuildException(Ljava/lang/reflect/InvocationTargetException;)Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
.end method

.method public getAddTextMethod()Ljava/lang/reflect/Method;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 871
    invoke-virtual {p0}, Lorg/apache/tools/ant/IntrospectionHelper;->supportsCharacters()Z

    move-result v0

    if-nez v0, :cond_0

    .line 872
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Class "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper;->bean:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t support nested text data."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 875
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper;->addText:Ljava/lang/reflect/Method;

    return-object v0
.end method

.method public getAttributeMap()Ljava/util/Map;
    .locals 1

    .prologue
    .line 948
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper;->attributeTypes:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper;->attributeTypes:Ljava/util/Hashtable;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    goto :goto_0
.end method

.method public getAttributeMethod(Ljava/lang/String;)Ljava/lang/reflect/Method;
    .locals 4
    .param p1, "attributeName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 912
    iget-object v1, p0, Lorg/apache/tools/ant/IntrospectionHelper;->attributeSetters:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 913
    .local v0, "setter":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 914
    new-instance v1, Lorg/apache/tools/ant/UnsupportedAttributeException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/IntrospectionHelper;->bean:Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " doesn\'t support the \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\" attribute."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lorg/apache/tools/ant/UnsupportedAttributeException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v1

    .line 918
    :cond_0
    check-cast v0, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;

    .end local v0    # "setter":Ljava/lang/Object;
    invoke-static {v0}, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;->access$300(Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;)Ljava/lang/reflect/Method;

    move-result-object v1

    return-object v1
.end method

.method public getAttributeType(Ljava/lang/String;)Ljava/lang/Class;
    .locals 4
    .param p1, "attributeName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 851
    iget-object v1, p0, Lorg/apache/tools/ant/IntrospectionHelper;->attributeTypes:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 852
    .local v0, "at":Ljava/lang/Class;
    if-nez v0, :cond_0

    .line 853
    new-instance v1, Lorg/apache/tools/ant/UnsupportedAttributeException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/IntrospectionHelper;->bean:Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " doesn\'t support the \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\" attribute."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lorg/apache/tools/ant/UnsupportedAttributeException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v1

    .line 857
    :cond_0
    return-object v0
.end method

.method public getAttributes()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 937
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper;->attributeSetters:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getElementCreator(Lorg/apache/tools/ant/Project;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Lorg/apache/tools/ant/UnknownElement;)Lorg/apache/tools/ant/IntrospectionHelper$Creator;
    .locals 3
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "parentUri"    # Ljava/lang/String;
    .param p3, "parent"    # Ljava/lang/Object;
    .param p4, "elementName"    # Ljava/lang/String;
    .param p5, "ue"    # Lorg/apache/tools/ant/UnknownElement;

    .prologue
    .line 637
    invoke-direct/range {p0 .. p5}, Lorg/apache/tools/ant/IntrospectionHelper;->getNestedCreator(Lorg/apache/tools/ant/Project;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Lorg/apache/tools/ant/UnknownElement;)Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;

    move-result-object v0

    .line 638
    .local v0, "nc":Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;
    new-instance v1, Lorg/apache/tools/ant/IntrospectionHelper$Creator;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p3, v0, v2}, Lorg/apache/tools/ant/IntrospectionHelper$Creator;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;Lorg/apache/tools/ant/IntrospectionHelper$1;)V

    return-object v1
.end method

.method public getElementMethod(Ljava/lang/String;)Ljava/lang/reflect/Method;
    .locals 4
    .param p1, "elementName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 891
    iget-object v1, p0, Lorg/apache/tools/ant/IntrospectionHelper;->nestedCreators:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 892
    .local v0, "creator":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 893
    new-instance v1, Lorg/apache/tools/ant/UnsupportedElementException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/IntrospectionHelper;->bean:Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " doesn\'t support the nested \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\" element."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lorg/apache/tools/ant/UnsupportedElementException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v1

    .line 897
    :cond_0
    check-cast v0, Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;

    .end local v0    # "creator":Ljava/lang/Object;
    invoke-static {v0}, Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;->access$200(Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;)Ljava/lang/reflect/Method;

    move-result-object v1

    return-object v1
.end method

.method public getElementType(Ljava/lang/String;)Ljava/lang/Class;
    .locals 4
    .param p1, "elementName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 829
    iget-object v1, p0, Lorg/apache/tools/ant/IntrospectionHelper;->nestedTypes:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 830
    .local v0, "nt":Ljava/lang/Class;
    if-nez v0, :cond_0

    .line 831
    new-instance v1, Lorg/apache/tools/ant/UnsupportedElementException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/IntrospectionHelper;->bean:Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " doesn\'t support the nested \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\" element."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lorg/apache/tools/ant/UnsupportedElementException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v1

    .line 835
    :cond_0
    return-object v0
.end method

.method public getExtensionPoints()Ljava/util/List;
    .locals 1

    .prologue
    .line 995
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper;->addTypeMethods:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper;->addTypeMethods:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public getNestedElementMap()Ljava/util/Map;
    .locals 1

    .prologue
    .line 973
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper;->nestedTypes:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper;->nestedTypes:Ljava/util/Hashtable;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    goto :goto_0
.end method

.method public getNestedElements()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 961
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper;->nestedTypes:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public isContainer()Z
    .locals 2

    .prologue
    .line 668
    sget-object v0, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$TaskContainer:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.TaskContainer"

    invoke-static {v0}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$TaskContainer:Ljava/lang/Class;

    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/IntrospectionHelper;->bean:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    return v0

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$TaskContainer:Ljava/lang/Class;

    goto :goto_0
.end method

.method public isDynamic()Z
    .locals 2

    .prologue
    .line 653
    sget-object v0, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$DynamicElement:Ljava/lang/Class;

    if-nez v0, :cond_1

    const-string/jumbo v0, "org.apache.tools.ant.DynamicElement"

    invoke-static {v0}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$DynamicElement:Ljava/lang/Class;

    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/IntrospectionHelper;->bean:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$DynamicElementNS:Ljava/lang/Class;

    if-nez v0, :cond_2

    const-string/jumbo v0, "org.apache.tools.ant.DynamicElementNS"

    invoke-static {v0}, Lorg/apache/tools/ant/IntrospectionHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$DynamicElementNS:Ljava/lang/Class;

    :goto_1
    iget-object v1, p0, Lorg/apache/tools/ant/IntrospectionHelper;->bean:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_0
    const/4 v0, 0x1

    :goto_2
    return v0

    :cond_1
    sget-object v0, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$DynamicElement:Ljava/lang/Class;

    goto :goto_0

    :cond_2
    sget-object v0, Lorg/apache/tools/ant/IntrospectionHelper;->class$org$apache$tools$ant$DynamicElementNS:Ljava/lang/Class;

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    goto :goto_2
.end method

.method public setAttribute(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 11
    .param p1, "p"    # Lorg/apache/tools/ant/Project;
    .param p2, "element"    # Ljava/lang/Object;
    .param p3, "attributeName"    # Ljava/lang/String;
    .param p4, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 380
    iget-object v9, p0, Lorg/apache/tools/ant/IntrospectionHelper;->attributeSetters:Ljava/util/Hashtable;

    sget-object v10, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p3, v10}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;

    .line 382
    .local v0, "as":Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;
    if-nez v0, :cond_4

    if-eqz p4, :cond_4

    .line 383
    instance-of v9, p2, Lorg/apache/tools/ant/DynamicAttributeNS;

    if-eqz v9, :cond_2

    move-object v1, p2

    .line 384
    check-cast v1, Lorg/apache/tools/ant/DynamicAttributeNS;

    .line 385
    .local v1, "dc":Lorg/apache/tools/ant/DynamicAttributeNS;
    invoke-static {p3}, Lorg/apache/tools/ant/ProjectHelper;->extractUriFromComponentName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 386
    .local v8, "uriPlusPrefix":Ljava/lang/String;
    invoke-static {v8}, Lorg/apache/tools/ant/ProjectHelper;->extractUriFromComponentName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 387
    .local v7, "uri":Ljava/lang/String;
    invoke-static {p3}, Lorg/apache/tools/ant/ProjectHelper;->extractNameFromComponentName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 388
    .local v4, "localName":Ljava/lang/String;
    const-string/jumbo v9, ""

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    move-object v6, v4

    .line 389
    .local v6, "qName":Ljava/lang/String;
    :goto_0
    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v1, v7, v4, v6, v9}, Lorg/apache/tools/ant/DynamicAttributeNS;->setDynamicAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 412
    .end local v1    # "dc":Lorg/apache/tools/ant/DynamicAttributeNS;
    .end local v4    # "localName":Ljava/lang/String;
    .end local v6    # "qName":Ljava/lang/String;
    .end local v7    # "uri":Ljava/lang/String;
    .end local v8    # "uriPlusPrefix":Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 388
    .restart local v1    # "dc":Lorg/apache/tools/ant/DynamicAttributeNS;
    .restart local v4    # "localName":Ljava/lang/String;
    .restart local v7    # "uri":Ljava/lang/String;
    .restart local v8    # "uriPlusPrefix":Ljava/lang/String;
    :cond_1
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, ":"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 392
    .end local v1    # "dc":Lorg/apache/tools/ant/DynamicAttributeNS;
    .end local v4    # "localName":Ljava/lang/String;
    .end local v7    # "uri":Ljava/lang/String;
    .end local v8    # "uriPlusPrefix":Ljava/lang/String;
    :cond_2
    instance-of v9, p2, Lorg/apache/tools/ant/DynamicAttribute;

    if-eqz v9, :cond_3

    move-object v1, p2

    .line 393
    check-cast v1, Lorg/apache/tools/ant/DynamicAttribute;

    .line 394
    .local v1, "dc":Lorg/apache/tools/ant/DynamicAttribute;
    sget-object v9, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p3, v9}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v1, v9, v10}, Lorg/apache/tools/ant/DynamicAttribute;->setDynamicAttribute(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 397
    .end local v1    # "dc":Lorg/apache/tools/ant/DynamicAttribute;
    :cond_3
    const/16 v9, 0x3a

    invoke-virtual {p3, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    if-gez v9, :cond_0

    .line 400
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/IntrospectionHelper;->getElementName(Lorg/apache/tools/ant/Project;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " doesn\'t support the \""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\" attribute."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 402
    .local v5, "msg":Ljava/lang/String;
    new-instance v9, Lorg/apache/tools/ant/UnsupportedAttributeException;

    invoke-direct {v9, v5, p3}, Lorg/apache/tools/ant/UnsupportedAttributeException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v9

    .line 405
    .end local v5    # "msg":Ljava/lang/String;
    :cond_4
    :try_start_0
    invoke-virtual {v0, p1, p2, p4}, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;->setObject(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 406
    :catch_0
    move-exception v2

    .line 408
    .local v2, "ie":Ljava/lang/IllegalAccessException;
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v9, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v9

    .line 409
    .end local v2    # "ie":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v3

    .line 410
    .local v3, "ite":Ljava/lang/reflect/InvocationTargetException;
    invoke-static {v3}, Lorg/apache/tools/ant/IntrospectionHelper;->extractBuildException(Ljava/lang/reflect/InvocationTargetException;)Lorg/apache/tools/ant/BuildException;

    move-result-object v9

    throw v9
.end method

.method public setAttribute(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "p"    # Lorg/apache/tools/ant/Project;
    .param p2, "element"    # Ljava/lang/Object;
    .param p3, "attributeName"    # Ljava/lang/String;
    .param p4, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 434
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/apache/tools/ant/IntrospectionHelper;->setAttribute(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 435
    return-void
.end method

.method public storeElement(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 6
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "parent"    # Ljava/lang/Object;
    .param p3, "child"    # Ljava/lang/Object;
    .param p4, "elementName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 781
    if-nez p4, :cond_1

    .line 799
    :cond_0
    :goto_0
    return-void

    .line 784
    :cond_1
    iget-object v4, p0, Lorg/apache/tools/ant/IntrospectionHelper;->nestedCreators:Ljava/util/Hashtable;

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;

    .line 785
    .local v3, "ns":Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;
    if-eqz v3, :cond_0

    .line 789
    :try_start_0
    invoke-virtual {v3, p2, p3}, Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;->store(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 790
    :catch_0
    move-exception v0

    .line 792
    .local v0, "ie":Ljava/lang/IllegalAccessException;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v4, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 793
    .end local v0    # "ie":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v1

    .line 795
    .local v1, "ine":Ljava/lang/InstantiationException;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v4, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 796
    .end local v1    # "ine":Ljava/lang/InstantiationException;
    :catch_2
    move-exception v2

    .line 797
    .local v2, "ite":Ljava/lang/reflect/InvocationTargetException;
    invoke-static {v2}, Lorg/apache/tools/ant/IntrospectionHelper;->extractBuildException(Ljava/lang/reflect/InvocationTargetException;)Lorg/apache/tools/ant/BuildException;

    move-result-object v4

    throw v4
.end method

.method public supportsCharacters()Z
    .locals 1

    .prologue
    .line 927
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper;->addText:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public supportsNestedElement(Ljava/lang/String;)Z
    .locals 1
    .param p1, "elementName"    # Ljava/lang/String;

    .prologue
    .line 680
    const-string/jumbo v0, ""

    invoke-virtual {p0, v0, p1}, Lorg/apache/tools/ant/IntrospectionHelper;->supportsNestedElement(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public supportsNestedElement(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "parentUri"    # Ljava/lang/String;
    .param p2, "elementName"    # Ljava/lang/String;

    .prologue
    .line 699
    invoke-virtual {p0}, Lorg/apache/tools/ant/IntrospectionHelper;->isDynamic()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper;->addTypeMethods:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 700
    :cond_0
    const/4 v0, 0x1

    .line 702
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0, p1, p2}, Lorg/apache/tools/ant/IntrospectionHelper;->supportsReflectElement(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method public supportsNestedElement(Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;Ljava/lang/Object;)Z
    .locals 2
    .param p1, "parentUri"    # Ljava/lang/String;
    .param p2, "elementName"    # Ljava/lang/String;
    .param p3, "project"    # Lorg/apache/tools/ant/Project;
    .param p4, "parent"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    .line 724
    iget-object v1, p0, Lorg/apache/tools/ant/IntrospectionHelper;->addTypeMethods:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_1

    invoke-direct {p0, p3, p4, p2}, Lorg/apache/tools/ant/IntrospectionHelper;->createAddTypeCreator(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;)Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 728
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/IntrospectionHelper;->isDynamic()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0, p1, p2}, Lorg/apache/tools/ant/IntrospectionHelper;->supportsReflectElement(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public supportsReflectElement(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p1, "parentUri"    # Ljava/lang/String;
    .param p2, "elementName"    # Ljava/lang/String;

    .prologue
    .line 742
    invoke-static {p2}, Lorg/apache/tools/ant/ProjectHelper;->extractNameFromComponentName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 743
    .local v0, "name":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper;->nestedCreators:Ljava/util/Hashtable;

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 744
    const/4 v2, 0x0

    .line 756
    :goto_0
    return v2

    .line 746
    :cond_0
    invoke-static {p2}, Lorg/apache/tools/ant/ProjectHelper;->extractUriFromComponentName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 747
    .local v1, "uri":Ljava/lang/String;
    const-string/jumbo v2, "antlib:org.apache.tools.ant"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 748
    const-string/jumbo v1, ""

    .line 750
    :cond_1
    const-string/jumbo v2, ""

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 751
    const/4 v2, 0x1

    goto :goto_0

    .line 753
    :cond_2
    const-string/jumbo v2, "antlib:org.apache.tools.ant"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 754
    const-string/jumbo p1, ""

    .line 756
    :cond_3
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_0
.end method

.method public throwNotSupported(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 3
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "parent"    # Ljava/lang/Object;
    .param p3, "elementName"    # Ljava/lang/String;

    .prologue
    .line 500
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p1, p2}, Lorg/apache/tools/ant/Project;->getElementName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t support the nested \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\" element."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 503
    .local v0, "msg":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/UnsupportedElementException;

    invoke-direct {v1, v0, p3}, Lorg/apache/tools/ant/UnsupportedElementException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v1
.end method
