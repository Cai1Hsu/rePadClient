.class public Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "ParserSupports.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# static fields
.field public static final ERROR_BOTH_ATTRIBUTES:Ljava/lang/String; = "Property and feature attributes are exclusive"

.field public static final ERROR_NO_ATTRIBUTES:Ljava/lang/String; = "Neither feature or property are set"

.field public static final ERROR_NO_VALUE:Ljava/lang/String; = "A value is needed when testing for property support"

.field public static final FEATURE:Ljava/lang/String; = "feature"

.field public static final NOT_RECOGNIZED:Ljava/lang/String; = " not recognized: "

.field public static final NOT_SUPPORTED:Ljava/lang/String; = " not supported: "

.field public static final PROPERTY:Ljava/lang/String; = "property"


# instance fields
.field private feature:Ljava/lang/String;

.field private property:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    return-void
.end method

.method private getReader()Lorg/xml/sax/XMLReader;
    .locals 1

    .prologue
    .line 108
    invoke-static {}, Lorg/apache/tools/ant/util/JAXPUtils;->getParser()Lorg/xml/sax/Parser;

    .line 109
    invoke-static {}, Lorg/apache/tools/ant/util/JAXPUtils;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public eval()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->feature:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->property:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 88
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Property and feature attributes are exclusive"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 90
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->feature:Ljava/lang/String;

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->property:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 91
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Neither feature or property are set"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 94
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->feature:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 95
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->evalFeature()Z

    move-result v0

    .line 100
    :goto_0
    return v0

    .line 97
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->value:Ljava/lang/String;

    if-nez v0, :cond_3

    .line 98
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "A value is needed when testing for property support"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 100
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->evalProperty()Z

    move-result v0

    goto :goto_0
.end method

.method public evalFeature()Z
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v3, 0x0

    .line 117
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->getReader()Lorg/xml/sax/XMLReader;

    move-result-object v1

    .line 118
    .local v1, "reader":Lorg/xml/sax/XMLReader;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->value:Ljava/lang/String;

    if-nez v4, :cond_0

    .line 119
    const-string/jumbo v4, "true"

    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->value:Ljava/lang/String;

    .line 121
    :cond_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->value:Ljava/lang/String;

    invoke-static {v4}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v2

    .line 123
    .local v2, "v":Z
    :try_start_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->feature:Ljava/lang/String;

    invoke-interface {v1, v4, v2}, Lorg/xml/sax/XMLReader;->setFeature(Ljava/lang/String;Z)V
    :try_end_0
    .catch Lorg/xml/sax/SAXNotRecognizedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xml/sax/SAXNotSupportedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 131
    const/4 v3, 0x1

    :goto_0
    return v3

    .line 124
    :catch_0
    move-exception v0

    .line 125
    .local v0, "e":Lorg/xml/sax/SAXNotRecognizedException;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "feature not recognized: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->feature:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 127
    .end local v0    # "e":Lorg/xml/sax/SAXNotRecognizedException;
    :catch_1
    move-exception v0

    .line 128
    .local v0, "e":Lorg/xml/sax/SAXNotSupportedException;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "feature not supported: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->feature:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public evalProperty()Z
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v2, 0x0

    .line 139
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->getReader()Lorg/xml/sax/XMLReader;

    move-result-object v1

    .line 141
    .local v1, "reader":Lorg/xml/sax/XMLReader;
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->property:Ljava/lang/String;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->value:Ljava/lang/String;

    invoke-interface {v1, v3, v4}, Lorg/xml/sax/XMLReader;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXNotRecognizedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xml/sax/SAXNotSupportedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 149
    const/4 v2, 0x1

    :goto_0
    return v2

    .line 142
    :catch_0
    move-exception v0

    .line 143
    .local v0, "e":Lorg/xml/sax/SAXNotRecognizedException;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "property not recognized: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->property:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v5}, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 145
    .end local v0    # "e":Lorg/xml/sax/SAXNotRecognizedException;
    :catch_1
    move-exception v0

    .line 146
    .local v0, "e":Lorg/xml/sax/SAXNotSupportedException;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "property not supported: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->property:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v5}, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public setFeature(Ljava/lang/String;)V
    .locals 0
    .param p1, "feature"    # Ljava/lang/String;

    .prologue
    .line 65
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->feature:Ljava/lang/String;

    .line 66
    return-void
.end method

.method public setProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 73
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->property:Ljava/lang/String;

    .line 74
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 82
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/ParserSupports;->value:Ljava/lang/String;

    .line 83
    return-void
.end method
