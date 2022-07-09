package org.apache.tools.ant.types.selectors;

import java.io.File;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/TokenizedPattern.class */
public class TokenizedPattern {
    public static final TokenizedPattern EMPTY_PATTERN = new TokenizedPattern("", new String[0]);
    private final String pattern;
    private final String[] tokenizedPattern;

    public TokenizedPattern(String str) {
        this(str, SelectorUtils.tokenizePathAsArray(str));
    }

    TokenizedPattern(String str, String[] strArr) {
        this.pattern = str;
        this.tokenizedPattern = strArr;
    }

    public boolean containsPattern(String str) {
        boolean z;
        int i = 0;
        while (true) {
            if (i >= this.tokenizedPattern.length) {
                z = false;
                break;
            } else if (this.tokenizedPattern[i].equals(str)) {
                z = true;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    public int depth() {
        return this.tokenizedPattern.length;
    }

    public boolean endsWith(String str) {
        return this.tokenizedPattern.length > 0 && this.tokenizedPattern[this.tokenizedPattern.length - 1].equals(str);
    }

    public boolean equals(Object obj) {
        return (obj instanceof TokenizedPattern) && this.pattern.equals(((TokenizedPattern) obj).pattern);
    }

    public String getPattern() {
        return this.pattern;
    }

    public int hashCode() {
        return this.pattern.hashCode();
    }

    public boolean matchPath(TokenizedPath tokenizedPath, boolean z) {
        return SelectorUtils.matchPath(this.tokenizedPattern, tokenizedPath.getTokens(), z);
    }

    public boolean matchStartOf(TokenizedPath tokenizedPath, boolean z) {
        return SelectorUtils.matchPatternStart(this.tokenizedPattern, tokenizedPath.getTokens(), z);
    }

    public TokenizedPath rtrimWildcardTokens() {
        TokenizedPath tokenizedPath;
        StringBuffer stringBuffer = new StringBuffer();
        int i = 0;
        while (i < this.tokenizedPattern.length && !SelectorUtils.hasWildcards(this.tokenizedPattern[i])) {
            if (i > 0 && stringBuffer.charAt(stringBuffer.length() - 1) != File.separatorChar) {
                stringBuffer.append(File.separator);
            }
            stringBuffer.append(this.tokenizedPattern[i]);
            i++;
        }
        if (i == 0) {
            tokenizedPath = TokenizedPath.EMPTY_PATH;
        } else {
            String[] strArr = new String[i];
            System.arraycopy(this.tokenizedPattern, 0, strArr, 0, i);
            tokenizedPath = new TokenizedPath(stringBuffer.toString(), strArr);
        }
        return tokenizedPath;
    }

    public String toString() {
        return this.pattern;
    }

    public TokenizedPattern withoutLastToken() {
        TokenizedPattern tokenizedPattern;
        if (this.tokenizedPattern.length == 0) {
            throw new IllegalStateException("cant strip a token from nothing");
        }
        if (this.tokenizedPattern.length == 1) {
            tokenizedPattern = EMPTY_PATTERN;
        } else {
            int lastIndexOf = this.pattern.lastIndexOf(this.tokenizedPattern[this.tokenizedPattern.length - 1]);
            String[] strArr = new String[this.tokenizedPattern.length - 1];
            System.arraycopy(this.tokenizedPattern, 0, strArr, 0, this.tokenizedPattern.length - 1);
            tokenizedPattern = new TokenizedPattern(this.pattern.substring(0, lastIndexOf), strArr);
        }
        return tokenizedPattern;
    }
}
