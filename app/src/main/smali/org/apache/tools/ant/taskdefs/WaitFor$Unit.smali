.class public Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "WaitFor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/WaitFor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Unit"
.end annotation


# static fields
.field public static final DAY:Ljava/lang/String; = "day"

.field public static final HOUR:Ljava/lang/String; = "hour"

.field public static final MILLISECOND:Ljava/lang/String; = "millisecond"

.field public static final MINUTE:Ljava/lang/String; = "minute"

.field public static final SECOND:Ljava/lang/String; = "second"

.field private static final UNITS:[Ljava/lang/String;

.field public static final WEEK:Ljava/lang/String; = "week"


# instance fields
.field private timeTable:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 242
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "millisecond"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "second"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "minute"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "hour"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "day"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "week"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;->UNITS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 6

    .prologue
    .line 249
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 246
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;->timeTable:Ljava/util/Map;

    .line 250
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;->timeTable:Ljava/util/Map;

    const-string/jumbo v1, "millisecond"

    new-instance v2, Ljava/lang/Long;

    const-wide/16 v4, 0x1

    invoke-direct {v2, v4, v5}, Ljava/lang/Long;-><init>(J)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;->timeTable:Ljava/util/Map;

    const-string/jumbo v1, "second"

    new-instance v2, Ljava/lang/Long;

    const-wide/16 v4, 0x3e8

    invoke-direct {v2, v4, v5}, Ljava/lang/Long;-><init>(J)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;->timeTable:Ljava/util/Map;

    const-string/jumbo v1, "minute"

    new-instance v2, Ljava/lang/Long;

    const-wide/32 v4, 0xea60

    invoke-direct {v2, v4, v5}, Ljava/lang/Long;-><init>(J)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;->timeTable:Ljava/util/Map;

    const-string/jumbo v1, "hour"

    new-instance v2, Ljava/lang/Long;

    const-wide/32 v4, 0x36ee80

    invoke-direct {v2, v4, v5}, Ljava/lang/Long;-><init>(J)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;->timeTable:Ljava/util/Map;

    const-string/jumbo v1, "day"

    new-instance v2, Ljava/lang/Long;

    const-wide/32 v4, 0x5265c00

    invoke-direct {v2, v4, v5}, Ljava/lang/Long;-><init>(J)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;->timeTable:Ljava/util/Map;

    const-string/jumbo v1, "week"

    new-instance v2, Ljava/lang/Long;

    const-wide/32 v4, 0x240c8400

    invoke-direct {v2, v4, v5}, Ljava/lang/Long;-><init>(J)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    return-void
.end method


# virtual methods
.method public getMultiplier()J
    .locals 4

    .prologue
    .line 263
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;->getValue()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 264
    .local v0, "key":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;->timeTable:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 265
    .local v1, "l":Ljava/lang/Long;
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    return-wide v2
.end method

.method public getValues()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 273
    sget-object v0, Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;->UNITS:[Ljava/lang/String;

    return-object v0
.end method
