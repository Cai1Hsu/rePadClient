.class public Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;
.super Ljava/lang/Object;
.source "ClassFile.java"


# static fields
.field private static final CLASS_MAGIC:I = -0x35014542


# instance fields
.field private className:Ljava/lang/String;

.field private constantPool:Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getClassRefs()Ljava/util/Vector;
    .locals 7

    .prologue
    .line 91
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    .line 93
    .local v1, "classRefs":Ljava/util/Vector;
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;->constantPool:Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;

    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->size()I

    move-result v4

    .line 94
    .local v4, "size":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v4, :cond_1

    .line 95
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;->constantPool:Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;

    invoke-virtual {v5, v3}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->getEntry(I)Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;

    move-result-object v2

    .line 97
    .local v2, "entry":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;->getTag()I

    move-result v5

    const/4 v6, 0x7

    if-ne v5, v6, :cond_0

    move-object v0, v2

    .line 99
    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo;

    .line 101
    .local v0, "classEntry":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo;->getClassName()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;->className:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 102
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo;->getClassName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFileUtils;->convertSlashName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 94
    .end local v0    # "classEntry":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 108
    .end local v2    # "entry":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    :cond_1
    return-object v1
.end method

.method public getFullClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;->className:Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFileUtils;->convertSlashName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public read(Ljava/io/InputStream;)V
    .locals 5
    .param p1, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassFormatError;
        }
    .end annotation

    .prologue
    .line 58
    new-instance v1, Ljava/io/DataInputStream;

    invoke-direct {v1, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 60
    .local v1, "classStream":Ljava/io/DataInputStream;
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v3

    const v4, -0x35014542    # -8346975.0f

    if-eq v3, v4, :cond_0

    .line 61
    new-instance v3, Ljava/lang/ClassFormatError;

    const-string/jumbo v4, "No Magic Code Found - probably not a Java class file."

    invoke-direct {v3, v4}, Ljava/lang/ClassFormatError;-><init>(Ljava/lang/String;)V

    throw v3

    .line 66
    :cond_0
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    .line 67
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    .line 70
    new-instance v3, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;

    invoke-direct {v3}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;-><init>()V

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;->constantPool:Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;

    .line 72
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;->constantPool:Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;

    invoke-virtual {v3, v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->read(Ljava/io/DataInputStream;)V

    .line 73
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;->constantPool:Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->resolve()V

    .line 75
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    .line 76
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v2

    .line 77
    .local v2, "thisClassIndex":I
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    .line 78
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;->constantPool:Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;

    invoke-virtual {v3, v2}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->getEntry(I)Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo;

    .line 80
    .local v0, "classInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo;->getClassName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;->className:Ljava/lang/String;

    .line 81
    return-void
.end method
