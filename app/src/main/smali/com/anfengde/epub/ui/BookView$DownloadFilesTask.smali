.class Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;
.super Landroid/os/AsyncTask;
.source "BookView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/anfengde/epub/ui/BookView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DownloadFilesTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/anfengde/epub/ui/BookView;


# direct methods
.method private constructor <init>(Lcom/anfengde/epub/ui/BookView;)V
    .locals 0

    .prologue
    .line 678
    iput-object p1, p0, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/anfengde/epub/ui/BookView;Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;)V
    .locals 0

    .prologue
    .line 678
    invoke-direct {p0, p1}, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;-><init>(Lcom/anfengde/epub/ui/BookView;)V

    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 32
    .param p1, "urls"    # [Ljava/lang/String;

    .prologue
    .line 680
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->this$0:Lcom/anfengde/epub/ui/BookView;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/anfengde/epub/ui/BookView;->access$34(Lcom/anfengde/epub/ui/BookView;)Z

    move-result v25

    if-eqz v25, :cond_0

    .line 681
    const-string/jumbo v11, "Downloading!"

    .line 756
    :goto_0
    return-object v11

    .line 682
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->this$0:Lcom/anfengde/epub/ui/BookView;

    move-object/from16 v25, v0

    const/16 v26, 0x1

    invoke-static/range {v25 .. v26}, Lcom/anfengde/epub/ui/BookView;->access$35(Lcom/anfengde/epub/ui/BookView;Z)V

    .line 683
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->this$0:Lcom/anfengde/epub/ui/BookView;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/anfengde/epub/ui/BookView;->access$19(Lcom/anfengde/epub/ui/BookView;)Ljava/lang/String;

    move-result-object v6

    .line 684
    .local v6, "dir":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->this$0:Lcom/anfengde/epub/ui/BookView;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/anfengde/epub/ui/BookView;->access$36(Lcom/anfengde/epub/ui/BookView;)Z

    move-result v25

    if-nez v25, :cond_1

    .line 686
    const-string/jumbo v11, "Download Error!"

    goto :goto_0

    .line 688
    :cond_1
    const/16 v25, 0x0

    aget-object v24, p1, v25

    .line 690
    .local v24, "urlPath":Ljava/lang/String;
    const/4 v11, 0x0

    .line 691
    .local v11, "filePath":Ljava/lang/String;
    const-string/jumbo v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v25

    if-eqz v25, :cond_2

    .line 692
    const/16 v25, 0x0

    const/16 v26, 0x4

    invoke-virtual/range {v24 .. v26}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v25

    const-string/jumbo v26, "http"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_3

    .line 694
    :cond_2
    const-string/jumbo v11, "Download Error!"

    goto :goto_0

    .line 696
    :cond_3
    const-string/jumbo v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v17

    .line 697
    .local v17, "paths":[Ljava/lang/String;
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v25, v0

    add-int/lit8 v25, v25, -0x1

    aget-object v10, v17, v25

    .line 698
    .local v10, "fileName":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v20

    .line 699
    .local v20, "size":I
    const/4 v14, 0x0

    .line 701
    .local v14, "output":Ljava/io/OutputStream;
    :try_start_0
    const-string/jumbo v25, "ContentLength"

    const-string/jumbo v26, "ContentLength:fileLength"

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 702
    const-string/jumbo v25, "UTF-8"

    move-object/from16 v0, v25

    invoke-static {v10, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    const-string/jumbo v26, "+"

    .line 703
    const-string/jumbo v27, "%20"

    .line 702
    invoke-virtual/range {v25 .. v27}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v21

    .line 704
    .local v21, "temp":Ljava/lang/String;
    new-instance v25, Ljava/lang/StringBuilder;

    const/16 v26, 0x0

    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->length()I

    move-result v27

    sub-int v27, v27, v20

    move-object/from16 v0, v24

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v26 .. v26}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    invoke-direct/range {v25 .. v26}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 705
    move-object/from16 v0, v25

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    .line 704
    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 706
    .local v22, "tempUrl":Ljava/lang/String;
    new-instance v23, Ljava/net/URL;

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 707
    .local v23, "url":Ljava/net/URL;
    const/16 v25, 0x0

    invoke-static/range {v25 .. v25}, Ljava/net/HttpURLConnection;->setFollowRedirects(Z)V

    .line 710
    invoke-virtual/range {v23 .. v23}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v5

    .line 709
    check-cast v5, Ljava/net/HttpURLConnection;

    .line 712
    .local v5, "conn":Ljava/net/HttpURLConnection;
    const/16 v25, 0x1388

    move/from16 v0, v25

    invoke-virtual {v5, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 713
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v9

    .line 714
    .local v9, "fileLength":I
    const-string/jumbo v25, "ContentLength"

    new-instance v26, Ljava/lang/StringBuilder;

    const-string/jumbo v27, "ContentLength:"

    invoke-direct/range {v26 .. v27}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v26

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 715
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v25

    const/16 v26, 0xc8

    move/from16 v0, v25

    move/from16 v1, v26

    if-ne v0, v1, :cond_4

    .line 716
    const/16 v25, 0x3e8

    move/from16 v0, v25

    if-ge v9, v0, :cond_5

    .line 717
    :cond_4
    const-string/jumbo v11, "Download Error!"

    goto/16 :goto_0

    .line 718
    :cond_5
    :try_start_1
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    invoke-direct/range {v25 .. v26}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v26, "/"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 719
    .local v16, "pathName":Ljava/lang/String;
    new-instance v8, Ljava/io/File;

    move-object/from16 v0, v16

    invoke-direct {v8, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 720
    .local v8, "file":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v25

    if-eqz v25, :cond_6

    .line 721
    invoke-virtual {v8}, Ljava/io/File;->delete()Z

    .line 724
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->this$0:Lcom/anfengde/epub/ui/BookView;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-static/range {v25 .. v26}, Lcom/anfengde/epub/ui/BookView;->access$33(Lcom/anfengde/epub/ui/BookView;Z)V

    .line 725
    new-instance v12, Ljava/io/BufferedInputStream;

    .line 726
    invoke-virtual/range {v23 .. v23}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v25

    .line 725
    move-object/from16 v0, v25

    invoke-direct {v12, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 727
    .local v12, "input":Ljava/io/InputStream;
    new-instance v25, Ljava/io/File;

    move-object/from16 v0, v25

    invoke-direct {v0, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->mkdir()Z

    .line 728
    invoke-virtual {v8}, Ljava/io/File;->createNewFile()Z

    .line 729
    new-instance v15, Ljava/io/FileOutputStream;

    invoke-direct {v15, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 730
    .end local v14    # "output":Ljava/io/OutputStream;
    .local v15, "output":Ljava/io/OutputStream;
    const/16 v25, 0x1000

    :try_start_2
    move/from16 v0, v25

    new-array v4, v0, [B

    .line 731
    .local v4, "buffer":[B
    const-wide/16 v18, 0x0

    .line 733
    .local v18, "recivedLength":J
    :cond_7
    invoke-virtual {v12, v4}, Ljava/io/InputStream;->read([B)I

    move-result v13

    .local v13, "len":I
    const/16 v25, -0x1

    move/from16 v0, v25

    if-ne v13, v0, :cond_8

    .line 746
    invoke-virtual {v15}, Ljava/io/OutputStream;->flush()V

    .line 747
    invoke-virtual {v15}, Ljava/io/OutputStream;->close()V

    .line 748
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V

    .line 749
    move-object/from16 v11, v16

    move-object v14, v15

    .line 751
    .end local v15    # "output":Ljava/io/OutputStream;
    .restart local v14    # "output":Ljava/io/OutputStream;
    goto/16 :goto_0

    .line 734
    .end local v14    # "output":Ljava/io/OutputStream;
    .restart local v15    # "output":Ljava/io/OutputStream;
    :cond_8
    int-to-long v0, v13

    move-wide/from16 v26, v0

    add-long v18, v18, v26

    .line 735
    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Integer;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    const-wide/16 v28, 0x64

    mul-long v28, v28, v18

    int-to-long v0, v9

    move-wide/from16 v30, v0

    div-long v28, v28, v30

    move-wide/from16 v0, v28

    long-to-int v0, v0

    move/from16 v27, v0

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v27

    aput-object v27, v25, v26

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->publishProgress([Ljava/lang/Object;)V

    .line 736
    const/16 v25, 0x0

    move/from16 v0, v25

    invoke-virtual {v15, v4, v0, v13}, Ljava/io/OutputStream;->write([BII)V

    .line 737
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->this$0:Lcom/anfengde/epub/ui/BookView;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/anfengde/epub/ui/BookView;->access$37(Lcom/anfengde/epub/ui/BookView;)Z

    move-result v25

    if-eqz v25, :cond_7

    .line 738
    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Integer;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    const/16 v27, 0x0

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v27

    aput-object v27, v25, v26

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->publishProgress([Ljava/lang/Object;)V

    .line 739
    invoke-virtual {v15}, Ljava/io/OutputStream;->flush()V

    .line 740
    invoke-virtual {v15}, Ljava/io/OutputStream;->close()V

    .line 741
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V

    .line 742
    invoke-virtual {v8}, Ljava/io/File;->delete()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 743
    const-string/jumbo v11, "Cancel Download!"

    goto/16 :goto_0

    .line 751
    .end local v4    # "buffer":[B
    .end local v5    # "conn":Ljava/net/HttpURLConnection;
    .end local v8    # "file":Ljava/io/File;
    .end local v9    # "fileLength":I
    .end local v12    # "input":Ljava/io/InputStream;
    .end local v13    # "len":I
    .end local v15    # "output":Ljava/io/OutputStream;
    .end local v16    # "pathName":Ljava/lang/String;
    .end local v18    # "recivedLength":J
    .end local v21    # "temp":Ljava/lang/String;
    .end local v22    # "tempUrl":Ljava/lang/String;
    .end local v23    # "url":Ljava/net/URL;
    .restart local v14    # "output":Ljava/io/OutputStream;
    :catch_0
    move-exception v7

    .line 754
    .local v7, "e":Ljava/lang/Exception;
    :goto_1
    const-string/jumbo v11, "Download Error!"

    goto/16 :goto_0

    .line 751
    .end local v7    # "e":Ljava/lang/Exception;
    .end local v14    # "output":Ljava/io/OutputStream;
    .restart local v5    # "conn":Ljava/net/HttpURLConnection;
    .restart local v8    # "file":Ljava/io/File;
    .restart local v9    # "fileLength":I
    .restart local v12    # "input":Ljava/io/InputStream;
    .restart local v15    # "output":Ljava/io/OutputStream;
    .restart local v16    # "pathName":Ljava/lang/String;
    .restart local v21    # "temp":Ljava/lang/String;
    .restart local v22    # "tempUrl":Ljava/lang/String;
    .restart local v23    # "url":Ljava/net/URL;
    :catch_1
    move-exception v7

    move-object v14, v15

    .end local v15    # "output":Ljava/io/OutputStream;
    .restart local v14    # "output":Ljava/io/OutputStream;
    goto :goto_1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 765
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/BookView;->access$5(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/ui/EPubWebView;

    move-result-object v0

    const-string/jumbo v1, "javascript:setLoadingButtonStatus(0)"

    invoke-virtual {v0, v1}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    .line 766
    const-string/jumbo v0, "Cancel Download!"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 767
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0, v2}, Lcom/anfengde/epub/ui/BookView;->access$35(Lcom/anfengde/epub/ui/BookView;Z)V

    .line 786
    :cond_0
    :goto_0
    return-void

    .line 770
    :cond_1
    const-string/jumbo v0, "Downloading!"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 773
    const-string/jumbo v0, "Download Error!"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 774
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0, v2}, Lcom/anfengde/epub/ui/BookView;->access$35(Lcom/anfengde/epub/ui/BookView;Z)V

    .line 776
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/BookView;->access$24(Lcom/anfengde/epub/ui/BookView;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 777
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 779
    :cond_2
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0, p1}, Lcom/anfengde/epub/ui/BookView;->access$27(Lcom/anfengde/epub/ui/BookView;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 780
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0, v2}, Lcom/anfengde/epub/ui/BookView;->access$35(Lcom/anfengde/epub/ui/BookView;Z)V

    .line 781
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/BookView;->access$25(Lcom/anfengde/epub/ui/BookView;)V

    .line 782
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/BookView;->access$24(Lcom/anfengde/epub/ui/BookView;)Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "Download Success!"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 783
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Integer;)V
    .locals 3
    .param p1, "progress"    # [Ljava/lang/Integer;

    .prologue
    .line 760
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/BookView;->access$5(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/ui/EPubWebView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "javascript:downloadProgress("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    aget-object v2, p1, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 761
    const-string/jumbo v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 760
    invoke-virtual {v0, v1}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    .line 762
    return-void
.end method

.method protected bridge varargs synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->onProgressUpdate([Ljava/lang/Integer;)V

    return-void
.end method
