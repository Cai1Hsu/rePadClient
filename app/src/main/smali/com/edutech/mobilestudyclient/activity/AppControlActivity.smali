.class public Lcom/edutech/mobilestudyclient/activity/AppControlActivity;
.super Landroid/app/Activity;
.source "AppControlActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/mobilestudyclient/activity/AppControlActivity$ShowAppsThread;
    }
.end annotation


# static fields
.field private static TAG:Ljava/lang/String;


# instance fields
.field private adapter:Lcom/edutech/mobilestudyclient/view/AppControlAdapter;

.field appClickListener:Landroid/widget/AdapterView$OnItemClickListener;

.field private appInfoList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/edutech/mobilestudyclient/util/AppDetails;",
            ">;"
        }
    .end annotation
.end field

.field private appLv:Landroid/widget/ListView;

.field private appSearchList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/edutech/mobilestudyclient/util/AppDetails;",
            ">;"
        }
    .end annotation
.end field

.field backListener:Landroid/view/View$OnClickListener;

.field private btn_back:Landroid/widget/Button;

.field private btn_clean:Landroid/widget/Button;

.field private btn_search:Landroid/widget/Button;

.field cleanListener:Landroid/view/View$OnClickListener;

.field private edt_search:Landroid/widget/EditText;

.field handler:Landroid/os/Handler;

.field private installPkg:Ljava/lang/String;

.field private installTime:J

.field searchListener:Landroid/view/View$OnClickListener;

.field private selfApps:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 55
    const-string/jumbo v0, " "

    sput-object v0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 41
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 56
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->installPkg:Ljava/lang/String;

    .line 57
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->installTime:J

    .line 322
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$1;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$1;-><init>(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->cleanListener:Landroid/view/View$OnClickListener;

    .line 337
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$2;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$2;-><init>(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->handler:Landroid/os/Handler;

    .line 392
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$3;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$3;-><init>(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->backListener:Landroid/view/View$OnClickListener;

    .line 404
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$4;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$4;-><init>(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->searchListener:Landroid/view/View$OnClickListener;

    .line 431
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$5;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$5;-><init>(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->appClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    .line 41
    return-void
.end method

.method static synthetic access$0(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 372
    invoke-direct {p0, p1}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->searchApps(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Lcom/edutech/mobilestudyclient/view/AppControlAdapter;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->adapter:Lcom/edutech/mobilestudyclient/view/AppControlAdapter;

    return-object v0
.end method

.method static synthetic access$2(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Ljava/util/List;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->appSearchList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$3(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Ljava/util/List;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->appInfoList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$4(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Landroid/widget/Button;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->btn_search:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$5(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->edt_search:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$6(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)V
    .locals 0

    .prologue
    .line 202
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->initApps()V

    return-void
.end method

.method private static cleanCacheFile(Ljava/lang/String;)V
    .locals 5
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 145
    const-string/jumbo v4, "sdcard"

    invoke-static {v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 147
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 149
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 150
    .local v1, "files":[Ljava/io/File;
    if-eqz v1, :cond_0

    .line 152
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, v1

    if-lt v2, v4, :cond_1

    .line 159
    .end local v1    # "files":[Ljava/io/File;
    .end local v2    # "i":I
    :cond_0
    return-void

    .line 154
    .restart local v1    # "files":[Ljava/io/File;
    .restart local v2    # "i":I
    :cond_1
    aget-object v3, v1, v2

    .line 155
    .local v3, "tep":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 152
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public static cleanExternalCache(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 110
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    .line 111
    const-string/jumbo v1, "mounted"

    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 111
    if-eqz v0, :cond_0

    .line 112
    sget-object v0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->TAG:Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    invoke-virtual {p0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->deleteFilesByDirectory(Ljava/io/File;)V

    .line 115
    :cond_0
    return-void
.end method

.method public static cleanFiles(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 102
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->deleteFilesByDirectory(Ljava/io/File;)V

    .line 103
    return-void
.end method

.method public static cleanInternalCache(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 87
    sget-object v0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->TAG:Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->deleteFilesByDirectory(Ljava/io/File;)V

    .line 89
    return-void
.end method

.method public static cleanSharedPreference(Landroid/content/Context;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 96
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "/data/data/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/shared_prefs"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 96
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->deleteFilesByDirectory(Ljava/io/File;)V

    .line 98
    return-void
.end method

.method private static deleteFilesByDirectory(Ljava/io/File;)V
    .locals 5
    .param p0, "directory"    # Ljava/io/File;

    .prologue
    .line 131
    const-string/jumbo v2, "cleaning"

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 133
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 134
    .local v1, "items":[Ljava/io/File;
    if-nez v1, :cond_1

    .line 142
    .end local v1    # "items":[Ljava/io/File;
    :cond_0
    return-void

    .line 138
    .restart local v1    # "items":[Ljava/io/File;
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v4, :cond_0

    aget-object v0, v3, v2

    .line 139
    .local v0, "item":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 138
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private initApps()V
    .locals 11
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 204
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 205
    .local v5, "packages":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->appInfoList:Ljava/util/List;

    .line 206
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->selfApps:Ljava/util/List;

    .line 207
    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->selfApps:Ljava/util/List;

    const-string/jumbo v10, "com.launcher.activity"

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 208
    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->selfApps:Ljava/util/List;

    const-string/jumbo v10, "com.edutech.firewall"

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 216
    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->selfApps:Ljava/util/List;

    const-string/jumbo v10, "com.edutech.assistantdemo"

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 218
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v5

    .line 219
    if-eqz v5, :cond_0

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v9

    if-lez v9, :cond_0

    .line 222
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v9

    if-lt v1, v9, :cond_1

    .line 275
    .end local v1    # "i":I
    :cond_0
    return-void

    .line 224
    .restart local v1    # "i":I
    :cond_1
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/PackageInfo;

    .line 225
    .local v3, "info":Landroid/content/pm/PackageInfo;
    new-instance v0, Lcom/edutech/mobilestudyclient/util/AppDetails;

    invoke-direct {v0}, Lcom/edutech/mobilestudyclient/util/AppDetails;-><init>()V

    .line 226
    .local v0, "detail":Lcom/edutech/mobilestudyclient/util/AppDetails;
    iget-object v6, v3, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 227
    .local v6, "pkName":Ljava/lang/String;
    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->selfApps:Ljava/util/List;

    invoke-interface {v9, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 222
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 231
    :cond_3
    const-string/jumbo v9, "com.edutech.myfiles"

    invoke-virtual {v6, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 235
    const-string/jumbo v9, "com.edutech.protect"

    invoke-virtual {v6, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 239
    const-string/jumbo v9, "com.edutech"

    invoke-virtual {v6, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_4

    const-string/jumbo v9, "cn.wps.moffice_eng"

    invoke-virtual {v6, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 254
    :cond_4
    iget-object v9, v3, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v9

    invoke-interface {v9}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    .line 255
    .local v4, "name":Ljava/lang/String;
    iget-object v8, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 256
    .local v8, "version":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    iget v10, v3, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 258
    .local v7, "vcode":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f02017c

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 260
    .local v2, "icon":Landroid/graphics/drawable/Drawable;
    :try_start_0
    iget-object v9, v3, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/content/pm/ApplicationInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 264
    :goto_2
    if-eqz v4, :cond_2

    if-eqz v6, :cond_2

    if-eqz v8, :cond_2

    if-eqz v7, :cond_2

    if-eqz v2, :cond_2

    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->selfApps:Ljava/util/List;

    invoke-interface {v9, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 266
    invoke-virtual {v0, v2}, Lcom/edutech/mobilestudyclient/util/AppDetails;->setAppIcon(Landroid/graphics/drawable/Drawable;)V

    .line 267
    invoke-virtual {v0, v4}, Lcom/edutech/mobilestudyclient/util/AppDetails;->setAppName(Ljava/lang/String;)V

    .line 268
    invoke-virtual {v0, v6}, Lcom/edutech/mobilestudyclient/util/AppDetails;->setAppPackageName(Ljava/lang/String;)V

    .line 269
    invoke-virtual {v0, v8}, Lcom/edutech/mobilestudyclient/util/AppDetails;->setAppVersion(Ljava/lang/String;)V

    .line 270
    invoke-virtual {v0, v7}, Lcom/edutech/mobilestudyclient/util/AppDetails;->setAppVersionCode(Ljava/lang/String;)V

    .line 271
    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->appInfoList:Ljava/util/List;

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 261
    :catch_0
    move-exception v9

    goto :goto_2
.end method

.method private initWidget()V
    .locals 2

    .prologue
    .line 282
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->appInfoList:Ljava/util/List;

    .line 283
    new-instance v0, Lcom/edutech/mobilestudyclient/view/AppControlAdapter;

    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->appInfoList:Ljava/util/List;

    invoke-direct {v0, v1, p0}, Lcom/edutech/mobilestudyclient/view/AppControlAdapter;-><init>(Ljava/util/List;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->adapter:Lcom/edutech/mobilestudyclient/view/AppControlAdapter;

    .line 284
    const v0, 0x7f0a002b

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->appLv:Landroid/widget/ListView;

    .line 285
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->appLv:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->adapter:Lcom/edutech/mobilestudyclient/view/AppControlAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 287
    const v0, 0x7f0a0027

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->btn_back:Landroid/widget/Button;

    .line 288
    const v0, 0x7f0a0028

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->btn_search:Landroid/widget/Button;

    .line 289
    const v0, 0x7f0a002a

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->edt_search:Landroid/widget/EditText;

    .line 290
    const v0, 0x7f0a0029

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->btn_clean:Landroid/widget/Button;

    .line 291
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->edt_search:Landroid/widget/EditText;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setVisibility(I)V

    .line 292
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->btn_back:Landroid/widget/Button;

    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->backListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 293
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->btn_search:Landroid/widget/Button;

    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->searchListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 294
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->btn_search:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 295
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->btn_clean:Landroid/widget/Button;

    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->cleanListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 296
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->edt_search:Landroid/widget/EditText;

    new-instance v1, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$6;

    invoke-direct {v1, p0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$6;-><init>(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 321
    return-void
.end method

.method private searchApps(Ljava/lang/String;)V
    .locals 3
    .param p1, "keywords"    # Ljava/lang/String;

    .prologue
    .line 374
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->appSearchList:Ljava/util/List;

    .line 375
    if-eqz p1, :cond_0

    const-string/jumbo v2, ""

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 387
    :cond_0
    return-void

    .line 379
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->appInfoList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 381
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->appInfoList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/mobilestudyclient/util/AppDetails;

    .line 382
    .local v0, "detail":Lcom/edutech/mobilestudyclient/util/AppDetails;
    invoke-virtual {v0}, Lcom/edutech/mobilestudyclient/util/AppDetails;->getAppName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 384
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->appSearchList:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 379
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 4
    .param p1, "newBase"    # Landroid/content/Context;

    .prologue
    .line 79
    :try_start_0
    const-string/jumbo v2, "language"

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 80
    .local v0, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v2, "language"

    const-string/jumbo v3, "chinese"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 81
    .local v1, "type":Ljava/lang/String;
    invoke-static {p1, v1}, Lcom/edutech/mobilestudyclient/LanguageUtils;->attachBaseContext(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Context;

    move-result-object v2

    invoke-super {p0, v2}, Landroid/app/Activity;->attachBaseContext(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    .end local v0    # "sp":Landroid/content/SharedPreferences;
    .end local v1    # "type":Ljava/lang/String;
    :goto_0
    return-void

    .line 82
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public cleanApplicationData(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 120
    invoke-static {p1}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->cleanInternalCache(Landroid/content/Context;)V

    .line 121
    invoke-static {p1}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->cleanExternalCache(Landroid/content/Context;)V

    .line 122
    invoke-static {p1}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->cleanSharedPreference(Landroid/content/Context;)V

    .line 124
    const-string/jumbo v1, "lockscreen"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 125
    .local v0, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "installtime"

    iget-wide v4, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->installTime:J

    invoke-interface {v1, v2, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 126
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "installpkg"

    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->installPkg:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 127
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 61
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 62
    const v2, 0x7f030008

    invoke-virtual {p0, v2}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->setContentView(I)V

    .line 63
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->initWidget()V

    .line 64
    const-string/jumbo v2, ""

    sput-object v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->CleaningPackage:Ljava/lang/String;

    .line 65
    const-string/jumbo v2, "language"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 66
    .local v0, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v2, "language"

    const-string/jumbo v3, "chinese"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 67
    .local v1, "type":Ljava/lang/String;
    const-string/jumbo v2, "en"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 68
    const-string/jumbo v2, "chinese"

    invoke-static {p0, v2}, Lcom/edutech/mobilestudyclient/LanguageUtils;->SetLanguage(Landroid/content/Context;Ljava/lang/String;)V

    .line 73
    :goto_0
    new-instance v2, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$ShowAppsThread;

    invoke-direct {v2, p0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$ShowAppsThread;-><init>(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)V

    invoke-virtual {v2}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$ShowAppsThread;->start()V

    .line 74
    return-void

    .line 70
    :cond_0
    const-string/jumbo v2, "en"

    invoke-static {p0, v2}, Lcom/edutech/mobilestudyclient/LanguageUtils;->SetLanguage(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 184
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 185
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->CleaningPackage:Ljava/lang/String;

    .line 191
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 196
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 177
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 178
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->CleaningPackage:Ljava/lang/String;

    .line 179
    return-void
.end method
