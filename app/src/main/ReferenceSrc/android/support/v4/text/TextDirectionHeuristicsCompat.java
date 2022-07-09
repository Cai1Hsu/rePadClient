package android.support.v4.text;

import java.nio.CharBuffer;
import java.util.Locale;

/* loaded from: classes.jar:android/support/v4/text/TextDirectionHeuristicsCompat.class */
public final class TextDirectionHeuristicsCompat {
    private static final int STATE_FALSE = 1;
    private static final int STATE_TRUE = 0;
    private static final int STATE_UNKNOWN = 2;
    public static final TextDirectionHeuristicCompat LTR = new TextDirectionHeuristicInternal(null, false);
    public static final TextDirectionHeuristicCompat RTL = new TextDirectionHeuristicInternal(null, true);
    public static final TextDirectionHeuristicCompat FIRSTSTRONG_LTR = new TextDirectionHeuristicInternal(FirstStrong.INSTANCE, false);
    public static final TextDirectionHeuristicCompat FIRSTSTRONG_RTL = new TextDirectionHeuristicInternal(FirstStrong.INSTANCE, true);
    public static final TextDirectionHeuristicCompat ANYRTL_LTR = new TextDirectionHeuristicInternal(AnyStrong.INSTANCE_RTL, false);
    public static final TextDirectionHeuristicCompat LOCALE = TextDirectionHeuristicLocale.INSTANCE;

    /* loaded from: classes.jar:android/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong.class */
    private static class AnyStrong implements TextDirectionAlgorithm {
        private final boolean mLookForRtl;
        public static final AnyStrong INSTANCE_RTL = new AnyStrong(true);
        public static final AnyStrong INSTANCE_LTR = new AnyStrong(false);

        private AnyStrong(boolean z) {
            this.mLookForRtl = z;
        }

        @Override // android.support.v4.text.TextDirectionHeuristicsCompat.TextDirectionAlgorithm
        public int checkRtl(CharSequence charSequence, int i, int i2) {
            int i3;
            boolean z = false;
            int i4 = i;
            while (true) {
                if (i4 < i + i2) {
                    switch (TextDirectionHeuristicsCompat.isRtlText(Character.getDirectionality(charSequence.charAt(i4)))) {
                        case 0:
                            if (!this.mLookForRtl) {
                                z = true;
                                break;
                            } else {
                                i3 = 0;
                                break;
                            }
                        case 1:
                            i3 = 1;
                            if (!this.mLookForRtl) {
                                break;
                            } else {
                                z = true;
                                break;
                            }
                    }
                    i4++;
                } else if (z) {
                    i3 = 1;
                    if (!this.mLookForRtl) {
                        i3 = 0;
                    }
                } else {
                    i3 = 2;
                }
            }
            return i3;
        }
    }

    /* loaded from: classes.jar:android/support/v4/text/TextDirectionHeuristicsCompat$FirstStrong.class */
    private static class FirstStrong implements TextDirectionAlgorithm {
        public static final FirstStrong INSTANCE = new FirstStrong();

        private FirstStrong() {
        }

        @Override // android.support.v4.text.TextDirectionHeuristicsCompat.TextDirectionAlgorithm
        public int checkRtl(CharSequence charSequence, int i, int i2) {
            int i3 = 2;
            for (int i4 = i; i4 < i + i2 && i3 == 2; i4++) {
                i3 = TextDirectionHeuristicsCompat.isRtlTextOrFormat(Character.getDirectionality(charSequence.charAt(i4)));
            }
            return i3;
        }
    }

    /* loaded from: classes.jar:android/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionAlgorithm.class */
    private interface TextDirectionAlgorithm {
        int checkRtl(CharSequence charSequence, int i, int i2);
    }

    /* loaded from: classes.jar:android/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicImpl.class */
    private static abstract class TextDirectionHeuristicImpl implements TextDirectionHeuristicCompat {
        private final TextDirectionAlgorithm mAlgorithm;

        public TextDirectionHeuristicImpl(TextDirectionAlgorithm textDirectionAlgorithm) {
            this.mAlgorithm = textDirectionAlgorithm;
        }

        private boolean doCheck(CharSequence charSequence, int i, int i2) {
            boolean z;
            switch (this.mAlgorithm.checkRtl(charSequence, i, i2)) {
                case 0:
                    z = true;
                    break;
                case 1:
                    z = false;
                    break;
                default:
                    z = defaultIsRtl();
                    break;
            }
            return z;
        }

        protected abstract boolean defaultIsRtl();

        @Override // android.support.v4.text.TextDirectionHeuristicCompat
        public boolean isRtl(CharSequence charSequence, int i, int i2) {
            if (charSequence == null || i < 0 || i2 < 0 || charSequence.length() - i2 < i) {
                throw new IllegalArgumentException();
            }
            return this.mAlgorithm == null ? defaultIsRtl() : doCheck(charSequence, i, i2);
        }

        @Override // android.support.v4.text.TextDirectionHeuristicCompat
        public boolean isRtl(char[] cArr, int i, int i2) {
            return isRtl(CharBuffer.wrap(cArr), i, i2);
        }
    }

    /* loaded from: classes.jar:android/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicInternal.class */
    private static class TextDirectionHeuristicInternal extends TextDirectionHeuristicImpl {
        private final boolean mDefaultIsRtl;

        TextDirectionHeuristicInternal(TextDirectionAlgorithm textDirectionAlgorithm, boolean z) {
            super(textDirectionAlgorithm);
            this.mDefaultIsRtl = z;
        }

        @Override // android.support.v4.text.TextDirectionHeuristicsCompat.TextDirectionHeuristicImpl
        protected boolean defaultIsRtl() {
            return this.mDefaultIsRtl;
        }
    }

    /* loaded from: classes.jar:android/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicLocale.class */
    private static class TextDirectionHeuristicLocale extends TextDirectionHeuristicImpl {
        public static final TextDirectionHeuristicLocale INSTANCE = new TextDirectionHeuristicLocale();

        public TextDirectionHeuristicLocale() {
            super(null);
        }

        @Override // android.support.v4.text.TextDirectionHeuristicsCompat.TextDirectionHeuristicImpl
        protected boolean defaultIsRtl() {
            boolean z = true;
            if (TextUtilsCompat.getLayoutDirectionFromLocale(Locale.getDefault()) != 1) {
                z = false;
            }
            return z;
        }
    }

    private TextDirectionHeuristicsCompat() {
    }

    static int isRtlText(int i) {
        int i2;
        switch (i) {
            case 0:
                i2 = 1;
                break;
            case 1:
            case 2:
                i2 = 0;
                break;
            default:
                i2 = 2;
                break;
        }
        return i2;
    }

    static int isRtlTextOrFormat(int i) {
        int i2;
        switch (i) {
            case 0:
            case 14:
            case 15:
                i2 = 1;
                break;
            case 1:
            case 2:
            case 16:
            case 17:
                i2 = 0;
                break;
            default:
                i2 = 2;
                break;
        }
        return i2;
    }
}
