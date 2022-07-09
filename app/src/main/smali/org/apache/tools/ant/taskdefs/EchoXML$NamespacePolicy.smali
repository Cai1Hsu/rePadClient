.class public Lorg/apache/tools/ant/taskdefs/EchoXML$NamespacePolicy;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "EchoXML.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/EchoXML;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NamespacePolicy"
.end annotation


# static fields
.field private static final ALL:Ljava/lang/String; = "all"

.field public static final DEFAULT:Lorg/apache/tools/ant/taskdefs/EchoXML$NamespacePolicy;

.field private static final ELEMENTS:Ljava/lang/String; = "elementsOnly"

.field private static final IGNORE:Ljava/lang/String; = "ignore"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 110
    new-instance v0, Lorg/apache/tools/ant/taskdefs/EchoXML$NamespacePolicy;

    const-string/jumbo v1, "ignore"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/EchoXML$NamespacePolicy;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/EchoXML$NamespacePolicy;->DEFAULT:Lorg/apache/tools/ant/taskdefs/EchoXML$NamespacePolicy;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 113
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 115
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 116
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/EchoXML$NamespacePolicy;->setValue(Ljava/lang/String;)V

    .line 117
    return-void
.end method


# virtual methods
.method public getPolicy()Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;
    .locals 4

    .prologue
    .line 124
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/EchoXML$NamespacePolicy;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 125
    .local v0, "s":Ljava/lang/String;
    const-string/jumbo v1, "ignore"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 126
    sget-object v1, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;->IGNORE:Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    .line 131
    :goto_0
    return-object v1

    .line 127
    :cond_0
    const-string/jumbo v1, "elementsOnly"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 128
    sget-object v1, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;->ONLY_QUALIFY_ELEMENTS:Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    goto :goto_0

    .line 130
    :cond_1
    const-string/jumbo v1, "all"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 131
    sget-object v1, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;->QUALIFY_ALL:Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    goto :goto_0

    .line 133
    :cond_2
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Invalid namespace policy: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getValues()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 120
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "ignore"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "elementsOnly"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "all"

    aput-object v2, v0, v1

    return-object v0
.end method
