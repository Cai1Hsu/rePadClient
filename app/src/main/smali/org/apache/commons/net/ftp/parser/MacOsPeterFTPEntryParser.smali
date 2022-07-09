.class public Lorg/apache/commons/net/ftp/parser/MacOsPeterFTPEntryParser;
.super Lorg/apache/commons/net/ftp/parser/ConfigurableFTPFileEntryParserImpl;
.source "MacOsPeterFTPEntryParser.java"


# static fields
.field static final DEFAULT_DATE_FORMAT:Ljava/lang/String; = "MMM d yyyy"

.field static final DEFAULT_RECENT_DATE_FORMAT:Ljava/lang/String; = "MMM d HH:mm"

.field private static final REGEX:Ljava/lang/String; = "([bcdelfmpSs-])(((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-])))\\+?\\s+((folder\\s+)|((\\d+)\\s+(\\d+)\\s+))(\\d+)\\s+((?:\\d+[-/]\\d+[-/]\\d+)|(?:\\S{3}\\s+\\d{1,2})|(?:\\d{1,2}\\s+\\S{3}))\\s+(\\d+(?::\\d+)?)\\s+(\\S*)(\\s*.*)"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 97
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/ftp/parser/MacOsPeterFTPEntryParser;-><init>(Lorg/apache/commons/net/ftp/FTPClientConfig;)V

    .line 98
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/net/ftp/FTPClientConfig;)V
    .locals 1
    .param p1, "config"    # Lorg/apache/commons/net/ftp/FTPClientConfig;

    .prologue
    .line 114
    const-string/jumbo v0, "([bcdelfmpSs-])(((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-])))\\+?\\s+((folder\\s+)|((\\d+)\\s+(\\d+)\\s+))(\\d+)\\s+((?:\\d+[-/]\\d+[-/]\\d+)|(?:\\S{3}\\s+\\d{1,2})|(?:\\d{1,2}\\s+\\S{3}))\\s+(\\d+(?::\\d+)?)\\s+(\\S*)(\\s*.*)"

    invoke-direct {p0, v0}, Lorg/apache/commons/net/ftp/parser/ConfigurableFTPFileEntryParserImpl;-><init>(Ljava/lang/String;)V

    .line 115
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/ftp/parser/MacOsPeterFTPEntryParser;->configure(Lorg/apache/commons/net/ftp/FTPClientConfig;)V

    .line 116
    return-void
.end method


# virtual methods
.method protected getDefaultConfiguration()Lorg/apache/commons/net/ftp/FTPClientConfig;
    .locals 7

    .prologue
    const/4 v4, 0x0

    .line 271
    new-instance v0, Lorg/apache/commons/net/ftp/FTPClientConfig;

    const-string/jumbo v1, "UNIX"

    const-string/jumbo v2, "MMM d yyyy"

    const-string/jumbo v3, "MMM d HH:mm"

    move-object v5, v4

    move-object v6, v4

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/net/ftp/FTPClientConfig;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public parseFTPEntry(Ljava/lang/String;)Lorg/apache/commons/net/ftp/FTPFile;
    .locals 20
    .param p1, "entry"    # Ljava/lang/String;

    .prologue
    .line 129
    new-instance v7, Lorg/apache/commons/net/ftp/FTPFile;

    invoke-direct {v7}, Lorg/apache/commons/net/ftp/FTPFile;-><init>()V

    .line 130
    .local v7, "file":Lorg/apache/commons/net/ftp/FTPFile;
    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Lorg/apache/commons/net/ftp/FTPFile;->setRawListing(Ljava/lang/String;)V

    .line 132
    const/4 v12, 0x0

    .line 134
    .local v12, "isDevice":Z
    invoke-virtual/range {p0 .. p1}, Lorg/apache/commons/net/ftp/parser/MacOsPeterFTPEntryParser;->matches(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_8

    .line 136
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/parser/MacOsPeterFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v15

    .line 137
    .local v15, "typeStr":Ljava/lang/String;
    const-string/jumbo v11, "0"

    .line 138
    .local v11, "hardLinkCount":Ljava/lang/String;
    const/16 v16, 0x0

    .line 139
    .local v16, "usr":Ljava/lang/String;
    const/4 v10, 0x0

    .line 140
    .local v10, "grp":Ljava/lang/String;
    const/16 v17, 0x14

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/parser/MacOsPeterFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v8

    .line 141
    .local v8, "filesize":Ljava/lang/String;
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v18, 0x15

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/parser/MacOsPeterFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, " "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x16

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/parser/MacOsPeterFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 142
    .local v3, "datestr":Ljava/lang/String;
    const/16 v17, 0x17

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/parser/MacOsPeterFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v13

    .line 143
    .local v13, "name":Ljava/lang/String;
    const/16 v17, 0x18

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/parser/MacOsPeterFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v5

    .line 147
    .local v5, "endtoken":Ljava/lang/String;
    :try_start_0
    move-object/from16 v0, p0

    invoke-super {v0, v3}, Lorg/apache/commons/net/ftp/parser/ConfigurableFTPFileEntryParserImpl;->parseTimestamp(Ljava/lang/String;)Ljava/util/Calendar;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Lorg/apache/commons/net/ftp/FTPFile;->setTimestamp(Ljava/util/Calendar;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_2

    .line 158
    :goto_0
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->charAt(I)C

    move-result v17

    sparse-switch v17, :sswitch_data_0

    .line 179
    const/4 v14, 0x3

    .line 182
    .local v14, "type":I
    :goto_1
    invoke-virtual {v7, v14}, Lorg/apache/commons/net/ftp/FTPFile;->setType(I)V

    .line 184
    const/4 v9, 0x4

    .line 185
    .local v9, "g":I
    const/4 v2, 0x0

    .local v2, "access":I
    :goto_2
    const/16 v17, 0x3

    move/from16 v0, v17

    if-ge v2, v0, :cond_3

    .line 188
    const/16 v18, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lorg/apache/commons/net/ftp/parser/MacOsPeterFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v17

    const-string/jumbo v19, "-"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_0

    const/16 v17, 0x1

    :goto_3
    move/from16 v0, v18

    move/from16 v1, v17

    invoke-virtual {v7, v2, v0, v1}, Lorg/apache/commons/net/ftp/FTPFile;->setPermission(IIZ)V

    .line 190
    const/16 v18, 0x1

    add-int/lit8 v17, v9, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/parser/MacOsPeterFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v17

    const-string/jumbo v19, "-"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_1

    const/16 v17, 0x1

    :goto_4
    move/from16 v0, v18

    move/from16 v1, v17

    invoke-virtual {v7, v2, v0, v1}, Lorg/apache/commons/net/ftp/FTPFile;->setPermission(IIZ)V

    .line 193
    add-int/lit8 v17, v9, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/parser/MacOsPeterFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v6

    .line 194
    .local v6, "execPerm":Ljava/lang/String;
    const-string/jumbo v17, "-"

    move-object/from16 v0, v17

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_2

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v6, v0}, Ljava/lang/String;->charAt(I)C

    move-result v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v17

    if-nez v17, :cond_2

    .line 196
    const/16 v17, 0x2

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v7, v2, v0, v1}, Lorg/apache/commons/net/ftp/FTPFile;->setPermission(IIZ)V

    .line 185
    :goto_5
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v9, v9, 0x4

    goto :goto_2

    .line 161
    .end local v2    # "access":I
    .end local v6    # "execPerm":Ljava/lang/String;
    .end local v9    # "g":I
    .end local v14    # "type":I
    :sswitch_0
    const/4 v14, 0x1

    .line 162
    .restart local v14    # "type":I
    goto :goto_1

    .line 164
    .end local v14    # "type":I
    :sswitch_1
    const/4 v14, 0x2

    .line 165
    .restart local v14    # "type":I
    goto/16 :goto_1

    .line 167
    .end local v14    # "type":I
    :sswitch_2
    const/4 v14, 0x2

    .line 168
    .restart local v14    # "type":I
    goto/16 :goto_1

    .line 171
    .end local v14    # "type":I
    :sswitch_3
    const/4 v12, 0x1

    .line 172
    const/4 v14, 0x0

    .line 173
    .restart local v14    # "type":I
    goto/16 :goto_1

    .line 176
    .end local v14    # "type":I
    :sswitch_4
    const/4 v14, 0x0

    .line 177
    .restart local v14    # "type":I
    goto/16 :goto_1

    .line 188
    .restart local v2    # "access":I
    .restart local v9    # "g":I
    :cond_0
    const/16 v17, 0x0

    goto :goto_3

    .line 190
    :cond_1
    const/16 v17, 0x0

    goto :goto_4

    .line 200
    .restart local v6    # "execPerm":Ljava/lang/String;
    :cond_2
    const/16 v17, 0x2

    const/16 v18, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v7, v2, v0, v1}, Lorg/apache/commons/net/ftp/FTPFile;->setPermission(IIZ)V

    goto :goto_5

    .line 204
    .end local v6    # "execPerm":Ljava/lang/String;
    :cond_3
    if-nez v12, :cond_4

    .line 208
    :try_start_1
    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v7, v0}, Lorg/apache/commons/net/ftp/FTPFile;->setHardLinkCount(I)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 216
    :cond_4
    :goto_6
    move-object/from16 v0, v16

    invoke-virtual {v7, v0}, Lorg/apache/commons/net/ftp/FTPFile;->setUser(Ljava/lang/String;)V

    .line 217
    invoke-virtual {v7, v10}, Lorg/apache/commons/net/ftp/FTPFile;->setGroup(Ljava/lang/String;)V

    .line 221
    :try_start_2
    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v18

    move-wide/from16 v0, v18

    invoke-virtual {v7, v0, v1}, Lorg/apache/commons/net/ftp/FTPFile;->setSize(J)V
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    .line 228
    :goto_7
    if-nez v5, :cond_5

    .line 230
    invoke-virtual {v7, v13}, Lorg/apache/commons/net/ftp/FTPFile;->setName(Ljava/lang/String;)V

    .line 260
    .end local v2    # "access":I
    .end local v3    # "datestr":Ljava/lang/String;
    .end local v5    # "endtoken":Ljava/lang/String;
    .end local v7    # "file":Lorg/apache/commons/net/ftp/FTPFile;
    .end local v8    # "filesize":Ljava/lang/String;
    .end local v9    # "g":I
    .end local v10    # "grp":Ljava/lang/String;
    .end local v11    # "hardLinkCount":Ljava/lang/String;
    .end local v13    # "name":Ljava/lang/String;
    .end local v14    # "type":I
    .end local v15    # "typeStr":Ljava/lang/String;
    .end local v16    # "usr":Ljava/lang/String;
    :goto_8
    return-object v7

    .line 236
    .restart local v2    # "access":I
    .restart local v3    # "datestr":Ljava/lang/String;
    .restart local v5    # "endtoken":Ljava/lang/String;
    .restart local v7    # "file":Lorg/apache/commons/net/ftp/FTPFile;
    .restart local v8    # "filesize":Ljava/lang/String;
    .restart local v9    # "g":I
    .restart local v10    # "grp":Ljava/lang/String;
    .restart local v11    # "hardLinkCount":Ljava/lang/String;
    .restart local v13    # "name":Ljava/lang/String;
    .restart local v14    # "type":I
    .restart local v15    # "typeStr":Ljava/lang/String;
    .restart local v16    # "usr":Ljava/lang/String;
    :cond_5
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 237
    const/16 v17, 0x2

    move/from16 v0, v17

    if-ne v14, v0, :cond_7

    .line 240
    const-string/jumbo v17, " -> "

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 242
    .local v4, "end":I
    const/16 v17, -0x1

    move/from16 v0, v17

    if-ne v4, v0, :cond_6

    .line 244
    invoke-virtual {v7, v13}, Lorg/apache/commons/net/ftp/FTPFile;->setName(Ljava/lang/String;)V

    goto :goto_8

    .line 248
    :cond_6
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v13, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Lorg/apache/commons/net/ftp/FTPFile;->setName(Ljava/lang/String;)V

    .line 249
    add-int/lit8 v17, v4, 0x4

    move/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Lorg/apache/commons/net/ftp/FTPFile;->setLink(Ljava/lang/String;)V

    goto :goto_8

    .line 255
    .end local v4    # "end":I
    :cond_7
    invoke-virtual {v7, v13}, Lorg/apache/commons/net/ftp/FTPFile;->setName(Ljava/lang/String;)V

    goto :goto_8

    .line 260
    .end local v2    # "access":I
    .end local v3    # "datestr":Ljava/lang/String;
    .end local v5    # "endtoken":Ljava/lang/String;
    .end local v8    # "filesize":Ljava/lang/String;
    .end local v9    # "g":I
    .end local v10    # "grp":Ljava/lang/String;
    .end local v11    # "hardLinkCount":Ljava/lang/String;
    .end local v13    # "name":Ljava/lang/String;
    .end local v14    # "type":I
    .end local v15    # "typeStr":Ljava/lang/String;
    .end local v16    # "usr":Ljava/lang/String;
    :cond_8
    const/4 v7, 0x0

    goto :goto_8

    .line 223
    .restart local v2    # "access":I
    .restart local v3    # "datestr":Ljava/lang/String;
    .restart local v5    # "endtoken":Ljava/lang/String;
    .restart local v8    # "filesize":Ljava/lang/String;
    .restart local v9    # "g":I
    .restart local v10    # "grp":Ljava/lang/String;
    .restart local v11    # "hardLinkCount":Ljava/lang/String;
    .restart local v13    # "name":Ljava/lang/String;
    .restart local v14    # "type":I
    .restart local v15    # "typeStr":Ljava/lang/String;
    .restart local v16    # "usr":Ljava/lang/String;
    :catch_0
    move-exception v17

    goto :goto_7

    .line 210
    :catch_1
    move-exception v17

    goto :goto_6

    .line 149
    .end local v2    # "access":I
    .end local v9    # "g":I
    .end local v14    # "type":I
    :catch_2
    move-exception v17

    goto/16 :goto_0

    .line 158
    nop

    :sswitch_data_0
    .sparse-switch
        0x2d -> :sswitch_4
        0x62 -> :sswitch_3
        0x63 -> :sswitch_3
        0x64 -> :sswitch_0
        0x65 -> :sswitch_1
        0x66 -> :sswitch_4
        0x6c -> :sswitch_2
    .end sparse-switch
.end method
