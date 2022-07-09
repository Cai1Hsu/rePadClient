.class public Lorg/apache/tools/ant/PropertyHelper;
.super Ljava/lang/Object;
.source "PropertyHelper.java"

# interfaces
.implements Lorg/apache/tools/ant/property/GetProperty;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/PropertyHelper$PropertySetter;,
        Lorg/apache/tools/ant/PropertyHelper$PropertyEvaluator;,
        Lorg/apache/tools/ant/PropertyHelper$Delegate;
    }
.end annotation


# static fields
.field private static final DEFAULT_EXPANDER:Lorg/apache/tools/ant/property/PropertyExpander;

.field private static final FROM_REF:Lorg/apache/tools/ant/PropertyHelper$PropertyEvaluator;

.field private static final SKIP_DOUBLE_DOLLAR:Lorg/apache/tools/ant/property/PropertyExpander;

.field private static final TO_STRING:Lorg/apache/tools/ant/PropertyHelper$PropertyEvaluator;

.field static class$org$apache$tools$ant$PropertyHelper$Delegate:Ljava/lang/Class;

.field static class$org$apache$tools$ant$PropertyHelper$PropertyEvaluator:Ljava/lang/Class;

.field static class$org$apache$tools$ant$PropertyHelper$PropertySetter:Ljava/lang/Class;

.field static class$org$apache$tools$ant$property$PropertyExpander:Ljava/lang/Class;


# instance fields
.field private delegates:Ljava/util/Hashtable;

.field private inheritedProperties:Ljava/util/Hashtable;

.field private next:Lorg/apache/tools/ant/PropertyHelper;

.field private project:Lorg/apache/tools/ant/Project;

.field private properties:Ljava/util/Hashtable;

.field private userProperties:Ljava/util/Hashtable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 174
    new-instance v0, Lorg/apache/tools/ant/PropertyHelper$1;

    invoke-direct {v0}, Lorg/apache/tools/ant/PropertyHelper$1;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/PropertyHelper;->TO_STRING:Lorg/apache/tools/ant/PropertyHelper$PropertyEvaluator;

    .line 187
    new-instance v0, Lorg/apache/tools/ant/PropertyHelper$2;

    invoke-direct {v0}, Lorg/apache/tools/ant/PropertyHelper$2;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/PropertyHelper;->DEFAULT_EXPANDER:Lorg/apache/tools/ant/property/PropertyExpander;

    .line 209
    new-instance v0, Lorg/apache/tools/ant/PropertyHelper$3;

    invoke-direct {v0}, Lorg/apache/tools/ant/PropertyHelper$3;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/PropertyHelper;->SKIP_DOUBLE_DOLLAR:Lorg/apache/tools/ant/property/PropertyExpander;

    .line 238
    new-instance v0, Lorg/apache/tools/ant/PropertyHelper$4;

    invoke-direct {v0}, Lorg/apache/tools/ant/PropertyHelper$4;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/PropertyHelper;->FROM_REF:Lorg/apache/tools/ant/PropertyHelper$PropertyEvaluator;

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 273
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 251
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/PropertyHelper;->delegates:Ljava/util/Hashtable;

    .line 254
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/PropertyHelper;->properties:Ljava/util/Hashtable;

    .line 261
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/PropertyHelper;->userProperties:Ljava/util/Hashtable;

    .line 268
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/PropertyHelper;->inheritedProperties:Ljava/util/Hashtable;

    .line 274
    sget-object v0, Lorg/apache/tools/ant/PropertyHelper;->FROM_REF:Lorg/apache/tools/ant/PropertyHelper$PropertyEvaluator;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/PropertyHelper;->add(Lorg/apache/tools/ant/PropertyHelper$Delegate;)V

    .line 275
    sget-object v0, Lorg/apache/tools/ant/PropertyHelper;->TO_STRING:Lorg/apache/tools/ant/PropertyHelper$PropertyEvaluator;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/PropertyHelper;->add(Lorg/apache/tools/ant/PropertyHelper$Delegate;)V

    .line 276
    sget-object v0, Lorg/apache/tools/ant/PropertyHelper;->SKIP_DOUBLE_DOLLAR:Lorg/apache/tools/ant/property/PropertyExpander;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/PropertyHelper;->add(Lorg/apache/tools/ant/PropertyHelper$Delegate;)V

    .line 277
    sget-object v0, Lorg/apache/tools/ant/PropertyHelper;->DEFAULT_EXPANDER:Lorg/apache/tools/ant/property/PropertyExpander;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/PropertyHelper;->add(Lorg/apache/tools/ant/PropertyHelper$Delegate;)V

    .line 278
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 418
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

.method private evalAsBooleanOrPropertyName(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 1190
    invoke-static {p1}, Lorg/apache/tools/ant/PropertyHelper;->toBoolean(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v0

    .line 1191
    .local v0, "b":Ljava/lang/Boolean;
    if-eqz v0, :cond_0

    .line 1192
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 1194
    :goto_0
    return v1

    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/PropertyHelper;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected static getDelegateInterfaces(Lorg/apache/tools/ant/PropertyHelper$Delegate;)Ljava/util/Set;
    .locals 6
    .param p0, "d"    # Lorg/apache/tools/ant/PropertyHelper$Delegate;

    .prologue
    .line 1135
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 1136
    .local v3, "result":Ljava/util/HashSet;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 1137
    .local v0, "c":Ljava/lang/Class;
    :goto_0
    if-eqz v0, :cond_3

    .line 1138
    invoke-virtual {v0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v2

    .line 1139
    .local v2, "ifs":[Ljava/lang/Class;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v4, v2

    if-ge v1, v4, :cond_2

    .line 1140
    sget-object v4, Lorg/apache/tools/ant/PropertyHelper;->class$org$apache$tools$ant$PropertyHelper$Delegate:Ljava/lang/Class;

    if-nez v4, :cond_1

    const-string/jumbo v4, "org.apache.tools.ant.PropertyHelper$Delegate"

    invoke-static {v4}, Lorg/apache/tools/ant/PropertyHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/PropertyHelper;->class$org$apache$tools$ant$PropertyHelper$Delegate:Ljava/lang/Class;

    :goto_2
    aget-object v5, v2, v1

    invoke-virtual {v4, v5}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1141
    aget-object v4, v2, v1

    invoke-virtual {v3, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1139
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1140
    :cond_1
    sget-object v4, Lorg/apache/tools/ant/PropertyHelper;->class$org$apache$tools$ant$PropertyHelper$Delegate:Ljava/lang/Class;

    goto :goto_2

    .line 1144
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_0

    .line 1146
    .end local v1    # "i":I
    .end local v2    # "ifs":[Ljava/lang/Class;
    :cond_3
    sget-object v4, Lorg/apache/tools/ant/PropertyHelper;->class$org$apache$tools$ant$PropertyHelper$Delegate:Ljava/lang/Class;

    if-nez v4, :cond_4

    const-string/jumbo v4, "org.apache.tools.ant.PropertyHelper$Delegate"

    invoke-static {v4}, Lorg/apache/tools/ant/PropertyHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/PropertyHelper;->class$org$apache$tools$ant$PropertyHelper$Delegate:Ljava/lang/Class;

    :goto_3
    invoke-virtual {v3, v4}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 1147
    return-object v3

    .line 1146
    :cond_4
    sget-object v4, Lorg/apache/tools/ant/PropertyHelper;->class$org$apache$tools$ant$PropertyHelper$Delegate:Ljava/lang/Class;

    goto :goto_3
.end method

.method public static getProperty(Lorg/apache/tools/ant/Project;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "project"    # Lorg/apache/tools/ant/Project;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 295
    invoke-static {p0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/PropertyHelper;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;
    .locals 5
    .param p0, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 393
    const-class v4, Lorg/apache/tools/ant/PropertyHelper;

    monitor-enter v4

    const/4 v1, 0x0

    .line 394
    .local v1, "helper":Lorg/apache/tools/ant/PropertyHelper;
    if-eqz p0, :cond_2

    .line 395
    :try_start_0
    const-string/jumbo v3, "ant.PropertyHelper"

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lorg/apache/tools/ant/PropertyHelper;

    move-object v1, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v2, v1

    .line 398
    .end local v1    # "helper":Lorg/apache/tools/ant/PropertyHelper;
    .local v2, "helper":Lorg/apache/tools/ant/PropertyHelper;
    :goto_0
    if-eqz v2, :cond_0

    move-object v1, v2

    .line 409
    .end local v2    # "helper":Lorg/apache/tools/ant/PropertyHelper;
    :goto_1
    monitor-exit v4

    return-object v2

    .line 402
    .restart local v2    # "helper":Lorg/apache/tools/ant/PropertyHelper;
    :cond_0
    :try_start_1
    new-instance v1, Lorg/apache/tools/ant/PropertyHelper;

    invoke-direct {v1}, Lorg/apache/tools/ant/PropertyHelper;-><init>()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 403
    .end local v2    # "helper":Lorg/apache/tools/ant/PropertyHelper;
    .restart local v1    # "helper":Lorg/apache/tools/ant/PropertyHelper;
    :try_start_2
    invoke-virtual {v1, p0}, Lorg/apache/tools/ant/PropertyHelper;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 405
    if-eqz p0, :cond_1

    .line 406
    const-string/jumbo v3, "ant.PropertyHelper"

    invoke-virtual {p0, v3, v1}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_1
    move-object v2, v1

    .line 409
    .local v2, "helper":Ljava/lang/Object;
    goto :goto_1

    .line 393
    .end local v2    # "helper":Ljava/lang/Object;
    :catchall_0
    move-exception v3

    :goto_2
    monitor-exit v4

    throw v3

    .end local v1    # "helper":Lorg/apache/tools/ant/PropertyHelper;
    .local v2, "helper":Lorg/apache/tools/ant/PropertyHelper;
    :catchall_1
    move-exception v3

    move-object v1, v2

    .end local v2    # "helper":Lorg/apache/tools/ant/PropertyHelper;
    .restart local v1    # "helper":Lorg/apache/tools/ant/PropertyHelper;
    goto :goto_2

    :cond_2
    move-object v2, v1

    .end local v1    # "helper":Lorg/apache/tools/ant/PropertyHelper;
    .restart local v2    # "helper":Lorg/apache/tools/ant/PropertyHelper;
    goto :goto_0
.end method

.method private static nullOrEmpty(Ljava/lang/Object;)Z
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 1179
    if-eqz p0, :cond_0

    const-string/jumbo v0, ""

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static parsePropertyStringDefault(Ljava/lang/String;Ljava/util/Vector;Ljava/util/Vector;)V
    .locals 7
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "fragments"    # Ljava/util/Vector;
    .param p2, "propertyRefs"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1040
    const/4 v2, 0x0

    .line 1043
    .local v2, "prev":I
    :goto_0
    const-string/jumbo v4, "$"

    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .local v1, "pos":I
    if-ltz v1, :cond_5

    .line 1049
    if-lez v1, :cond_0

    .line 1050
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1054
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ne v1, v4, :cond_1

    .line 1055
    const-string/jumbo v4, "$"

    invoke-virtual {p1, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1056
    add-int/lit8 v2, v1, 0x1

    goto :goto_0

    .line 1057
    :cond_1
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x7b

    if-eq v4, v5, :cond_3

    .line 1064
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x24

    if-ne v4, v5, :cond_2

    .line 1066
    const-string/jumbo v4, "$"

    invoke-virtual {p1, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1067
    add-int/lit8 v2, v1, 0x2

    goto :goto_0

    .line 1070
    :cond_2
    add-int/lit8 v4, v1, 0x2

    invoke-virtual {p0, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1071
    add-int/lit8 v2, v1, 0x2

    goto :goto_0

    .line 1075
    :cond_3
    const/16 v4, 0x7d

    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 1076
    .local v0, "endName":I
    if-gez v0, :cond_4

    .line 1077
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Syntax error in property: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1079
    :cond_4
    add-int/lit8 v4, v1, 0x2

    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 1080
    .local v3, "propertyName":Ljava/lang/String;
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1081
    invoke-virtual {p2, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1082
    add-int/lit8 v2, v0, 0x1

    goto :goto_0

    .line 1087
    .end local v0    # "endName":I
    .end local v3    # "propertyName":Ljava/lang/String;
    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_6

    .line 1088
    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1090
    :cond_6
    return-void
.end method

.method public static setNewProperty(Lorg/apache/tools/ant/Project;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p0, "project"    # Lorg/apache/tools/ant/Project;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 322
    invoke-static {p0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/PropertyHelper;->setNewProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 324
    return-void
.end method

.method public static setProperty(Lorg/apache/tools/ant/Project;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p0, "project"    # Lorg/apache/tools/ant/Project;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 308
    invoke-static {p0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, p1, p2, v1}, Lorg/apache/tools/ant/PropertyHelper;->setProperty(Ljava/lang/String;Ljava/lang/Object;Z)Z

    .line 310
    return-void
.end method

.method public static toBoolean(Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 2
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 1156
    instance-of v1, p0, Ljava/lang/Boolean;

    if-eqz v1, :cond_0

    .line 1157
    check-cast p0, Ljava/lang/Boolean;

    .line 1170
    .end local p0    # "value":Ljava/lang/Object;
    .local v0, "s":Ljava/lang/String;
    :goto_0
    return-object p0

    .line 1159
    .end local v0    # "s":Ljava/lang/String;
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_0
    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_3

    move-object v0, p0

    .line 1160
    check-cast v0, Ljava/lang/String;

    .line 1161
    .restart local v0    # "s":Ljava/lang/String;
    invoke-static {v0}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1162
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    .line 1164
    :cond_1
    const-string/jumbo v1, "off"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string/jumbo v1, "false"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string/jumbo v1, "no"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1167
    :cond_2
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 1170
    .end local v0    # "s":Ljava/lang/String;
    :cond_3
    const/4 p0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/PropertyHelper$Delegate;)V
    .locals 7
    .param p1, "delegate"    # Lorg/apache/tools/ant/PropertyHelper$Delegate;

    .prologue
    .line 1099
    iget-object v5, p0, Lorg/apache/tools/ant/PropertyHelper;->delegates:Ljava/util/Hashtable;

    monitor-enter v5

    .line 1100
    :try_start_0
    invoke-static {p1}, Lorg/apache/tools/ant/PropertyHelper;->getDelegateInterfaces(Lorg/apache/tools/ant/PropertyHelper$Delegate;)Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1101
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 1102
    .local v1, "key":Ljava/lang/Object;
    iget-object v4, p0, Lorg/apache/tools/ant/PropertyHelper;->delegates:Ljava/util/Hashtable;

    invoke-virtual {v4, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 1103
    .local v2, "list":Ljava/util/List;
    if-nez v2, :cond_0

    .line 1104
    new-instance v2, Ljava/util/ArrayList;

    .end local v2    # "list":Ljava/util/List;
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1109
    .restart local v2    # "list":Ljava/util/List;
    :goto_1
    const/4 v4, 0x0

    invoke-interface {v2, v4, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 1110
    iget-object v4, p0, Lorg/apache/tools/ant/PropertyHelper;->delegates:Ljava/util/Hashtable;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v6

    invoke-virtual {v4, v1, v6}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1112
    .end local v0    # "iter":Ljava/util/Iterator;
    .end local v1    # "key":Ljava/lang/Object;
    .end local v2    # "list":Ljava/util/List;
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 1106
    .restart local v0    # "iter":Ljava/util/Iterator;
    .restart local v1    # "key":Ljava/lang/Object;
    .restart local v2    # "list":Ljava/util/List;
    :cond_0
    :try_start_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1107
    .end local v2    # "list":Ljava/util/List;
    .local v3, "list":Ljava/util/List;
    invoke-interface {v3, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-object v2, v3

    .end local v3    # "list":Ljava/util/List;
    .restart local v2    # "list":Ljava/util/List;
    goto :goto_1

    .line 1112
    .end local v1    # "key":Ljava/lang/Object;
    .end local v2    # "list":Ljava/util/List;
    :cond_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1113
    return-void
.end method

.method public containsProperties(Ljava/lang/String;)Z
    .locals 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 597
    new-instance v0, Lorg/apache/tools/ant/property/ParseProperties;

    invoke-virtual {p0}, Lorg/apache/tools/ant/PropertyHelper;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/PropertyHelper;->getExpanders()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v0, v1, v2, p0}, Lorg/apache/tools/ant/property/ParseProperties;-><init>(Lorg/apache/tools/ant/Project;Ljava/util/Collection;Lorg/apache/tools/ant/property/GetProperty;)V

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/property/ParseProperties;->containsProperties(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public copyInheritedProperties(Lorg/apache/tools/ant/Project;)V
    .locals 5
    .param p1, "other"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 986
    iget-object v4, p0, Lorg/apache/tools/ant/PropertyHelper;->inheritedProperties:Ljava/util/Hashtable;

    monitor-enter v4

    .line 987
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/PropertyHelper;->inheritedProperties:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .line 988
    .local v1, "e":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 989
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 990
    .local v0, "arg":Ljava/lang/String;
    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/Project;->getUserProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    .line 993
    iget-object v3, p0, Lorg/apache/tools/ant/PropertyHelper;->inheritedProperties:Ljava/util/Hashtable;

    invoke-virtual {v3, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 994
    .local v2, "value":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v0, v3}, Lorg/apache/tools/ant/Project;->setInheritedProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 996
    .end local v0    # "arg":Ljava/lang/String;
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v2    # "value":Ljava/lang/Object;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .restart local v1    # "e":Ljava/util/Enumeration;
    :cond_1
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 997
    return-void
.end method

.method public copyUserProperties(Lorg/apache/tools/ant/Project;)V
    .locals 6
    .param p1, "other"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 1016
    iget-object v4, p0, Lorg/apache/tools/ant/PropertyHelper;->userProperties:Ljava/util/Hashtable;

    monitor-enter v4

    .line 1017
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/PropertyHelper;->userProperties:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .line 1018
    .local v1, "e":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1019
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    .line 1020
    .local v0, "arg":Ljava/lang/Object;
    iget-object v3, p0, Lorg/apache/tools/ant/PropertyHelper;->inheritedProperties:Ljava/util/Hashtable;

    invoke-virtual {v3, v0}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1023
    iget-object v3, p0, Lorg/apache/tools/ant/PropertyHelper;->userProperties:Ljava/util/Hashtable;

    invoke-virtual {v3, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1024
    .local v2, "value":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v3, v5}, Lorg/apache/tools/ant/Project;->setUserProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1026
    .end local v0    # "arg":Ljava/lang/Object;
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v2    # "value":Ljava/lang/Object;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .restart local v1    # "e":Ljava/util/Enumeration;
    :cond_1
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1027
    return-void
.end method

.method protected getDelegates(Ljava/lang/Class;)Ljava/util/List;
    .locals 2
    .param p1, "type"    # Ljava/lang/Class;

    .prologue
    .line 1124
    iget-object v1, p0, Lorg/apache/tools/ant/PropertyHelper;->delegates:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1125
    .local v0, "r":Ljava/util/List;
    if-nez v0, :cond_0

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .end local v0    # "r":Ljava/util/List;
    :cond_0
    return-object v0
.end method

.method public getExpanders()Ljava/util/Collection;
    .locals 1

    .prologue
    .line 418
    sget-object v0, Lorg/apache/tools/ant/PropertyHelper;->class$org$apache$tools$ant$property$PropertyExpander:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.property.PropertyExpander"

    invoke-static {v0}, Lorg/apache/tools/ant/PropertyHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/PropertyHelper;->class$org$apache$tools$ant$property$PropertyExpander:Ljava/lang/Class;

    :goto_0
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/PropertyHelper;->getDelegates(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/PropertyHelper;->class$org$apache$tools$ant$property$PropertyExpander:Ljava/lang/Class;

    goto :goto_0
.end method

.method public getInheritedProperties()Ljava/util/Hashtable;
    .locals 3

    .prologue
    .line 938
    iget-object v1, p0, Lorg/apache/tools/ant/PropertyHelper;->inheritedProperties:Ljava/util/Hashtable;

    monitor-enter v1

    .line 939
    :try_start_0
    new-instance v0, Ljava/util/Hashtable;

    iget-object v2, p0, Lorg/apache/tools/ant/PropertyHelper;->inheritedProperties:Ljava/util/Hashtable;

    invoke-direct {v0, v2}, Ljava/util/Hashtable;-><init>(Ljava/util/Map;)V

    monitor-exit v1

    return-object v0

    .line 940
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected getInternalInheritedProperties()Ljava/util/Hashtable;
    .locals 1

    .prologue
    .line 966
    iget-object v0, p0, Lorg/apache/tools/ant/PropertyHelper;->inheritedProperties:Ljava/util/Hashtable;

    return-object v0
.end method

.method protected getInternalProperties()Ljava/util/Hashtable;
    .locals 1

    .prologue
    .line 948
    iget-object v0, p0, Lorg/apache/tools/ant/PropertyHelper;->properties:Ljava/util/Hashtable;

    return-object v0
.end method

.method protected getInternalUserProperties()Ljava/util/Hashtable;
    .locals 1

    .prologue
    .line 957
    iget-object v0, p0, Lorg/apache/tools/ant/PropertyHelper;->userProperties:Ljava/util/Hashtable;

    return-object v0
.end method

.method public getNext()Lorg/apache/tools/ant/PropertyHelper;
    .locals 1

    .prologue
    .line 379
    iget-object v0, p0, Lorg/apache/tools/ant/PropertyHelper;->next:Lorg/apache/tools/ant/PropertyHelper;

    return-object v0
.end method

.method public getProject()Lorg/apache/tools/ant/Project;
    .locals 1

    .prologue
    .line 344
    iget-object v0, p0, Lorg/apache/tools/ant/PropertyHelper;->project:Lorg/apache/tools/ant/Project;

    return-object v0
.end method

.method public getProperties()Ljava/util/Hashtable;
    .locals 3

    .prologue
    .line 906
    iget-object v1, p0, Lorg/apache/tools/ant/PropertyHelper;->properties:Ljava/util/Hashtable;

    monitor-enter v1

    .line 907
    :try_start_0
    new-instance v0, Ljava/util/Hashtable;

    iget-object v2, p0, Lorg/apache/tools/ant/PropertyHelper;->properties:Ljava/util/Hashtable;

    invoke-direct {v0, v2}, Ljava/util/Hashtable;-><init>(Ljava/util/Map;)V

    monitor-exit v1

    return-object v0

    .line 908
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 841
    if-nez p1, :cond_1

    move-object v1, v3

    .line 853
    :cond_0
    :goto_0
    return-object v1

    .line 844
    :cond_1
    sget-object v2, Lorg/apache/tools/ant/PropertyHelper;->class$org$apache$tools$ant$PropertyHelper$PropertyEvaluator:Ljava/lang/Class;

    if-nez v2, :cond_3

    const-string/jumbo v2, "org.apache.tools.ant.PropertyHelper$PropertyEvaluator"

    invoke-static {v2}, Lorg/apache/tools/ant/PropertyHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/PropertyHelper;->class$org$apache$tools$ant$PropertyHelper$PropertyEvaluator:Ljava/lang/Class;

    :goto_1
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/PropertyHelper;->getDelegates(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 845
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/PropertyHelper$PropertyEvaluator;

    invoke-interface {v2, p1, p0}, Lorg/apache/tools/ant/PropertyHelper$PropertyEvaluator;->evaluate(Ljava/lang/String;Lorg/apache/tools/ant/PropertyHelper;)Ljava/lang/Object;

    move-result-object v1

    .line 846
    .local v1, "o":Ljava/lang/Object;
    if-eqz v1, :cond_2

    .line 847
    instance-of v2, v1, Lorg/apache/tools/ant/property/NullReturn;

    if-eqz v2, :cond_0

    move-object v1, v3

    .line 848
    goto :goto_0

    .line 844
    .end local v0    # "iter":Ljava/util/Iterator;
    .end local v1    # "o":Ljava/lang/Object;
    :cond_3
    sget-object v2, Lorg/apache/tools/ant/PropertyHelper;->class$org$apache$tools$ant$PropertyHelper$PropertyEvaluator:Ljava/lang/Class;

    goto :goto_1

    .line 853
    .restart local v0    # "iter":Ljava/util/Iterator;
    :cond_4
    iget-object v2, p0, Lorg/apache/tools/ant/PropertyHelper;->properties:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "ns"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 820
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/PropertyHelper;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getPropertyHook(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/Object;
    .locals 4
    .param p1, "ns"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "user"    # Z

    .prologue
    const/4 v2, 0x0

    .line 476
    invoke-virtual {p0}, Lorg/apache/tools/ant/PropertyHelper;->getNext()Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 477
    invoke-virtual {p0}, Lorg/apache/tools/ant/PropertyHelper;->getNext()Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v3

    invoke-virtual {v3, p1, p2, p3}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHook(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v0

    .line 478
    .local v0, "o":Ljava/lang/Object;
    if-eqz v0, :cond_1

    move-object v2, v0

    .line 488
    .end local v0    # "o":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-object v2

    .line 483
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/PropertyHelper;->project:Lorg/apache/tools/ant/Project;

    if-eqz v3, :cond_0

    const-string/jumbo v3, "toString:"

    invoke-virtual {p2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 484
    const-string/jumbo v3, "toString:"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    .line 485
    iget-object v3, p0, Lorg/apache/tools/ant/PropertyHelper;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v3, p2}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 486
    .local v1, "v":Ljava/lang/Object;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public getUserProperties()Ljava/util/Hashtable;
    .locals 3

    .prologue
    .line 923
    iget-object v1, p0, Lorg/apache/tools/ant/PropertyHelper;->userProperties:Ljava/util/Hashtable;

    monitor-enter v1

    .line 924
    :try_start_0
    new-instance v0, Ljava/util/Hashtable;

    iget-object v2, p0, Lorg/apache/tools/ant/PropertyHelper;->userProperties:Ljava/util/Hashtable;

    invoke-direct {v0, v2}, Ljava/util/Hashtable;-><init>(Ljava/util/Map;)V

    monitor-exit v1

    return-object v0

    .line 925
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getUserProperty(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 885
    if-nez p1, :cond_0

    .line 886
    const/4 v0, 0x0

    .line 888
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/PropertyHelper;->userProperties:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public getUserProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "ns"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 870
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/PropertyHelper;->getUserProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parseProperties(Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 587
    new-instance v0, Lorg/apache/tools/ant/property/ParseProperties;

    invoke-virtual {p0}, Lorg/apache/tools/ant/PropertyHelper;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/PropertyHelper;->getExpanders()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v0, v1, v2, p0}, Lorg/apache/tools/ant/property/ParseProperties;-><init>(Lorg/apache/tools/ant/Project;Ljava/util/Collection;Lorg/apache/tools/ant/property/GetProperty;)V

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/property/ParseProperties;->parseProperties(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parsePropertyString(Ljava/lang/String;Ljava/util/Vector;Ljava/util/Vector;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "fragments"    # Ljava/util/Vector;
    .param p3, "propertyRefs"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 524
    invoke-static {p1, p2, p3}, Lorg/apache/tools/ant/PropertyHelper;->parsePropertyStringDefault(Ljava/lang/String;Ljava/util/Vector;Ljava/util/Vector;)V

    .line 525
    return-void
.end method

.method public replaceProperties(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 567
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/PropertyHelper;->parseProperties(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 568
    .local v0, "o":Ljava/lang/Object;
    if-eqz v0, :cond_0

    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_1

    :cond_0
    check-cast v0, Ljava/lang/String;

    .end local v0    # "o":Ljava/lang/Object;
    :goto_0
    return-object v0

    .restart local v0    # "o":Ljava/lang/Object;
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public replaceProperties(Ljava/lang/String;Ljava/lang/String;Ljava/util/Hashtable;)Ljava/lang/String;
    .locals 1
    .param p1, "ns"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "keys"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 549
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/PropertyHelper;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setInheritedProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 791
    iget-object v0, p0, Lorg/apache/tools/ant/PropertyHelper;->project:Lorg/apache/tools/ant/Project;

    if-eqz v0, :cond_0

    .line 792
    iget-object v0, p0, Lorg/apache/tools/ant/PropertyHelper;->project:Lorg/apache/tools/ant/Project;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Setting ro project property: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " -> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 796
    :cond_0
    monitor-enter p0

    .line 797
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/PropertyHelper;->inheritedProperties:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 798
    iget-object v0, p0, Lorg/apache/tools/ant/PropertyHelper;->userProperties:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 799
    iget-object v0, p0, Lorg/apache/tools/ant/PropertyHelper;->properties:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 800
    monitor-exit p0

    .line 801
    return-void

    .line 800
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setInheritedProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p1, "ns"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 774
    invoke-virtual {p0, p2, p3}, Lorg/apache/tools/ant/PropertyHelper;->setInheritedProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 775
    return-void
.end method

.method public setNewProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 694
    sget-object v2, Lorg/apache/tools/ant/PropertyHelper;->class$org$apache$tools$ant$PropertyHelper$PropertySetter:Ljava/lang/Class;

    if-nez v2, :cond_1

    const-string/jumbo v2, "org.apache.tools.ant.PropertyHelper$PropertySetter"

    invoke-static {v2}, Lorg/apache/tools/ant/PropertyHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/PropertyHelper;->class$org$apache$tools$ant$PropertyHelper$PropertySetter:Ljava/lang/Class;

    :goto_0
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/PropertyHelper;->getDelegates(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 695
    .local v0, "iter":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 696
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/PropertyHelper$PropertySetter;

    .line 697
    .local v1, "setter":Lorg/apache/tools/ant/PropertyHelper$PropertySetter;
    invoke-interface {v1, p1, p2, p0}, Lorg/apache/tools/ant/PropertyHelper$PropertySetter;->setNew(Ljava/lang/String;Ljava/lang/Object;Lorg/apache/tools/ant/PropertyHelper;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 715
    .end local v1    # "setter":Lorg/apache/tools/ant/PropertyHelper$PropertySetter;
    :goto_1
    return-void

    .line 694
    .end local v0    # "iter":Ljava/util/Iterator;
    :cond_1
    sget-object v2, Lorg/apache/tools/ant/PropertyHelper;->class$org$apache$tools$ant$PropertyHelper$PropertySetter:Ljava/lang/Class;

    goto :goto_0

    .line 701
    .restart local v0    # "iter":Ljava/util/Iterator;
    :cond_2
    monitor-enter p0

    .line 702
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/PropertyHelper;->project:Lorg/apache/tools/ant/Project;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lorg/apache/tools/ant/PropertyHelper;->properties:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 703
    iget-object v2, p0, Lorg/apache/tools/ant/PropertyHelper;->project:Lorg/apache/tools/ant/Project;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Override ignored for property \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    invoke-virtual {v2, v3, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 705
    monitor-exit p0

    goto :goto_1

    .line 714
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 707
    :cond_3
    :try_start_1
    iget-object v2, p0, Lorg/apache/tools/ant/PropertyHelper;->project:Lorg/apache/tools/ant/Project;

    if-eqz v2, :cond_4

    .line 708
    iget-object v2, p0, Lorg/apache/tools/ant/PropertyHelper;->project:Lorg/apache/tools/ant/Project;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Setting project property: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " -> "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {v2, v3, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 711
    :cond_4
    if-eqz p1, :cond_5

    if-eqz p2, :cond_5

    .line 712
    iget-object v2, p0, Lorg/apache/tools/ant/PropertyHelper;->properties:Ljava/util/Hashtable;

    invoke-virtual {v2, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 714
    :cond_5
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1
.end method

.method public setNewProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p1, "ns"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 679
    invoke-virtual {p0, p2, p3}, Lorg/apache/tools/ant/PropertyHelper;->setNewProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 680
    return-void
.end method

.method public setNext(Lorg/apache/tools/ant/PropertyHelper;)V
    .locals 0
    .param p1, "next"    # Lorg/apache/tools/ant/PropertyHelper;

    .prologue
    .line 364
    iput-object p1, p0, Lorg/apache/tools/ant/PropertyHelper;->next:Lorg/apache/tools/ant/PropertyHelper;

    .line 365
    return-void
.end method

.method public setProject(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 336
    iput-object p1, p0, Lorg/apache/tools/ant/PropertyHelper;->project:Lorg/apache/tools/ant/Project;

    .line 337
    return-void
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/Object;Z)Z
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "verbose"    # Z

    .prologue
    const/4 v3, 0x1

    .line 632
    sget-object v2, Lorg/apache/tools/ant/PropertyHelper;->class$org$apache$tools$ant$PropertyHelper$PropertySetter:Ljava/lang/Class;

    if-nez v2, :cond_1

    const-string/jumbo v2, "org.apache.tools.ant.PropertyHelper$PropertySetter"

    invoke-static {v2}, Lorg/apache/tools/ant/PropertyHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/PropertyHelper;->class$org$apache$tools$ant$PropertyHelper$PropertySetter:Ljava/lang/Class;

    :goto_0
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/PropertyHelper;->getDelegates(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 633
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/PropertyHelper$PropertySetter;

    .line 634
    .local v1, "setter":Lorg/apache/tools/ant/PropertyHelper$PropertySetter;
    invoke-interface {v1, p1, p2, p0}, Lorg/apache/tools/ant/PropertyHelper$PropertySetter;->set(Ljava/lang/String;Ljava/lang/Object;Lorg/apache/tools/ant/PropertyHelper;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v2, v3

    .line 658
    .end local v1    # "setter":Lorg/apache/tools/ant/PropertyHelper$PropertySetter;
    :goto_1
    return v2

    .line 632
    .end local v0    # "iter":Ljava/util/Iterator;
    :cond_1
    sget-object v2, Lorg/apache/tools/ant/PropertyHelper;->class$org$apache$tools$ant$PropertyHelper$PropertySetter:Ljava/lang/Class;

    goto :goto_0

    .line 638
    .restart local v0    # "iter":Ljava/util/Iterator;
    :cond_2
    monitor-enter p0

    .line 640
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/PropertyHelper;->userProperties:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 641
    iget-object v2, p0, Lorg/apache/tools/ant/PropertyHelper;->project:Lorg/apache/tools/ant/Project;

    if-eqz v2, :cond_3

    if-eqz p3, :cond_3

    .line 642
    iget-object v2, p0, Lorg/apache/tools/ant/PropertyHelper;->project:Lorg/apache/tools/ant/Project;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Override ignored for user property \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    invoke-virtual {v2, v3, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 645
    :cond_3
    const/4 v2, 0x0

    monitor-exit p0

    goto :goto_1

    .line 659
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 647
    :cond_4
    :try_start_1
    iget-object v2, p0, Lorg/apache/tools/ant/PropertyHelper;->project:Lorg/apache/tools/ant/Project;

    if-eqz v2, :cond_6

    if-eqz p3, :cond_6

    .line 648
    iget-object v2, p0, Lorg/apache/tools/ant/PropertyHelper;->properties:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 649
    iget-object v2, p0, Lorg/apache/tools/ant/PropertyHelper;->project:Lorg/apache/tools/ant/Project;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Overriding previous definition of property \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    invoke-virtual {v2, v4, v5}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 652
    :cond_5
    iget-object v2, p0, Lorg/apache/tools/ant/PropertyHelper;->project:Lorg/apache/tools/ant/Project;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Setting project property: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " -> "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x4

    invoke-virtual {v2, v4, v5}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 655
    :cond_6
    if-eqz p1, :cond_7

    if-eqz p2, :cond_7

    .line 656
    iget-object v2, p0, Lorg/apache/tools/ant/PropertyHelper;->properties:Ljava/util/Hashtable;

    invoke-virtual {v2, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 658
    :cond_7
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v2, v3

    goto/16 :goto_1
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Z)Z
    .locals 1
    .param p1, "ns"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "verbose"    # Z

    .prologue
    .line 621
    invoke-virtual {p0, p2, p3, p4}, Lorg/apache/tools/ant/PropertyHelper;->setProperty(Ljava/lang/String;Ljava/lang/Object;Z)Z

    move-result v0

    return v0
.end method

.method public setPropertyHook(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZZZ)Z
    .locals 8
    .param p1, "ns"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "inherited"    # Z
    .param p5, "user"    # Z
    .param p6, "isNew"    # Z

    .prologue
    .line 452
    invoke-virtual {p0}, Lorg/apache/tools/ant/PropertyHelper;->getNext()Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 453
    invoke-virtual {p0}, Lorg/apache/tools/ant/PropertyHelper;->getNext()Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lorg/apache/tools/ant/PropertyHelper;->setPropertyHook(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZZZ)Z

    move-result v7

    .line 455
    .local v7, "subst":Z
    if-eqz v7, :cond_0

    .line 456
    const/4 v0, 0x1

    .line 459
    .end local v7    # "subst":Z
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setUserProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 747
    iget-object v0, p0, Lorg/apache/tools/ant/PropertyHelper;->project:Lorg/apache/tools/ant/Project;

    if-eqz v0, :cond_0

    .line 748
    iget-object v0, p0, Lorg/apache/tools/ant/PropertyHelper;->project:Lorg/apache/tools/ant/Project;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Setting ro project property: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " -> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 751
    :cond_0
    monitor-enter p0

    .line 752
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/PropertyHelper;->userProperties:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 753
    iget-object v0, p0, Lorg/apache/tools/ant/PropertyHelper;->properties:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 754
    monitor-exit p0

    .line 755
    return-void

    .line 754
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setUserProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p1, "ns"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 732
    invoke-virtual {p0, p2, p3}, Lorg/apache/tools/ant/PropertyHelper;->setUserProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 733
    return-void
.end method

.method public testIfCondition(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 1204
    invoke-static {p1}, Lorg/apache/tools/ant/PropertyHelper;->nullOrEmpty(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lorg/apache/tools/ant/PropertyHelper;->evalAsBooleanOrPropertyName(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public testUnlessCondition(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 1214
    invoke-static {p1}, Lorg/apache/tools/ant/PropertyHelper;->nullOrEmpty(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lorg/apache/tools/ant/PropertyHelper;->evalAsBooleanOrPropertyName(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
