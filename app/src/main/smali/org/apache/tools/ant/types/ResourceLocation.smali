.class public Lorg/apache/tools/ant/types/ResourceLocation;
.super Ljava/lang/Object;
.source "ResourceLocation.java"


# instance fields
.field private base:Ljava/net/URL;

.field private location:Ljava/lang/String;

.field private publicId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object v0, p0, Lorg/apache/tools/ant/types/ResourceLocation;->publicId:Ljava/lang/String;

    .line 47
    iput-object v0, p0, Lorg/apache/tools/ant/types/ResourceLocation;->location:Ljava/lang/String;

    .line 56
    iput-object v0, p0, Lorg/apache/tools/ant/types/ResourceLocation;->base:Ljava/net/URL;

    return-void
.end method


# virtual methods
.method public getBase()Ljava/net/URL;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lorg/apache/tools/ant/types/ResourceLocation;->base:Ljava/net/URL;

    return-object v0
.end method

.method public getLocation()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lorg/apache/tools/ant/types/ResourceLocation;->location:Ljava/lang/String;

    return-object v0
.end method

.method public getPublicId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lorg/apache/tools/ant/types/ResourceLocation;->publicId:Ljava/lang/String;

    return-object v0
.end method

.method public setBase(Ljava/net/URL;)V
    .locals 0
    .param p1, "base"    # Ljava/net/URL;

    .prologue
    .line 82
    iput-object p1, p0, Lorg/apache/tools/ant/types/ResourceLocation;->base:Ljava/net/URL;

    .line 83
    return-void
.end method

.method public setLocation(Ljava/lang/String;)V
    .locals 0
    .param p1, "location"    # Ljava/lang/String;

    .prologue
    .line 72
    iput-object p1, p0, Lorg/apache/tools/ant/types/ResourceLocation;->location:Ljava/lang/String;

    .line 73
    return-void
.end method

.method public setPublicId(Ljava/lang/String;)V
    .locals 0
    .param p1, "publicId"    # Ljava/lang/String;

    .prologue
    .line 64
    iput-object p1, p0, Lorg/apache/tools/ant/types/ResourceLocation;->publicId:Ljava/lang/String;

    .line 65
    return-void
.end method
