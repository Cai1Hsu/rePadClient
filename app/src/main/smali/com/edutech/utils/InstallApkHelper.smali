.class public Lcom/edutech/utils/InstallApkHelper;
.super Ljava/lang/Object;
.source "InstallApkHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/utils/InstallApkHelper$InstallApkThread;
    }
.end annotation


# instance fields
.field private ApkThread:Ljava/lang/Thread;

.field private InstallApkHandler:Landroid/os/Handler;

.field private apkList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final installReceiver:Landroid/content/BroadcastReceiver;

.field private mContext:Landroid/content/Context;

.field private mFileList:[Ljava/io/File;

.field private msg:Landroid/os/Message;

.field private nummetod:I

.field private selfPackageName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/edutech/idauthentication/MainActivity;Ljava/lang/String;)V
    .locals 3
    .param p1, "mainActivity"    # Lcom/edutech/idauthentication/MainActivity;
    .param p2, "packageName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->mFileList:[Ljava/io/File;

    .line 25
    iput-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->apkList:Ljava/util/ArrayList;

    .line 26
    const/4 v1, 0x0

    iput v1, p0, Lcom/edutech/utils/InstallApkHelper;->nummetod:I

    .line 27
    iput-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->ApkThread:Ljava/lang/Thread;

    .line 28
    iput-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->msg:Landroid/os/Message;

    .line 30
    const-string/jumbo v1, ""

    iput-object v1, p0, Lcom/edutech/utils/InstallApkHelper;->selfPackageName:Ljava/lang/String;

    .line 254
    new-instance v1, Lcom/edutech/utils/InstallApkHelper$1;

    invoke-direct {v1, p0}, Lcom/edutech/utils/InstallApkHelper$1;-><init>(Lcom/edutech/utils/InstallApkHelper;)V

    iput-object v1, p0, Lcom/edutech/utils/InstallApkHelper;->InstallApkHandler:Landroid/os/Handler;

    .line 267
    new-instance v1, Lcom/edutech/utils/InstallApkHelper$2;

    invoke-direct {v1, p0}, Lcom/edutech/utils/InstallApkHelper$2;-><init>(Lcom/edutech/utils/InstallApkHelper;)V

    iput-object v1, p0, Lcom/edutech/utils/InstallApkHelper;->installReceiver:Landroid/content/BroadcastReceiver;

    .line 32
    iput-object p2, p0, Lcom/edutech/utils/InstallApkHelper;->selfPackageName:Ljava/lang/String;

    .line 34
    iget-object v1, p1, Lcom/edutech/idauthentication/MainActivity;->mContext:Landroid/content/Context;

    iput-object v1, p0, Lcom/edutech/utils/InstallApkHelper;->mContext:Landroid/content/Context;

    .line 35
    new-instance v0, Landroid/content/IntentFilter;

    const-string/jumbo v1, "android.intent.action.PACKAGE_ADDED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 36
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "package"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 37
    iget-object v1, p0, Lcom/edutech/utils/InstallApkHelper;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->installReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 38
    return-void
.end method

.method static synthetic access$0(Lcom/edutech/utils/InstallApkHelper;)Landroid/content/Context;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/edutech/utils/InstallApkHelper;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1(Lcom/edutech/utils/InstallApkHelper;)Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/edutech/utils/InstallApkHelper;->apkList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2(Lcom/edutech/utils/InstallApkHelper;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/edutech/utils/InstallApkHelper;->selfPackageName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3(Lcom/edutech/utils/InstallApkHelper;)Ljava/lang/Thread;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/edutech/utils/InstallApkHelper;->ApkThread:Ljava/lang/Thread;

    return-object v0
.end method

.method static synthetic access$4(Lcom/edutech/utils/InstallApkHelper;Ljava/lang/Thread;)V
    .locals 0

    .prologue
    .line 27
    iput-object p1, p0, Lcom/edutech/utils/InstallApkHelper;->ApkThread:Ljava/lang/Thread;

    return-void
.end method

.method static synthetic access$5(Lcom/edutech/utils/InstallApkHelper;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 151
    invoke-direct {p0, p1, p2}, Lcom/edutech/utils/InstallApkHelper;->apkinstall(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$6(Lcom/edutech/utils/InstallApkHelper;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 144
    invoke-direct {p0, p1, p2}, Lcom/edutech/utils/InstallApkHelper;->apkinstall_samsung(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method private apkinstall(Landroid/content/Context;Ljava/lang/String;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "apkpath"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 175
    iget v2, p0, Lcom/edutech/utils/InstallApkHelper;->nummetod:I

    if-lez v2, :cond_1

    .line 178
    :try_start_0
    iget v2, p0, Lcom/edutech/utils/InstallApkHelper;->nummetod:I

    packed-switch v2, :pswitch_data_0

    .line 253
    :cond_0
    :goto_0
    return-void

    .line 180
    :pswitch_0
    invoke-static {p2}, Lcom/edutech/utils/InstallApkUtil;->SlientInstall(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 181
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->InstallApkHandler:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v2, v3, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    iput-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->msg:Landroid/os/Message;

    .line 182
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->InstallApkHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/edutech/utils/InstallApkHelper;->msg:Landroid/os/Message;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 195
    :catch_0
    move-exception v0

    .line 197
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 186
    .end local v0    # "e":Ljava/lang/Exception;
    :pswitch_1
    :try_start_1
    invoke-static {p2}, Lcom/edutech/utils/InstallApkUtil;->SuSlientInstall(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 187
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->InstallApkHandler:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v2, v3, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    iput-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->msg:Landroid/os/Message;

    .line 188
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->InstallApkHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/edutech/utils/InstallApkHelper;->msg:Landroid/os/Message;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    .line 192
    :pswitch_2
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->InstallApkHandler:Landroid/os/Handler;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 202
    :cond_1
    :try_start_2
    invoke-static {p2}, Lcom/edutech/utils/InstallApkUtil;->SlientInstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 204
    invoke-static {p2}, Lcom/edutech/utils/InstallApkUtil;->SlientInstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 206
    invoke-static {p2}, Lcom/edutech/utils/InstallApkUtil;->SuSlientInstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 208
    invoke-static {p2}, Lcom/edutech/utils/InstallApkUtil;->SuSlientInstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 210
    const/4 v2, 0x3

    iput v2, p0, Lcom/edutech/utils/InstallApkHelper;->nummetod:I

    .line 212
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->InstallApkHandler:Landroid/os/Handler;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 233
    :catch_1
    move-exception v0

    .line 236
    .restart local v0    # "e":Ljava/lang/Exception;
    :try_start_3
    invoke-static {p2}, Lcom/edutech/utils/InstallApkUtil;->SuSlientInstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 238
    const/4 v2, 0x3

    iput v2, p0, Lcom/edutech/utils/InstallApkHelper;->nummetod:I

    .line 240
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->InstallApkHandler:Landroid/os/Handler;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 246
    :catch_2
    move-exception v1

    .line 249
    .local v1, "e1":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->InstallApkHandler:Landroid/os/Handler;

    invoke-virtual {v2, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 214
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "e1":Ljava/lang/Exception;
    :cond_2
    const/4 v2, 0x2

    :try_start_4
    iput v2, p0, Lcom/edutech/utils/InstallApkHelper;->nummetod:I

    .line 215
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->InstallApkHandler:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v2, v3, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    iput-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->msg:Landroid/os/Message;

    .line 216
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->InstallApkHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/edutech/utils/InstallApkHelper;->msg:Landroid/os/Message;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    .line 219
    :cond_3
    const/4 v2, 0x2

    iput v2, p0, Lcom/edutech/utils/InstallApkHelper;->nummetod:I

    .line 220
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->InstallApkHandler:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v2, v3, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    iput-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->msg:Landroid/os/Message;

    .line 221
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->InstallApkHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/edutech/utils/InstallApkHelper;->msg:Landroid/os/Message;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    .line 224
    :cond_4
    const/4 v2, 0x1

    iput v2, p0, Lcom/edutech/utils/InstallApkHelper;->nummetod:I

    .line 225
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->InstallApkHandler:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v2, v3, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    iput-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->msg:Landroid/os/Message;

    .line 226
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->InstallApkHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/edutech/utils/InstallApkHelper;->msg:Landroid/os/Message;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    .line 229
    :cond_5
    const/4 v2, 0x1

    iput v2, p0, Lcom/edutech/utils/InstallApkHelper;->nummetod:I

    .line 230
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->InstallApkHandler:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v2, v3, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    iput-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->msg:Landroid/os/Message;

    .line 231
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->InstallApkHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/edutech/utils/InstallApkHelper;->msg:Landroid/os/Message;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_0

    .line 242
    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_6
    const/4 v2, 0x2

    :try_start_5
    iput v2, p0, Lcom/edutech/utils/InstallApkHelper;->nummetod:I

    .line 243
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->InstallApkHandler:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v2, v3, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    iput-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->msg:Landroid/os/Message;

    .line 244
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper;->InstallApkHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/edutech/utils/InstallApkHelper;->msg:Landroid/os/Message;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    goto/16 :goto_0

    .line 178
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private apkinstall_samsung(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "apkpath"    # Ljava/lang/String;

    .prologue
    .line 145
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 146
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "android.intent.action.SILENCE_INSTALL"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 147
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    const-string/jumbo v2, "application/vnd.android.package-archive"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 148
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 150
    return-void
.end method

.method private initApksInfo(Ljava/lang/String;)Z
    .locals 6
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 95
    iget-object v5, p0, Lcom/edutech/utils/InstallApkHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 96
    .local v3, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual {v3, p1, v4}, Landroid/content/pm/PackageManager;->getPackageArchiveInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 98
    .local v1, "info":Landroid/content/pm/PackageInfo;
    const/4 v0, 0x0

    .line 99
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    if-eqz v1, :cond_0

    .line 101
    iget-object v0, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 102
    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 104
    .local v2, "packageName":Ljava/lang/String;
    iget-object v5, p0, Lcom/edutech/utils/InstallApkHelper;->selfPackageName:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 105
    const/4 v4, 0x0

    .line 107
    .end local v2    # "packageName":Ljava/lang/String;
    :cond_0
    return v4
.end method


# virtual methods
.method public InstallAll()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 42
    new-instance v0, Ljava/io/File;

    sget-object v5, Lcom/edutech/idauthentication/AppEnvironment;->FOLDER_EDUTECH:Ljava/lang/String;

    invoke-direct {v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 43
    .local v0, "apkFolder":Ljava/io/File;
    iget-object v5, p0, Lcom/edutech/utils/InstallApkHelper;->mFileList:[Ljava/io/File;

    if-eqz v5, :cond_0

    .line 44
    iput-object v7, p0, Lcom/edutech/utils/InstallApkHelper;->mFileList:[Ljava/io/File;

    .line 45
    :cond_0
    iget-object v5, p0, Lcom/edutech/utils/InstallApkHelper;->apkList:Ljava/util/ArrayList;

    if-eqz v5, :cond_1

    .line 47
    iget-object v5, p0, Lcom/edutech/utils/InstallApkHelper;->apkList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 48
    iput-object v7, p0, Lcom/edutech/utils/InstallApkHelper;->apkList:Ljava/util/ArrayList;

    .line 52
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 53
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v5

    iput-object v5, p0, Lcom/edutech/utils/InstallApkHelper;->mFileList:[Ljava/io/File;

    .line 54
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/edutech/utils/InstallApkHelper;->apkList:Ljava/util/ArrayList;

    .line 59
    :goto_0
    const/4 v1, 0x0

    .line 60
    .local v1, "haveself":Z
    const/4 v3, -0x1

    .line 61
    .local v3, "j":I
    iget-object v5, p0, Lcom/edutech/utils/InstallApkHelper;->mFileList:[Ljava/io/File;

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/edutech/utils/InstallApkHelper;->mFileList:[Ljava/io/File;

    array-length v5, v5

    if-lez v5, :cond_2

    .line 62
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget-object v5, p0, Lcom/edutech/utils/InstallApkHelper;->mFileList:[Ljava/io/File;

    array-length v5, v5

    if-lt v2, v5, :cond_7

    .line 78
    .end local v2    # "i":I
    :cond_2
    if-eqz v1, :cond_3

    if-ltz v3, :cond_3

    .line 79
    iget-object v5, p0, Lcom/edutech/utils/InstallApkHelper;->apkList:Ljava/util/ArrayList;

    iget-object v6, p0, Lcom/edutech/utils/InstallApkHelper;->mFileList:[Ljava/io/File;

    aget-object v6, v6, v3

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 82
    :cond_3
    iget-object v5, p0, Lcom/edutech/utils/InstallApkHelper;->apkList:Ljava/util/ArrayList;

    if-eqz v5, :cond_4

    iget-object v5, p0, Lcom/edutech/utils/InstallApkHelper;->apkList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_4

    .line 83
    const/4 v5, 0x0

    iput v5, p0, Lcom/edutech/utils/InstallApkHelper;->nummetod:I

    .line 86
    :cond_4
    iget-object v5, p0, Lcom/edutech/utils/InstallApkHelper;->ApkThread:Ljava/lang/Thread;

    if-eqz v5, :cond_5

    .line 87
    iput-object v7, p0, Lcom/edutech/utils/InstallApkHelper;->ApkThread:Ljava/lang/Thread;

    .line 88
    :cond_5
    new-instance v5, Ljava/lang/Thread;

    new-instance v6, Lcom/edutech/utils/InstallApkHelper$InstallApkThread;

    invoke-direct {v6, p0, v7}, Lcom/edutech/utils/InstallApkHelper$InstallApkThread;-><init>(Lcom/edutech/utils/InstallApkHelper;Lcom/edutech/utils/InstallApkHelper$InstallApkThread;)V

    invoke-direct {v5, v6}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v5, p0, Lcom/edutech/utils/InstallApkHelper;->ApkThread:Ljava/lang/Thread;

    .line 89
    iget-object v5, p0, Lcom/edutech/utils/InstallApkHelper;->ApkThread:Ljava/lang/Thread;

    invoke-virtual {v5}, Ljava/lang/Thread;->start()V

    .line 90
    return-void

    .line 57
    .end local v1    # "haveself":Z
    .end local v3    # "j":I
    :cond_6
    iput-object v7, p0, Lcom/edutech/utils/InstallApkHelper;->mFileList:[Ljava/io/File;

    goto :goto_0

    .line 63
    .restart local v1    # "haveself":Z
    .restart local v2    # "i":I
    .restart local v3    # "j":I
    :cond_7
    iget-object v5, p0, Lcom/edutech/utils/InstallApkHelper;->mFileList:[Ljava/io/File;

    aget-object v5, v5, v2

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    .line 64
    .local v4, "path":Ljava/lang/String;
    const-string/jumbo v5, ".apk"

    invoke-virtual {v4, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_8

    .line 62
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 68
    :cond_8
    iget-object v5, p0, Lcom/edutech/utils/InstallApkHelper;->mFileList:[Ljava/io/File;

    aget-object v5, v5, v2

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/edutech/utils/InstallApkHelper;->initApksInfo(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 69
    iget-object v5, p0, Lcom/edutech/utils/InstallApkHelper;->apkList:Ljava/util/ArrayList;

    iget-object v6, p0, Lcom/edutech/utils/InstallApkHelper;->mFileList:[Ljava/io/File;

    aget-object v6, v6, v2

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 72
    :cond_9
    const/4 v1, 0x1

    .line 73
    move v3, v2

    goto :goto_2
.end method
