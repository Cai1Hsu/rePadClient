.class public interface abstract Lorg/apache/tools/ant/util/Tokenizer;
.super Ljava/lang/Object;
.source "Tokenizer.java"


# virtual methods
.method public abstract getPostToken()Ljava/lang/String;
.end method

.method public abstract getToken(Ljava/io/Reader;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
