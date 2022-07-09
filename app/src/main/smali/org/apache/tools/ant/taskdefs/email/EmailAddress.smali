.class public Lorg/apache/tools/ant/taskdefs/email/EmailAddress;
.super Ljava/lang/Object;
.source "EmailAddress.java"


# instance fields
.field private address:Ljava/lang/String;

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 14
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    const/4 v13, 0x0

    const/16 v12, 0x3e

    const/16 v11, 0x3c

    const/4 v10, 0x1

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/16 v4, 0x9

    .line 51
    .local v4, "minLen":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 54
    .local v3, "len":I
    const/16 v9, 0x9

    if-le v3, v9, :cond_3

    .line 55
    invoke-virtual {p1, v13}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-eq v9, v11, :cond_0

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v9, v11, :cond_3

    :cond_0
    add-int/lit8 v9, v3, -0x1

    invoke-virtual {p1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-eq v9, v12, :cond_1

    add-int/lit8 v9, v3, -0x2

    invoke-virtual {p1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v9, v12, :cond_3

    .line 57
    :cond_1
    invoke-direct {p0, p1, v10}, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;->trim(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;->address:Ljava/lang/String;

    .line 113
    :cond_2
    :goto_0
    return-void

    .line 62
    :cond_3
    const/4 v7, 0x0

    .line 63
    .local v7, "paramDepth":I
    const/4 v8, 0x0

    .line 64
    .local v8, "start":I
    const/4 v1, 0x0

    .line 65
    .local v1, "end":I
    const/4 v6, 0x0

    .line 66
    .local v6, "nStart":I
    const/4 v5, 0x0

    .line 68
    .local v5, "nEnd":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v3, :cond_9

    .line 69
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 70
    .local v0, "c":C
    const/16 v9, 0x28

    if-ne v0, v9, :cond_5

    .line 71
    add-int/lit8 v7, v7, 0x1

    .line 72
    if-nez v8, :cond_4

    .line 73
    move v1, v2

    .line 74
    add-int/lit8 v6, v2, 0x1

    .line 68
    :cond_4
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 76
    :cond_5
    const/16 v9, 0x29

    if-ne v0, v9, :cond_6

    .line 77
    add-int/lit8 v7, v7, -0x1

    .line 78
    if-nez v1, :cond_4

    .line 79
    add-int/lit8 v8, v2, 0x1

    .line 80
    move v5, v2

    goto :goto_2

    .line 82
    :cond_6
    if-nez v7, :cond_8

    if-ne v0, v11, :cond_8

    .line 83
    if-nez v8, :cond_7

    .line 84
    move v5, v2

    .line 86
    :cond_7
    add-int/lit8 v8, v2, 0x1

    goto :goto_2

    .line 87
    :cond_8
    if-nez v7, :cond_4

    if-ne v0, v12, :cond_4

    .line 88
    move v1, v2

    .line 89
    add-int/lit8 v9, v3, -0x1

    if-eq v1, v9, :cond_4

    .line 90
    add-int/lit8 v6, v2, 0x1

    goto :goto_2

    .line 96
    .end local v0    # "c":C
    :cond_9
    if-nez v1, :cond_a

    .line 97
    move v1, v3

    .line 100
    :cond_a
    if-nez v5, :cond_b

    .line 101
    move v5, v3

    .line 105
    :cond_b
    invoke-virtual {p1, v8, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9, v10}, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;->trim(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;->address:Ljava/lang/String;

    .line 106
    invoke-virtual {p1, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9, v13}, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;->trim(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;->name:Ljava/lang/String;

    .line 110
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;->name:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;->address:Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    add-int/2addr v9, v10

    if-le v9, v3, :cond_2

    .line 111
    const/4 v9, 0x0

    iput-object v9, p0, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;->name:Ljava/lang/String;

    goto :goto_0
.end method

.method private trim(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 7
    .param p1, "t"    # Ljava/lang/String;
    .param p2, "trimAngleBrackets"    # Z

    .prologue
    const/16 v6, 0x22

    const/16 v5, 0x20

    .line 120
    const/4 v1, 0x0

    .line 121
    .local v1, "start":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 122
    .local v0, "end":I
    const/4 v2, 0x0

    .line 124
    .local v2, "trim":Z
    :cond_0
    const/4 v2, 0x0

    .line 125
    add-int/lit8 v3, v0, -0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x29

    if-eq v3, v4, :cond_3

    add-int/lit8 v3, v0, -0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x3e

    if-ne v3, v4, :cond_1

    if-nez p2, :cond_3

    :cond_1
    add-int/lit8 v3, v0, -0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v6, :cond_2

    add-int/lit8 v3, v0, -0x2

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x5c

    if-ne v3, v4, :cond_3

    :cond_2
    add-int/lit8 v3, v0, -0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-gt v3, v5, :cond_4

    .line 129
    :cond_3
    const/4 v2, 0x1

    .line 130
    add-int/lit8 v0, v0, -0x1

    .line 132
    :cond_4
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x28

    if-eq v3, v4, :cond_6

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x3c

    if-ne v3, v4, :cond_5

    if-nez p2, :cond_6

    :cond_5
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v3, v6, :cond_6

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-gt v3, v5, :cond_7

    .line 136
    :cond_6
    const/4 v2, 0x1

    .line 137
    add-int/lit8 v1, v1, 0x1

    .line 139
    :cond_7
    if-nez v2, :cond_0

    .line 140
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method


# virtual methods
.method public getAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;->address:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;->name:Ljava/lang/String;

    return-object v0
.end method

.method public setAddress(Ljava/lang/String;)V
    .locals 0
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 160
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;->address:Ljava/lang/String;

    .line 161
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 150
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;->name:Ljava/lang/String;

    .line 151
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 170
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;->name:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 171
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;->address:Ljava/lang/String;

    .line 173
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " <"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;->address:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
