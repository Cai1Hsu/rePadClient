package android.support.v4.text;

import android.text.SpannableStringBuilder;
import java.util.Locale;

/* loaded from: classes.jar:android/support/v4/text/BidiFormatter.class */
public final class BidiFormatter {
    private static final int DEFAULT_FLAGS = 2;
    private static final int DIR_LTR = -1;
    private static final int DIR_RTL = 1;
    private static final int DIR_UNKNOWN = 0;
    private static final String EMPTY_STRING = "";
    private static final int FLAG_STEREO_RESET = 2;
    private static final char LRE = 8234;
    private static final char LRM = 8206;
    private static final char PDF = 8236;
    private static final char RLE = 8235;
    private static final char RLM = 8207;
    private final TextDirectionHeuristicCompat mDefaultTextDirectionHeuristicCompat;
    private final int mFlags;
    private final boolean mIsRtlContext;
    private static TextDirectionHeuristicCompat DEFAULT_TEXT_DIRECTION_HEURISTIC = TextDirectionHeuristicsCompat.FIRSTSTRONG_LTR;
    private static final String LRM_STRING = Character.toString(8206);
    private static final String RLM_STRING = Character.toString(8207);
    private static final BidiFormatter DEFAULT_LTR_INSTANCE = new BidiFormatter(false, 2, DEFAULT_TEXT_DIRECTION_HEURISTIC);
    private static final BidiFormatter DEFAULT_RTL_INSTANCE = new BidiFormatter(true, 2, DEFAULT_TEXT_DIRECTION_HEURISTIC);

    /* loaded from: classes.jar:android/support/v4/text/BidiFormatter$Builder.class */
    public static final class Builder {
        private int mFlags;
        private boolean mIsRtlContext;
        private TextDirectionHeuristicCompat mTextDirectionHeuristicCompat;

        public Builder() {
            initialize(BidiFormatter.isRtlLocale(Locale.getDefault()));
        }

        public Builder(Locale locale) {
            initialize(BidiFormatter.isRtlLocale(locale));
        }

        public Builder(boolean z) {
            initialize(z);
        }

        private static BidiFormatter getDefaultInstanceFromContext(boolean z) {
            return z ? BidiFormatter.DEFAULT_RTL_INSTANCE : BidiFormatter.DEFAULT_LTR_INSTANCE;
        }

        private void initialize(boolean z) {
            this.mIsRtlContext = z;
            this.mTextDirectionHeuristicCompat = BidiFormatter.DEFAULT_TEXT_DIRECTION_HEURISTIC;
            this.mFlags = 2;
        }

        public BidiFormatter build() {
            return (this.mFlags == 2 && this.mTextDirectionHeuristicCompat == BidiFormatter.DEFAULT_TEXT_DIRECTION_HEURISTIC) ? getDefaultInstanceFromContext(this.mIsRtlContext) : new BidiFormatter(this.mIsRtlContext, this.mFlags, this.mTextDirectionHeuristicCompat);
        }

        public Builder setTextDirectionHeuristic(TextDirectionHeuristicCompat textDirectionHeuristicCompat) {
            this.mTextDirectionHeuristicCompat = textDirectionHeuristicCompat;
            return this;
        }

        public Builder stereoReset(boolean z) {
            if (z) {
                this.mFlags |= 2;
            } else {
                this.mFlags &= -3;
            }
            return this;
        }
    }

    /* loaded from: classes.jar:android/support/v4/text/BidiFormatter$DirectionalityEstimator.class */
    private static class DirectionalityEstimator {
        private int charIndex;
        private final boolean isHtml;
        private char lastChar;
        private final int length;
        private final CharSequence text;
        private static final int DIR_TYPE_CACHE_SIZE = 1792;
        private static final byte[] DIR_TYPE_CACHE = new byte[DIR_TYPE_CACHE_SIZE];

        static {
            for (int i = 0; i < DIR_TYPE_CACHE_SIZE; i++) {
                DIR_TYPE_CACHE[i] = Character.getDirectionality(i);
            }
        }

        DirectionalityEstimator(CharSequence charSequence, boolean z) {
            this.text = charSequence;
            this.isHtml = z;
            this.length = charSequence.length();
        }

        private static byte getCachedDirectionality(char c) {
            return c < DIR_TYPE_CACHE_SIZE ? DIR_TYPE_CACHE[c] : Character.getDirectionality(c);
        }

        private byte skipEntityBackward() {
            byte b;
            int i = this.charIndex;
            while (this.charIndex > 0) {
                CharSequence charSequence = this.text;
                int i2 = this.charIndex - 1;
                this.charIndex = i2;
                this.lastChar = charSequence.charAt(i2);
                if (this.lastChar != '&') {
                    if (this.lastChar == ';') {
                        break;
                    }
                } else {
                    b = 12;
                    break;
                }
            }
            this.charIndex = i;
            this.lastChar = (char) 59;
            b = 13;
            return b;
        }

        private byte skipEntityForward() {
            while (this.charIndex < this.length) {
                CharSequence charSequence = this.text;
                int i = this.charIndex;
                this.charIndex = i + 1;
                char charAt = charSequence.charAt(i);
                this.lastChar = charAt;
                if (charAt == ';') {
                    return (byte) 12;
                }
            }
            return (byte) 12;
        }

        private byte skipTagBackward() {
            byte b;
            int i = this.charIndex;
            while (this.charIndex > 0) {
                CharSequence charSequence = this.text;
                int i2 = this.charIndex - 1;
                this.charIndex = i2;
                this.lastChar = charSequence.charAt(i2);
                if (this.lastChar == '<') {
                    b = 12;
                    break;
                } else if (this.lastChar == '>') {
                    break;
                } else if (this.lastChar == '\"' || this.lastChar == '\'') {
                    char c = this.lastChar;
                    while (this.charIndex > 0) {
                        CharSequence charSequence2 = this.text;
                        int i3 = this.charIndex - 1;
                        this.charIndex = i3;
                        char charAt = charSequence2.charAt(i3);
                        this.lastChar = charAt;
                        if (charAt == c) {
                            break;
                        }
                    }
                }
            }
            this.charIndex = i;
            this.lastChar = (char) 62;
            b = 13;
            return b;
        }

        private byte skipTagForward() {
            byte b;
            int i = this.charIndex;
            while (true) {
                if (this.charIndex >= this.length) {
                    this.charIndex = i;
                    this.lastChar = (char) 60;
                    b = 13;
                    break;
                }
                CharSequence charSequence = this.text;
                int i2 = this.charIndex;
                this.charIndex = i2 + 1;
                this.lastChar = charSequence.charAt(i2);
                if (this.lastChar == '>') {
                    b = 12;
                    break;
                } else if (this.lastChar == '\"' || this.lastChar == '\'') {
                    char c = this.lastChar;
                    while (this.charIndex < this.length) {
                        CharSequence charSequence2 = this.text;
                        int i3 = this.charIndex;
                        this.charIndex = i3 + 1;
                        char charAt = charSequence2.charAt(i3);
                        this.lastChar = charAt;
                        if (charAt == c) {
                            break;
                        }
                    }
                }
            }
            return b;
        }

        byte dirTypeBackward() {
            byte b;
            this.lastChar = this.text.charAt(this.charIndex - 1);
            if (Character.isLowSurrogate(this.lastChar)) {
                int codePointBefore = Character.codePointBefore(this.text, this.charIndex);
                this.charIndex -= Character.charCount(codePointBefore);
                b = Character.getDirectionality(codePointBefore);
            } else {
                this.charIndex--;
                byte cachedDirectionality = getCachedDirectionality(this.lastChar);
                b = cachedDirectionality;
                if (this.isHtml) {
                    if (this.lastChar == '>') {
                        b = skipTagBackward();
                    } else {
                        b = cachedDirectionality;
                        if (this.lastChar == ';') {
                            b = skipEntityBackward();
                        }
                    }
                }
            }
            return b;
        }

        byte dirTypeForward() {
            byte b;
            this.lastChar = this.text.charAt(this.charIndex);
            if (Character.isHighSurrogate(this.lastChar)) {
                int codePointAt = Character.codePointAt(this.text, this.charIndex);
                this.charIndex += Character.charCount(codePointAt);
                b = Character.getDirectionality(codePointAt);
            } else {
                this.charIndex++;
                byte cachedDirectionality = getCachedDirectionality(this.lastChar);
                b = cachedDirectionality;
                if (this.isHtml) {
                    if (this.lastChar == '<') {
                        b = skipTagForward();
                    } else {
                        b = cachedDirectionality;
                        if (this.lastChar == '&') {
                            b = skipEntityForward();
                        }
                    }
                }
            }
            return b;
        }

        int getEntryDir() {
            int i;
            this.charIndex = 0;
            int i2 = 0;
            int i3 = 0;
            int i4 = 0;
            while (this.charIndex < this.length && i4 == 0) {
                switch (dirTypeForward()) {
                    case 0:
                        if (i2 != 0) {
                            i4 = i2;
                            break;
                        } else {
                            i = -1;
                            return i;
                        }
                    case 1:
                    case 2:
                        if (i2 != 0) {
                            i4 = i2;
                            break;
                        } else {
                            i = 1;
                            return i;
                        }
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                    case 7:
                    case 8:
                    case 10:
                    case 11:
                    case 12:
                    case 13:
                    default:
                        i4 = i2;
                        break;
                    case 9:
                        break;
                    case 14:
                    case 15:
                        i2++;
                        i3 = -1;
                        break;
                    case 16:
                    case 17:
                        i2++;
                        i3 = 1;
                        break;
                    case 18:
                        i2--;
                        i3 = 0;
                        break;
                }
            }
            if (i4 == 0) {
                i = 0;
            } else {
                i = i3;
                if (i3 == 0) {
                    while (true) {
                        if (this.charIndex > 0) {
                            switch (dirTypeBackward()) {
                                case 14:
                                case 15:
                                    if (i4 != i2) {
                                        i2--;
                                        break;
                                    } else {
                                        i = -1;
                                        break;
                                    }
                                case 16:
                                case 17:
                                    if (i4 != i2) {
                                        i2--;
                                        break;
                                    } else {
                                        i = 1;
                                        break;
                                    }
                                case 18:
                                    i2++;
                                    break;
                            }
                        } else {
                            i = 0;
                        }
                    }
                }
            }
            return i;
        }

        int getExitDir() {
            int i;
            this.charIndex = this.length;
            int i2 = 0;
            int i3 = 0;
            while (true) {
                if (this.charIndex > 0) {
                    switch (dirTypeBackward()) {
                        case 0:
                            if (i2 != 0) {
                                if (i3 != 0) {
                                    break;
                                } else {
                                    i3 = i2;
                                    break;
                                }
                            } else {
                                i = -1;
                                break;
                            }
                        case 1:
                        case 2:
                            if (i2 != 0) {
                                if (i3 != 0) {
                                    break;
                                } else {
                                    i3 = i2;
                                    break;
                                }
                            } else {
                                i = 1;
                                break;
                            }
                        case 3:
                        case 4:
                        case 5:
                        case 6:
                        case 7:
                        case 8:
                        case 10:
                        case 11:
                        case 12:
                        case 13:
                        default:
                            if (i3 != 0) {
                                break;
                            } else {
                                i3 = i2;
                                break;
                            }
                        case 9:
                            break;
                        case 14:
                        case 15:
                            i = -1;
                            if (i3 == i2) {
                                break;
                            } else {
                                i2--;
                                break;
                            }
                        case 16:
                        case 17:
                            if (i3 != i2) {
                                i2--;
                                break;
                            } else {
                                i = 1;
                                break;
                            }
                        case 18:
                            i2++;
                            break;
                    }
                } else {
                    i = 0;
                }
            }
            return i;
        }
    }

    private BidiFormatter(boolean z, int i, TextDirectionHeuristicCompat textDirectionHeuristicCompat) {
        this.mIsRtlContext = z;
        this.mFlags = i;
        this.mDefaultTextDirectionHeuristicCompat = textDirectionHeuristicCompat;
    }

    private static int getEntryDir(CharSequence charSequence) {
        return new DirectionalityEstimator(charSequence, false).getEntryDir();
    }

    private static int getExitDir(CharSequence charSequence) {
        return new DirectionalityEstimator(charSequence, false).getExitDir();
    }

    public static BidiFormatter getInstance() {
        return new Builder().build();
    }

    public static BidiFormatter getInstance(Locale locale) {
        return new Builder(locale).build();
    }

    public static BidiFormatter getInstance(boolean z) {
        return new Builder(z).build();
    }

    public static boolean isRtlLocale(Locale locale) {
        boolean z = true;
        if (TextUtilsCompat.getLayoutDirectionFromLocale(locale) != 1) {
            z = false;
        }
        return z;
    }

    private String markAfter(CharSequence charSequence, TextDirectionHeuristicCompat textDirectionHeuristicCompat) {
        boolean isRtl = textDirectionHeuristicCompat.isRtl(charSequence, 0, charSequence.length());
        return (this.mIsRtlContext || (!isRtl && getExitDir(charSequence) != 1)) ? (!this.mIsRtlContext || (isRtl && getExitDir(charSequence) != -1)) ? "" : RLM_STRING : LRM_STRING;
    }

    private String markBefore(CharSequence charSequence, TextDirectionHeuristicCompat textDirectionHeuristicCompat) {
        boolean isRtl = textDirectionHeuristicCompat.isRtl(charSequence, 0, charSequence.length());
        return (this.mIsRtlContext || (!isRtl && getEntryDir(charSequence) != 1)) ? (!this.mIsRtlContext || (isRtl && getEntryDir(charSequence) != -1)) ? "" : RLM_STRING : LRM_STRING;
    }

    public boolean getStereoReset() {
        return (this.mFlags & 2) != 0;
    }

    public boolean isRtl(CharSequence charSequence) {
        return this.mDefaultTextDirectionHeuristicCompat.isRtl(charSequence, 0, charSequence.length());
    }

    public boolean isRtl(String str) {
        return isRtl((CharSequence) str);
    }

    public boolean isRtlContext() {
        return this.mIsRtlContext;
    }

    public CharSequence unicodeWrap(CharSequence charSequence) {
        return unicodeWrap(charSequence, this.mDefaultTextDirectionHeuristicCompat, true);
    }

    public CharSequence unicodeWrap(CharSequence charSequence, TextDirectionHeuristicCompat textDirectionHeuristicCompat) {
        return unicodeWrap(charSequence, textDirectionHeuristicCompat, true);
    }

    public CharSequence unicodeWrap(CharSequence charSequence, TextDirectionHeuristicCompat textDirectionHeuristicCompat, boolean z) {
        SpannableStringBuilder spannableStringBuilder;
        if (charSequence == null) {
            spannableStringBuilder = null;
        } else {
            boolean isRtl = textDirectionHeuristicCompat.isRtl(charSequence, 0, charSequence.length());
            SpannableStringBuilder spannableStringBuilder2 = new SpannableStringBuilder();
            if (getStereoReset() && z) {
                spannableStringBuilder2.append((CharSequence) markBefore(charSequence, isRtl ? TextDirectionHeuristicsCompat.RTL : TextDirectionHeuristicsCompat.LTR));
            }
            if (isRtl != this.mIsRtlContext) {
                spannableStringBuilder2.append(isRtl ? RLE : LRE);
                spannableStringBuilder2.append(charSequence);
                spannableStringBuilder2.append((char) 8236);
            } else {
                spannableStringBuilder2.append(charSequence);
            }
            spannableStringBuilder = spannableStringBuilder2;
            if (z) {
                spannableStringBuilder2.append((CharSequence) markAfter(charSequence, isRtl ? TextDirectionHeuristicsCompat.RTL : TextDirectionHeuristicsCompat.LTR));
                spannableStringBuilder = spannableStringBuilder2;
            }
        }
        return spannableStringBuilder;
    }

    public CharSequence unicodeWrap(CharSequence charSequence, boolean z) {
        return unicodeWrap(charSequence, this.mDefaultTextDirectionHeuristicCompat, z);
    }

    public String unicodeWrap(String str) {
        return unicodeWrap(str, this.mDefaultTextDirectionHeuristicCompat, true);
    }

    public String unicodeWrap(String str, TextDirectionHeuristicCompat textDirectionHeuristicCompat) {
        return unicodeWrap(str, textDirectionHeuristicCompat, true);
    }

    public String unicodeWrap(String str, TextDirectionHeuristicCompat textDirectionHeuristicCompat, boolean z) {
        return str == null ? null : unicodeWrap((CharSequence) str, textDirectionHeuristicCompat, z).toString();
    }

    public String unicodeWrap(String str, boolean z) {
        return unicodeWrap(str, this.mDefaultTextDirectionHeuristicCompat, z);
    }
}
