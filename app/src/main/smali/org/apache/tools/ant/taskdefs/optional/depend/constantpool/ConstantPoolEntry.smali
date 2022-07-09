.class public abstract Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
.super Ljava/lang/Object;
.source "ConstantPoolEntry.java"


# static fields
.field public static final CONSTANT_CLASS:I = 0x7

.field public static final CONSTANT_DOUBLE:I = 0x6

.field public static final CONSTANT_FIELDREF:I = 0x9

.field public static final CONSTANT_FLOAT:I = 0x4

.field public static final CONSTANT_INTEGER:I = 0x3

.field public static final CONSTANT_INTERFACEMETHODREF:I = 0xb

.field public static final CONSTANT_LONG:I = 0x5

.field public static final CONSTANT_METHODREF:I = 0xa

.field public static final CONSTANT_NAMEANDTYPE:I = 0xc

.field public static final CONSTANT_STRING:I = 0x8

.field public static final CONSTANT_UTF8:I = 0x1


# instance fields
.field private numEntries:I

.field private resolved:Z

.field private tag:I


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .param p1, "tagValue"    # I
    .param p2, "entries"    # I

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;->tag:I

    .line 91
    iput p2, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;->numEntries:I

    .line 92
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;->resolved:Z

    .line 93
    return-void
.end method

.method public static readEntry(Ljava/io/DataInputStream;)Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    .locals 5
    .param p0, "cpStream"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 109
    const/4 v0, 0x0

    .line 110
    .local v0, "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v1

    .line 112
    .local v1, "cpTag":I
    packed-switch v1, :pswitch_data_0

    .line 159
    :pswitch_0
    new-instance v2, Ljava/lang/ClassFormatError;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Invalid Constant Pool entry Type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/ClassFormatError;-><init>(Ljava/lang/String;)V

    throw v2

    .line 115
    :pswitch_1
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/Utf8CPInfo;

    .end local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/Utf8CPInfo;-><init>()V

    .line 163
    .restart local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    :goto_0
    invoke-virtual {v0, p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;->read(Ljava/io/DataInputStream;)V

    .line 165
    return-object v0

    .line 119
    :pswitch_2
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/IntegerCPInfo;

    .end local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/IntegerCPInfo;-><init>()V

    .line 121
    .restart local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    goto :goto_0

    .line 123
    :pswitch_3
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/FloatCPInfo;

    .end local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/FloatCPInfo;-><init>()V

    .line 125
    .restart local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    goto :goto_0

    .line 127
    :pswitch_4
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/LongCPInfo;

    .end local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/LongCPInfo;-><init>()V

    .line 129
    .restart local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    goto :goto_0

    .line 131
    :pswitch_5
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/DoubleCPInfo;

    .end local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/DoubleCPInfo;-><init>()V

    .line 133
    .restart local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    goto :goto_0

    .line 135
    :pswitch_6
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo;

    .end local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo;-><init>()V

    .line 137
    .restart local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    goto :goto_0

    .line 139
    :pswitch_7
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/StringCPInfo;

    .end local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/StringCPInfo;-><init>()V

    .line 141
    .restart local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    goto :goto_0

    .line 143
    :pswitch_8
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/FieldRefCPInfo;

    .end local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/FieldRefCPInfo;-><init>()V

    .line 145
    .restart local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    goto :goto_0

    .line 147
    :pswitch_9
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/MethodRefCPInfo;

    .end local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/MethodRefCPInfo;-><init>()V

    .line 149
    .restart local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    goto :goto_0

    .line 151
    :pswitch_a
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;

    .end local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo;-><init>()V

    .line 153
    .restart local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    goto :goto_0

    .line 155
    :pswitch_b
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/NameAndTypeCPInfo;

    .end local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/NameAndTypeCPInfo;-><init>()V

    .line 157
    .restart local v0    # "cpInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;
    goto :goto_0

    .line 112
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
    .end packed-switch
.end method


# virtual methods
.method public final getNumEntries()I
    .locals 1

    .prologue
    .line 217
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;->numEntries:I

    return v0
.end method

.method public getTag()I
    .locals 1

    .prologue
    .line 207
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;->tag:I

    return v0
.end method

.method public isResolved()Z
    .locals 1

    .prologue
    .line 177
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;->resolved:Z

    return v0
.end method

.method public abstract read(Ljava/io/DataInputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public resolve(Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;)V
    .locals 1
    .param p1, "constantPool"    # Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool;

    .prologue
    .line 188
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry;->resolved:Z

    .line 189
    return-void
.end method
