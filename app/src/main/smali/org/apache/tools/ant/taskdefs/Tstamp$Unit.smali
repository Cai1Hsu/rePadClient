.class public Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "Tstamp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Tstamp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Unit"
.end annotation


# static fields
.field private static final DAY:Ljava/lang/String; = "day"

.field private static final HOUR:Ljava/lang/String; = "hour"

.field private static final MILLISECOND:Ljava/lang/String; = "millisecond"

.field private static final MINUTE:Ljava/lang/String; = "minute"

.field private static final MONTH:Ljava/lang/String; = "month"

.field private static final SECOND:Ljava/lang/String; = "second"

.field private static final UNITS:[Ljava/lang/String;

.field private static final WEEK:Ljava/lang/String; = "week"

.field private static final YEAR:Ljava/lang/String; = "year"


# instance fields
.field private calendarFields:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 296
    const/16 v0, 0x8

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

    const/4 v1, 0x6

    const-string/jumbo v2, "month"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "year"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;->UNITS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    .line 310
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 307
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;->calendarFields:Ljava/util/Map;

    .line 311
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;->calendarFields:Ljava/util/Map;

    const-string/jumbo v1, "millisecond"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0xe

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;->calendarFields:Ljava/util/Map;

    const-string/jumbo v1, "second"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0xd

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 314
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;->calendarFields:Ljava/util/Map;

    const-string/jumbo v1, "minute"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0xc

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;->calendarFields:Ljava/util/Map;

    const-string/jumbo v1, "hour"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0xb

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;->calendarFields:Ljava/util/Map;

    const-string/jumbo v1, "day"

    new-instance v2, Ljava/lang/Integer;

    const/4 v3, 0x5

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;->calendarFields:Ljava/util/Map;

    const-string/jumbo v1, "week"

    new-instance v2, Ljava/lang/Integer;

    const/4 v3, 0x3

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;->calendarFields:Ljava/util/Map;

    const-string/jumbo v1, "month"

    new-instance v2, Ljava/lang/Integer;

    const/4 v3, 0x2

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;->calendarFields:Ljava/util/Map;

    const-string/jumbo v1, "year"

    new-instance v2, Ljava/lang/Integer;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    return-void
.end method


# virtual methods
.method public getCalendarField()I
    .locals 4

    .prologue
    .line 327
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;->getValue()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 328
    .local v1, "key":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;->calendarFields:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 329
    .local v0, "i":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    return v2
.end method

.method public getValues()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 337
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;->UNITS:[Ljava/lang/String;

    return-object v0
.end method
