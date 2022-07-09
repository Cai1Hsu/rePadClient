package org.apache.commons.net.ftp.parser;

import java.util.regex.MatchResult;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;
import org.apache.commons.net.ftp.FTPFileEntryParserImpl;

/* loaded from: classes.jar:org/apache/commons/net/ftp/parser/RegexFTPFileEntryParserImpl.class */
public abstract class RegexFTPFileEntryParserImpl extends FTPFileEntryParserImpl {
    private Pattern pattern = null;
    private MatchResult result = null;
    protected Matcher _matcher_ = null;

    public RegexFTPFileEntryParserImpl(String str) {
        setRegex(str);
    }

    public int getGroupCnt() {
        return this.result == null ? 0 : this.result.groupCount();
    }

    public String getGroupsAsString() {
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i <= this.result.groupCount(); i++) {
            sb.append(i).append(") ").append(this.result.group(i)).append(System.getProperty("line.separator"));
        }
        return sb.toString();
    }

    public String group(int i) {
        return this.result == null ? null : this.result.group(i);
    }

    public boolean matches(String str) {
        this.result = null;
        this._matcher_ = this.pattern.matcher(str);
        if (this._matcher_.matches()) {
            this.result = this._matcher_.toMatchResult();
        }
        return this.result != null;
    }

    public boolean setRegex(String str) {
        try {
            this.pattern = Pattern.compile(str);
            return this.pattern != null;
        } catch (PatternSyntaxException e) {
            throw new IllegalArgumentException("Unparseable regex supplied: " + str);
        }
    }
}
