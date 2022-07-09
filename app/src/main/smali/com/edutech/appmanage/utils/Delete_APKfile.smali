.class public Lcom/edutech/appmanage/utils/Delete_APKfile;
.super Landroid/app/Service;
.source "Delete_APKfile.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 16
    const/4 v0, 0x0

    return-object v0
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 14
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 22
    .line 23
    const-string/jumbo v12, "deletefile"

    invoke-virtual {p1, v12}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 24
    .local v3, "delete_apkfile":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-lt v7, v12, :cond_2

    .line 41
    const-string/jumbo v12, "deleteicon"

    invoke-virtual {p1, v12}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 42
    .local v8, "iconpath":Ljava/lang/String;
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 43
    .local v6, "fileicon":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v9

    .line 44
    .local v9, "icons":[Ljava/io/File;
    if-eqz v9, :cond_0

    .line 45
    const/4 v7, 0x0

    :goto_1
    array-length v12, v9

    if-lt v7, v12, :cond_4

    .line 52
    :cond_0
    const-string/jumbo v12, "install"

    invoke-virtual {p1, v12}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v10

    .line 54
    .local v10, "install_num":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string/jumbo v12, "deleteapks"

    invoke-virtual {p1, v12}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 55
    .local v1, "apkpath":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 56
    .local v0, "apk":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 57
    .local v2, "apks":[Ljava/io/File;
    const/4 v4, 0x0

    .line 58
    .local v4, "exist":Z
    if-eqz v2, :cond_1

    array-length v12, v2

    if-lez v12, :cond_1

    .line 60
    const/4 v7, 0x0

    :goto_2
    array-length v12, v2

    if-lt v7, v12, :cond_6

    .line 75
    :cond_1
    invoke-virtual {p0}, Lcom/edutech/appmanage/utils/Delete_APKfile;->stopSelf()V

    .line 76
    invoke-super/range {p0 .. p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v12

    return v12

    .line 25
    .end local v0    # "apk":Ljava/io/File;
    .end local v1    # "apkpath":Ljava/lang/String;
    .end local v2    # "apks":[Ljava/io/File;
    .end local v4    # "exist":Z
    .end local v6    # "fileicon":Ljava/io/File;
    .end local v8    # "iconpath":Ljava/lang/String;
    .end local v9    # "icons":[Ljava/io/File;
    .end local v10    # "install_num":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_2
    new-instance v5, Ljava/io/File;

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-direct {v5, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 27
    .local v5, "file":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->isFile()Z

    move-result v12

    if-eqz v12, :cond_3

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_3

    .line 28
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 24
    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 46
    .end local v5    # "file":Ljava/io/File;
    .restart local v6    # "fileicon":Ljava/io/File;
    .restart local v8    # "iconpath":Ljava/lang/String;
    .restart local v9    # "icons":[Ljava/io/File;
    :cond_4
    aget-object v12, v9, v7

    invoke-virtual {v12}, Ljava/io/File;->isFile()Z

    move-result v12

    if-eqz v12, :cond_5

    aget-object v12, v9, v7

    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_5

    .line 47
    aget-object v12, v9, v7

    invoke-virtual {v12}, Ljava/io/File;->delete()Z

    .line 45
    :cond_5
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 61
    .restart local v0    # "apk":Ljava/io/File;
    .restart local v1    # "apkpath":Ljava/lang/String;
    .restart local v2    # "apks":[Ljava/io/File;
    .restart local v4    # "exist":Z
    .restart local v10    # "install_num":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_6
    aget-object v12, v2, v7

    invoke-virtual {v12}, Ljava/io/File;->isFile()Z

    move-result v12

    if-eqz v12, :cond_7

    aget-object v12, v2, v7

    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_7

    .line 62
    const/4 v11, 0x0

    .local v11, "j":I
    :goto_3
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-lt v11, v12, :cond_8

    .line 69
    :goto_4
    if-nez v4, :cond_7

    .line 70
    aget-object v12, v2, v7

    invoke-virtual {v12}, Ljava/io/File;->delete()Z

    .line 60
    .end local v11    # "j":I
    :cond_7
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 63
    .restart local v11    # "j":I
    :cond_8
    new-instance v5, Ljava/io/File;

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-direct {v5, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 64
    .restart local v5    # "file":Ljava/io/File;
    aget-object v12, v2, v7

    invoke-virtual {v12}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_9

    .line 65
    const/4 v4, 0x1

    .line 66
    goto :goto_4

    .line 62
    :cond_9
    add-int/lit8 v11, v11, 0x1

    goto :goto_3
.end method
