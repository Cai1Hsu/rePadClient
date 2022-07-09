.class public Lcom/mongodb/gridfs/CLI;
.super Ljava/lang/Object;
.source "CLI.java"


# static fields
.field private static _gridfs:Lcom/mongodb/gridfs/GridFS;

.field private static _mongo:Lcom/mongodb/Mongo;

.field private static db:Ljava/lang/String;

.field private static uri:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    const-string/jumbo v0, "test"

    sput-object v0, Lcom/mongodb/gridfs/CLI;->db:Ljava/lang/String;

    .line 50
    const-string/jumbo v0, "mongodb://127.0.0.1"

    sput-object v0, Lcom/mongodb/gridfs/CLI;->uri:Ljava/lang/String;

    .line 51
    const/4 v0, 0x0

    sput-object v0, Lcom/mongodb/gridfs/CLI;->_mongo:Lcom/mongodb/Mongo;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getGridFS()Lcom/mongodb/gridfs/GridFS;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 65
    sget-object v0, Lcom/mongodb/gridfs/CLI;->_gridfs:Lcom/mongodb/gridfs/GridFS;

    if-nez v0, :cond_0

    .line 66
    new-instance v0, Lcom/mongodb/gridfs/GridFS;

    invoke-static {}, Lcom/mongodb/gridfs/CLI;->getMongo()Lcom/mongodb/Mongo;

    move-result-object v1

    sget-object v2, Lcom/mongodb/gridfs/CLI;->db:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/mongodb/Mongo;->getDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mongodb/gridfs/GridFS;-><init>(Lcom/mongodb/DB;)V

    sput-object v0, Lcom/mongodb/gridfs/CLI;->_gridfs:Lcom/mongodb/gridfs/GridFS;

    .line 67
    :cond_0
    sget-object v0, Lcom/mongodb/gridfs/CLI;->_gridfs:Lcom/mongodb/gridfs/GridFS;

    return-object v0
.end method

.method private static getMongo()Lcom/mongodb/Mongo;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 56
    sget-object v0, Lcom/mongodb/gridfs/CLI;->_mongo:Lcom/mongodb/Mongo;

    if-nez v0, :cond_0

    .line 57
    new-instance v0, Lcom/mongodb/MongoClient;

    new-instance v1, Lcom/mongodb/MongoClientURI;

    sget-object v2, Lcom/mongodb/gridfs/CLI;->uri:Ljava/lang/String;

    invoke-direct {v1, v2}, Lcom/mongodb/MongoClientURI;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/mongodb/MongoClient;-><init>(Lcom/mongodb/MongoClientURI;)V

    sput-object v0, Lcom/mongodb/gridfs/CLI;->_mongo:Lcom/mongodb/Mongo;

    .line 59
    :cond_0
    sget-object v0, Lcom/mongodb/gridfs/CLI;->_mongo:Lcom/mongodb/Mongo;

    return-object v0
.end method

.method public static main([Ljava/lang/String;)V
    .locals 22
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 72
    move-object/from16 v0, p0

    array-length v14, v0

    const/4 v15, 0x1

    if-ge v14, v15, :cond_1

    .line 73
    invoke-static {}, Lcom/mongodb/gridfs/CLI;->printUsage()V

    .line 167
    :cond_0
    :goto_0
    return-void

    .line 77
    :cond_1
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    move-object/from16 v0, p0

    array-length v14, v0

    if-ge v6, v14, :cond_0

    .line 78
    aget-object v13, p0, v6

    .line 80
    .local v13, "s":Ljava/lang/String;
    const-string/jumbo v14, "--db"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 81
    add-int/lit8 v14, v6, 0x1

    aget-object v14, p0, v14

    sput-object v14, Lcom/mongodb/gridfs/CLI;->db:Ljava/lang/String;

    .line 82
    add-int/lit8 v6, v6, 0x1

    .line 77
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 86
    :cond_2
    const-string/jumbo v14, "--host"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 87
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "mongodb://"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    add-int/lit8 v15, v6, 0x1

    aget-object v15, p0, v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    sput-object v14, Lcom/mongodb/gridfs/CLI;->uri:Ljava/lang/String;

    .line 88
    add-int/lit8 v6, v6, 0x1

    .line 89
    goto :goto_2

    .line 92
    :cond_3
    const-string/jumbo v14, "--uri"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 93
    add-int/lit8 v14, v6, 0x1

    aget-object v14, p0, v14

    sput-object v14, Lcom/mongodb/gridfs/CLI;->uri:Ljava/lang/String;

    .line 94
    add-int/lit8 v6, v6, 0x1

    .line 95
    goto :goto_2

    .line 98
    :cond_4
    const-string/jumbo v14, "help"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_5

    .line 99
    invoke-static {}, Lcom/mongodb/gridfs/CLI;->printUsage()V

    goto :goto_0

    .line 103
    :cond_5
    const-string/jumbo v14, "list"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_6

    .line 104
    invoke-static {}, Lcom/mongodb/gridfs/CLI;->getGridFS()Lcom/mongodb/gridfs/GridFS;

    move-result-object v5

    .line 106
    .local v5, "fs":Lcom/mongodb/gridfs/GridFS;
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v15, "%-60s %-10s\n"

    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    const-string/jumbo v18, "Filename"

    aput-object v18, v16, v17

    const/16 v17, 0x1

    const-string/jumbo v18, "Length"

    aput-object v18, v16, v17

    invoke-virtual/range {v14 .. v16}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 108
    invoke-virtual {v5}, Lcom/mongodb/gridfs/GridFS;->getFileList()Lcom/mongodb/DBCursor;

    move-result-object v14

    invoke-virtual {v14}, Lcom/mongodb/DBCursor;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mongodb/DBObject;

    .line 109
    .local v10, "o":Lcom/mongodb/DBObject;
    sget-object v15, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v16, "%-60s %-10d\n"

    const/4 v14, 0x2

    new-array v0, v14, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/4 v14, 0x0

    const-string/jumbo v18, "filename"

    move-object/from16 v0, v18

    invoke-interface {v10, v0}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v18

    aput-object v18, v17, v14

    const/16 v18, 0x1

    const-string/jumbo v14, "length"

    invoke-interface {v10, v14}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Number;

    invoke-virtual {v14}, Ljava/lang/Number;->longValue()J

    move-result-wide v20

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    aput-object v14, v17, v18

    invoke-virtual/range {v15 .. v17}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    goto :goto_3

    .line 114
    .end local v5    # "fs":Lcom/mongodb/gridfs/GridFS;
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v10    # "o":Lcom/mongodb/DBObject;
    :cond_6
    const-string/jumbo v14, "get"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_8

    .line 115
    invoke-static {}, Lcom/mongodb/gridfs/CLI;->getGridFS()Lcom/mongodb/gridfs/GridFS;

    move-result-object v5

    .line 116
    .restart local v5    # "fs":Lcom/mongodb/gridfs/GridFS;
    add-int/lit8 v14, v6, 0x1

    aget-object v4, p0, v14

    .line 117
    .local v4, "fn":Ljava/lang/String;
    invoke-virtual {v5, v4}, Lcom/mongodb/gridfs/GridFS;->findOne(Ljava/lang/String;)Lcom/mongodb/gridfs/GridFSDBFile;

    move-result-object v3

    .line 118
    .local v3, "f":Lcom/mongodb/gridfs/GridFSDBFile;
    if-nez v3, :cond_7

    .line 119
    sget-object v14, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "can\'t find file: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 123
    :cond_7
    invoke-virtual {v3}, Lcom/mongodb/gridfs/GridFSDBFile;->getFilename()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v3, v14}, Lcom/mongodb/gridfs/GridFSDBFile;->writeTo(Ljava/lang/String;)J

    goto/16 :goto_0

    .line 127
    .end local v3    # "f":Lcom/mongodb/gridfs/GridFSDBFile;
    .end local v4    # "fn":Ljava/lang/String;
    .end local v5    # "fs":Lcom/mongodb/gridfs/GridFS;
    :cond_8
    const-string/jumbo v14, "put"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_9

    .line 128
    invoke-static {}, Lcom/mongodb/gridfs/CLI;->getGridFS()Lcom/mongodb/gridfs/GridFS;

    move-result-object v5

    .line 129
    .restart local v5    # "fs":Lcom/mongodb/gridfs/GridFS;
    add-int/lit8 v14, v6, 0x1

    aget-object v4, p0, v14

    .line 130
    .restart local v4    # "fn":Ljava/lang/String;
    new-instance v14, Ljava/io/File;

    invoke-direct {v14, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v14}, Lcom/mongodb/gridfs/GridFS;->createFile(Ljava/io/File;)Lcom/mongodb/gridfs/GridFSInputFile;

    move-result-object v3

    .line 131
    .local v3, "f":Lcom/mongodb/gridfs/GridFSInputFile;
    invoke-virtual {v3}, Lcom/mongodb/gridfs/GridFSInputFile;->save()V

    .line 132
    invoke-virtual {v3}, Lcom/mongodb/gridfs/GridFSInputFile;->validate()V

    goto/16 :goto_0

    .line 137
    .end local v3    # "f":Lcom/mongodb/gridfs/GridFSInputFile;
    .end local v4    # "fn":Ljava/lang/String;
    .end local v5    # "fs":Lcom/mongodb/gridfs/GridFS;
    :cond_9
    const-string/jumbo v14, "md5"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_d

    .line 138
    invoke-static {}, Lcom/mongodb/gridfs/CLI;->getGridFS()Lcom/mongodb/gridfs/GridFS;

    move-result-object v5

    .line 139
    .restart local v5    # "fs":Lcom/mongodb/gridfs/GridFS;
    add-int/lit8 v14, v6, 0x1

    aget-object v4, p0, v14

    .line 140
    .restart local v4    # "fn":Ljava/lang/String;
    invoke-virtual {v5, v4}, Lcom/mongodb/gridfs/GridFS;->findOne(Ljava/lang/String;)Lcom/mongodb/gridfs/GridFSDBFile;

    move-result-object v3

    .line 141
    .local v3, "f":Lcom/mongodb/gridfs/GridFSDBFile;
    if-nez v3, :cond_a

    .line 142
    sget-object v14, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "can\'t find file: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 146
    :cond_a
    const-string/jumbo v14, "MD5"

    invoke-static {v14}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v9

    .line 147
    .local v9, "md5":Ljava/security/MessageDigest;
    invoke-virtual {v9}, Ljava/security/MessageDigest;->reset()V

    .line 148
    new-instance v8, Ljava/security/DigestInputStream;

    invoke-virtual {v3}, Lcom/mongodb/gridfs/GridFSDBFile;->getInputStream()Ljava/io/InputStream;

    move-result-object v14

    invoke-direct {v8, v14, v9}, Ljava/security/DigestInputStream;-><init>(Ljava/io/InputStream;Ljava/security/MessageDigest;)V

    .line 149
    .local v8, "is":Ljava/security/DigestInputStream;
    const/4 v12, 0x0

    .line 150
    .local v12, "read":I
    :goto_4
    invoke-virtual {v8}, Ljava/security/DigestInputStream;->read()I

    move-result v14

    if-ltz v14, :cond_b

    .line 151
    add-int/lit8 v12, v12, 0x1

    .line 152
    const/16 v14, 0x11

    new-array v14, v14, [B

    invoke-virtual {v8, v14}, Ljava/security/DigestInputStream;->read([B)I

    move-result v11

    .line 153
    .local v11, "r":I
    if-gez v11, :cond_c

    .line 157
    .end local v11    # "r":I
    :cond_b
    invoke-virtual {v9}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v2

    .line 158
    .local v2, "digest":[B
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "length: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, " md5: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-static {v2}, Lcom/mongodb/util/Util;->toHex([B)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 155
    .end local v2    # "digest":[B
    .restart local v11    # "r":I
    :cond_c
    add-int/2addr v12, v11

    .line 156
    goto :goto_4

    .line 163
    .end local v3    # "f":Lcom/mongodb/gridfs/GridFSDBFile;
    .end local v4    # "fn":Ljava/lang/String;
    .end local v5    # "fs":Lcom/mongodb/gridfs/GridFS;
    .end local v8    # "is":Ljava/security/DigestInputStream;
    .end local v9    # "md5":Ljava/security/MessageDigest;
    .end local v11    # "r":I
    .end local v12    # "read":I
    :cond_d
    sget-object v14, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "unknown option: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private static printUsage()V
    .locals 2

    .prologue
    .line 41
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "Usage : [--db database] action"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 42
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  where  action is one of:"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 43
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "      list                      : lists all files in the store"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 44
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "      put filename              : puts the file filename into the store"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 45
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "      get filename1 filename2   : gets filename1 from store and sends to filename2"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 46
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "      md5 filename              : does an md5 hash on a file in the db (for testing)"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 47
    return-void
.end method
