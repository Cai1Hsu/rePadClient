.class public Lcom/edutech/mobilestudyclient/LanguageUtils;
.super Ljava/lang/Object;
.source "LanguageUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static SetLanguage(Landroid/content/Context;Ljava/lang/String;)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "newLanguage"    # Ljava/lang/String;

    .prologue
    .line 22
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 23
    .local v3, "resources":Landroid/content/res/Resources;
    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 24
    .local v0, "configuration":Landroid/content/res/Configuration;
    invoke-static {p1}, Lcom/edutech/mobilestudyclient/LanguageUtils;->getLocaleByLanguage(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v2

    .line 26
    .local v2, "locale":Ljava/util/Locale;
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x11

    if-lt v4, v5, :cond_0

    .line 27
    invoke-virtual {v0, v2}, Landroid/content/res/Configuration;->setLocale(Ljava/util/Locale;)V

    .line 31
    :goto_0
    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 32
    .local v1, "dm":Landroid/util/DisplayMetrics;
    invoke-virtual {v3, v0, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 33
    return-void

    .line 29
    .end local v1    # "dm":Landroid/util/DisplayMetrics;
    :cond_0
    iput-object v2, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    goto :goto_0
.end method

.method public static attachBaseContext(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Context;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 15
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_0

    .line 16
    invoke-static {p0, p1}, Lcom/edutech/mobilestudyclient/LanguageUtils;->updateResources(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Context;

    move-result-object p0

    .line 18
    .end local p0    # "context":Landroid/content/Context;
    :cond_0
    return-object p0
.end method

.method private static getLocaleByLanguage(Ljava/lang/String;)Ljava/util/Locale;
    .locals 1
    .param p0, "language"    # Ljava/lang/String;

    .prologue
    .line 46
    const-string/jumbo v0, "en"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 50
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Ljava/util/Locale;->SIMPLIFIED_CHINESE:Ljava/util/Locale;

    goto :goto_0
.end method

.method private static updateResources(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Context;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 37
    .local v2, "resources":Landroid/content/res/Resources;
    invoke-static {p1}, Lcom/edutech/mobilestudyclient/LanguageUtils;->getLocaleByLanguage(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v1

    .line 38
    .local v1, "locale":Ljava/util/Locale;
    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 39
    .local v0, "configuration":Landroid/content/res/Configuration;
    invoke-virtual {v0, v1}, Landroid/content/res/Configuration;->setLocale(Ljava/util/Locale;)V

    .line 40
    new-instance v3, Landroid/os/LocaleList;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/util/Locale;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    invoke-direct {v3, v4}, Landroid/os/LocaleList;-><init>([Ljava/util/Locale;)V

    invoke-virtual {v0, v3}, Landroid/content/res/Configuration;->setLocales(Landroid/os/LocaleList;)V

    .line 41
    invoke-virtual {p0, v0}, Landroid/content/Context;->createConfigurationContext(Landroid/content/res/Configuration;)Landroid/content/Context;

    move-result-object v3

    return-object v3
.end method
