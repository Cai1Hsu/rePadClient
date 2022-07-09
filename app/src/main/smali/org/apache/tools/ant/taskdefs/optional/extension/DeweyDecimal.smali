.class public final Lorg/apache/tools/ant/taskdefs/optional/extension/DeweyDecimal;
.super Lorg/apache/tools/ant/util/DeweyDecimal;
.source "DeweyDecimal.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/util/DeweyDecimal;-><init>(Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method public constructor <init>([I)V
    .locals 0
    .param p1, "components"    # [I

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/util/DeweyDecimal;-><init>([I)V

    .line 42
    return-void
.end method
