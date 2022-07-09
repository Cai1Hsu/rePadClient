.class Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$1;
.super Ljava/lang/Object;
.source "PasswdDialogActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->showDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

.field private final synthetic val$passwdEdit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;Landroid/widget/EditText;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    iput-object p2, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$1;->val$passwdEdit:Landroid/widget/EditText;

    .line 285
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 10
    .param p1, "arg0"    # Landroid/content/DialogInterface;
    .param p2, "arg1"    # I

    .prologue
    .line 290
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    iget-object v4, v6, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->PWD:Ljava/lang/String;

    .line 291
    .local v4, "passwd":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_0

    .line 294
    const-string/jumbo v4, "ayjedutechyx@123456z"

    .line 302
    :cond_0
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$1;->val$passwdEdit:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-interface {v6}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 304
    const/4 v6, 0x0

    sput v6, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->showDialogNumber:I

    .line 305
    const-wide/16 v6, 0x0

    sput-wide v6, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->startTime:J

    .line 306
    new-instance v3, Landroid/content/Intent;

    const-string/jumbo v6, "PASSWDPASS"

    invoke-direct {v3, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 307
    .local v3, "intentLock":Landroid/content/Intent;
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    invoke-virtual {v6, v3}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 308
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->access$1(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;Ljava/lang/Integer;)V

    .line 309
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    const-string/jumbo v7, "lockscreen"

    const/4 v8, 0x4

    invoke-virtual {v6, v7, v8}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 310
    .local v5, "spf":Landroid/content/SharedPreferences;
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    const-string/jumbo v7, "tmplocked"

    const/4 v8, 0x0

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 311
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    const-string/jumbo v7, "showstarttime"

    const-wide/16 v8, 0x0

    invoke-interface {v6, v7, v8, v9}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 312
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    const-string/jumbo v7, "shownumber"

    const/4 v8, 0x1

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 313
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    invoke-virtual {v6}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->finish()V

    .line 339
    .end local v3    # "intentLock":Landroid/content/Intent;
    .end local v5    # "spf":Landroid/content/SharedPreferences;
    :goto_0
    return-void

    .line 317
    :cond_1
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    invoke-static {v6}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->access$2(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->access$1(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;Ljava/lang/Integer;)V

    .line 318
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    invoke-static {v6}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->access$2(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/4 v7, 0x3

    if-ge v6, v7, :cond_2

    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    invoke-static {v6}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->access$3(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;)I

    move-result v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_4

    .line 320
    :cond_2
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    invoke-static {v6}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->access$2(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/4 v7, 0x3

    if-lt v6, v7, :cond_3

    sget v6, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->showDialogNumber:I

    add-int/lit8 v6, v6, 0x1

    sput v6, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->showDialogNumber:I

    .line 321
    :cond_3
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->access$1(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;Ljava/lang/Integer;)V

    .line 322
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v6, "android.intent.action.MAIN"

    invoke-direct {v2, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 323
    .local v2, "intent":Landroid/content/Intent;
    const v6, 0x10008000

    invoke-virtual {v2, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 324
    const-string/jumbo v6, "android.intent.category.LAUNCHER"

    invoke-virtual {v2, v6}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 325
    new-instance v0, Landroid/content/ComponentName;

    const-string/jumbo v6, "com.launcher.activity"

    const-string/jumbo v7, "com.edutech.mobilestudyclient.activity.CloudClientActivity"

    invoke-direct {v0, v6, v7}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 326
    .local v0, "cn":Landroid/content/ComponentName;
    invoke-virtual {v2, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 327
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    invoke-virtual {v6, v2}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->startActivity(Landroid/content/Intent;)V

    .line 328
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    invoke-virtual {v6}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->finish()V

    .line 331
    .end local v0    # "cn":Landroid/content/ComponentName;
    .end local v2    # "intent":Landroid/content/Intent;
    :cond_4
    const-wide/16 v6, 0xc8

    :try_start_0
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 336
    :goto_1
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    invoke-virtual {v6}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->showDialog()V

    goto :goto_0

    .line 332
    :catch_0
    move-exception v1

    .line 334
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1
.end method
