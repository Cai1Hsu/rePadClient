.class public Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;
.super Ljava/lang/Object;
.source "DOMElementWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/util/DOMElementWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "XmlNamespacePolicy"
.end annotation


# static fields
.field public static final IGNORE:Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

.field public static final ONLY_QUALIFY_ELEMENTS:Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

.field public static final QUALIFY_ALL:Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;


# instance fields
.field private qualifyAttributes:Z

.field private qualifyElements:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 93
    new-instance v0, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    invoke-direct {v0, v1, v1}, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;-><init>(ZZ)V

    sput-object v0, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;->IGNORE:Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    .line 99
    new-instance v0, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    invoke-direct {v0, v2, v1}, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;-><init>(ZZ)V

    sput-object v0, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;->ONLY_QUALIFY_ELEMENTS:Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    .line 105
    new-instance v0, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    invoke-direct {v0, v2, v2}, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;-><init>(ZZ)V

    sput-object v0, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;->QUALIFY_ALL:Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    return-void
.end method

.method public constructor <init>(ZZ)V
    .locals 0
    .param p1, "qualifyElements"    # Z
    .param p2, "qualifyAttributes"    # Z

    .prologue
    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    iput-boolean p1, p0, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;->qualifyElements:Z

    .line 115
    iput-boolean p2, p0, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;->qualifyAttributes:Z

    .line 116
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    .prologue
    .line 86
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;->qualifyElements:Z

    return v0
.end method

.method static access$100(Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    .prologue
    .line 86
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;->qualifyAttributes:Z

    return v0
.end method
