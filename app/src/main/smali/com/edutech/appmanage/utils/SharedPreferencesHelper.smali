.class public Lcom/edutech/appmanage/utils/SharedPreferencesHelper;
.super Ljava/lang/Object;
.source "SharedPreferencesHelper.java"


# static fields
.field public static preferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static load_info()Ljava/lang/String;
    .locals 4

    .prologue
    .line 31
    sget-object v1, Lcom/edutech/appmanage/utils/SharedPreferencesHelper;->preferences:Landroid/content/SharedPreferences;

    const-string/jumbo v2, "info"

    const-string/jumbo v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 32
    .local v0, "info":Ljava/lang/String;
    return-object v0
.end method

.method public static save_info(Ljava/lang/String;)V
    .locals 2
    .param p0, "info"    # Ljava/lang/String;

    .prologue
    .line 16
    sget-object v1, Lcom/edutech/appmanage/utils/SharedPreferencesHelper;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 17
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v1, "info"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 18
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 19
    return-void
.end method
