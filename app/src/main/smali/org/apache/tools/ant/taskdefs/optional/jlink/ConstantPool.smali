.class Lorg/apache/tools/ant/taskdefs/optional/jlink/ConstantPool;
.super Ljava/lang/Object;
.source "ClassNameReader.java"


# static fields
.field static final CLASS:B = 0x7t

.field static final DOUBLE:B = 0x6t

.field static final FIELDREF:B = 0x9t

.field static final FLOAT:B = 0x4t

.field static final INTEGER:B = 0x3t

.field static final INTERFACEMETHODREF:B = 0xbt

.field static final LONG:B = 0x5t

.field static final METHODREF:B = 0xat

.field static final NAMEANDTYPE:B = 0xct

.field static final STRING:B = 0x8t

.field static final UNUSED:B = 0x2t

.field static final UTF8:B = 0x1t


# instance fields
.field types:[B

.field values:[Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/io/DataInput;)V
    .locals 8
    .param p1, "data"    # Ljava/io/DataInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedShort()I

    move-result v0

    .line 52
    .local v0, "count":I
    new-array v3, v0, [B

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/ConstantPool;->types:[B

    .line 53
    new-array v3, v0, [Ljava/lang/Object;

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/ConstantPool;->values:[Ljava/lang/Object;

    .line 55
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 56
    invoke-interface {p1}, Ljava/io/DataInput;->readByte()B

    move-result v2

    .line 57
    .local v2, "type":B
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/ConstantPool;->types:[B

    aput-byte v2, v3, v1

    .line 58
    packed-switch v2, :pswitch_data_0

    .line 55
    :goto_1
    :pswitch_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 60
    :pswitch_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/ConstantPool;->values:[Ljava/lang/Object;

    invoke-interface {p1}, Ljava/io/DataInput;->readUTF()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v1

    goto :goto_1

    .line 67
    :pswitch_2
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/ConstantPool;->values:[Ljava/lang/Object;

    new-instance v4, Ljava/lang/Integer;

    invoke-interface {p1}, Ljava/io/DataInput;->readInt()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/lang/Integer;-><init>(I)V

    aput-object v4, v3, v1

    goto :goto_1

    .line 71
    :pswitch_3
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/ConstantPool;->values:[Ljava/lang/Object;

    new-instance v4, Ljava/lang/Float;

    invoke-interface {p1}, Ljava/io/DataInput;->readFloat()F

    move-result v5

    invoke-direct {v4, v5}, Ljava/lang/Float;-><init>(F)V

    aput-object v4, v3, v1

    goto :goto_1

    .line 75
    :pswitch_4
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/ConstantPool;->values:[Ljava/lang/Object;

    new-instance v4, Ljava/lang/Long;

    invoke-interface {p1}, Ljava/io/DataInput;->readLong()J

    move-result-wide v6

    invoke-direct {v4, v6, v7}, Ljava/lang/Long;-><init>(J)V

    aput-object v4, v3, v1

    .line 76
    add-int/lit8 v1, v1, 0x1

    .line 77
    goto :goto_1

    .line 80
    :pswitch_5
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/ConstantPool;->values:[Ljava/lang/Object;

    new-instance v4, Ljava/lang/Double;

    invoke-interface {p1}, Ljava/io/DataInput;->readDouble()D

    move-result-wide v6

    invoke-direct {v4, v6, v7}, Ljava/lang/Double;-><init>(D)V

    aput-object v4, v3, v1

    .line 81
    add-int/lit8 v1, v1, 0x1

    .line 82
    goto :goto_1

    .line 86
    :pswitch_6
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/ConstantPool;->values:[Ljava/lang/Object;

    new-instance v4, Ljava/lang/Integer;

    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedShort()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/lang/Integer;-><init>(I)V

    aput-object v4, v3, v1

    goto :goto_1

    .line 93
    :pswitch_7
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/ConstantPool;->values:[Ljava/lang/Object;

    new-instance v4, Ljava/lang/Integer;

    invoke-interface {p1}, Ljava/io/DataInput;->readInt()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/lang/Integer;-><init>(I)V

    aput-object v4, v3, v1

    goto :goto_1

    .line 99
    .end local v2    # "type":B
    :cond_0
    return-void

    .line 58
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_6
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
    .end packed-switch
.end method
