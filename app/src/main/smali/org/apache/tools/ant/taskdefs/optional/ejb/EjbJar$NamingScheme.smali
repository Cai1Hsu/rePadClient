.class public Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "EjbJar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NamingScheme"
.end annotation


# static fields
.field public static final BASEJARNAME:Ljava/lang/String; = "basejarname"

.field public static final DESCRIPTOR:Ljava/lang/String; = "descriptor"

.field public static final DIRECTORY:Ljava/lang/String; = "directory"

.field public static final EJB_NAME:Ljava/lang/String; = "ejb-name"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 133
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    return-void
.end method


# virtual methods
.method public getValues()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 164
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "ejb-name"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "directory"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "descriptor"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "basejarname"

    aput-object v2, v0, v1

    return-object v0
.end method
