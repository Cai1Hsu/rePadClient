.class Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;
.super Ljava/lang/Object;
.source "IPlanetEjbc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Classname"
.end annotation


# instance fields
.field private className:Ljava/lang/String;

.field private packageName:Ljava/lang/String;

.field private qualifiedName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "qualifiedName"    # Ljava/lang/String;

    .prologue
    .line 1365
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1366
    if-nez p1, :cond_0

    .line 1380
    :goto_0
    return-void

    .line 1370
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->qualifiedName:Ljava/lang/String;

    .line 1372
    const/16 v1, 0x2e

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 1373
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 1374
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->className:Ljava/lang/String;

    .line 1375
    const-string/jumbo v1, ""

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->packageName:Ljava/lang/String;

    goto :goto_0

    .line 1377
    :cond_1
    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->packageName:Ljava/lang/String;

    .line 1378
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->className:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method public getClassFile(Ljava/io/File;)Ljava/io/File;
    .locals 5
    .param p1, "directory"    # Ljava/io/File;

    .prologue
    .line 1431
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->qualifiedName:Ljava/lang/String;

    const/16 v3, 0x2e

    sget-char v4, Ljava/io/File;->separatorChar:C

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ".class"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1433
    .local v0, "pathToFile":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1406
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->className:Ljava/lang/String;

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1397
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->packageName:Ljava/lang/String;

    return-object v0
.end method

.method public getQualifiedClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1388
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->qualifiedName:Ljava/lang/String;

    return-object v0
.end method

.method public getQualifiedWithUnderscores()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1419
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->qualifiedName:Ljava/lang/String;

    const/16 v1, 0x2e

    const/16 v2, 0x5f

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1443
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getQualifiedClassName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
