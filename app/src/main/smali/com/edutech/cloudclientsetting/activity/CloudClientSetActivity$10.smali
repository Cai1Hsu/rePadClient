.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$10;
.super Ljava/lang/Object;
.source "CloudClientSetActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;


# direct methods
.method constructor <init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$10;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    .line 2702
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 32

    .prologue
    .line 2708
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$10;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v4, v4, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->id:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0xa

    if-ge v4, v5, :cond_0

    .line 2709
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$10;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const-string/jumbo v5, "\u6388\u6743\u7801\u683c\u5f0f\u4e0d\u5bf9\uff01"

    invoke-virtual {v4, v5}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showToast(Ljava/lang/String;)V

    .line 2819
    :goto_0
    return-void

    .line 2713
    :cond_0
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x18

    if-lt v4, v5, :cond_1

    .line 2715
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$10;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v4}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$50(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    goto :goto_0

    .line 2718
    :cond_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$10;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    new-instance v5, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v5}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    invoke-static {v4, v5}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$51(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Lorg/apache/http/client/HttpClient;)Lorg/apache/http/client/HttpClient;

    move-result-object v17

    .line 2719
    .local v17, "httpClient":Lorg/apache/http/client/HttpClient;
    const-string/jumbo v28, "https://www.icontrol365.com/regmac.aspx"

    .line 2722
    .local v28, "url":Ljava/lang/String;
    new-instance v18, Lorg/apache/http/client/methods/HttpPost;

    const-string/jumbo v4, "https://www.icontrol365.com/regmac.aspx"

    move-object/from16 v0, v18

    invoke-direct {v0, v4}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 2723
    .local v18, "httpPost":Lorg/apache/http/client/methods/HttpPost;
    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    .line 2724
    .local v29, "xml":Ljava/lang/StringBuilder;
    const-string/jumbo v4, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2725
    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "<ApplyAuth><strAuthID>"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$10;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v5, v5, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->id:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 2726
    const-string/jumbo v5, "</strAuthID>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2725
    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2727
    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "<strMacAddr>"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$10;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v5}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->GetMachineID()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "</strMacAddr>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2728
    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "<strSystemInfo>"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 2729
    const-string/jumbo v5, "</strSystemInfo></ApplyAuth>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2728
    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2731
    :try_start_0
    const-string/jumbo v4, "Content-Type"

    .line 2732
    const-string/jumbo v5, "application/xml;charset=UTF-8"

    .line 2731
    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v5}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 2733
    new-instance v4, Lorg/apache/http/entity/StringEntity;

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    .line 2740
    :goto_1
    :try_start_1
    invoke-interface/range {v17 .. v18}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v23

    .line 2741
    .local v23, "response":Lorg/apache/http/HttpResponse;
    invoke-interface/range {v23 .. v23}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v26

    .line 2742
    .local v26, "status":Lorg/apache/http/StatusLine;
    invoke-interface/range {v26 .. v26}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v4

    const/16 v5, 0xc8

    if-eq v4, v5, :cond_2

    .line 2743
    const-string/jumbo v4, "SSL"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v9, "HTTP error, invalid server status code: "

    invoke-direct {v5, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2744
    invoke-interface/range {v23 .. v23}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2743
    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Lorg/xml/sax/SAXException; {:try_start_1 .. :try_end_1} :catch_5

    goto/16 :goto_0

    .line 2803
    .end local v23    # "response":Lorg/apache/http/HttpResponse;
    .end local v26    # "status":Lorg/apache/http/StatusLine;
    :catch_0
    move-exception v12

    .line 2805
    .local v12, "e":Lorg/apache/http/client/ClientProtocolException;
    invoke-virtual {v12}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    goto/16 :goto_0

    .line 2734
    .end local v12    # "e":Lorg/apache/http/client/ClientProtocolException;
    :catch_1
    move-exception v15

    .line 2736
    .local v15, "e3":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v15}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_1

    .line 2747
    .end local v15    # "e3":Ljava/io/UnsupportedEncodingException;
    .restart local v23    # "response":Lorg/apache/http/HttpResponse;
    .restart local v26    # "status":Lorg/apache/http/StatusLine;
    :cond_2
    :try_start_2
    new-instance v22, Ljava/io/ByteArrayOutputStream;

    invoke-direct/range {v22 .. v22}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 2748
    .local v22, "outStream":Ljava/io/ByteArrayOutputStream;
    invoke-interface/range {v23 .. v23}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v20

    .line 2751
    .local v20, "in":Ljava/io/InputStream;
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v16

    .line 2752
    .local v16, "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual/range {v16 .. v16}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v10

    .line 2754
    .local v10, "builder":Ljavax/xml/parsers/DocumentBuilder;
    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v11

    .line 2756
    .local v11, "doc":Lorg/w3c/dom/Document;
    invoke-interface {v11}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v24

    .line 2761
    .local v24, "root":Lorg/w3c/dom/Element;
    const-string/jumbo v4, "AuthResult"

    move-object/from16 v0, v24

    invoke-interface {v0, v4}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 2762
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v4

    .line 2760
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 2763
    .local v6, "result":I
    const/4 v4, 0x4

    if-eq v6, v4, :cond_3

    const/4 v4, 0x5

    if-ne v6, v4, :cond_4

    .line 2765
    :cond_3
    const/16 v27, 0x0

    .line 2766
    .local v27, "tmpnode":Lorg/w3c/dom/NodeList;
    const/4 v7, 0x0

    .line 2767
    .local v7, "times":Ljava/lang/String;
    const-string/jumbo v4, "AuthTimes"

    move-object/from16 v0, v24

    invoke-interface {v0, v4}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v27

    .line 2769
    invoke-interface/range {v27 .. v27}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-lez v4, :cond_5

    .line 2770
    const/4 v4, 0x0

    move-object/from16 v0, v27

    invoke-interface {v0, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v4

    .line 2771
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_5

    .line 2772
    const/4 v4, 0x0

    move-object/from16 v0, v27

    invoke-interface {v0, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v4

    .line 2773
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v7

    .line 2777
    :goto_2
    const/4 v8, 0x0

    .line 2778
    .local v8, "date":Ljava/lang/String;
    const-string/jumbo v4, "AuthValidDate"

    move-object/from16 v0, v24

    invoke-interface {v0, v4}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v27

    .line 2779
    invoke-interface/range {v27 .. v27}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-lez v4, :cond_6

    .line 2780
    const/4 v4, 0x0

    move-object/from16 v0, v27

    invoke-interface {v0, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v4

    .line 2781
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_6

    .line 2782
    const/4 v4, 0x0

    move-object/from16 v0, v27

    invoke-interface {v0, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v4

    .line 2783
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v8

    .line 2787
    :goto_3
    const/16 v19, 0x0

    .line 2789
    .local v19, "idInfo":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget v25, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2794
    .local v25, "sdk_version":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$10;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v4, v4, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth:Lcom/edutech/idauthentication/MainActivity;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$10;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v5, v5, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->id:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2795
    const-string/jumbo v9, "0"

    .line 2794
    invoke-virtual/range {v4 .. v9}, Lcom/edutech/idauthentication/MainActivity;->writeidFile(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2798
    .end local v7    # "times":Ljava/lang/String;
    .end local v8    # "date":Ljava/lang/String;
    .end local v19    # "idInfo":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v25    # "sdk_version":I
    .end local v27    # "tmpnode":Lorg/w3c/dom/NodeList;
    :cond_4
    new-instance v21, Landroid/os/Message;

    invoke-direct/range {v21 .. v21}, Landroid/os/Message;-><init>()V

    .line 2799
    .local v21, "msg":Landroid/os/Message;
    move-object/from16 v0, v21

    iput v6, v0, Landroid/os/Message;->what:I

    .line 2800
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$10;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v4}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v4

    const-wide/16 v30, 0x3e8

    move-object/from16 v0, v21

    move-wide/from16 v1, v30

    invoke-virtual {v4, v0, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z
    :try_end_2
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Lorg/xml/sax/SAXException; {:try_start_2 .. :try_end_2} :catch_5

    goto/16 :goto_0

    .line 2806
    .end local v6    # "result":I
    .end local v10    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v11    # "doc":Lorg/w3c/dom/Document;
    .end local v16    # "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v20    # "in":Ljava/io/InputStream;
    .end local v21    # "msg":Landroid/os/Message;
    .end local v22    # "outStream":Ljava/io/ByteArrayOutputStream;
    .end local v23    # "response":Lorg/apache/http/HttpResponse;
    .end local v24    # "root":Lorg/w3c/dom/Element;
    .end local v26    # "status":Lorg/apache/http/StatusLine;
    :catch_2
    move-exception v12

    .line 2808
    .local v12, "e":Ljava/io/IOException;
    invoke-virtual {v12}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0

    .line 2775
    .end local v12    # "e":Ljava/io/IOException;
    .restart local v6    # "result":I
    .restart local v7    # "times":Ljava/lang/String;
    .restart local v10    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .restart local v11    # "doc":Lorg/w3c/dom/Document;
    .restart local v16    # "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .restart local v20    # "in":Ljava/io/InputStream;
    .restart local v22    # "outStream":Ljava/io/ByteArrayOutputStream;
    .restart local v23    # "response":Lorg/apache/http/HttpResponse;
    .restart local v24    # "root":Lorg/w3c/dom/Element;
    .restart local v26    # "status":Lorg/apache/http/StatusLine;
    .restart local v27    # "tmpnode":Lorg/w3c/dom/NodeList;
    :cond_5
    :try_start_3
    const-string/jumbo v7, "0"

    goto :goto_2

    .line 2785
    .restart local v8    # "date":Ljava/lang/String;
    :cond_6
    const-string/jumbo v8, "0"
    :try_end_3
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Lorg/xml/sax/SAXException; {:try_start_3 .. :try_end_3} :catch_5

    goto :goto_3

    .line 2809
    .end local v6    # "result":I
    .end local v7    # "times":Ljava/lang/String;
    .end local v8    # "date":Ljava/lang/String;
    .end local v10    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v11    # "doc":Lorg/w3c/dom/Document;
    .end local v16    # "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v20    # "in":Ljava/io/InputStream;
    .end local v22    # "outStream":Ljava/io/ByteArrayOutputStream;
    .end local v23    # "response":Lorg/apache/http/HttpResponse;
    .end local v24    # "root":Lorg/w3c/dom/Element;
    .end local v26    # "status":Lorg/apache/http/StatusLine;
    .end local v27    # "tmpnode":Lorg/w3c/dom/NodeList;
    :catch_3
    move-exception v13

    .line 2811
    .local v13, "e1":Ljavax/xml/parsers/ParserConfigurationException;
    invoke-virtual {v13}, Ljavax/xml/parsers/ParserConfigurationException;->printStackTrace()V

    goto/16 :goto_0

    .line 2812
    .end local v13    # "e1":Ljavax/xml/parsers/ParserConfigurationException;
    :catch_4
    move-exception v14

    .line 2814
    .local v14, "e2":Ljava/lang/IllegalStateException;
    invoke-virtual {v14}, Ljava/lang/IllegalStateException;->printStackTrace()V

    goto/16 :goto_0

    .line 2815
    .end local v14    # "e2":Ljava/lang/IllegalStateException;
    :catch_5
    move-exception v12

    .line 2817
    .local v12, "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v12}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto/16 :goto_0
.end method
