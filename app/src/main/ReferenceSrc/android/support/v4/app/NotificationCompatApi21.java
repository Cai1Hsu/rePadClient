package android.support.v4.app;

import android.annotation.TargetApi;
import android.app.Notification;
import android.app.PendingIntent;
import android.app.RemoteInput;
import android.content.Context;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.annotation.RequiresApi;
import android.support.v4.app.NotificationCompatBase;
import android.support.v4.app.RemoteInputCompatBase;
import android.widget.RemoteViews;
import java.util.ArrayList;
import java.util.Iterator;

@RequiresApi(21)
@TargetApi(21)
/* loaded from: classes.jar:android/support/v4/app/NotificationCompatApi21.class */
class NotificationCompatApi21 {
    public static final String CATEGORY_ALARM = "alarm";
    public static final String CATEGORY_CALL = "call";
    public static final String CATEGORY_EMAIL = "email";
    public static final String CATEGORY_ERROR = "err";
    public static final String CATEGORY_EVENT = "event";
    public static final String CATEGORY_MESSAGE = "msg";
    public static final String CATEGORY_PROGRESS = "progress";
    public static final String CATEGORY_PROMO = "promo";
    public static final String CATEGORY_RECOMMENDATION = "recommendation";
    public static final String CATEGORY_SERVICE = "service";
    public static final String CATEGORY_SOCIAL = "social";
    public static final String CATEGORY_STATUS = "status";
    public static final String CATEGORY_SYSTEM = "sys";
    public static final String CATEGORY_TRANSPORT = "transport";
    private static final String KEY_AUTHOR = "author";
    private static final String KEY_MESSAGES = "messages";
    private static final String KEY_ON_READ = "on_read";
    private static final String KEY_ON_REPLY = "on_reply";
    private static final String KEY_PARTICIPANTS = "participants";
    private static final String KEY_REMOTE_INPUT = "remote_input";
    private static final String KEY_TEXT = "text";
    private static final String KEY_TIMESTAMP = "timestamp";

    /* loaded from: classes.jar:android/support/v4/app/NotificationCompatApi21$Builder.class */
    public static class Builder implements NotificationBuilderWithBuilderAccessor, NotificationBuilderWithActions {
        private Notification.Builder b;
        private RemoteViews mBigContentView;
        private RemoteViews mContentView;
        private Bundle mExtras;
        private RemoteViews mHeadsUpContentView;

        public Builder(Context context, Notification notification, CharSequence charSequence, CharSequence charSequence2, CharSequence charSequence3, RemoteViews remoteViews, int i, PendingIntent pendingIntent, PendingIntent pendingIntent2, Bitmap bitmap, int i2, int i3, boolean z, boolean z2, boolean z3, int i4, CharSequence charSequence4, boolean z4, String str, ArrayList<String> arrayList, Bundle bundle, int i5, int i6, Notification notification2, String str2, boolean z5, String str3, RemoteViews remoteViews2, RemoteViews remoteViews3, RemoteViews remoteViews4) {
            this.b = new Notification.Builder(context).setWhen(notification.when).setShowWhen(z2).setSmallIcon(notification.icon, notification.iconLevel).setContent(notification.contentView).setTicker(notification.tickerText, remoteViews).setSound(notification.sound, notification.audioStreamType).setVibrate(notification.vibrate).setLights(notification.ledARGB, notification.ledOnMS, notification.ledOffMS).setOngoing((notification.flags & 2) != 0).setOnlyAlertOnce((notification.flags & 8) != 0).setAutoCancel((notification.flags & 16) != 0).setDefaults(notification.defaults).setContentTitle(charSequence).setContentText(charSequence2).setSubText(charSequence4).setContentInfo(charSequence3).setContentIntent(pendingIntent).setDeleteIntent(notification.deleteIntent).setFullScreenIntent(pendingIntent2, (notification.flags & 128) != 0).setLargeIcon(bitmap).setNumber(i).setUsesChronometer(z3).setPriority(i4).setProgress(i2, i3, z).setLocalOnly(z4).setGroup(str2).setGroupSummary(z5).setSortKey(str3).setCategory(str).setColor(i5).setVisibility(i6).setPublicVersion(notification2);
            this.mExtras = new Bundle();
            if (bundle != null) {
                this.mExtras.putAll(bundle);
            }
            Iterator<String> it = arrayList.iterator();
            while (it.hasNext()) {
                this.b.addPerson(it.next());
            }
            this.mContentView = remoteViews2;
            this.mBigContentView = remoteViews3;
            this.mHeadsUpContentView = remoteViews4;
        }

        @Override // android.support.v4.app.NotificationBuilderWithActions
        public void addAction(NotificationCompatBase.Action action) {
            NotificationCompatApi20.addAction(this.b, action);
        }

        @Override // android.support.v4.app.NotificationBuilderWithBuilderAccessor
        public Notification build() {
            this.b.setExtras(this.mExtras);
            Notification build = this.b.build();
            if (this.mContentView != null) {
                build.contentView = this.mContentView;
            }
            if (this.mBigContentView != null) {
                build.bigContentView = this.mBigContentView;
            }
            if (this.mHeadsUpContentView != null) {
                build.headsUpContentView = this.mHeadsUpContentView;
            }
            return build;
        }

        @Override // android.support.v4.app.NotificationBuilderWithBuilderAccessor
        public Notification.Builder getBuilder() {
            return this.b;
        }
    }

    NotificationCompatApi21() {
    }

    private static android.app.RemoteInput fromCompatRemoteInput(RemoteInputCompatBase.RemoteInput remoteInput) {
        return new RemoteInput.Builder(remoteInput.getResultKey()).setLabel(remoteInput.getLabel()).setChoices(remoteInput.getChoices()).setAllowFreeFormInput(remoteInput.getAllowFreeFormInput()).addExtras(remoteInput.getExtras()).build();
    }

    static Bundle getBundleForUnreadConversation(NotificationCompatBase.UnreadConversation unreadConversation) {
        Bundle bundle;
        if (unreadConversation == null) {
            bundle = null;
        } else {
            Bundle bundle2 = new Bundle();
            String str = null;
            if (unreadConversation.getParticipants() != null) {
                str = null;
                if (unreadConversation.getParticipants().length > 1) {
                    str = unreadConversation.getParticipants()[0];
                }
            }
            Parcelable[] parcelableArr = new Parcelable[unreadConversation.getMessages().length];
            for (int i = 0; i < parcelableArr.length; i++) {
                Bundle bundle3 = new Bundle();
                bundle3.putString("text", unreadConversation.getMessages()[i]);
                bundle3.putString(KEY_AUTHOR, str);
                parcelableArr[i] = bundle3;
            }
            bundle2.putParcelableArray(KEY_MESSAGES, parcelableArr);
            RemoteInputCompatBase.RemoteInput remoteInput = unreadConversation.getRemoteInput();
            if (remoteInput != null) {
                bundle2.putParcelable(KEY_REMOTE_INPUT, fromCompatRemoteInput(remoteInput));
            }
            bundle2.putParcelable(KEY_ON_REPLY, unreadConversation.getReplyPendingIntent());
            bundle2.putParcelable(KEY_ON_READ, unreadConversation.getReadPendingIntent());
            bundle2.putStringArray(KEY_PARTICIPANTS, unreadConversation.getParticipants());
            bundle2.putLong(KEY_TIMESTAMP, unreadConversation.getLatestTimestamp());
            bundle = bundle2;
        }
        return bundle;
    }

    public static String getCategory(Notification notification) {
        return notification.category;
    }

    /* JADX WARN: Code restructure failed: missing block: B:16:0x004e, code lost:
        if (r18 != false) goto L17;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    static NotificationCompatBase.UnreadConversation getUnreadConversationFromBundle(Bundle bundle, NotificationCompatBase.UnreadConversation.Factory factory, RemoteInputCompatBase.RemoteInput.Factory factory2) {
        NotificationCompatBase.UnreadConversation unreadConversation;
        if (bundle == null) {
            unreadConversation = null;
        } else {
            Parcelable[] parcelableArray = bundle.getParcelableArray(KEY_MESSAGES);
            String[] strArr = null;
            if (parcelableArray != null) {
                strArr = new String[parcelableArray.length];
                int i = 0;
                while (true) {
                    boolean z = true;
                    if (i >= strArr.length) {
                        break;
                    } else if (!(parcelableArray[i] instanceof Bundle)) {
                        z = false;
                        break;
                    } else {
                        strArr[i] = ((Bundle) parcelableArray[i]).getString("text");
                        if (strArr[i] == null) {
                            z = false;
                            break;
                        }
                        i++;
                    }
                }
                unreadConversation = null;
            }
            PendingIntent pendingIntent = (PendingIntent) bundle.getParcelable(KEY_ON_READ);
            PendingIntent pendingIntent2 = (PendingIntent) bundle.getParcelable(KEY_ON_REPLY);
            android.app.RemoteInput remoteInput = (android.app.RemoteInput) bundle.getParcelable(KEY_REMOTE_INPUT);
            String[] stringArray = bundle.getStringArray(KEY_PARTICIPANTS);
            unreadConversation = null;
            if (stringArray != null) {
                unreadConversation = null;
                if (stringArray.length == 1) {
                    RemoteInputCompatBase.RemoteInput remoteInput2 = null;
                    if (remoteInput != null) {
                        remoteInput2 = toCompatRemoteInput(remoteInput, factory2);
                    }
                    unreadConversation = factory.build(strArr, remoteInput2, pendingIntent2, pendingIntent, stringArray, bundle.getLong(KEY_TIMESTAMP));
                }
            }
        }
        return unreadConversation;
    }

    private static RemoteInputCompatBase.RemoteInput toCompatRemoteInput(android.app.RemoteInput remoteInput, RemoteInputCompatBase.RemoteInput.Factory factory) {
        return factory.build(remoteInput.getResultKey(), remoteInput.getLabel(), remoteInput.getChoices(), remoteInput.getAllowFreeFormInput(), remoteInput.getExtras());
    }
}
