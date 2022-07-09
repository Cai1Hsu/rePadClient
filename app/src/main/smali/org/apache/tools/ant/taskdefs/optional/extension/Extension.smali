.class public final Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
.super Ljava/lang/Object;
.source "Extension.java"


# static fields
.field public static final COMPATIBLE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

.field public static final EXTENSION_LIST:Ljava/util/jar/Attributes$Name;

.field public static final EXTENSION_NAME:Ljava/util/jar/Attributes$Name;

.field public static final IMPLEMENTATION_URL:Ljava/util/jar/Attributes$Name;

.field public static final IMPLEMENTATION_VENDOR:Ljava/util/jar/Attributes$Name;

.field public static final IMPLEMENTATION_VENDOR_ID:Ljava/util/jar/Attributes$Name;

.field public static final IMPLEMENTATION_VERSION:Ljava/util/jar/Attributes$Name;

.field public static final INCOMPATIBLE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

.field public static final OPTIONAL_EXTENSION_LIST:Ljava/util/jar/Attributes$Name;

.field public static final REQUIRE_IMPLEMENTATION_UPGRADE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

.field public static final REQUIRE_SPECIFICATION_UPGRADE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

.field public static final REQUIRE_VENDOR_SWITCH:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

.field public static final SPECIFICATION_VENDOR:Ljava/util/jar/Attributes$Name;

.field public static final SPECIFICATION_VERSION:Ljava/util/jar/Attributes$Name;


# instance fields
.field private extensionName:Ljava/lang/String;

.field private implementationURL:Ljava/lang/String;

.field private implementationVendor:Ljava/lang/String;

.field private implementationVendorID:Ljava/lang/String;

.field private implementationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

.field private specificationVendor:Ljava/lang/String;

.field private specificationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 45
    new-instance v0, Ljava/util/jar/Attributes$Name;

    const-string/jumbo v1, "Extension-List"

    invoke-direct {v0, v1}, Ljava/util/jar/Attributes$Name;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->EXTENSION_LIST:Ljava/util/jar/Attributes$Name;

    .line 58
    new-instance v0, Ljava/util/jar/Attributes$Name;

    const-string/jumbo v1, "Optional-Extension-List"

    invoke-direct {v0, v1}, Ljava/util/jar/Attributes$Name;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->OPTIONAL_EXTENSION_LIST:Ljava/util/jar/Attributes$Name;

    .line 64
    new-instance v0, Ljava/util/jar/Attributes$Name;

    const-string/jumbo v1, "Extension-Name"

    invoke-direct {v0, v1}, Ljava/util/jar/Attributes$Name;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->EXTENSION_NAME:Ljava/util/jar/Attributes$Name;

    .line 69
    sget-object v0, Ljava/util/jar/Attributes$Name;->SPECIFICATION_VERSION:Ljava/util/jar/Attributes$Name;

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->SPECIFICATION_VERSION:Ljava/util/jar/Attributes$Name;

    .line 75
    sget-object v0, Ljava/util/jar/Attributes$Name;->SPECIFICATION_VENDOR:Ljava/util/jar/Attributes$Name;

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->SPECIFICATION_VENDOR:Ljava/util/jar/Attributes$Name;

    .line 81
    sget-object v0, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_VERSION:Ljava/util/jar/Attributes$Name;

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->IMPLEMENTATION_VERSION:Ljava/util/jar/Attributes$Name;

    .line 87
    sget-object v0, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_VENDOR:Ljava/util/jar/Attributes$Name;

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->IMPLEMENTATION_VENDOR:Ljava/util/jar/Attributes$Name;

    .line 93
    new-instance v0, Ljava/util/jar/Attributes$Name;

    const-string/jumbo v1, "Implementation-URL"

    invoke-direct {v0, v1}, Ljava/util/jar/Attributes$Name;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->IMPLEMENTATION_URL:Ljava/util/jar/Attributes$Name;

    .line 99
    new-instance v0, Ljava/util/jar/Attributes$Name;

    const-string/jumbo v1, "Implementation-Vendor-Id"

    invoke-direct {v0, v1}, Ljava/util/jar/Attributes$Name;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->IMPLEMENTATION_VENDOR_ID:Ljava/util/jar/Attributes$Name;

    .line 105
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    const-string/jumbo v1, "COMPATIBLE"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->COMPATIBLE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    .line 112
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    const-string/jumbo v1, "REQUIRE_SPECIFICATION_UPGRADE"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->REQUIRE_SPECIFICATION_UPGRADE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    .line 119
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    const-string/jumbo v1, "REQUIRE_VENDOR_SWITCH"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->REQUIRE_VENDOR_SWITCH:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    .line 126
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    const-string/jumbo v1, "REQUIRE_IMPLEMENTATION_UPGRADE"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->REQUIRE_IMPLEMENTATION_UPGRADE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    .line 135
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    const-string/jumbo v1, "INCOMPATIBLE"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->INCOMPATIBLE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "extensionName"    # Ljava/lang/String;
    .param p2, "specificationVersion"    # Ljava/lang/String;
    .param p3, "specificationVendor"    # Ljava/lang/String;
    .param p4, "implementationVersion"    # Ljava/lang/String;
    .param p5, "implementationVendor"    # Ljava/lang/String;
    .param p6, "implementationVendorId"    # Ljava/lang/String;
    .param p7, "implementationURL"    # Ljava/lang/String;

    .prologue
    .line 327
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 328
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->extensionName:Ljava/lang/String;

    .line 329
    iput-object p3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->specificationVendor:Ljava/lang/String;

    .line 331
    if-eqz p2, :cond_0

    .line 333
    :try_start_0
    new-instance v2, Lorg/apache/tools/ant/util/DeweyDecimal;

    invoke-direct {v2, p2}, Lorg/apache/tools/ant/util/DeweyDecimal;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->specificationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 343
    :cond_0
    iput-object p7, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationURL:Ljava/lang/String;

    .line 344
    iput-object p5, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationVendor:Ljava/lang/String;

    .line 345
    iput-object p6, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationVendorID:Ljava/lang/String;

    .line 347
    if-eqz p4, :cond_1

    .line 349
    :try_start_1
    new-instance v2, Lorg/apache/tools/ant/util/DeweyDecimal;

    invoke-direct {v2, p4}, Lorg/apache/tools/ant/util/DeweyDecimal;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 359
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->extensionName:Ljava/lang/String;

    if-nez v2, :cond_2

    .line 360
    new-instance v2, Ljava/lang/NullPointerException;

    const-string/jumbo v3, "extensionName property is null"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 335
    :catch_0
    move-exception v1

    .line 336
    .local v1, "nfe":Ljava/lang/NumberFormatException;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Bad specification version format \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\' in \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\'. (Reason: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 339
    .local v0, "error":Ljava/lang/String;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 351
    .end local v0    # "error":Ljava/lang/String;
    .end local v1    # "nfe":Ljava/lang/NumberFormatException;
    :catch_1
    move-exception v1

    .line 352
    .restart local v1    # "nfe":Ljava/lang/NumberFormatException;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Bad implementation version format \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\' in \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\'. (Reason: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 355
    .restart local v0    # "error":Ljava/lang/String;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 362
    .end local v0    # "error":Ljava/lang/String;
    .end local v1    # "nfe":Ljava/lang/NumberFormatException;
    :cond_2
    return-void
.end method

.method public static addExtension(Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;Ljava/lang/String;Ljava/util/jar/Attributes;)V
    .locals 8
    .param p0, "extension"    # Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "attributes"    # Ljava/util/jar/Attributes;

    .prologue
    .line 265
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    sget-object v7, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->EXTENSION_NAME:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getExtensionName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v6, v7}, Ljava/util/jar/Attributes;->putValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 268
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getSpecificationVendor()Ljava/lang/String;

    move-result-object v4

    .line 269
    .local v4, "specificationVendor":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 270
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    sget-object v7, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->SPECIFICATION_VENDOR:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6, v4}, Ljava/util/jar/Attributes;->putValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 274
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getSpecificationVersion()Lorg/apache/tools/ant/util/DeweyDecimal;

    move-result-object v5

    .line 276
    .local v5, "specificationVersion":Lorg/apache/tools/ant/util/DeweyDecimal;
    if-eqz v5, :cond_1

    .line 277
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    sget-object v7, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->SPECIFICATION_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5}, Lorg/apache/tools/ant/util/DeweyDecimal;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v6, v7}, Ljava/util/jar/Attributes;->putValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 281
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getImplementationVendorID()Ljava/lang/String;

    move-result-object v2

    .line 283
    .local v2, "implementationVendorID":Ljava/lang/String;
    if-eqz v2, :cond_2

    .line 284
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    sget-object v7, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->IMPLEMENTATION_VENDOR_ID:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6, v2}, Ljava/util/jar/Attributes;->putValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 288
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getImplementationVendor()Ljava/lang/String;

    move-result-object v1

    .line 289
    .local v1, "implementationVendor":Ljava/lang/String;
    if-eqz v1, :cond_3

    .line 290
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    sget-object v7, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->IMPLEMENTATION_VENDOR:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6, v1}, Ljava/util/jar/Attributes;->putValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 294
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getImplementationVersion()Lorg/apache/tools/ant/util/DeweyDecimal;

    move-result-object v3

    .line 296
    .local v3, "implementationVersion":Lorg/apache/tools/ant/util/DeweyDecimal;
    if-eqz v3, :cond_4

    .line 297
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    sget-object v7, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->IMPLEMENTATION_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3}, Lorg/apache/tools/ant/util/DeweyDecimal;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v6, v7}, Ljava/util/jar/Attributes;->putValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 301
    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getImplementationURL()Ljava/lang/String;

    move-result-object v0

    .line 302
    .local v0, "implementationURL":Ljava/lang/String;
    if-eqz v0, :cond_5

    .line 303
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    sget-object v7, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->IMPLEMENTATION_URL:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6, v0}, Ljava/util/jar/Attributes;->putValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 306
    :cond_5
    return-void
.end method

.method public static addExtension(Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;Ljava/util/jar/Attributes;)V
    .locals 1
    .param p0, "extension"    # Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .param p1, "attributes"    # Ljava/util/jar/Attributes;

    .prologue
    .line 250
    const-string/jumbo v0, ""

    invoke-static {p0, v0, p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->addExtension(Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;Ljava/lang/String;Ljava/util/jar/Attributes;)V

    .line 251
    return-void
.end method

.method public static getAvailable(Ljava/util/jar/Manifest;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .locals 8
    .param p0, "manifest"    # Ljava/util/jar/Manifest;

    .prologue
    .line 189
    if-nez p0, :cond_0

    .line 190
    const/4 v7, 0x0

    new-array v7, v7, [Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    .line 214
    :goto_0
    return-object v7

    .line 193
    :cond_0
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 195
    .local v6, "results":Ljava/util/ArrayList;
    invoke-virtual {p0}, Ljava/util/jar/Manifest;->getMainAttributes()Ljava/util/jar/Attributes;

    move-result-object v5

    .line 196
    .local v5, "mainAttributes":Ljava/util/jar/Attributes;
    if-eqz v5, :cond_1

    .line 197
    const-string/jumbo v7, ""

    invoke-static {v7, v5}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getExtension(Ljava/lang/String;Ljava/util/jar/Attributes;)Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v2

    .line 198
    .local v2, "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    if-eqz v2, :cond_1

    .line 199
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 203
    .end local v2    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    :cond_1
    invoke-virtual {p0}, Ljava/util/jar/Manifest;->getEntries()Ljava/util/Map;

    move-result-object v1

    .line 204
    .local v1, "entries":Ljava/util/Map;
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 205
    .local v4, "keys":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 206
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 207
    .local v3, "key":Ljava/lang/String;
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/jar/Attributes;

    .line 208
    .local v0, "attributes":Ljava/util/jar/Attributes;
    const-string/jumbo v7, ""

    invoke-static {v7, v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getExtension(Ljava/lang/String;Ljava/util/jar/Attributes;)Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v2

    .line 209
    .restart local v2    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    if-eqz v2, :cond_2

    .line 210
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 214
    .end local v0    # "attributes":Ljava/util/jar/Attributes;
    .end local v2    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .end local v3    # "key":Ljava/lang/String;
    :cond_3
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v7, v7, [Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    goto :goto_0
.end method

.method private static getExtension(Ljava/lang/String;Ljava/util/jar/Attributes;)Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .locals 17
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "attributes"    # Ljava/util/jar/Attributes;

    .prologue
    .line 652
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v16, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->EXTENSION_NAME:Ljava/util/jar/Attributes$Name;

    move-object/from16 v0, v16

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    .line 653
    .local v13, "nameKey":Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/util/jar/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getTrimmedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 654
    .local v2, "name":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 655
    const/4 v1, 0x0

    .line 677
    :goto_0
    return-object v1

    .line 658
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v16, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->SPECIFICATION_VENDOR:Ljava/util/jar/Attributes$Name;

    move-object/from16 v0, v16

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    .line 659
    .local v14, "specVendorKey":Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/util/jar/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getTrimmedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 661
    .local v4, "specVendor":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v16, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->SPECIFICATION_VERSION:Ljava/util/jar/Attributes$Name;

    move-object/from16 v0, v16

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    .line 662
    .local v15, "specVersionKey":Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/util/jar/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getTrimmedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 665
    .local v3, "specVersion":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v16, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->IMPLEMENTATION_VERSION:Ljava/util/jar/Attributes$Name;

    move-object/from16 v0, v16

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    .line 666
    .local v12, "impVersionKey":Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/util/jar/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getTrimmedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 668
    .local v5, "impVersion":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v16, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->IMPLEMENTATION_VENDOR:Ljava/util/jar/Attributes$Name;

    move-object/from16 v0, v16

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    .line 669
    .local v11, "impVendorKey":Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Ljava/util/jar/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getTrimmedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 671
    .local v6, "impVendor":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v16, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->IMPLEMENTATION_VENDOR_ID:Ljava/util/jar/Attributes$Name;

    move-object/from16 v0, v16

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    .line 672
    .local v10, "impVendorIDKey":Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Ljava/util/jar/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getTrimmedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 674
    .local v7, "impVendorId":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v16, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->IMPLEMENTATION_URL:Ljava/util/jar/Attributes$Name;

    move-object/from16 v0, v16

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    .line 675
    .local v9, "impURLKey":Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Ljava/util/jar/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getTrimmedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 677
    .local v8, "impURL":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    invoke-direct/range {v1 .. v8}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private static getExtension(Ljava/util/jar/Attributes;Ljava/util/ArrayList;Ljava/util/jar/Attributes$Name;)V
    .locals 7
    .param p0, "attributes"    # Ljava/util/jar/Attributes;
    .param p1, "required"    # Ljava/util/ArrayList;
    .param p2, "listKey"    # Ljava/util/jar/Attributes$Name;

    .prologue
    .line 600
    invoke-virtual {p0, p2}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v3

    .line 601
    .local v3, "names":Ljava/lang/String;
    if-nez v3, :cond_1

    .line 614
    :cond_0
    return-void

    .line 605
    :cond_1
    const-string/jumbo v5, " "

    invoke-static {v3, v5}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 606
    .local v1, "extentions":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v5, v1

    if-ge v2, v5, :cond_0

    .line 607
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    aget-object v6, v1, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 608
    .local v4, "prefix":Ljava/lang/String;
    invoke-static {v4, p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getExtension(Ljava/lang/String;Ljava/util/jar/Attributes;)Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v0

    .line 610
    .local v0, "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    if-eqz v0, :cond_2

    .line 611
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 606
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private static getListed(Ljava/util/jar/Manifest;Ljava/util/jar/Attributes$Name;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .locals 7
    .param p0, "manifest"    # Ljava/util/jar/Manifest;
    .param p1, "listKey"    # Ljava/util/jar/Attributes$Name;

    .prologue
    .line 570
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 571
    .local v5, "results":Ljava/util/ArrayList;
    invoke-virtual {p0}, Ljava/util/jar/Manifest;->getMainAttributes()Ljava/util/jar/Attributes;

    move-result-object v4

    .line 573
    .local v4, "mainAttributes":Ljava/util/jar/Attributes;
    if-eqz v4, :cond_0

    .line 574
    invoke-static {v4, v5, p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getExtension(Ljava/util/jar/Attributes;Ljava/util/ArrayList;Ljava/util/jar/Attributes$Name;)V

    .line 577
    :cond_0
    invoke-virtual {p0}, Ljava/util/jar/Manifest;->getEntries()Ljava/util/Map;

    move-result-object v1

    .line 578
    .local v1, "entries":Ljava/util/Map;
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 579
    .local v3, "keys":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 580
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 581
    .local v2, "key":Ljava/lang/String;
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/jar/Attributes;

    .line 582
    .local v0, "attributes":Ljava/util/jar/Attributes;
    invoke-static {v0, v5, p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getExtension(Ljava/util/jar/Attributes;Ljava/util/ArrayList;Ljava/util/jar/Attributes$Name;)V

    goto :goto_0

    .line 585
    .end local v0    # "attributes":Ljava/util/jar/Attributes;
    .end local v2    # "key":Ljava/lang/String;
    :cond_1
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v6, v6, [Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    return-object v6
.end method

.method public static getOptions(Ljava/util/jar/Manifest;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .locals 1
    .param p0, "manifest"    # Ljava/util/jar/Manifest;

    .prologue
    .line 239
    sget-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->OPTIONAL_EXTENSION_LIST:Ljava/util/jar/Attributes$Name;

    invoke-static {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getListed(Ljava/util/jar/Manifest;Ljava/util/jar/Attributes$Name;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v0

    return-object v0
.end method

.method public static getRequired(Ljava/util/jar/Manifest;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .locals 1
    .param p0, "manifest"    # Ljava/util/jar/Manifest;

    .prologue
    .line 227
    sget-object v0, Ljava/util/jar/Attributes$Name;->EXTENSION_LIST:Ljava/util/jar/Attributes$Name;

    invoke-static {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getListed(Ljava/util/jar/Manifest;Ljava/util/jar/Attributes$Name;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v0

    return-object v0
.end method

.method private static getTrimmedString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 688
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
    .line 556
    invoke-virtual {p1, p2}, Lorg/apache/tools/ant/util/DeweyDecimal;->isGreaterThanOrEqual(Lorg/apache/tools/ant/util/DeweyDecimal;)Z

    move-result v0

    return v0
.end method

.method private static split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 4
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "onToken"    # Ljava/lang/String;

    .prologue
    .line 625
    new-instance v2, Ljava/util/StringTokenizer;

    invoke-direct {v2, p0, p1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 626
    .local v2, "tokenizer":Ljava/util/StringTokenizer;
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v3

    new-array v1, v3, [Ljava/lang/String;

    .line 628
    .local v1, "result":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v1

    if-ge v0, v3, :cond_0

    .line 629
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v0

    .line 628
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 632
    :cond_0
    return-object v1
.end method


# virtual methods
.method public getCompatibilityWith(Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;)Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;
    .locals 5
    .param p1, "required"    # Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    .prologue
    .line 437
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->extensionName:Ljava/lang/String;

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getExtensionName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 438
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->INCOMPATIBLE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    .line 472
    :goto_0
    return-object v3

    .line 442
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getSpecificationVersion()Lorg/apache/tools/ant/util/DeweyDecimal;

    move-result-object v2

    .line 444
    .local v2, "requiredSpecificationVersion":Lorg/apache/tools/ant/util/DeweyDecimal;
    if-eqz v2, :cond_2

    .line 445
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->specificationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->specificationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    invoke-direct {p0, v3, v2}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->isCompatible(Lorg/apache/tools/ant/util/DeweyDecimal;Lorg/apache/tools/ant/util/DeweyDecimal;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 447
    :cond_1
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->REQUIRE_SPECIFICATION_UPGRADE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    goto :goto_0

    .line 452
    :cond_2
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getImplementationVendorID()Ljava/lang/String;

    move-result-object v0

    .line 454
    .local v0, "requiredImplementationVendorID":Ljava/lang/String;
    if-eqz v0, :cond_4

    .line 455
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationVendorID:Ljava/lang/String;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationVendorID:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 457
    :cond_3
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->REQUIRE_VENDOR_SWITCH:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    goto :goto_0

    .line 462
    :cond_4
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getImplementationVersion()Lorg/apache/tools/ant/util/DeweyDecimal;

    move-result-object v1

    .line 464
    .local v1, "requiredImplementationVersion":Lorg/apache/tools/ant/util/DeweyDecimal;
    if-eqz v1, :cond_6

    .line 465
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    invoke-direct {p0, v3, v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->isCompatible(Lorg/apache/tools/ant/util/DeweyDecimal;Lorg/apache/tools/ant/util/DeweyDecimal;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 467
    :cond_5
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->REQUIRE_IMPLEMENTATION_UPGRADE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    goto :goto_0

    .line 472
    :cond_6
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->COMPATIBLE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    goto :goto_0
.end method

.method public getExtensionName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 370
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->extensionName:Ljava/lang/String;

    return-object v0
.end method

.method public getImplementationURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 397
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationURL:Ljava/lang/String;

    return-object v0
.end method

.method public getImplementationVendor()Ljava/lang/String;
    .locals 1

    .prologue
    .line 406
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationVendor:Ljava/lang/String;

    return-object v0
.end method

.method public getImplementationVendorID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 415
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationVendorID:Ljava/lang/String;

    return-object v0
.end method

.method public getImplementationVersion()Lorg/apache/tools/ant/util/DeweyDecimal;
    .locals 1

    .prologue
    .line 424
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    return-object v0
.end method

.method public getSpecificationVendor()Ljava/lang/String;
    .locals 1

    .prologue
    .line 379
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->specificationVendor:Ljava/lang/String;

    return-object v0
.end method

.method public getSpecificationVersion()Lorg/apache/tools/ant/util/DeweyDecimal;
    .locals 1

    .prologue
    .line 388
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->specificationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    return-object v0
.end method

.method public isCompatibleWith(Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;)Z
    .locals 2
    .param p1, "required"    # Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    .prologue
    .line 486
    sget-object v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->COMPATIBLE:Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getCompatibilityWith(Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;)Lorg/apache/tools/ant/taskdefs/optional/extension/Compatibility;

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
    .line 495
    const-string/jumbo v0, ": "

    .line 497
    .local v0, "brace":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuffer;

    sget-object v2, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->EXTENSION_NAME:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v2}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 498
    .local v1, "sb":Ljava/lang/StringBuffer;
    const-string/jumbo v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 499
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->extensionName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 500
    sget-object v2, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 502
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->specificationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    if-eqz v2, :cond_0

    .line 503
    sget-object v2, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->SPECIFICATION_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 504
    const-string/jumbo v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 505
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->specificationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 506
    sget-object v2, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 509
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->specificationVendor:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 510
    sget-object v2, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->SPECIFICATION_VENDOR:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 511
    const-string/jumbo v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 512
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->specificationVendor:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 513
    sget-object v2, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 516
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    if-eqz v2, :cond_2

    .line 517
    sget-object v2, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->IMPLEMENTATION_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 518
    const-string/jumbo v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 519
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 520
    sget-object v2, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 523
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationVendorID:Ljava/lang/String;

    if-eqz v2, :cond_3

    .line 524
    sget-object v2, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->IMPLEMENTATION_VENDOR_ID:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 525
    const-string/jumbo v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 526
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationVendorID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 527
    sget-object v2, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 530
    :cond_3
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationVendor:Ljava/lang/String;

    if-eqz v2, :cond_4

    .line 531
    sget-object v2, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->IMPLEMENTATION_VENDOR:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 532
    const-string/jumbo v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 533
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationVendor:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 534
    sget-object v2, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 537
    :cond_4
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationURL:Ljava/lang/String;

    if-eqz v2, :cond_5

    .line 538
    sget-object v2, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->IMPLEMENTATION_URL:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 539
    const-string/jumbo v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 540
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->implementationURL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 541
    sget-object v2, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 544
    :cond_5
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
