.class public Lorg/apache/tools/ant/types/PropertySet$BuiltinPropertySetName;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "PropertySet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/PropertySet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BuiltinPropertySetName"
.end annotation


# static fields
.field static final ALL:Ljava/lang/String; = "all"

.field static final COMMANDLINE:Ljava/lang/String; = "commandline"

.field static final SYSTEM:Ljava/lang/String; = "system"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 464
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    return-void
.end method


# virtual methods
.method public getValues()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 470
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "all"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "system"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "commandline"

    aput-object v2, v0, v1

    return-object v0
.end method
