.class public Lorg/apache/tools/ant/filters/StringInputStream;
.super Lorg/apache/tools/ant/util/ReaderInputStream;
.source "StringInputStream.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "source"    # Ljava/lang/String;

    .prologue
    .line 36
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/util/ReaderInputStream;-><init>(Ljava/io/Reader;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;

    .prologue
    .line 46
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Lorg/apache/tools/ant/util/ReaderInputStream;-><init>(Ljava/io/Reader;Ljava/lang/String;)V

    .line 47
    return-void
.end method
