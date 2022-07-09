.class public Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/StringCPInfo;
.super Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantCPInfo;
.source "StringCPInfo.java"


# instance fields
.field private index:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 32
    const/16 v0, 0x8

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantCPInfo;-><init>(II)V

    .line 33
    return-void
.end method


# virtual methods
.method public read(Ljava/io/DataInputStream;)V
    .locals 1
    .param p1, "cpStream"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/StringCPInfo;->index:I

    .line 46
    const-string/jumbo v0, "unresolved"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/StringCPInfo;->setValue(Ljava/lang/Object;)V

    .line 47
    return-void
.end method

.method public resolve(Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;)V
    .locals 1
    .param p1, "constantPool"    # Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;

    .prologue
    .line 67
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/StringCPInfo;->index:I

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->getEntry(I)Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/Utf8CPInfo;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/Utf8CPInfo;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/StringCPInfo;->setValue(Ljava/lang/Object;)V

    .line 68
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantCPInfo;->resolve(Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;)V

    .line 69
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 55
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "String Constant Pool Entry for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/StringCPInfo;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget v1, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/StringCPInfo;->index:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
