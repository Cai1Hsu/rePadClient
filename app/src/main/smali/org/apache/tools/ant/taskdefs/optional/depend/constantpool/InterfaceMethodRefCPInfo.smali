.class public Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;
.super Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
.source "InterfaceMethodRefCPInfo.java"


# instance fields
.field private classIndex:I

.field private interfaceMethodClassName:Ljava/lang/String;

.field private interfaceMethodName:Ljava/lang/String;

.field private interfaceMethodType:Ljava/lang/String;

.field private nameAndTypeIndex:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 47
    const/16 v0, 0xb

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;-><init>(II)V

    .line 48
    return-void
.end method


# virtual methods
.method public getInterfaceMethodClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;->interfaceMethodClassName:Ljava/lang/String;

    return-object v0
.end method

.method public getInterfaceMethodName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;->interfaceMethodName:Ljava/lang/String;

    return-object v0
.end method

.method public getInterfaceMethodType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;->interfaceMethodType:Ljava/lang/String;

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
    .line 59
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;->classIndex:I

    .line 60
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;->nameAndTypeIndex:I

    .line 61
    return-void
.end method

.method public resolve(Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;)V
    .locals 3
    .param p1, "constantPool"    # Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;

    .prologue
    .line 71
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;->classIndex:I

    invoke-virtual {p1, v2}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->getEntry(I)Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo;

    .line 74
    .local v0, "interfaceMethodClass":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo;->resolve(Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;)V

    .line 76
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo;->getClassName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;->interfaceMethodClassName:Ljava/lang/String;

    .line 78
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;->nameAndTypeIndex:I

    invoke-virtual {p1, v2}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->getEntry(I)Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/NameAndTypeCPInfo;

    .line 81
    .local v1, "nt":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/NameAndTypeCPInfo;
    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/NameAndTypeCPInfo;->resolve(Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;)V

    .line 83
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/NameAndTypeCPInfo;->getName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;->interfaceMethodName:Ljava/lang/String;

    .line 84
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/NameAndTypeCPInfo;->getType()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;->interfaceMethodType:Ljava/lang/String;

    .line 86
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;->resolve(Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;)V

    .line 87
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 97
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;->isResolved()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 98
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "InterfaceMethod : Class = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;->interfaceMethodClassName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ", name = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;->interfaceMethodName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ", type = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;->interfaceMethodType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 106
    .local v0, "value":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 102
    .end local v0    # "value":Ljava/lang/String;
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "InterfaceMethod : Class index = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;->classIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ", name and type index = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;->nameAndTypeIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "value":Ljava/lang/String;
    goto :goto_0
.end method
