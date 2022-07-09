.class public Lorg/apache/tools/ant/types/Mapper$MapperType;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "Mapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/Mapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MapperType"
.end annotation


# instance fields
.field private implementations:Ljava/util/Properties;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 288
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 289
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/Mapper$MapperType;->implementations:Ljava/util/Properties;

    .line 290
    iget-object v0, p0, Lorg/apache/tools/ant/types/Mapper$MapperType;->implementations:Ljava/util/Properties;

    const-string/jumbo v1, "identity"

    const-string/jumbo v2, "org.apache.tools.ant.util.IdentityMapper"

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    iget-object v0, p0, Lorg/apache/tools/ant/types/Mapper$MapperType;->implementations:Ljava/util/Properties;

    const-string/jumbo v1, "flatten"

    const-string/jumbo v2, "org.apache.tools.ant.util.FlatFileNameMapper"

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    iget-object v0, p0, Lorg/apache/tools/ant/types/Mapper$MapperType;->implementations:Ljava/util/Properties;

    const-string/jumbo v1, "glob"

    const-string/jumbo v2, "org.apache.tools.ant.util.GlobPatternMapper"

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    iget-object v0, p0, Lorg/apache/tools/ant/types/Mapper$MapperType;->implementations:Ljava/util/Properties;

    const-string/jumbo v1, "merge"

    const-string/jumbo v2, "org.apache.tools.ant.util.MergingMapper"

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    iget-object v0, p0, Lorg/apache/tools/ant/types/Mapper$MapperType;->implementations:Ljava/util/Properties;

    const-string/jumbo v1, "regexp"

    const-string/jumbo v2, "org.apache.tools.ant.util.RegexpPatternMapper"

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    iget-object v0, p0, Lorg/apache/tools/ant/types/Mapper$MapperType;->implementations:Ljava/util/Properties;

    const-string/jumbo v1, "package"

    const-string/jumbo v2, "org.apache.tools.ant.util.PackageNameMapper"

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    iget-object v0, p0, Lorg/apache/tools/ant/types/Mapper$MapperType;->implementations:Ljava/util/Properties;

    const-string/jumbo v1, "unpackage"

    const-string/jumbo v2, "org.apache.tools.ant.util.UnPackageNameMapper"

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    return-void
.end method


# virtual methods
.method public getImplementation()Ljava/lang/String;
    .locals 2

    .prologue
    .line 318
    iget-object v0, p0, Lorg/apache/tools/ant/types/Mapper$MapperType;->implementations:Ljava/util/Properties;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper$MapperType;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValues()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 310
    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "identity"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "flatten"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "glob"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "merge"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "regexp"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "package"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "unpackage"

    aput-object v2, v0, v1

    return-object v0
.end method
