.class Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;
.super Ljava/lang/Object;
.source "EjbJar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Config"
.end annotation


# instance fields
.field public analyzer:Ljava/lang/String;

.field public baseJarName:Ljava/lang/String;

.field public baseNameTerminator:Ljava/lang/String;

.field public classpath:Lorg/apache/tools/ant/types/Path;

.field public descriptorDir:Ljava/io/File;

.field public dtdLocations:Ljava/util/ArrayList;

.field public flatDestDir:Z

.field public manifest:Ljava/io/File;

.field public namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

.field public srcDir:Ljava/io/File;

.field public supportFileSets:Ljava/util/List;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    const-string/jumbo v0, "-"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->baseNameTerminator:Ljava/lang/String;

    .line 94
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->flatDestDir:Z

    .line 104
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->supportFileSets:Ljava/util/List;

    .line 109
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->dtdLocations:Ljava/util/ArrayList;

    return-void
.end method
