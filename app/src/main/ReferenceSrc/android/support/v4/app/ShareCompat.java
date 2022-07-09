package android.support.v4.app;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.support.annotation.StringRes;
import android.support.v4.content.IntentCompat;
import android.text.Html;
import android.text.Spanned;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import java.util.ArrayList;

/* loaded from: classes.jar:android/support/v4/app/ShareCompat.class */
public final class ShareCompat {
    public static final String EXTRA_CALLING_ACTIVITY = "android.support.v4.app.EXTRA_CALLING_ACTIVITY";
    public static final String EXTRA_CALLING_PACKAGE = "android.support.v4.app.EXTRA_CALLING_PACKAGE";
    static ShareCompatImpl IMPL;

    /* loaded from: classes.jar:android/support/v4/app/ShareCompat$IntentBuilder.class */
    public static class IntentBuilder {
        private Activity mActivity;
        private ArrayList<String> mBccAddresses;
        private ArrayList<String> mCcAddresses;
        private CharSequence mChooserTitle;
        private Intent mIntent = new Intent().setAction("android.intent.action.SEND");
        private ArrayList<Uri> mStreams;
        private ArrayList<String> mToAddresses;

        private IntentBuilder(Activity activity) {
            this.mActivity = activity;
            this.mIntent.putExtra(ShareCompat.EXTRA_CALLING_PACKAGE, activity.getPackageName());
            this.mIntent.putExtra(ShareCompat.EXTRA_CALLING_ACTIVITY, activity.getComponentName());
            this.mIntent.addFlags(524288);
        }

        private void combineArrayExtra(String str, ArrayList<String> arrayList) {
            String[] stringArrayExtra = this.mIntent.getStringArrayExtra(str);
            int length = stringArrayExtra != null ? stringArrayExtra.length : 0;
            String[] strArr = new String[arrayList.size() + length];
            arrayList.toArray(strArr);
            if (stringArrayExtra != null) {
                System.arraycopy(stringArrayExtra, 0, strArr, arrayList.size(), length);
            }
            this.mIntent.putExtra(str, strArr);
        }

        private void combineArrayExtra(String str, String[] strArr) {
            Intent intent = getIntent();
            String[] stringArrayExtra = intent.getStringArrayExtra(str);
            int length = stringArrayExtra != null ? stringArrayExtra.length : 0;
            String[] strArr2 = new String[strArr.length + length];
            if (stringArrayExtra != null) {
                System.arraycopy(stringArrayExtra, 0, strArr2, 0, length);
            }
            System.arraycopy(strArr, 0, strArr2, length, strArr.length);
            intent.putExtra(str, strArr2);
        }

        public static IntentBuilder from(Activity activity) {
            return new IntentBuilder(activity);
        }

        public IntentBuilder addEmailBcc(String str) {
            if (this.mBccAddresses == null) {
                this.mBccAddresses = new ArrayList<>();
            }
            this.mBccAddresses.add(str);
            return this;
        }

        public IntentBuilder addEmailBcc(String[] strArr) {
            combineArrayExtra("android.intent.extra.BCC", strArr);
            return this;
        }

        public IntentBuilder addEmailCc(String str) {
            if (this.mCcAddresses == null) {
                this.mCcAddresses = new ArrayList<>();
            }
            this.mCcAddresses.add(str);
            return this;
        }

        public IntentBuilder addEmailCc(String[] strArr) {
            combineArrayExtra("android.intent.extra.CC", strArr);
            return this;
        }

        public IntentBuilder addEmailTo(String str) {
            if (this.mToAddresses == null) {
                this.mToAddresses = new ArrayList<>();
            }
            this.mToAddresses.add(str);
            return this;
        }

        public IntentBuilder addEmailTo(String[] strArr) {
            combineArrayExtra("android.intent.extra.EMAIL", strArr);
            return this;
        }

        public IntentBuilder addStream(Uri uri) {
            IntentBuilder intentBuilder;
            Uri uri2 = (Uri) this.mIntent.getParcelableExtra("android.intent.extra.STREAM");
            if (this.mStreams == null && uri2 == null) {
                intentBuilder = setStream(uri);
            } else {
                if (this.mStreams == null) {
                    this.mStreams = new ArrayList<>();
                }
                if (uri2 != null) {
                    this.mIntent.removeExtra("android.intent.extra.STREAM");
                    this.mStreams.add(uri2);
                }
                this.mStreams.add(uri);
                intentBuilder = this;
            }
            return intentBuilder;
        }

        public Intent createChooserIntent() {
            return Intent.createChooser(getIntent(), this.mChooserTitle);
        }

        Activity getActivity() {
            return this.mActivity;
        }

        public Intent getIntent() {
            boolean z = true;
            if (this.mToAddresses != null) {
                combineArrayExtra("android.intent.extra.EMAIL", this.mToAddresses);
                this.mToAddresses = null;
            }
            if (this.mCcAddresses != null) {
                combineArrayExtra("android.intent.extra.CC", this.mCcAddresses);
                this.mCcAddresses = null;
            }
            if (this.mBccAddresses != null) {
                combineArrayExtra("android.intent.extra.BCC", this.mBccAddresses);
                this.mBccAddresses = null;
            }
            if (this.mStreams == null || this.mStreams.size() <= 1) {
                z = false;
            }
            boolean equals = this.mIntent.getAction().equals("android.intent.action.SEND_MULTIPLE");
            if (!z && equals) {
                this.mIntent.setAction("android.intent.action.SEND");
                if (this.mStreams == null || this.mStreams.isEmpty()) {
                    this.mIntent.removeExtra("android.intent.extra.STREAM");
                } else {
                    this.mIntent.putExtra("android.intent.extra.STREAM", this.mStreams.get(0));
                }
                this.mStreams = null;
            }
            if (z && !equals) {
                this.mIntent.setAction("android.intent.action.SEND_MULTIPLE");
                if (this.mStreams == null || this.mStreams.isEmpty()) {
                    this.mIntent.removeExtra("android.intent.extra.STREAM");
                } else {
                    this.mIntent.putParcelableArrayListExtra("android.intent.extra.STREAM", this.mStreams);
                }
            }
            return this.mIntent;
        }

        public IntentBuilder setChooserTitle(@StringRes int i) {
            return setChooserTitle(this.mActivity.getText(i));
        }

        public IntentBuilder setChooserTitle(CharSequence charSequence) {
            this.mChooserTitle = charSequence;
            return this;
        }

        public IntentBuilder setEmailBcc(String[] strArr) {
            this.mIntent.putExtra("android.intent.extra.BCC", strArr);
            return this;
        }

        public IntentBuilder setEmailCc(String[] strArr) {
            this.mIntent.putExtra("android.intent.extra.CC", strArr);
            return this;
        }

        public IntentBuilder setEmailTo(String[] strArr) {
            if (this.mToAddresses != null) {
                this.mToAddresses = null;
            }
            this.mIntent.putExtra("android.intent.extra.EMAIL", strArr);
            return this;
        }

        public IntentBuilder setHtmlText(String str) {
            this.mIntent.putExtra(IntentCompat.EXTRA_HTML_TEXT, str);
            if (!this.mIntent.hasExtra("android.intent.extra.TEXT")) {
                setText(Html.fromHtml(str));
            }
            return this;
        }

        public IntentBuilder setStream(Uri uri) {
            if (!this.mIntent.getAction().equals("android.intent.action.SEND")) {
                this.mIntent.setAction("android.intent.action.SEND");
            }
            this.mStreams = null;
            this.mIntent.putExtra("android.intent.extra.STREAM", uri);
            return this;
        }

        public IntentBuilder setSubject(String str) {
            this.mIntent.putExtra("android.intent.extra.SUBJECT", str);
            return this;
        }

        public IntentBuilder setText(CharSequence charSequence) {
            this.mIntent.putExtra("android.intent.extra.TEXT", charSequence);
            return this;
        }

        public IntentBuilder setType(String str) {
            this.mIntent.setType(str);
            return this;
        }

        public void startChooser() {
            this.mActivity.startActivity(createChooserIntent());
        }
    }

    /* loaded from: classes.jar:android/support/v4/app/ShareCompat$IntentReader.class */
    public static class IntentReader {
        private static final String TAG = "IntentReader";
        private Activity mActivity;
        private ComponentName mCallingActivity;
        private String mCallingPackage;
        private Intent mIntent;
        private ArrayList<Uri> mStreams;

        private IntentReader(Activity activity) {
            this.mActivity = activity;
            this.mIntent = activity.getIntent();
            this.mCallingPackage = ShareCompat.getCallingPackage(activity);
            this.mCallingActivity = ShareCompat.getCallingActivity(activity);
        }

        public static IntentReader from(Activity activity) {
            return new IntentReader(activity);
        }

        public ComponentName getCallingActivity() {
            return this.mCallingActivity;
        }

        public Drawable getCallingActivityIcon() {
            Drawable drawable = null;
            if (this.mCallingActivity != null) {
                try {
                    drawable = this.mActivity.getPackageManager().getActivityIcon(this.mCallingActivity);
                } catch (PackageManager.NameNotFoundException e) {
                    Log.e(TAG, "Could not retrieve icon for calling activity", e);
                }
            }
            return drawable;
        }

        public Drawable getCallingApplicationIcon() {
            Drawable drawable = null;
            if (this.mCallingPackage != null) {
                try {
                    drawable = this.mActivity.getPackageManager().getApplicationIcon(this.mCallingPackage);
                } catch (PackageManager.NameNotFoundException e) {
                    Log.e(TAG, "Could not retrieve icon for calling application", e);
                }
            }
            return drawable;
        }

        public CharSequence getCallingApplicationLabel() {
            CharSequence charSequence = null;
            if (this.mCallingPackage != null) {
                PackageManager packageManager = this.mActivity.getPackageManager();
                try {
                    charSequence = packageManager.getApplicationLabel(packageManager.getApplicationInfo(this.mCallingPackage, 0));
                } catch (PackageManager.NameNotFoundException e) {
                    Log.e(TAG, "Could not retrieve label for calling application", e);
                }
            }
            return charSequence;
        }

        public String getCallingPackage() {
            return this.mCallingPackage;
        }

        public String[] getEmailBcc() {
            return this.mIntent.getStringArrayExtra("android.intent.extra.BCC");
        }

        public String[] getEmailCc() {
            return this.mIntent.getStringArrayExtra("android.intent.extra.CC");
        }

        public String[] getEmailTo() {
            return this.mIntent.getStringArrayExtra("android.intent.extra.EMAIL");
        }

        public String getHtmlText() {
            String stringExtra = this.mIntent.getStringExtra(IntentCompat.EXTRA_HTML_TEXT);
            String str = stringExtra;
            if (stringExtra == null) {
                CharSequence text = getText();
                if (text instanceof Spanned) {
                    str = Html.toHtml((Spanned) text);
                } else {
                    str = stringExtra;
                    if (text != null) {
                        str = ShareCompat.IMPL.escapeHtml(text);
                    }
                }
            }
            return str;
        }

        public Uri getStream() {
            return (Uri) this.mIntent.getParcelableExtra("android.intent.extra.STREAM");
        }

        public Uri getStream(int i) {
            Uri uri;
            if (this.mStreams == null && isMultipleShare()) {
                this.mStreams = this.mIntent.getParcelableArrayListExtra("android.intent.extra.STREAM");
            }
            if (this.mStreams != null) {
                uri = this.mStreams.get(i);
            } else if (i != 0) {
                throw new IndexOutOfBoundsException("Stream items available: " + getStreamCount() + " index requested: " + i);
            } else {
                uri = (Uri) this.mIntent.getParcelableExtra("android.intent.extra.STREAM");
            }
            return uri;
        }

        public int getStreamCount() {
            if (this.mStreams == null && isMultipleShare()) {
                this.mStreams = this.mIntent.getParcelableArrayListExtra("android.intent.extra.STREAM");
            }
            return this.mStreams != null ? this.mStreams.size() : this.mIntent.hasExtra("android.intent.extra.STREAM") ? 1 : 0;
        }

        public String getSubject() {
            return this.mIntent.getStringExtra("android.intent.extra.SUBJECT");
        }

        public CharSequence getText() {
            return this.mIntent.getCharSequenceExtra("android.intent.extra.TEXT");
        }

        public String getType() {
            return this.mIntent.getType();
        }

        public boolean isMultipleShare() {
            return "android.intent.action.SEND_MULTIPLE".equals(this.mIntent.getAction());
        }

        public boolean isShareIntent() {
            String action = this.mIntent.getAction();
            return "android.intent.action.SEND".equals(action) || "android.intent.action.SEND_MULTIPLE".equals(action);
        }

        public boolean isSingleShare() {
            return "android.intent.action.SEND".equals(this.mIntent.getAction());
        }
    }

    /* loaded from: classes.jar:android/support/v4/app/ShareCompat$ShareCompatImpl.class */
    interface ShareCompatImpl {
        void configureMenuItem(MenuItem menuItem, IntentBuilder intentBuilder);

        String escapeHtml(CharSequence charSequence);
    }

    /* loaded from: classes.jar:android/support/v4/app/ShareCompat$ShareCompatImplBase.class */
    static class ShareCompatImplBase implements ShareCompatImpl {
        ShareCompatImplBase() {
        }

        private static void withinStyle(StringBuilder sb, CharSequence charSequence, int i, int i2) {
            while (i < i2) {
                char charAt = charSequence.charAt(i);
                if (charAt == '<') {
                    sb.append("&lt;");
                } else if (charAt == '>') {
                    sb.append("&gt;");
                } else if (charAt == '&') {
                    sb.append("&amp;");
                } else if (charAt > '~' || charAt < ' ') {
                    sb.append("&#" + ((int) charAt) + ";");
                } else if (charAt == ' ') {
                    while (i + 1 < i2 && charSequence.charAt(i + 1) == ' ') {
                        sb.append("&nbsp;");
                        i++;
                    }
                    sb.append(' ');
                } else {
                    sb.append(charAt);
                }
                i++;
            }
        }

        @Override // android.support.v4.app.ShareCompat.ShareCompatImpl
        public void configureMenuItem(MenuItem menuItem, IntentBuilder intentBuilder) {
            menuItem.setIntent(intentBuilder.createChooserIntent());
        }

        @Override // android.support.v4.app.ShareCompat.ShareCompatImpl
        public String escapeHtml(CharSequence charSequence) {
            StringBuilder sb = new StringBuilder();
            withinStyle(sb, charSequence, 0, charSequence.length());
            return sb.toString();
        }
    }

    /* loaded from: classes.jar:android/support/v4/app/ShareCompat$ShareCompatImplICS.class */
    static class ShareCompatImplICS extends ShareCompatImplBase {
        ShareCompatImplICS() {
        }

        @Override // android.support.v4.app.ShareCompat.ShareCompatImplBase, android.support.v4.app.ShareCompat.ShareCompatImpl
        public void configureMenuItem(MenuItem menuItem, IntentBuilder intentBuilder) {
            ShareCompatICS.configureMenuItem(menuItem, intentBuilder.getActivity(), intentBuilder.getIntent());
            if (shouldAddChooserIntent(menuItem)) {
                menuItem.setIntent(intentBuilder.createChooserIntent());
            }
        }

        boolean shouldAddChooserIntent(MenuItem menuItem) {
            return !menuItem.hasSubMenu();
        }
    }

    /* loaded from: classes.jar:android/support/v4/app/ShareCompat$ShareCompatImplJB.class */
    static class ShareCompatImplJB extends ShareCompatImplICS {
        ShareCompatImplJB() {
        }

        @Override // android.support.v4.app.ShareCompat.ShareCompatImplBase, android.support.v4.app.ShareCompat.ShareCompatImpl
        public String escapeHtml(CharSequence charSequence) {
            return ShareCompatJB.escapeHtml(charSequence);
        }

        @Override // android.support.v4.app.ShareCompat.ShareCompatImplICS
        boolean shouldAddChooserIntent(MenuItem menuItem) {
            return false;
        }
    }

    static {
        if (Build.VERSION.SDK_INT >= 16) {
            IMPL = new ShareCompatImplJB();
        } else if (Build.VERSION.SDK_INT >= 14) {
            IMPL = new ShareCompatImplICS();
        } else {
            IMPL = new ShareCompatImplBase();
        }
    }

    private ShareCompat() {
    }

    public static void configureMenuItem(Menu menu, int i, IntentBuilder intentBuilder) {
        MenuItem findItem = menu.findItem(i);
        if (findItem == null) {
            throw new IllegalArgumentException("Could not find menu item with id " + i + " in the supplied menu");
        }
        configureMenuItem(findItem, intentBuilder);
    }

    public static void configureMenuItem(MenuItem menuItem, IntentBuilder intentBuilder) {
        IMPL.configureMenuItem(menuItem, intentBuilder);
    }

    public static ComponentName getCallingActivity(Activity activity) {
        ComponentName callingActivity = activity.getCallingActivity();
        ComponentName componentName = callingActivity;
        if (callingActivity == null) {
            componentName = (ComponentName) activity.getIntent().getParcelableExtra(EXTRA_CALLING_ACTIVITY);
        }
        return componentName;
    }

    public static String getCallingPackage(Activity activity) {
        String callingPackage = activity.getCallingPackage();
        String str = callingPackage;
        if (callingPackage == null) {
            str = activity.getIntent().getStringExtra(EXTRA_CALLING_PACKAGE);
        }
        return str;
    }
}
