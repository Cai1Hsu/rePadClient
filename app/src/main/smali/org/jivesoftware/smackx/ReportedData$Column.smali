.class public Lorg/jivesoftware/smackx/ReportedData$Column;
.super Ljava/lang/Object;
.source "ReportedData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/ReportedData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Column"
.end annotation


# instance fields
.field private label:Ljava/lang/String;

.field private type:Ljava/lang/String;

.field private variable:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "label"    # Ljava/lang/String;
    .param p2, "variable"    # Ljava/lang/String;
    .param p3, "type"    # Ljava/lang/String;

    .prologue
    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 169
    iput-object p1, p0, Lorg/jivesoftware/smackx/ReportedData$Column;->label:Ljava/lang/String;

    .line 170
    iput-object p2, p0, Lorg/jivesoftware/smackx/ReportedData$Column;->variable:Ljava/lang/String;

    .line 171
    iput-object p3, p0, Lorg/jivesoftware/smackx/ReportedData$Column;->type:Ljava/lang/String;

    .line 172
    return-void
.end method


# virtual methods
.method public getLabel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lorg/jivesoftware/smackx/ReportedData$Column;->label:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 206
    iget-object v0, p0, Lorg/jivesoftware/smackx/ReportedData$Column;->type:Ljava/lang/String;

    return-object v0
.end method

.method public getVariable()Ljava/lang/String;
    .locals 1

    .prologue
    .line 216
    iget-object v0, p0, Lorg/jivesoftware/smackx/ReportedData$Column;->variable:Ljava/lang/String;

    return-object v0
.end method
