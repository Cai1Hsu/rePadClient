.class public Lorg/apache/tools/ant/taskdefs/optional/jlink/ClassNameReader;
.super Ljava/lang/Object;
.source "ClassNameReader.java"


# static fields
.field private static final CLASS_MAGIC_NUMBER:I = -0x35014542


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getClassName(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 8
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    new-instance v4, Ljava/io/DataInputStream;

    invoke-direct {v4, p0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 120
    .local v4, "data":Ljava/io/DataInputStream;
    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v3

    .line 121
    .local v3, "cookie":I
    const v7, -0x35014542    # -8346975.0f

    if-eq v3, v7, :cond_0

    .line 122
    const/4 v1, 0x0

    .line 133
    :goto_0
    return-object v1

    .line 124
    :cond_0
    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    .line 126
    new-instance v2, Lorg/apache/tools/ant/taskdefs/optional/jlink/ConstantPool;

    invoke-direct {v2, v4}, Lorg/apache/tools/ant/taskdefs/optional/jlink/ConstantPool;-><init>(Ljava/io/DataInput;)V

    .line 127
    .local v2, "constants":Lorg/apache/tools/ant/taskdefs/optional/jlink/ConstantPool;
    iget-object v6, v2, Lorg/apache/tools/ant/taskdefs/optional/jlink/ConstantPool;->values:[Ljava/lang/Object;

    .line 129
    .local v6, "values":[Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/io/DataInputStream;->readUnsignedShort()I

    .line 130
    invoke-virtual {v4}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    .line 131
    .local v0, "classIndex":I
    aget-object v5, v6, v0

    check-cast v5, Ljava/lang/Integer;

    .line 132
    .local v5, "stringIndex":Ljava/lang/Integer;
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v7

    aget-object v1, v6, v7

    check-cast v1, Ljava/lang/String;

    .line 133
    .local v1, "className":Ljava/lang/String;
    goto :goto_0
.end method
