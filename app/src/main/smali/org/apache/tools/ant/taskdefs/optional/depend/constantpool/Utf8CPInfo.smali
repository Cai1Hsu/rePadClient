.class public Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/Utf8CPInfo;
.super Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
.source "Utf8CPInfo.java"


# instance fields
.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 33
    invoke-direct {p0, v0, v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;-><init>(II)V

    .line 34
    return-void
.end method


# virtual methods
.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/Utf8CPInfo;->value:Ljava/lang/String;

    return-object v0
.end method

.method public read(Ljava/io/DataInputStream;)V
    .locals 1
    .param p1, "cpStream"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/Utf8CPInfo;->value:Ljava/lang/String;

    .line 46
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 54
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "UTF8 Value = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/Utf8CPInfo;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
