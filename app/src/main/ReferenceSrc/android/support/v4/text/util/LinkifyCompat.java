package android.support.v4.text.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.PatternsCompat;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.method.LinkMovementMethod;
import android.text.method.MovementMethod;
import android.text.style.URLSpan;
import android.text.util.Linkify;
import android.webkit.WebView;
import android.widget.TextView;
import java.io.UnsupportedEncodingException;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes.jar:android/support/v4/text/util/LinkifyCompat.class */
public final class LinkifyCompat {
    private static final String[] EMPTY_STRING = new String[0];
    private static final Comparator<LinkSpec> COMPARATOR = new Comparator<LinkSpec>() { // from class: android.support.v4.text.util.LinkifyCompat.1
        public final int compare(LinkSpec linkSpec, LinkSpec linkSpec2) {
            int i = -1;
            if (linkSpec.start >= linkSpec2.start) {
                if (linkSpec.start > linkSpec2.start) {
                    i = 1;
                } else if (linkSpec.end < linkSpec2.end) {
                    i = 1;
                } else if (linkSpec.end <= linkSpec2.end) {
                    i = 0;
                }
            }
            return i;
        }
    };

    /* loaded from: classes.jar:android/support/v4/text/util/LinkifyCompat$LinkSpec.class */
    private static class LinkSpec {
        int end;
        URLSpan frameworkAddedSpan;
        int start;
        String url;

        LinkSpec() {
        }
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.jar:android/support/v4/text/util/LinkifyCompat$LinkifyMask.class */
    public @interface LinkifyMask {
    }

    private LinkifyCompat() {
    }

    private static void addLinkMovementMethod(@NonNull TextView textView) {
        MovementMethod movementMethod = textView.getMovementMethod();
        if ((movementMethod == null || !(movementMethod instanceof LinkMovementMethod)) && textView.getLinksClickable()) {
            textView.setMovementMethod(LinkMovementMethod.getInstance());
        }
    }

    public static final void addLinks(@NonNull TextView textView, @NonNull Pattern pattern, @Nullable String str) {
        addLinks(textView, pattern, str, (String[]) null, (Linkify.MatchFilter) null, (Linkify.TransformFilter) null);
    }

    public static final void addLinks(@NonNull TextView textView, @NonNull Pattern pattern, @Nullable String str, @Nullable Linkify.MatchFilter matchFilter, @Nullable Linkify.TransformFilter transformFilter) {
        addLinks(textView, pattern, str, (String[]) null, matchFilter, transformFilter);
    }

    public static final void addLinks(@NonNull TextView textView, @NonNull Pattern pattern, @Nullable String str, @Nullable String[] strArr, @Nullable Linkify.MatchFilter matchFilter, @Nullable Linkify.TransformFilter transformFilter) {
        SpannableString valueOf = SpannableString.valueOf(textView.getText());
        if (addLinks(valueOf, pattern, str, strArr, matchFilter, transformFilter)) {
            textView.setText(valueOf);
            addLinkMovementMethod(textView);
        }
    }

    public static final boolean addLinks(@NonNull Spannable spannable, int i) {
        boolean z;
        if (i == 0) {
            z = false;
        } else {
            URLSpan[] uRLSpanArr = (URLSpan[]) spannable.getSpans(0, spannable.length(), URLSpan.class);
            for (int length = uRLSpanArr.length - 1; length >= 0; length--) {
                spannable.removeSpan(uRLSpanArr[length]);
            }
            if ((i & 4) != 0) {
                Linkify.addLinks(spannable, 4);
            }
            ArrayList arrayList = new ArrayList();
            if ((i & 1) != 0) {
                gatherLinks(arrayList, spannable, PatternsCompat.AUTOLINK_WEB_URL, new String[]{"http://", "https://", "rtsp://"}, Linkify.sUrlMatchFilter, null);
            }
            if ((i & 2) != 0) {
                gatherLinks(arrayList, spannable, PatternsCompat.AUTOLINK_EMAIL_ADDRESS, new String[]{"mailto:"}, null, null);
            }
            if ((i & 8) != 0) {
                gatherMapLinks(arrayList, spannable);
            }
            pruneOverlaps(arrayList, spannable);
            if (arrayList.size() == 0) {
                z = false;
            } else {
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    LinkSpec linkSpec = (LinkSpec) it.next();
                    if (linkSpec.frameworkAddedSpan == null) {
                        applyLink(linkSpec.url, linkSpec.start, linkSpec.end, spannable);
                    }
                }
                z = true;
            }
        }
        return z;
    }

    public static final boolean addLinks(@NonNull Spannable spannable, @NonNull Pattern pattern, @Nullable String str) {
        return addLinks(spannable, pattern, str, (String[]) null, (Linkify.MatchFilter) null, (Linkify.TransformFilter) null);
    }

    public static final boolean addLinks(@NonNull Spannable spannable, @NonNull Pattern pattern, @Nullable String str, @Nullable Linkify.MatchFilter matchFilter, @Nullable Linkify.TransformFilter transformFilter) {
        return addLinks(spannable, pattern, str, (String[]) null, matchFilter, transformFilter);
    }

    /* JADX WARN: Code restructure failed: missing block: B:8:0x0014, code lost:
        if (r8.length < 1) goto L9;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final boolean addLinks(@NonNull Spannable spannable, @NonNull Pattern pattern, @Nullable String str, @Nullable String[] strArr, @Nullable Linkify.MatchFilter matchFilter, @Nullable Linkify.TransformFilter transformFilter) {
        String[] strArr2;
        String str2 = str;
        if (str == null) {
            str2 = "";
        }
        if (strArr != null) {
            strArr2 = strArr;
        }
        strArr2 = EMPTY_STRING;
        String[] strArr3 = new String[strArr2.length + 1];
        strArr3[0] = str2.toLowerCase(Locale.ROOT);
        for (int i = 0; i < strArr2.length; i++) {
            String str3 = strArr2[i];
            strArr3[i + 1] = str3 == null ? "" : str3.toLowerCase(Locale.ROOT);
        }
        boolean z = false;
        Matcher matcher = pattern.matcher(spannable);
        while (matcher.find()) {
            int start = matcher.start();
            int end = matcher.end();
            boolean z2 = true;
            if (matchFilter != null) {
                z2 = matchFilter.acceptMatch(spannable, start, end);
            }
            if (z2) {
                applyLink(makeUrl(matcher.group(0), strArr3, matcher, transformFilter), start, end, spannable);
                z = true;
            }
        }
        return z;
    }

    public static final boolean addLinks(@NonNull TextView textView, int i) {
        boolean z = false;
        if (i != 0) {
            CharSequence text = textView.getText();
            if (!(text instanceof Spannable)) {
                SpannableString valueOf = SpannableString.valueOf(text);
                if (addLinks(valueOf, i)) {
                    addLinkMovementMethod(textView);
                    textView.setText(valueOf);
                    z = true;
                }
            } else if (addLinks((Spannable) text, i)) {
                addLinkMovementMethod(textView);
                z = true;
            }
        }
        return z;
    }

    private static void applyLink(String str, int i, int i2, Spannable spannable) {
        spannable.setSpan(new URLSpan(str), i, i2, 33);
    }

    private static void gatherLinks(ArrayList<LinkSpec> arrayList, Spannable spannable, Pattern pattern, String[] strArr, Linkify.MatchFilter matchFilter, Linkify.TransformFilter transformFilter) {
        Matcher matcher = pattern.matcher(spannable);
        while (matcher.find()) {
            int start = matcher.start();
            int end = matcher.end();
            if (matchFilter == null || matchFilter.acceptMatch(spannable, start, end)) {
                LinkSpec linkSpec = new LinkSpec();
                linkSpec.url = makeUrl(matcher.group(0), strArr, matcher, transformFilter);
                linkSpec.start = start;
                linkSpec.end = end;
                arrayList.add(linkSpec);
            }
        }
    }

    private static final void gatherMapLinks(ArrayList<LinkSpec> arrayList, Spannable spannable) {
        int indexOf;
        String obj = spannable.toString();
        int i = 0;
        while (true) {
            try {
                String findAddress = WebView.findAddress(obj);
                if (findAddress == null || (indexOf = obj.indexOf(findAddress)) < 0) {
                    return;
                }
                LinkSpec linkSpec = new LinkSpec();
                int length = indexOf + findAddress.length();
                linkSpec.start = i + indexOf;
                linkSpec.end = i + length;
                obj = obj.substring(length);
                i += length;
                try {
                    linkSpec.url = "geo:0,0?q=" + URLEncoder.encode(findAddress, "UTF-8");
                    arrayList.add(linkSpec);
                } catch (UnsupportedEncodingException e) {
                }
            } catch (UnsupportedOperationException e2) {
                return;
            }
        }
    }

    private static String makeUrl(@NonNull String str, @NonNull String[] strArr, Matcher matcher, @Nullable Linkify.TransformFilter transformFilter) {
        boolean z;
        String str2;
        String str3 = str;
        if (transformFilter != null) {
            str3 = transformFilter.transformUrl(matcher, str);
        }
        int i = 0;
        while (true) {
            z = false;
            str2 = str3;
            if (i >= strArr.length) {
                break;
            } else if (str3.regionMatches(true, 0, strArr[i], 0, strArr[i].length())) {
                z = true;
                str2 = str3;
                if (!str3.regionMatches(false, 0, strArr[i], 0, strArr[i].length())) {
                    str2 = strArr[i] + str3.substring(strArr[i].length());
                    z = true;
                }
            } else {
                i++;
            }
        }
        String str4 = str2;
        if (!z) {
            str4 = str2;
            if (strArr.length > 0) {
                str4 = strArr[0] + str2;
            }
        }
        return str4;
    }

    private static final void pruneOverlaps(ArrayList<LinkSpec> arrayList, Spannable spannable) {
        Object[] objArr = (URLSpan[]) spannable.getSpans(0, spannable.length(), URLSpan.class);
        for (int i = 0; i < objArr.length; i++) {
            LinkSpec linkSpec = new LinkSpec();
            linkSpec.frameworkAddedSpan = objArr[i];
            linkSpec.start = spannable.getSpanStart(objArr[i]);
            linkSpec.end = spannable.getSpanEnd(objArr[i]);
            arrayList.add(linkSpec);
        }
        Collections.sort(arrayList, COMPARATOR);
        int size = arrayList.size();
        int i2 = 0;
        while (i2 < size - 1) {
            LinkSpec linkSpec2 = arrayList.get(i2);
            LinkSpec linkSpec3 = arrayList.get(i2 + 1);
            int i3 = -1;
            if (linkSpec2.start <= linkSpec3.start && linkSpec2.end > linkSpec3.start) {
                if (linkSpec3.end <= linkSpec2.end) {
                    i3 = i2 + 1;
                } else if (linkSpec2.end - linkSpec2.start > linkSpec3.end - linkSpec3.start) {
                    i3 = i2 + 1;
                } else if (linkSpec2.end - linkSpec2.start < linkSpec3.end - linkSpec3.start) {
                    i3 = i2;
                }
                if (i3 != -1) {
                    Object obj = arrayList.get(i3).frameworkAddedSpan;
                    if (obj != null) {
                        spannable.removeSpan(obj);
                    }
                    arrayList.remove(i3);
                    size--;
                }
            }
            i2++;
        }
    }
}
