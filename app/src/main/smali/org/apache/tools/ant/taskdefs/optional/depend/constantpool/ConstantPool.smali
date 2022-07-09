.class public Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;
.super Ljava/lang/Object;
.source "ConstantPool.java"


# instance fields
.field private entries:Ljava/util/Vector;

.field private utf8Indexes:Ljava/util/Hashtable;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    .line 51
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 53
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->utf8Indexes:Ljava/util/Hashtable;

    .line 54
    return-void
.end method


# virtual methods
.method public addEntry(Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;)I
    .locals 7
    .param p1, "entry"    # Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;

    .prologue
    .line 93
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v0

    .line 95
    .local v0, "index":I
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    invoke-virtual {v4, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 97
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;->getNumEntries()I

    move-result v2

    .line 100
    .local v2, "numSlots":I
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    add-int/lit8 v4, v2, -0x1

    if-ge v1, v4, :cond_0

    .line 101
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 100
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 104
    :cond_0
    instance-of v4, p1, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/Utf8CPInfo;

    if-eqz v4, :cond_1

    move-object v3, p1

    .line 105
    check-cast v3, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/Utf8CPInfo;

    .line 107
    .local v3, "utf8Info":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/Utf8CPInfo;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->utf8Indexes:Ljava/util/Hashtable;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/Utf8CPInfo;->getValue()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/Integer;

    invoke-direct {v6, v0}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v4, v5, v6}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .end local v3    # "utf8Info":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/Utf8CPInfo;
    :cond_1
    return v0
.end method

.method public getClassEntry(Ljava/lang/String;)I
    .locals 6
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 166
    const/4 v3, -0x1

    .line 168
    .local v3, "index":I
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v4

    .line 169
    .local v4, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v4, :cond_1

    const/4 v5, -0x1

    if-ne v3, v5, :cond_1

    .line 170
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    invoke-virtual {v5, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    .line 172
    .local v1, "element":Ljava/lang/Object;
    instance-of v5, v1, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo;

    if-eqz v5, :cond_0

    move-object v0, v1

    .line 173
    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo;

    .line 175
    .local v0, "classinfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo;->getClassName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 176
    move v3, v2

    .line 169
    .end local v0    # "classinfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 181
    .end local v1    # "element":Ljava/lang/Object;
    :cond_1
    return v3
.end method

.method public getConstantEntry(Ljava/lang/Object;)I
    .locals 6
    .param p1, "constantValue"    # Ljava/lang/Object;

    .prologue
    .line 193
    const/4 v3, -0x1

    .line 195
    .local v3, "index":I
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v4

    .line 196
    .local v4, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v4, :cond_1

    const/4 v5, -0x1

    if-ne v3, v5, :cond_1

    .line 197
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    invoke-virtual {v5, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    .line 199
    .local v1, "element":Ljava/lang/Object;
    instance-of v5, v1, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantCPInfo;

    if-eqz v5, :cond_0

    move-object v0, v1

    .line 200
    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantCPInfo;

    .line 202
    .local v0, "constantEntry":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantCPInfo;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantCPInfo;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 203
    move v3, v2

    .line 196
    .end local v0    # "constantEntry":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantCPInfo;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 208
    .end local v1    # "element":Ljava/lang/Object;
    :cond_1
    return v3
.end method

.method public getEntry(I)Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 136
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;

    return-object v0
.end method

.method public getFieldRefEntry(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 6
    .param p1, "fieldClassName"    # Ljava/lang/String;
    .param p2, "fieldName"    # Ljava/lang/String;
    .param p3, "fieldType"    # Ljava/lang/String;

    .prologue
    .line 296
    const/4 v3, -0x1

    .line 298
    .local v3, "index":I
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v4

    .line 299
    .local v4, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v4, :cond_1

    const/4 v5, -0x1

    if-ne v3, v5, :cond_1

    .line 300
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    invoke-virtual {v5, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    .line 302
    .local v0, "element":Ljava/lang/Object;
    instance-of v5, v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/FieldRefCPInfo;

    if-eqz v5, :cond_0

    move-object v1, v0

    .line 303
    check-cast v1, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/FieldRefCPInfo;

    .line 305
    .local v1, "fieldRefEntry":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/FieldRefCPInfo;
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/FieldRefCPInfo;->getFieldClassName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/FieldRefCPInfo;->getFieldName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/FieldRefCPInfo;->getFieldType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 308
    move v3, v2

    .line 299
    .end local v1    # "fieldRefEntry":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/FieldRefCPInfo;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 313
    .end local v0    # "element":Ljava/lang/Object;
    :cond_1
    return v3
.end method

.method public getInterfaceMethodRefEntry(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 6
    .param p1, "interfaceMethodClassName"    # Ljava/lang/String;
    .param p2, "interfaceMethodName"    # Ljava/lang/String;
    .param p3, "interfaceMethodType"    # Ljava/lang/String;

    .prologue
    .line 259
    const/4 v2, -0x1

    .line 261
    .local v2, "index":I
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v4

    .line 262
    .local v4, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v4, :cond_1

    const/4 v5, -0x1

    if-ne v2, v5, :cond_1

    .line 263
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    invoke-virtual {v5, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    .line 265
    .local v0, "element":Ljava/lang/Object;
    instance-of v5, v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;

    if-eqz v5, :cond_0

    move-object v3, v0

    .line 266
    check-cast v3, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;

    .line 269
    .local v3, "interfaceMethodRefEntry":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;->getInterfaceMethodClassName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;->getInterfaceMethodName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;->getInterfaceMethodType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 275
    move v2, v1

    .line 262
    .end local v3    # "interfaceMethodRefEntry":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 280
    .end local v0    # "element":Ljava/lang/Object;
    :cond_1
    return v2
.end method

.method public getMethodRefEntry(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 6
    .param p1, "methodClassName"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "methodType"    # Ljava/lang/String;

    .prologue
    .line 224
    const/4 v2, -0x1

    .line 226
    .local v2, "index":I
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v4

    .line 227
    .local v4, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v4, :cond_1

    const/4 v5, -0x1

    if-ne v2, v5, :cond_1

    .line 228
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    invoke-virtual {v5, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    .line 230
    .local v0, "element":Ljava/lang/Object;
    instance-of v5, v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/MethodRefCPInfo;

    if-eqz v5, :cond_0

    move-object v3, v0

    .line 231
    check-cast v3, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/MethodRefCPInfo;

    .line 233
    .local v3, "methodRefEntry":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/MethodRefCPInfo;
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/MethodRefCPInfo;->getMethodClassName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/MethodRefCPInfo;->getMethodName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/MethodRefCPInfo;->getMethodType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 236
    move v2, v1

    .line 227
    .end local v3    # "methodRefEntry":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/MethodRefCPInfo;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 241
    .end local v0    # "element":Ljava/lang/Object;
    :cond_1
    return v2
.end method

.method public getNameAndTypeEntry(Ljava/lang/String;Ljava/lang/String;)I
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 326
    const/4 v2, -0x1

    .line 328
    .local v2, "index":I
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v4

    .line 329
    .local v4, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v4, :cond_1

    const/4 v5, -0x1

    if-ne v2, v5, :cond_1

    .line 330
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    invoke-virtual {v5, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    .line 332
    .local v0, "element":Ljava/lang/Object;
    instance-of v5, v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/NameAndTypeCPInfo;

    if-eqz v5, :cond_0

    move-object v3, v0

    .line 333
    check-cast v3, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/NameAndTypeCPInfo;

    .line 336
    .local v3, "nameAndTypeEntry":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/NameAndTypeCPInfo;
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/NameAndTypeCPInfo;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/NameAndTypeCPInfo;->getType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 338
    move v2, v1

    .line 329
    .end local v3    # "nameAndTypeEntry":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/NameAndTypeCPInfo;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 343
    .end local v0    # "element":Ljava/lang/Object;
    :cond_1
    return v2
.end method

.method public getUTF8Entry(Ljava/lang/String;)I
    .locals 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 147
    const/4 v0, -0x1

    .line 148
    .local v0, "index":I
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->utf8Indexes:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 150
    .local v1, "indexInteger":Ljava/lang/Integer;
    if-eqz v1, :cond_0

    .line 151
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 154
    :cond_0
    return v0
.end method

.method public read(Ljava/io/DataInputStream;)V
    .locals 4
    .param p1, "classStream"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v2

    .line 66
    .local v2, "numEntries":I
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    if-ge v0, v2, :cond_0

    .line 67
    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;->readEntry(Ljava/io/DataInputStream;)Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;

    move-result-object v1

    .line 70
    .local v1, "nextEntry":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;->getNumEntries()I

    move-result v3

    add-int/2addr v0, v3

    .line 72
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->addEntry(Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;)I

    goto :goto_0

    .line 74
    .end local v1    # "nextEntry":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    :cond_0
    return-void
.end method

.method public resolve()V
    .locals 3

    .prologue
    .line 119
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "i":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 120
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;

    .line 122
    .local v1, "poolInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;->isResolved()Z

    move-result v2

    if-nez v2, :cond_0

    .line 123
    invoke-virtual {v1, p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;->resolve(Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;)V

    goto :goto_0

    .line 126
    .end local v1    # "poolInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    :cond_1
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 352
    new-instance v1, Ljava/lang/StringBuffer;

    const-string/jumbo v3, "\n"

    invoke-direct {v1, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 353
    .local v1, "sb":Ljava/lang/StringBuffer;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->entries:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v2

    .line 355
    .local v2, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v2, :cond_0

    .line 356
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "] = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;->getEntry(I)Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 355
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 359
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
