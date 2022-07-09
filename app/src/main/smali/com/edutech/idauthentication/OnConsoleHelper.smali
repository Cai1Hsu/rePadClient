.class public Lcom/edutech/idauthentication/OnConsoleHelper;
.super Ljava/lang/Object;
.source "OnConsoleHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static goBackError(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p0, "errorMessage"    # Ljava/lang/String;
    .param p1, "jsName"    # Ljava/lang/String;

    .prologue
    const/4 v3, -0x1

    .line 9
    const-string/jumbo v0, "Uncaught ReferenceError"

    .line 10
    .local v0, "errorinfo":Ljava/lang/String;
    const-string/jumbo v1, "is not defined"

    .line 12
    .local v1, "errorinfo1":Ljava/lang/String;
    if-eqz p0, :cond_0

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-eq v2, v3, :cond_0

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-eq v2, v3, :cond_0

    .line 14
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-eq v2, v3, :cond_0

    .line 15
    const/4 v2, 0x1

    .line 18
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method
