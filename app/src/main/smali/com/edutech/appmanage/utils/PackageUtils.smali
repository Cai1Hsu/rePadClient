.class public Lcom/edutech/appmanage/utils/PackageUtils;
.super Ljava/lang/Object;
.source "PackageUtils.java"


# static fields
.field public static final APP_INSTALL_AUTO:I = 0x0

.field public static final APP_INSTALL_EXTERNAL:I = 0x2

.field public static final APP_INSTALL_INTERNAL:I = 0x1

.field public static final DELETE_FAILED_DEVICE_POLICY_MANAGER:I = -0x2

.field public static final DELETE_FAILED_INTERNAL_ERROR:I = -0x1

.field public static final DELETE_FAILED_INVALID_PACKAGE:I = -0x3

.field public static final DELETE_FAILED_PERMISSION_DENIED:I = -0x4

.field public static final DELETE_SUCCEEDED:I = 0x1

.field public static final INSTALL_FAILED_ALREADY_EXISTS:I = -0x1

.field public static final INSTALL_FAILED_CONFLICTING_PROVIDER:I = -0xd

.field public static final INSTALL_FAILED_CONTAINER_ERROR:I = -0x12

.field public static final INSTALL_FAILED_CPU_ABI_INCOMPATIBLE:I = -0x10

.field public static final INSTALL_FAILED_DEXOPT:I = -0xb

.field public static final INSTALL_FAILED_DUPLICATE_PACKAGE:I = -0x5

.field public static final INSTALL_FAILED_INSUFFICIENT_STORAGE:I = -0x4

.field public static final INSTALL_FAILED_INTERNAL_ERROR:I = -0x6e

.field public static final INSTALL_FAILED_INVALID_APK:I = -0x2

.field public static final INSTALL_FAILED_INVALID_INSTALL_LOCATION:I = -0x13

.field public static final INSTALL_FAILED_INVALID_URI:I = -0x3

.field public static final INSTALL_FAILED_MEDIA_UNAVAILABLE:I = -0x14

.field public static final INSTALL_FAILED_MISSING_FEATURE:I = -0x11

.field public static final INSTALL_FAILED_MISSING_SHARED_LIBRARY:I = -0x9

.field public static final INSTALL_FAILED_NEWER_SDK:I = -0xe

.field public static final INSTALL_FAILED_NO_SHARED_USER:I = -0x6

.field public static final INSTALL_FAILED_OLDER_SDK:I = -0xc

.field public static final INSTALL_FAILED_OTHER:I = -0xf4240

.field public static final INSTALL_FAILED_PACKAGE_CHANGED:I = -0x17

.field public static final INSTALL_FAILED_REPLACE_COULDNT_DELETE:I = -0xa

.field public static final INSTALL_FAILED_SHARED_USER_INCOMPATIBLE:I = -0x8

.field public static final INSTALL_FAILED_TEST_ONLY:I = -0xf

.field public static final INSTALL_FAILED_UID_CHANGED:I = -0x18

.field public static final INSTALL_FAILED_UPDATE_INCOMPATIBLE:I = -0x7

.field public static final INSTALL_FAILED_VERIFICATION_FAILURE:I = -0x16

.field public static final INSTALL_FAILED_VERIFICATION_TIMEOUT:I = -0x15

.field public static final INSTALL_PARSE_FAILED_BAD_MANIFEST:I = -0x65

.field public static final INSTALL_PARSE_FAILED_BAD_PACKAGE_NAME:I = -0x6a

.field public static final INSTALL_PARSE_FAILED_BAD_SHARED_USER_ID:I = -0x6b

.field public static final INSTALL_PARSE_FAILED_CERTIFICATE_ENCODING:I = -0x69

.field public static final INSTALL_PARSE_FAILED_INCONSISTENT_CERTIFICATES:I = -0x68

.field public static final INSTALL_PARSE_FAILED_MANIFEST_EMPTY:I = -0x6d

.field public static final INSTALL_PARSE_FAILED_MANIFEST_MALFORMED:I = -0x6c

.field public static final INSTALL_PARSE_FAILED_NOT_APK:I = -0x64

.field public static final INSTALL_PARSE_FAILED_NO_CERTIFICATES:I = -0x67

.field public static final INSTALL_PARSE_FAILED_UNEXPECTED_EXCEPTION:I = -0x66

.field public static final INSTALL_SUCCEEDED:I = 0x1

.field public static final TAG:Ljava/lang/String; = "PackageUtils"


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static getAppVersionCode(Landroid/content/Context;)I
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 575
    if-eqz p0, :cond_0

    .line 576
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 577
    .local v2, "pm":Landroid/content/pm/PackageManager;
    if-eqz v2, :cond_0

    .line 580
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 581
    .local v1, "pi":Landroid/content/pm/PackageInfo;
    if-eqz v1, :cond_0

    .line 582
    iget v3, v1, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 589
    .end local v1    # "pi":Landroid/content/pm/PackageInfo;
    .end local v2    # "pm":Landroid/content/pm/PackageManager;
    :goto_0
    return v3

    .line 584
    .restart local v2    # "pm":Landroid/content/pm/PackageManager;
    :catch_0
    move-exception v0

    .line 585
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 589
    .end local v0    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v2    # "pm":Landroid/content/pm/PackageManager;
    :cond_0
    const/4 v3, -0x1

    goto :goto_0
.end method

.method public static getInstallLocation()I
    .locals 8

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 602
    const-string/jumbo v5, "LD_LIBRARY_PATH=/vendor/lib:/system/lib pm get-install-location"

    .line 601
    invoke-static {v5, v4, v3}, Lcom/edutech/appmanage/utils/ShellUtils;->execCommand(Ljava/lang/String;ZZ)Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;

    move-result-object v0

    .line 604
    .local v0, "commandResult":Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;
    iget v5, v0, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->result:I

    if-nez v5, :cond_0

    iget-object v5, v0, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->successMsg:Ljava/lang/String;

    if-eqz v5, :cond_0

    .line 605
    iget-object v5, v0, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->successMsg:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_0

    .line 607
    :try_start_0
    iget-object v5, v0, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->successMsg:Ljava/lang/String;

    .line 608
    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 607
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 609
    .local v2, "location":I
    packed-switch v2, :pswitch_data_0

    .end local v2    # "location":I
    :cond_0
    :goto_0
    move v3, v4

    .line 620
    :goto_1
    :pswitch_0
    return v3

    .line 613
    .restart local v2    # "location":I
    :pswitch_1
    const/4 v3, 0x2

    goto :goto_1

    .line 615
    .end local v2    # "location":I
    :catch_0
    move-exception v1

    .line 616
    .local v1, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v1}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 617
    const-string/jumbo v3, "PackageUtils"

    const-string/jumbo v5, "pm get-install-location error"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 609
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static getInstallLocationParams()Ljava/lang/String;
    .locals 2

    .prologue
    .line 629
    invoke-static {}, Lcom/edutech/appmanage/utils/PackageUtils;->getInstallLocation()I

    move-result v0

    .line 630
    .local v0, "location":I
    packed-switch v0, :pswitch_data_0

    .line 636
    const-string/jumbo v1, ""

    :goto_0
    return-object v1

    .line 632
    :pswitch_0
    const-string/jumbo v1, "-f"

    goto :goto_0

    .line 634
    :pswitch_1
    const-string/jumbo v1, "-s"

    goto :goto_0

    .line 630
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static final install(Landroid/content/Context;Ljava/lang/String;)I
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    const/4 v2, -0x3

    const/4 v1, 0x1

    .line 80
    invoke-static {p0}, Lcom/edutech/appmanage/utils/PackageUtils;->isSystemApplication(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 81
    invoke-static {}, Lcom/edutech/appmanage/utils/ShellUtils;->checkRootPermission()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 82
    :cond_0
    invoke-static {p0, p1}, Lcom/edutech/appmanage/utils/PackageUtils;->installSilent(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    .line 83
    .local v0, "res":I
    if-eq v1, v0, :cond_3

    .line 84
    invoke-static {p0, p1}, Lcom/edutech/appmanage/utils/PackageUtils;->installNormal(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 91
    .end local v0    # "res":I
    :cond_1
    :goto_0
    return v1

    .restart local v0    # "res":I
    :cond_2
    move v1, v2

    .line 85
    goto :goto_0

    :cond_3
    move v1, v0

    .line 87
    goto :goto_0

    .line 91
    .end local v0    # "res":I
    :cond_4
    invoke-static {p0, p1}, Lcom/edutech/appmanage/utils/PackageUtils;->installNormal(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    move v1, v2

    .line 92
    goto :goto_0
.end method

.method public static installNormal(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 104
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 105
    .local v1, "i":Landroid/content/Intent;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 106
    .local v0, "file":Ljava/io/File;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 107
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gtz v2, :cond_1

    .line 108
    :cond_0
    const/4 v2, 0x0

    .line 115
    :goto_0
    return v2

    .line 111
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "file://"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 112
    const-string/jumbo v3, "application/vnd.android.package-archive"

    .line 111
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 113
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 114
    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 115
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static installSilent(Landroid/content/Context;Ljava/lang/String;)I
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 138
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, " -r "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 139
    invoke-static {}, Lcom/edutech/appmanage/utils/PackageUtils;->getInstallLocationParams()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 138
    invoke-static {p0, p1, v0}, Lcom/edutech/appmanage/utils/PackageUtils;->installSilent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static installSilent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    .locals 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "pmParams"    # Ljava/lang/String;

    .prologue
    const v5, -0xf4240

    const/4 v4, 0x1

    const/4 v6, -0x3

    .line 163
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_2

    :cond_0
    move v4, v6

    .line 321
    .end local p2    # "pmParams":Ljava/lang/String;
    :cond_1
    :goto_0
    return v4

    .line 167
    .restart local p2    # "pmParams":Ljava/lang/String;
    :cond_2
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 168
    .local v2, "file":Ljava/io/File;
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v3, v8, v10

    if-lez v3, :cond_3

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 169
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v3

    if-nez v3, :cond_4

    :cond_3
    move v4, v6

    .line 170
    goto :goto_0

    .line 178
    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 179
    const-string/jumbo v7, "LD_LIBRARY_PATH=/vendor/lib:/system/lib pm install "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 180
    if-nez p2, :cond_5

    const-string/jumbo p2, ""

    .end local p2    # "pmParams":Ljava/lang/String;
    :cond_5
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v7, " "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 181
    const-string/jumbo v7, " "

    const-string/jumbo v8, "\\ "

    invoke-virtual {p1, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 183
    .local v0, "command":Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {p0}, Lcom/edutech/appmanage/utils/PackageUtils;->isSystemApplication(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_7

    const/4 v3, 0x0

    .line 182
    :goto_1
    invoke-static {v7, v3, v4}, Lcom/edutech/appmanage/utils/ShellUtils;->execCommand(Ljava/lang/String;ZZ)Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;

    move-result-object v1

    .line 184
    .local v1, "commandResult":Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->successMsg:Ljava/lang/String;

    if-eqz v3, :cond_6

    .line 185
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->successMsg:Ljava/lang/String;

    const-string/jumbo v7, "Success"

    invoke-virtual {v3, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->successMsg:Ljava/lang/String;

    .line 186
    const-string/jumbo v7, "success"

    invoke-virtual {v3, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 190
    :cond_6
    const-string/jumbo v3, "PackageUtils"

    .line 191
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "installSilent successMsg:"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 192
    iget-object v7, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->successMsg:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v7, ", ErrorMsg:"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 193
    iget-object v7, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 190
    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    if-nez v3, :cond_8

    move v4, v5

    .line 195
    goto/16 :goto_0

    .end local v1    # "commandResult":Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;
    :cond_7
    move v3, v4

    .line 183
    goto :goto_1

    .line 197
    .restart local v1    # "commandResult":Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;
    :cond_8
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    const-string/jumbo v4, "INSTALL_FAILED_ALREADY_EXISTS"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 198
    const/4 v4, -0x1

    goto/16 :goto_0

    .line 200
    :cond_9
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    const-string/jumbo v4, "INSTALL_FAILED_INVALID_APK"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 201
    const/4 v4, -0x2

    goto/16 :goto_0

    .line 203
    :cond_a
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    const-string/jumbo v4, "INSTALL_FAILED_INVALID_URI"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_b

    move v4, v6

    .line 204
    goto/16 :goto_0

    .line 206
    :cond_b
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    .line 207
    const-string/jumbo v4, "INSTALL_FAILED_INSUFFICIENT_STORAGE"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 208
    const/4 v4, -0x4

    goto/16 :goto_0

    .line 210
    :cond_c
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    const-string/jumbo v4, "INSTALL_FAILED_DUPLICATE_PACKAGE"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 211
    const/4 v4, -0x5

    goto/16 :goto_0

    .line 213
    :cond_d
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    const-string/jumbo v4, "INSTALL_FAILED_NO_SHARED_USER"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 214
    const/4 v4, -0x6

    goto/16 :goto_0

    .line 216
    :cond_e
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    .line 217
    const-string/jumbo v4, "INSTALL_FAILED_UPDATE_INCOMPATIBLE"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 218
    const/4 v4, -0x7

    goto/16 :goto_0

    .line 220
    :cond_f
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    .line 221
    const-string/jumbo v4, "INSTALL_FAILED_SHARED_USER_INCOMPATIBLE"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_10

    .line 222
    const/4 v4, -0x8

    goto/16 :goto_0

    .line 224
    :cond_10
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    .line 225
    const-string/jumbo v4, "INSTALL_FAILED_MISSING_SHARED_LIBRARY"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 226
    const/16 v4, -0x9

    goto/16 :goto_0

    .line 228
    :cond_11
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    .line 229
    const-string/jumbo v4, "INSTALL_FAILED_REPLACE_COULDNT_DELETE"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 230
    const/16 v4, -0xa

    goto/16 :goto_0

    .line 232
    :cond_12
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    const-string/jumbo v4, "INSTALL_FAILED_DEXOPT"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_13

    .line 233
    const/16 v4, -0xb

    goto/16 :goto_0

    .line 235
    :cond_13
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    const-string/jumbo v4, "INSTALL_FAILED_OLDER_SDK"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 236
    const/16 v4, -0xc

    goto/16 :goto_0

    .line 238
    :cond_14
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    .line 239
    const-string/jumbo v4, "INSTALL_FAILED_CONFLICTING_PROVIDER"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_15

    .line 240
    const/16 v4, -0xd

    goto/16 :goto_0

    .line 242
    :cond_15
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    const-string/jumbo v4, "INSTALL_FAILED_NEWER_SDK"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_16

    .line 243
    const/16 v4, -0xe

    goto/16 :goto_0

    .line 245
    :cond_16
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    const-string/jumbo v4, "INSTALL_FAILED_TEST_ONLY"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_17

    .line 246
    const/16 v4, -0xf

    goto/16 :goto_0

    .line 248
    :cond_17
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    .line 249
    const-string/jumbo v4, "INSTALL_FAILED_CPU_ABI_INCOMPATIBLE"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_18

    .line 250
    const/16 v4, -0x10

    goto/16 :goto_0

    .line 252
    :cond_18
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    const-string/jumbo v4, "INSTALL_FAILED_MISSING_FEATURE"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_19

    .line 253
    const/16 v4, -0x11

    goto/16 :goto_0

    .line 255
    :cond_19
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    const-string/jumbo v4, "INSTALL_FAILED_CONTAINER_ERROR"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 256
    const/16 v4, -0x12

    goto/16 :goto_0

    .line 258
    :cond_1a
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    .line 259
    const-string/jumbo v4, "INSTALL_FAILED_INVALID_INSTALL_LOCATION"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 260
    const/16 v4, -0x13

    goto/16 :goto_0

    .line 262
    :cond_1b
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    const-string/jumbo v4, "INSTALL_FAILED_MEDIA_UNAVAILABLE"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 263
    const/16 v4, -0x14

    goto/16 :goto_0

    .line 265
    :cond_1c
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    .line 266
    const-string/jumbo v4, "INSTALL_FAILED_VERIFICATION_TIMEOUT"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 267
    const/16 v4, -0x15

    goto/16 :goto_0

    .line 269
    :cond_1d
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    .line 270
    const-string/jumbo v4, "INSTALL_FAILED_VERIFICATION_FAILURE"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 271
    const/16 v4, -0x16

    goto/16 :goto_0

    .line 273
    :cond_1e
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    const-string/jumbo v4, "INSTALL_FAILED_PACKAGE_CHANGED"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 274
    const/16 v4, -0x17

    goto/16 :goto_0

    .line 276
    :cond_1f
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    const-string/jumbo v4, "INSTALL_FAILED_UID_CHANGED"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_20

    .line 277
    const/16 v4, -0x18

    goto/16 :goto_0

    .line 279
    :cond_20
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    const-string/jumbo v4, "INSTALL_PARSE_FAILED_NOT_APK"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_21

    .line 280
    const/16 v4, -0x64

    goto/16 :goto_0

    .line 282
    :cond_21
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    .line 283
    const-string/jumbo v4, "INSTALL_PARSE_FAILED_BAD_MANIFEST"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_22

    .line 284
    const/16 v4, -0x65

    goto/16 :goto_0

    .line 286
    :cond_22
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    .line 287
    const-string/jumbo v4, "INSTALL_PARSE_FAILED_UNEXPECTED_EXCEPTION"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 288
    const/16 v4, -0x66

    goto/16 :goto_0

    .line 290
    :cond_23
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    .line 291
    const-string/jumbo v4, "INSTALL_PARSE_FAILED_NO_CERTIFICATES"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_24

    .line 292
    const/16 v4, -0x67

    goto/16 :goto_0

    .line 294
    :cond_24
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    .line 295
    const-string/jumbo v4, "INSTALL_PARSE_FAILED_INCONSISTENT_CERTIFICATES"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_25

    .line 296
    const/16 v4, -0x68

    goto/16 :goto_0

    .line 298
    :cond_25
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    .line 299
    const-string/jumbo v4, "INSTALL_PARSE_FAILED_CERTIFICATE_ENCODING"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_26

    .line 300
    const/16 v4, -0x69

    goto/16 :goto_0

    .line 302
    :cond_26
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    .line 303
    const-string/jumbo v4, "INSTALL_PARSE_FAILED_BAD_PACKAGE_NAME"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_27

    .line 304
    const/16 v4, -0x6a

    goto/16 :goto_0

    .line 306
    :cond_27
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    .line 307
    const-string/jumbo v4, "INSTALL_PARSE_FAILED_BAD_SHARED_USER_ID"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_28

    .line 308
    const/16 v4, -0x6b

    goto/16 :goto_0

    .line 310
    :cond_28
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    .line 311
    const-string/jumbo v4, "INSTALL_PARSE_FAILED_MANIFEST_MALFORMED"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_29

    .line 312
    const/16 v4, -0x6c

    goto/16 :goto_0

    .line 314
    :cond_29
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    .line 315
    const-string/jumbo v4, "INSTALL_PARSE_FAILED_MANIFEST_EMPTY"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 316
    const/16 v4, -0x6d

    goto/16 :goto_0

    .line 318
    :cond_2a
    iget-object v3, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    const-string/jumbo v4, "INSTALL_FAILED_INTERNAL_ERROR"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 319
    const/16 v4, -0x6e

    goto/16 :goto_0

    :cond_2b
    move v4, v5

    .line 321
    goto/16 :goto_0
.end method

.method public static isEmpty(Ljava/lang/CharSequence;)Z
    .locals 1
    .param p0, "str"    # Ljava/lang/CharSequence;

    .prologue
    .line 548
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isEmpty(Ljava/util/List;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<TV;>;)Z"
        }
    .end annotation

    .prologue
    .line 565
    .local p0, "sourceList":Ljava/util/List;, "Ljava/util/List<TV;>;"
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSystemApplication(Landroid/content/Context;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 447
    if-nez p0, :cond_0

    .line 448
    const/4 v0, 0x0

    .line 451
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/edutech/appmanage/utils/PackageUtils;->isSystemApplication(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method public static isSystemApplication(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 463
    if-nez p0, :cond_0

    .line 464
    const/4 v0, 0x0

    .line 467
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/edutech/appmanage/utils/PackageUtils;->isSystemApplication(Landroid/content/pm/PackageManager;Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method public static isSystemApplication(Landroid/content/pm/PackageManager;Ljava/lang/String;)Z
    .locals 4
    .param p0, "packageManager"    # Landroid/content/pm/PackageManager;
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 485
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    .line 486
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_1

    .line 497
    :cond_0
    :goto_0
    return v2

    .line 492
    :cond_1
    const/4 v3, 0x0

    .line 491
    :try_start_0
    invoke-virtual {p0, p1, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 493
    .local v0, "app":Landroid/content/pm/ApplicationInfo;
    if-eqz v0, :cond_0

    iget v3, v0, Landroid/content/pm/ApplicationInfo;->flags:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    and-int/lit8 v3, v3, 0x1

    if-lez v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    .line 494
    .end local v0    # "app":Landroid/content/pm/ApplicationInfo;
    :catch_0
    move-exception v1

    .line 495
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method public static isTopActivity(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    const/4 v5, 0x0

    .line 515
    if-eqz p0, :cond_0

    invoke-static {p1}, Lcom/edutech/appmanage/utils/PackageUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 530
    :cond_0
    :goto_0
    return-object v3

    .line 520
    :cond_1
    const-string/jumbo v4, "activity"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 519
    check-cast v0, Landroid/app/ActivityManager;

    .line 521
    .local v0, "activityManager":Landroid/app/ActivityManager;
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Landroid/app/ActivityManager;->getRunningTasks(I)Ljava/util/List;

    move-result-object v2

    .line 522
    .local v2, "tasksInfo":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningTaskInfo;>;"
    invoke-static {v2}, Lcom/edutech/appmanage/utils/PackageUtils;->isEmpty(Ljava/util/List;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 526
    const/4 v3, 0x0

    :try_start_0
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/ActivityManager$RunningTaskInfo;

    iget-object v3, v3, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 527
    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .line 526
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 528
    :catch_0
    move-exception v1

    .line 529
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 530
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_0
.end method

.method public static startInstalledAppDetails(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 647
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 648
    .local v0, "intent":Landroid/content/Intent;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 649
    .local v1, "sdkVersion":I
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x9

    if-lt v2, v3, :cond_0

    .line 650
    const-string/jumbo v2, "android.settings.APPLICATION_DETAILS_SETTINGS"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 651
    const-string/jumbo v2, "package"

    const/4 v3, 0x0

    invoke-static {v2, p1, v3}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 659
    :goto_0
    const/high16 v2, 0x10000000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 660
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 661
    return-void

    .line 653
    :cond_0
    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 654
    const-string/jumbo v2, "com.android.settings"

    .line 655
    const-string/jumbo v3, "com.android.settings.InstalledAppDetails"

    .line 654
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 656
    const/16 v2, 0x8

    if-ne v1, v2, :cond_1

    const-string/jumbo v2, "pkg"

    :goto_1
    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 657
    :cond_1
    const-string/jumbo v2, "com.android.settings.ApplicationPkgName"

    goto :goto_1
.end method

.method public static final uninstall(Landroid/content/Context;Ljava/lang/String;)I
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 339
    invoke-static {p0}, Lcom/edutech/appmanage/utils/PackageUtils;->isSystemApplication(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 340
    invoke-static {}, Lcom/edutech/appmanage/utils/ShellUtils;->checkRootPermission()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 341
    :cond_0
    invoke-static {p0, p1}, Lcom/edutech/appmanage/utils/PackageUtils;->uninstallSilent(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    .line 343
    :goto_0
    return v0

    :cond_1
    invoke-static {p0, p1}, Lcom/edutech/appmanage/utils/PackageUtils;->uninstallNormal(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    .line 344
    :cond_2
    const/4 v0, -0x3

    goto :goto_0
.end method

.method public static uninstallNormal(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 356
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 357
    :cond_0
    const/4 v1, 0x0

    .line 365
    :goto_0
    return v1

    .line 360
    :cond_1
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.DELETE"

    .line 361
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v3, 0x20

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "package:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 362
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 361
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 360
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 363
    .local v0, "i":Landroid/content/Intent;
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 364
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 365
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static uninstallSilent(Landroid/content/Context;Ljava/lang/String;)I
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 378
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/edutech/appmanage/utils/PackageUtils;->uninstallSilent(Landroid/content/Context;Ljava/lang/String;Z)I

    move-result v0

    return v0
.end method

.method public static uninstallSilent(Landroid/content/Context;Ljava/lang/String;Z)I
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "isKeepData"    # Z

    .prologue
    const/4 v4, -0x1

    const/4 v3, 0x1

    .line 407
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_2

    .line 408
    :cond_0
    const/4 v3, -0x3

    .line 437
    :cond_1
    :goto_0
    return v3

    .line 416
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 417
    const-string/jumbo v5, "LD_LIBRARY_PATH=/vendor/lib:/system/lib pm uninstall"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 418
    if-eqz p2, :cond_4

    const-string/jumbo v2, " -k "

    :goto_1
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 419
    const-string/jumbo v5, " "

    const-string/jumbo v6, "\\ "

    invoke-virtual {p1, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 421
    .local v0, "command":Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0}, Lcom/edutech/appmanage/utils/PackageUtils;->isSystemApplication(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v2, 0x0

    .line 420
    :goto_2
    invoke-static {v5, v2, v3}, Lcom/edutech/appmanage/utils/ShellUtils;->execCommand(Ljava/lang/String;ZZ)Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;

    move-result-object v1

    .line 422
    .local v1, "commandResult":Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;
    iget-object v2, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->successMsg:Ljava/lang/String;

    if-eqz v2, :cond_3

    .line 423
    iget-object v2, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->successMsg:Ljava/lang/String;

    const-string/jumbo v5, "Success"

    invoke-virtual {v2, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->successMsg:Ljava/lang/String;

    .line 424
    const-string/jumbo v5, "success"

    invoke-virtual {v2, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 427
    :cond_3
    const-string/jumbo v2, "PackageUtils"

    .line 428
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "uninstallSilent successMsg:"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 429
    iget-object v5, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->successMsg:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, ", ErrorMsg:"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 430
    iget-object v5, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 427
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 431
    iget-object v2, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    if-nez v2, :cond_6

    move v3, v4

    .line 432
    goto :goto_0

    .line 418
    .end local v0    # "command":Ljava/lang/StringBuilder;
    .end local v1    # "commandResult":Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;
    :cond_4
    const-string/jumbo v2, " "

    goto :goto_1

    .restart local v0    # "command":Ljava/lang/StringBuilder;
    :cond_5
    move v2, v3

    .line 421
    goto :goto_2

    .line 434
    .restart local v1    # "commandResult":Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;
    :cond_6
    iget-object v2, v1, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->errorMsg:Ljava/lang/String;

    const-string/jumbo v3, "Permission denied"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 435
    const/4 v3, -0x4

    goto/16 :goto_0

    :cond_7
    move v3, v4

    .line 437
    goto/16 :goto_0
.end method
