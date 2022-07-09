.class Lcom/edutech/appmanage/MainActivity$15;
.super Ljava/lang/Thread;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/appmanage/MainActivity;->compare()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/appmanage/MainActivity;


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/MainActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$15;->this$0:Lcom/edutech/appmanage/MainActivity;

    .line 1075
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 1079
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 1081
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget-object v3, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    if-lt v1, v3, :cond_0

    .line 1104
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$15;->this$0:Lcom/edutech/appmanage/MainActivity;

    const/4 v4, 0x1

    invoke-static {v3, v4}, Lcom/edutech/appmanage/MainActivity;->access$9(Lcom/edutech/appmanage/MainActivity;Z)V

    .line 1105
    return-void

    .line 1082
    :cond_0
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_1
    sget-object v3, Lcom/edutech/appmanage/MainActivity;->market_applist_local:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    if-lt v2, v3, :cond_1

    .line 1081
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1083
    :cond_1
    sget-object v3, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v3, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v4, v3, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    .line 1084
    sget-object v3, Lcom/edutech/appmanage/MainActivity;->market_applist_local:Ljava/util/LinkedList;

    invoke-virtual {v3, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v3, v3, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1086
    :try_start_0
    sget-object v3, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v3, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v5, p0, Lcom/edutech/appmanage/MainActivity$15;->this$0:Lcom/edutech/appmanage/MainActivity;

    new-instance v4, Ljava/lang/StringBuilder;

    .line 1087
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v6

    .line 1088
    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1089
    sget-char v6, Ljava/io/File;->separatorChar:C

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1090
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1091
    sget-char v6, Ljava/io/File;->separatorChar:C

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1092
    const-string/jumbo v6, "icon"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1093
    sget-char v6, Ljava/io/File;->separatorChar:C

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 1094
    sget-object v4, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v4, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v4, v4, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1095
    const-string/jumbo v6, ".png"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1086
    invoke-virtual {v5, v4}, Lcom/edutech/appmanage/MainActivity;->getImageDrawable(Ljava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v4

    iput-object v4, v3, Lcom/edutech/appmanage/MainActivity$AppInfo;->appicon:Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 1096
    :catch_0
    move-exception v0

    .line 1098
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 1082
    .end local v0    # "e":Ljava/io/IOException;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1
.end method
