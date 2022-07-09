.class public Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/LongCPInfo;
.super Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantCPInfo;
.source "LongCPInfo.java"


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 31
    const/4 v0, 0x5

    const/4 v1, 0x2

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantCPInfo;-><init>(II)V

    .line 32
    return-void
.end method


# virtual methods
.method public read(Ljava/io/DataInputStream;)V
    .locals 4
    .param p1, "cpStream"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    new-instance v0, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/LongCPInfo;->setValue(Ljava/lang/Object;)V

    .line 44
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 52
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Long Constant Pool Entry: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/constantpool/LongCPInfo;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
