.class public Lorg/apache/tools/ant/taskdefs/SendEmail;
.super Lorg/apache/tools/ant/taskdefs/email/EmailTask;
.source "SendEmail.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;-><init>()V

    return-void
.end method


# virtual methods
.method public setMailport(Ljava/lang/Integer;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/Integer;

    .prologue
    .line 43
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/SendEmail;->setMailport(I)V

    .line 44
    return-void
.end method
