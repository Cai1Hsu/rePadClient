.class Lcom/edutech/appmanage/MainActivity$12;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/appmanage/MainActivity;->unlink_parse(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/edutech/appmanage/MainActivity$AppInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/appmanage/MainActivity;


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/MainActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$12;->this$0:Lcom/edutech/appmanage/MainActivity;

    .line 701
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/edutech/appmanage/MainActivity$AppInfo;Lcom/edutech/appmanage/MainActivity$AppInfo;)I
    .locals 3
    .param p1, "lhs"    # Lcom/edutech/appmanage/MainActivity$AppInfo;
    .param p2, "rhs"    # Lcom/edutech/appmanage/MainActivity$AppInfo;

    .prologue
    .line 705
    const/4 v0, 0x0

    .local v0, "a":I
    const/4 v1, 0x0

    .line 706
    .local v1, "b":I
    iget-boolean v2, p1, Lcom/edutech/appmanage/MainActivity$AppInfo;->islocal:Z

    if-eqz v2, :cond_0

    .line 707
    const/4 v0, 0x1

    .line 708
    :cond_0
    iget-boolean v2, p2, Lcom/edutech/appmanage/MainActivity$AppInfo;->islocal:Z

    if-eqz v2, :cond_1

    .line 709
    const/4 v1, 0x1

    .line 710
    :cond_1
    if-le v0, v1, :cond_2

    .line 711
    const/4 v2, -0x1

    .line 715
    :goto_0
    return v2

    .line 712
    :cond_2
    if-ne v0, v1, :cond_3

    .line 713
    const/4 v2, 0x0

    goto :goto_0

    .line 715
    :cond_3
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 1
    check-cast p1, Lcom/edutech/appmanage/MainActivity$AppInfo;

    check-cast p2, Lcom/edutech/appmanage/MainActivity$AppInfo;

    invoke-virtual {p0, p1, p2}, Lcom/edutech/appmanage/MainActivity$12;->compare(Lcom/edutech/appmanage/MainActivity$AppInfo;Lcom/edutech/appmanage/MainActivity$AppInfo;)I

    move-result v0

    return v0
.end method
