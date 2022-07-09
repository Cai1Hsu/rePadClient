.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$1;
.super Landroid/os/Handler;
.source "CloudClientActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    .line 1107
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 8
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 1110
    iget v5, p1, Landroid/os/Message;->what:I

    sparse-switch v5, :sswitch_data_0

    .line 1168
    :cond_0
    :goto_0
    :sswitch_0
    return-void

    .line 1112
    :sswitch_1
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v5}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$0(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    goto :goto_0

    .line 1115
    :sswitch_2
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    const/4 v6, 0x0

    invoke-static {v5, v6}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$1(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;)V

    .line 1116
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    const/16 v6, 0x12c

    invoke-static {v5, v6}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$2(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;I)V

    .line 1117
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v5}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$3(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    goto :goto_0

    .line 1120
    :sswitch_3
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v5, "android.intent.action.MAIN"

    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1121
    .local v2, "intent2":Landroid/content/Intent;
    const/high16 v5, 0x10000000

    invoke-virtual {v2, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1123
    new-instance v0, Landroid/content/ComponentName;

    const-string/jumbo v5, "com.edutech.assistantdemo"

    .line 1124
    const-string/jumbo v6, "com.edutech.assistantdemo.MainActivity"

    .line 1123
    invoke-direct {v0, v5, v6}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1125
    .local v0, "cn":Landroid/content/ComponentName;
    invoke-virtual {v2, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1128
    :try_start_0
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v5}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    .line 1129
    const-string/jumbo v6, "com.edutech.assistantdemo"

    const/4 v7, 0x0

    .line 1128
    invoke-virtual {v5, v6, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 1134
    .local v3, "packageInfo2":Landroid/content/pm/PackageInfo;
    :goto_1
    if-eqz v3, :cond_0

    .line 1135
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v5, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 1130
    .end local v3    # "packageInfo2":Landroid/content/pm/PackageInfo;
    :catch_0
    move-exception v1

    .line 1131
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v3, 0x0

    .line 1132
    .restart local v3    # "packageInfo2":Landroid/content/pm/PackageInfo;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_1

    .line 1141
    .end local v0    # "cn":Landroid/content/ComponentName;
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v2    # "intent2":Landroid/content/Intent;
    .end local v3    # "packageInfo2":Landroid/content/pm/PackageInfo;
    :sswitch_4
    :try_start_1
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v5}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$4(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 1142
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v5}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$4(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1144
    :cond_1
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v5}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$5(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 1145
    :catch_1
    move-exception v1

    .line 1147
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 1152
    .end local v1    # "e":Ljava/lang/Exception;
    :sswitch_5
    :try_start_2
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v5}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$5(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 1153
    :catch_2
    move-exception v1

    .line 1155
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 1161
    .end local v1    # "e":Ljava/lang/Exception;
    :sswitch_6
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    .line 1162
    .local v4, "path":Ljava/lang/String;
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v5, v4}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$6(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1110
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x3 -> :sswitch_2
        0x4 -> :sswitch_3
        0x1011 -> :sswitch_5
        0x1012 -> :sswitch_0
        0x1013 -> :sswitch_4
        0x1014 -> :sswitch_6
    .end sparse-switch
.end method
