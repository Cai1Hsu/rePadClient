.class public Lorg/apache/tools/ant/taskdefs/condition/Os;
.super Ljava/lang/Object;
.source "Os.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# static fields
.field private static final DARWIN:Ljava/lang/String; = "darwin"

.field public static final FAMILY_9X:Ljava/lang/String; = "win9x"

.field public static final FAMILY_DOS:Ljava/lang/String; = "dos"

.field public static final FAMILY_MAC:Ljava/lang/String; = "mac"

.field public static final FAMILY_NETWARE:Ljava/lang/String; = "netware"

.field public static final FAMILY_NT:Ljava/lang/String; = "winnt"

.field public static final FAMILY_OS2:Ljava/lang/String; = "os/2"

.field public static final FAMILY_OS400:Ljava/lang/String; = "os/400"

.field public static final FAMILY_TANDEM:Ljava/lang/String; = "tandem"

.field public static final FAMILY_UNIX:Ljava/lang/String; = "unix"

.field public static final FAMILY_VMS:Ljava/lang/String; = "openvms"

.field public static final FAMILY_WINDOWS:Ljava/lang/String; = "windows"

.field public static final FAMILY_ZOS:Ljava/lang/String; = "z/os"

.field private static final OS_ARCH:Ljava/lang/String;

.field private static final OS_NAME:Ljava/lang/String;

.field private static final OS_VERSION:Ljava/lang/String;

.field private static final PATH_SEP:Ljava/lang/String;


# instance fields
.field private arch:Ljava/lang/String;

.field private family:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private version:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 31
    const-string/jumbo v0, "os.name"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_NAME:Ljava/lang/String;

    .line 33
    const-string/jumbo v0, "os.arch"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_ARCH:Ljava/lang/String;

    .line 35
    const-string/jumbo v0, "os.version"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_VERSION:Ljava/lang/String;

    .line 37
    const-string/jumbo v0, "path.separator"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/condition/Os;->PATH_SEP:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "family"    # Ljava/lang/String;

    .prologue
    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/condition/Os;->setFamily(Ljava/lang/String;)V

    .line 124
    return-void
.end method

.method public static isArch(Ljava/lang/String;)Z
    .locals 1
    .param p0, "arch"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 218
    invoke-static {v0, v0, p0, v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isOs(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isFamily(Ljava/lang/String;)Z
    .locals 1
    .param p0, "family"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 194
    invoke-static {p0, v0, v0, v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isOs(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isName(Ljava/lang/String;)Z
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 206
    invoke-static {v0, p0, v0, v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isOs(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isOs(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 11
    .param p0, "family"    # Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "arch"    # Ljava/lang/String;
    .param p3, "version"    # Ljava/lang/String;

    .prologue
    .line 246
    const/4 v7, 0x0

    .line 248
    .local v7, "retValue":Z
    if-nez p0, :cond_0

    if-nez p1, :cond_0

    if-nez p2, :cond_0

    if-eqz p3, :cond_7

    .line 251
    :cond_0
    const/4 v2, 0x1

    .line 252
    .local v2, "isFamily":Z
    const/4 v4, 0x1

    .line 253
    .local v4, "isName":Z
    const/4 v1, 0x1

    .line 254
    .local v1, "isArch":Z
    const/4 v5, 0x1

    .line 256
    .local v5, "isVersion":Z
    if-eqz p0, :cond_3

    .line 260
    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_NAME:Ljava/lang/String;

    const-string/jumbo v9, "windows"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    const/4 v9, -0x1

    if-le v8, v9, :cond_8

    const/4 v6, 0x1

    .line 261
    .local v6, "isWindows":Z
    :goto_0
    const/4 v0, 0x0

    .line 262
    .local v0, "is9x":Z
    const/4 v3, 0x0

    .line 263
    .local v3, "isNT":Z
    if-eqz v6, :cond_2

    .line 265
    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_NAME:Ljava/lang/String;

    const-string/jumbo v9, "95"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_1

    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_NAME:Ljava/lang/String;

    const-string/jumbo v9, "98"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_1

    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_NAME:Ljava/lang/String;

    const-string/jumbo v9, "me"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_1

    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_NAME:Ljava/lang/String;

    const-string/jumbo v9, "ce"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-ltz v8, :cond_9

    :cond_1
    const/4 v0, 0x1

    .line 271
    :goto_1
    if-nez v0, :cond_a

    const/4 v3, 0x1

    .line 273
    :cond_2
    :goto_2
    const-string/jumbo v8, "windows"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_b

    .line 274
    move v2, v6

    .line 308
    .end local v0    # "is9x":Z
    .end local v3    # "isNT":Z
    .end local v6    # "isWindows":Z
    :cond_3
    :goto_3
    if-eqz p1, :cond_4

    .line 309
    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_NAME:Ljava/lang/String;

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 311
    :cond_4
    if-eqz p2, :cond_5

    .line 312
    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_ARCH:Ljava/lang/String;

    invoke-virtual {p2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 314
    :cond_5
    if-eqz p3, :cond_6

    .line 315
    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_VERSION:Ljava/lang/String;

    invoke-virtual {p3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 317
    :cond_6
    if-eqz v2, :cond_25

    if-eqz v4, :cond_25

    if-eqz v1, :cond_25

    if-eqz v5, :cond_25

    const/4 v7, 0x1

    .line 319
    .end local v1    # "isArch":Z
    .end local v2    # "isFamily":Z
    .end local v4    # "isName":Z
    .end local v5    # "isVersion":Z
    :cond_7
    :goto_4
    return v7

    .line 260
    .restart local v1    # "isArch":Z
    .restart local v2    # "isFamily":Z
    .restart local v4    # "isName":Z
    .restart local v5    # "isVersion":Z
    :cond_8
    const/4 v6, 0x0

    goto :goto_0

    .line 265
    .restart local v0    # "is9x":Z
    .restart local v3    # "isNT":Z
    .restart local v6    # "isWindows":Z
    :cond_9
    const/4 v0, 0x0

    goto :goto_1

    .line 271
    :cond_a
    const/4 v3, 0x0

    goto :goto_2

    .line 275
    :cond_b
    const-string/jumbo v8, "win9x"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    .line 276
    if-eqz v6, :cond_c

    if-eqz v0, :cond_c

    const/4 v2, 0x1

    :goto_5
    goto :goto_3

    :cond_c
    const/4 v2, 0x0

    goto :goto_5

    .line 277
    :cond_d
    const-string/jumbo v8, "winnt"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_f

    .line 278
    if-eqz v6, :cond_e

    if-eqz v3, :cond_e

    const/4 v2, 0x1

    :goto_6
    goto :goto_3

    :cond_e
    const/4 v2, 0x0

    goto :goto_6

    .line 279
    :cond_f
    const-string/jumbo v8, "os/2"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_11

    .line 280
    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_NAME:Ljava/lang/String;

    const-string/jumbo v9, "os/2"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    const/4 v9, -0x1

    if-le v8, v9, :cond_10

    const/4 v2, 0x1

    :goto_7
    goto :goto_3

    :cond_10
    const/4 v2, 0x0

    goto :goto_7

    .line 281
    :cond_11
    const-string/jumbo v8, "netware"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_13

    .line 282
    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_NAME:Ljava/lang/String;

    const-string/jumbo v9, "netware"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    const/4 v9, -0x1

    if-le v8, v9, :cond_12

    const/4 v2, 0x1

    :goto_8
    goto :goto_3

    :cond_12
    const/4 v2, 0x0

    goto :goto_8

    .line 283
    :cond_13
    const-string/jumbo v8, "dos"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_15

    .line 284
    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->PATH_SEP:Ljava/lang/String;

    const-string/jumbo v9, ";"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_14

    const-string/jumbo v8, "netware"

    invoke-static {v8}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_14

    const/4 v2, 0x1

    :goto_9
    goto/16 :goto_3

    :cond_14
    const/4 v2, 0x0

    goto :goto_9

    .line 285
    :cond_15
    const-string/jumbo v8, "mac"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_18

    .line 286
    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_NAME:Ljava/lang/String;

    const-string/jumbo v9, "mac"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    const/4 v9, -0x1

    if-gt v8, v9, :cond_16

    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_NAME:Ljava/lang/String;

    const-string/jumbo v9, "darwin"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    const/4 v9, -0x1

    if-le v8, v9, :cond_17

    :cond_16
    const/4 v2, 0x1

    :goto_a
    goto/16 :goto_3

    :cond_17
    const/4 v2, 0x0

    goto :goto_a

    .line 288
    :cond_18
    const-string/jumbo v8, "tandem"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1a

    .line 289
    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_NAME:Ljava/lang/String;

    const-string/jumbo v9, "nonstop_kernel"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    const/4 v9, -0x1

    if-le v8, v9, :cond_19

    const/4 v2, 0x1

    :goto_b
    goto/16 :goto_3

    :cond_19
    const/4 v2, 0x0

    goto :goto_b

    .line 290
    :cond_1a
    const-string/jumbo v8, "unix"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1d

    .line 291
    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->PATH_SEP:Ljava/lang/String;

    const-string/jumbo v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1c

    const-string/jumbo v8, "openvms"

    invoke-static {v8}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1c

    const-string/jumbo v8, "mac"

    invoke-static {v8}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1b

    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_NAME:Ljava/lang/String;

    const-string/jumbo v9, "x"

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1b

    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_NAME:Ljava/lang/String;

    const-string/jumbo v9, "darwin"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    const/4 v9, -0x1

    if-le v8, v9, :cond_1c

    :cond_1b
    const/4 v2, 0x1

    :goto_c
    goto/16 :goto_3

    :cond_1c
    const/4 v2, 0x0

    goto :goto_c

    .line 295
    :cond_1d
    const-string/jumbo v8, "z/os"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_20

    .line 296
    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_NAME:Ljava/lang/String;

    const-string/jumbo v9, "z/os"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    const/4 v9, -0x1

    if-gt v8, v9, :cond_1e

    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_NAME:Ljava/lang/String;

    const-string/jumbo v9, "os/390"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    const/4 v9, -0x1

    if-le v8, v9, :cond_1f

    :cond_1e
    const/4 v2, 0x1

    :goto_d
    goto/16 :goto_3

    :cond_1f
    const/4 v2, 0x0

    goto :goto_d

    .line 298
    :cond_20
    const-string/jumbo v8, "os/400"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_22

    .line 299
    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_NAME:Ljava/lang/String;

    const-string/jumbo v9, "os/400"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    const/4 v9, -0x1

    if-le v8, v9, :cond_21

    const/4 v2, 0x1

    :goto_e
    goto/16 :goto_3

    :cond_21
    const/4 v2, 0x0

    goto :goto_e

    .line 300
    :cond_22
    const-string/jumbo v8, "openvms"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_24

    .line 301
    sget-object v8, Lorg/apache/tools/ant/taskdefs/condition/Os;->OS_NAME:Ljava/lang/String;

    const-string/jumbo v9, "openvms"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    const/4 v9, -0x1

    if-le v8, v9, :cond_23

    const/4 v2, 0x1

    :goto_f
    goto/16 :goto_3

    :cond_23
    const/4 v2, 0x0

    goto :goto_f

    .line 303
    :cond_24
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Don\'t know how to detect os family \""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 317
    .end local v0    # "is9x":Z
    .end local v3    # "isNT":Z
    .end local v6    # "isWindows":Z
    :cond_25
    const/4 v7, 0x0

    goto/16 :goto_4
.end method

.method public static isVersion(Ljava/lang/String;)Z
    .locals 1
    .param p0, "version"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 230
    invoke-static {v0, v0, v0, p0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isOs(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public eval()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 183
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Os;->family:Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/condition/Os;->name:Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Os;->arch:Ljava/lang/String;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/Os;->version:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isOs(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public setArch(Ljava/lang/String;)V
    .locals 1
    .param p1, "arch"    # Ljava/lang/String;

    .prologue
    .line 163
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Os;->arch:Ljava/lang/String;

    .line 164
    return-void
.end method

.method public setFamily(Ljava/lang/String;)V
    .locals 1
    .param p1, "f"    # Ljava/lang/String;

    .prologue
    .line 145
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Os;->family:Ljava/lang/String;

    .line 146
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 154
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Os;->name:Ljava/lang/String;

    .line 155
    return-void
.end method

.method public setVersion(Ljava/lang/String;)V
    .locals 1
    .param p1, "version"    # Ljava/lang/String;

    .prologue
    .line 172
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Os;->version:Ljava/lang/String;

    .line 173
    return-void
.end method
