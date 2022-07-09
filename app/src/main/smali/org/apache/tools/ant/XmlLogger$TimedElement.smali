.class Lorg/apache/tools/ant/XmlLogger$TimedElement;
.super Ljava/lang/Object;
.source "XmlLogger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/XmlLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TimedElement"
.end annotation


# instance fields
.field private element:Lorg/w3c/dom/Element;

.field private startTime:J


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/XmlLogger$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/XmlLogger$1;

    .prologue
    .line 126
    invoke-direct {p0}, Lorg/apache/tools/ant/XmlLogger$TimedElement;-><init>()V

    return-void
.end method

.method static access$100(Lorg/apache/tools/ant/XmlLogger$TimedElement;)J
    .locals 2
    .param p0, "x0"    # Lorg/apache/tools/ant/XmlLogger$TimedElement;

    .prologue
    .line 126
    iget-wide v0, p0, Lorg/apache/tools/ant/XmlLogger$TimedElement;->startTime:J

    return-wide v0
.end method

.method static access$102(Lorg/apache/tools/ant/XmlLogger$TimedElement;J)J
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/XmlLogger$TimedElement;
    .param p1, "x1"    # J

    .prologue
    .line 126
    iput-wide p1, p0, Lorg/apache/tools/ant/XmlLogger$TimedElement;->startTime:J

    return-wide p1
.end method

.method static access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/XmlLogger$TimedElement;

    .prologue
    .line 126
    iget-object v0, p0, Lorg/apache/tools/ant/XmlLogger$TimedElement;->element:Lorg/w3c/dom/Element;

    return-object v0
.end method

.method static access$202(Lorg/apache/tools/ant/XmlLogger$TimedElement;Lorg/w3c/dom/Element;)Lorg/w3c/dom/Element;
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/XmlLogger$TimedElement;
    .param p1, "x1"    # Lorg/w3c/dom/Element;

    .prologue
    .line 126
    iput-object p1, p0, Lorg/apache/tools/ant/XmlLogger$TimedElement;->element:Lorg/w3c/dom/Element;

    return-object p1
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 135
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/XmlLogger$TimedElement;->element:Lorg/w3c/dom/Element;

    invoke-interface {v1}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/XmlLogger$TimedElement;->element:Lorg/w3c/dom/Element;

    const-string/jumbo v2, "name"

    invoke-interface {v1, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
