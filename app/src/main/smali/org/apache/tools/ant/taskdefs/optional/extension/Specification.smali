.class public final Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
.super Ljava/lang/Object;
.source "Specification.java"


# static fields
.field public static final COMPATIBLE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

.field public static final IMPLEMENTATION_TITLE:Ljava/util/jar/Attributes$Name;

.field public static final IMPLEMENTATION_VENDOR:Ljava/util/jar/Attributes$Name;

.field public static final IMPLEMENTATION_VERSION:Ljava/util/jar/Attributes$Name;

.field public static final INCOMPATIBLE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

.field private static final MISSING:Ljava/lang/String; = "Missing "

.field public static final REQUIRE_IMPLEMENTATION_CHANGE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

.field public static final REQUIRE_SPECIFICATION_UPGRADE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

.field public static final REQUIRE_VENDOR_SWITCH:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

.field public static final SPECIFICATION_TITLE:Ljava/util/jar/Attributes$Name;

.field public static final SPECIFICATION_VENDOR:Ljava/util/jar/Attributes$Name;

.field public static final SPECIFICATION_VERSION:Ljava/util/jar/Attributes$Name;


# instance fields
.field private implementationTitle:Ljava/lang/String;

.field private implementationVendor:Ljava/lang/String;

.field private implementationVersion:Ljava/lang/String;

.field private sections:[Ljava/lang/String;

.field private specificationTitle:Ljava/lang/String;

.field private specificationVendor:Ljava/lang/String;

.field private specificationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 49
    sget-object v0, Ljava/util/jar/Attributes$Name;->SPECIFICATION_TITLE:Ljava/util/jar/Attributes$Name;

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->SPECIFICATION_TITLE:Ljava/util/jar/Attributes$Name;

    .line 55
    sget-object v0, Ljava/util/jar/Attributes$Name;->SPECIFICATION_VERSION:Ljava/util/jar/Attributes$Name;

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->SPECIFICATION_VERSION:Ljava/util/jar/Attributes$Name;

    .line 61
    sget-object v0, Ljava/util/jar/Attributes$Name;->SPECIFICATION_VENDOR:Ljava/util/jar/Attributes$Name;

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->SPECIFICATION_VENDOR:Ljava/util/jar/Attributes$Name;

    .line 67
    sget-object v0, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_TITLE:Ljava/util/jar/Attributes$Name;

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->IMPLEMENTATION_TITLE:Ljava/util/jar/Attributes$Name;

    .line 73
    sget-object v0, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_VERSION:Ljava/util/jar/Attributes$Name;

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->IMPLEMENTATION_VERSION:Ljava/util/jar/Attributes$Name;

    .line 79
    sget-object v0, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_VENDOR:Ljava/util/jar/Attributes$Name;

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->IMPLEMENTATION_VENDOR:Ljava/util/jar/Attributes$Name;

    .line 86
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    const-string/jumbo v1, "COMPATIBLE"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->COMPATIBLE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    .line 93
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    const-string/jumbo v1, "REQUIRE_SPECIFICATION_UPGRADE"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->REQUIRE_SPECIFICATION_UPGRADE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    .line 100
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    const-string/jumbo v1, "REQUIRE_VENDOR_SWITCH"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->REQUIRE_VENDOR_SWITCH:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    .line 107
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    const-string/jumbo v1, "REQUIRE_IMPLEMENTATION_CHANGE"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->REQUIRE_IMPLEMENTATION_CHANGE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    .line 116
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    const-string/jumbo v1, "INCOMPATIBLE"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->INCOMPATIBLE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "specificationTitle"    # Ljava/lang/String;
    .param p2, "specificationVersion"    # Ljava/lang/String;
    .param p3, "specificationVendor"    # Ljava/lang/String;
    .param p4, "implementationTitle"    # Ljava/lang/String;
    .param p5, "implementationVersion"    # Ljava/lang/String;
    .param p6, "implementationVendor"    # Ljava/lang/String;

    .prologue
    .line 209
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 212
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 5
    .param p1, "specificationTitle"    # Ljava/lang/String;
    .param p2, "specificationVersion"    # Ljava/lang/String;
    .param p3, "specificationVendor"    # Ljava/lang/String;
    .param p4, "implementationTitle"    # Ljava/lang/String;
    .param p5, "implementationVersion"    # Ljava/lang/String;
    .param p6, "implementationVendor"    # Ljava/lang/String;
    .param p7, "sections"    # [Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 233
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 234
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->specificationTitle:Ljava/lang/String;

    .line 235
    iput-object p3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->specificationVendor:Ljava/lang/String;

    .line 237
    if-eqz p2, :cond_0

    .line 239
    :try_start_0
    new-instance v3, Lorg/apache/tools/ant/util/DeweyDecimal;

    invoke-direct {v3, p2}, Lorg/apache/tools/ant/util/DeweyDecimal;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->specificationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 249
    :cond_0
    iput-object p4, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->implementationTitle:Ljava/lang/String;

    .line 250
    iput-object p6, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->implementationVendor:Ljava/lang/String;

    .line 251
    iput-object p5, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->implementationVersion:Ljava/lang/String;

    .line 253
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->specificationTitle:Ljava/lang/String;

    if-nez v3, :cond_1

    .line 254
    new-instance v3, Ljava/lang/NullPointerException;

    const-string/jumbo v4, "specificationTitle"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 241
    :catch_0
    move-exception v2

    .line 242
    .local v2, "nfe":Ljava/lang/NumberFormatException;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Bad specification version format \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "\' in \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "\'. (Reason: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 245
    .local v1, "error":Ljava/lang/String;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 257
    .end local v1    # "error":Ljava/lang/String;
    .end local v2    # "nfe":Ljava/lang/NumberFormatException;
    :cond_1
    const/4 v0, 0x0

    .line 258
    .local v0, "copy":[Ljava/lang/String;
    if-eqz p7, :cond_2

    .line 259
    array-length v3, p7

    new-array v0, v3, [Ljava/lang/String;

    .line 260
    array-length v3, p7

    invoke-static {p7, v4, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 262
    :cond_2
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->sections:[Ljava/lang/String;

    .line 263
    return-void
.end method

.method private static getSpecification(Ljava/lang/String;Ljava/util/jar/Attributes;)Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
    .locals 10
    .param p0, "section"    # Ljava/lang/String;
    .param p1, "attributes"    # Ljava/util/jar/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 565
    sget-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->SPECIFICATION_TITLE:Ljava/util/jar/Attributes$Name;

    invoke-virtual {p1, v0}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getTrimmedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 567
    .local v1, "name":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 568
    const/4 v0, 0x0

    .line 601
    :goto_0
    return-object v0

    .line 571
    :cond_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->SPECIFICATION_VENDOR:Ljava/util/jar/Attributes$Name;

    invoke-virtual {p1, v0}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getTrimmedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 573
    .local v3, "specVendor":Ljava/lang/String;
    if-nez v3, :cond_1

    .line 574
    new-instance v0, Ljava/text/ParseException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Missing "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->SPECIFICATION_VENDOR:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v7, v9}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 577
    :cond_1
    sget-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->SPECIFICATION_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {p1, v0}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getTrimmedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 579
    .local v2, "specVersion":Ljava/lang/String;
    if-nez v2, :cond_2

    .line 580
    new-instance v0, Ljava/text/ParseException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Missing "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->SPECIFICATION_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v7, v9}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 583
    :cond_2
    sget-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->IMPLEMENTATION_TITLE:Ljava/util/jar/Attributes$Name;

    invoke-virtual {p1, v0}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getTrimmedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 585
    .local v4, "impTitle":Ljava/lang/String;
    if-nez v4, :cond_3

    .line 586
    new-instance v0, Ljava/text/ParseException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Missing "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->IMPLEMENTATION_TITLE:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v7, v9}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 589
    :cond_3
    sget-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->IMPLEMENTATION_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {p1, v0}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getTrimmedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 591
    .local v5, "impVersion":Ljava/lang/String;
    if-nez v5, :cond_4

    .line 592
    new-instance v0, Ljava/text/ParseException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Missing "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->IMPLEMENTATION_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v7, v9}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 595
    :cond_4
    sget-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->IMPLEMENTATION_VENDOR:Ljava/util/jar/Attributes$Name;

    invoke-virtual {p1, v0}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getTrimmedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 597
    .local v6, "impVendor":Ljava/lang/String;
    if-nez v6, :cond_5

    .line 598
    new-instance v0, Ljava/text/ParseException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Missing "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->IMPLEMENTATION_VENDOR:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v7, v9}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 601
    :cond_5
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    aput-object p0, v7, v9

    invoke-direct/range {v0 .. v7}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public static getSpecifications(Ljava/util/jar/Manifest;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
    .locals 8
    .param p0, "manifest"    # Ljava/util/jar/Manifest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 169
    if-nez p0, :cond_0

    .line 170
    const/4 v7, 0x0

    new-array v7, v7, [Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;

    .line 188
    :goto_0
    return-object v7

    .line 173
    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 175
    .local v4, "results":Ljava/util/ArrayList;
    invoke-virtual {p0}, Ljava/util/jar/Manifest;->getEntries()Ljava/util/Map;

    move-result-object v1

    .line 176
    .local v1, "entries":Ljava/util/Map;
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 177
    .local v3, "keys":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 178
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 179
    .local v2, "key":Ljava/lang/String;
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/jar/Attributes;

    .line 180
    .local v0, "attributes":Ljava/util/jar/Attributes;
    invoke-static {v2, v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getSpecification(Ljava/lang/String;Ljava/util/jar/Attributes;)Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;

    move-result-object v5

    .line 182
    .local v5, "specification":Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
    if-eqz v5, :cond_1

    .line 183
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 187
    .end local v0    # "attributes":Ljava/util/jar/Attributes;
    .end local v2    # "key":Ljava/lang/String;
    .end local v5    # "specification":Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
    :cond_2
    invoke-static {v4}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->removeDuplicates(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v6

    .line 188
    .local v6, "trimmedResults":Ljava/util/ArrayList;
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v7, v7, [Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;

    goto :goto_0
.end method

.method private static getTrimmedString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 550
    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private isCompatible(Lorg/apache/tools/ant/util/DeweyDecimal;Lorg/apache/tools/ant/util/DeweyDecimal;)Z
    .locals 1
    .param p1, "first"    # Lorg/apache/tools/ant/util/DeweyDecimal;
    .param p2, "second"    # Lorg/apache/tools/ant/util/DeweyDecimal;

    .prologue
    .line 457
    invoke-virtual {p1, p2}, Lorg/apache/tools/ant/util/DeweyDecimal;->isGreaterThanOrEqual(Lorg/apache/tools/ant/util/DeweyDecimal;)Z

    move-result v0

    return v0
.end method

.method private static isEqual(Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;)Z
    .locals 2
    .param p0, "specification"    # Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
    .param p1, "other"    # Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;

    .prologue
    .line 507
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getSpecificationTitle()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getSpecificationTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getSpecificationVersion()Lorg/apache/tools/ant/util/DeweyDecimal;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getSpecificationVersion()Lorg/apache/tools/ant/util/DeweyDecimal;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/DeweyDecimal;->isEqual(Lorg/apache/tools/ant/util/DeweyDecimal;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getSpecificationVendor()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getSpecificationVendor()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getImplementationTitle()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getImplementationTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getImplementationVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getImplementationVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getImplementationVendor()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getImplementationVendor()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static mergeInSections(Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;Ljava/util/ArrayList;)Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
    .locals 8
    .param p0, "specification"    # Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
    .param p1, "sectionsToAdd"    # Ljava/util/ArrayList;

    .prologue
    .line 526
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 534
    .end local p0    # "specification":Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
    :goto_0
    return-object p0

    .line 529
    .restart local p0    # "specification":Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getSections()[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 531
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    .line 534
    .local v7, "sections":[Ljava/lang/String;
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getSpecificationTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getSpecificationVersion()Lorg/apache/tools/ant/util/DeweyDecimal;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/util/DeweyDecimal;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getSpecificationVendor()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getImplementationTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getImplementationVersion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getImplementationVendor()Ljava/lang/String;

    move-result-object v6

    invoke-direct/range {v0 .. v7}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    move-object p0, v0

    goto :goto_0
.end method

.method private static removeDuplicates(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 8
    .param p0, "list"    # Ljava/util/ArrayList;

    .prologue
    .line 471
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 472
    .local v4, "results":Ljava/util/ArrayList;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 473
    .local v5, "sections":Ljava/util/ArrayList;
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_3

    .line 474
    const/4 v7, 0x0

    invoke-virtual {p0, v7}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;

    .line 475
    .local v6, "specification":Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 476
    .local v0, "iterator":Ljava/util/Iterator;
    :cond_0
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 477
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;

    .line 478
    .local v2, "other":Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
    invoke-static {v6, v2}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->isEqual(Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 479
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getSections()[Ljava/lang/String;

    move-result-object v3

    .line 480
    .local v3, "otherSections":[Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 481
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 483
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 487
    .end local v2    # "other":Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
    .end local v3    # "otherSections":[Ljava/lang/String;
    :cond_2
    invoke-static {v6, v5}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->mergeInSections(Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;Ljava/util/ArrayList;)Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;

    move-result-object v1

    .line 489
    .local v1, "merged":Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 491
    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    goto :goto_0

    .line 494
    .end local v0    # "iterator":Ljava/util/Iterator;
    .end local v1    # "merged":Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
    .end local v6    # "specification":Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;
    :cond_3
    return-object v4
.end method


# virtual methods
.method public getCompatibilityWith(Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;)Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;
    .locals 5
    .param p1, "other"    # Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;

    .prologue
    .line 346
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->specificationTitle:Ljava/lang/String;

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getSpecificationTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 347
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->INCOMPATIBLE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    .line 381
    :goto_0
    return-object v3

    .line 351
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getSpecificationVersion()Lorg/apache/tools/ant/util/DeweyDecimal;

    move-result-object v2

    .line 353
    .local v2, "otherSpecificationVersion":Lorg/apache/tools/ant/util/DeweyDecimal;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->specificationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    if-eqz v3, :cond_2

    .line 354
    if-eqz v2, :cond_1

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->specificationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    invoke-direct {p0, v3, v2}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->isCompatible(Lorg/apache/tools/ant/util/DeweyDecimal;Lorg/apache/tools/ant/util/DeweyDecimal;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 356
    :cond_1
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->REQUIRE_SPECIFICATION_UPGRADE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    goto :goto_0

    .line 361
    :cond_2
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getImplementationVendor()Ljava/lang/String;

    move-result-object v0

    .line 363
    .local v0, "otherImplementationVendor":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->implementationVendor:Ljava/lang/String;

    if-eqz v3, :cond_4

    .line 364
    if-eqz v0, :cond_3

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->implementationVendor:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 366
    :cond_3
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->REQUIRE_VENDOR_SWITCH:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    goto :goto_0

    .line 371
    :cond_4
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getImplementationVersion()Ljava/lang/String;

    move-result-object v1

    .line 373
    .local v1, "otherImplementationVersion":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->implementationVersion:Ljava/lang/String;

    if-eqz v3, :cond_6

    .line 374
    if-eqz v1, :cond_5

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->implementationVersion:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 376
    :cond_5
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->REQUIRE_IMPLEMENTATION_CHANGE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    goto :goto_0

    .line 381
    :cond_6
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->COMPATIBLE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    goto :goto_0
.end method

.method public getImplementationTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 289
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->implementationTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getImplementationVendor()Ljava/lang/String;
    .locals 1

    .prologue
    .line 307
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->implementationVendor:Ljava/lang/String;

    return-object v0
.end method

.method public getImplementationVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 316
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->implementationVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getSections()[Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 327
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->sections:[Ljava/lang/String;

    if-nez v1, :cond_0

    .line 328
    const/4 v0, 0x0

    .line 332
    :goto_0
    return-object v0

    .line 330
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->sections:[Ljava/lang/String;

    array-length v1, v1

    new-array v0, v1, [Ljava/lang/String;

    .line 331
    .local v0, "newSections":[Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->sections:[Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->sections:[Ljava/lang/String;

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public getSpecificationTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 271
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->specificationTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getSpecificationVendor()Ljava/lang/String;
    .locals 1

    .prologue
    .line 280
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->specificationVendor:Ljava/lang/String;

    return-object v0
.end method

.method public getSpecificationVersion()Lorg/apache/tools/ant/util/DeweyDecimal;
    .locals 1

    .prologue
    .line 298
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->specificationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    return-object v0
.end method

.method public isCompatibleWith(Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;)Z
    .locals 2
    .param p1, "other"    # Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;

    .prologue
    .line 393
    sget-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->COMPATIBLE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->getCompatibilityWith(Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;)Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 402
    const-string/jumbo v0, ": "

    .line 404
    .local v0, "brace":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuffer;

    sget-object v2, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->SPECIFICATION_TITLE:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v2}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 406
    .local v1, "sb":Ljava/lang/StringBuffer;
    const-string/jumbo v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 407
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->specificationTitle:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 408
    sget-object v2, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 410
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->specificationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    if-eqz v2, :cond_0

    .line 411
    sget-object v2, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->SPECIFICATION_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 412
    const-string/jumbo v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 413
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->specificationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 414
    sget-object v2, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 417
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->specificationVendor:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 418
    sget-object v2, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->SPECIFICATION_VENDOR:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 419
    const-string/jumbo v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 420
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->specificationVendor:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 421
    sget-object v2, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 424
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->implementationTitle:Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 425
    sget-object v2, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->IMPLEMENTATION_TITLE:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 426
    const-string/jumbo v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 427
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->implementationTitle:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 428
    sget-object v2, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 431
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->implementationVersion:Ljava/lang/String;

    if-eqz v2, :cond_3

    .line 432
    sget-object v2, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->IMPLEMENTATION_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 433
    const-string/jumbo v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 434
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->implementationVersion:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 435
    sget-object v2, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 438
    :cond_3
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->implementationVendor:Ljava/lang/String;

    if-eqz v2, :cond_4

    .line 439
    sget-object v2, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->IMPLEMENTATION_VENDOR:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 440
    const-string/jumbo v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 441
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Specification;->implementationVendor:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 442
    sget-object v2, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 445
    :cond_4
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
