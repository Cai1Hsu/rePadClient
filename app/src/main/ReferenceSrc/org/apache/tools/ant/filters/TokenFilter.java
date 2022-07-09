package org.apache.tools.ant.filters;

import java.io.IOException;
import java.io.Reader;
import java.util.Enumeration;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.types.RegularExpression;
import org.apache.tools.ant.types.Substitution;
import org.apache.tools.ant.util.LineTokenizer;
import org.apache.tools.ant.util.StringUtils;
import org.apache.tools.ant.util.Tokenizer;
import org.apache.tools.ant.util.regexp.Regexp;
import org.apache.tools.ant.util.regexp.RegexpUtil;

/* loaded from: classes.jar:org/apache/tools/ant/filters/TokenFilter.class */
public class TokenFilter extends BaseFilterReader implements ChainableReader {
    private Vector filters = new Vector();
    private Tokenizer tokenizer = null;
    private String delimOutput = null;
    private String line = null;
    private int linePos = 0;

    /* loaded from: classes.jar:org/apache/tools/ant/filters/TokenFilter$ChainableReaderFilter.class */
    public static abstract class ChainableReaderFilter extends ProjectComponent implements ChainableReader, Filter {
        private boolean byLine = true;

        @Override // org.apache.tools.ant.filters.ChainableReader
        public Reader chain(Reader reader) {
            TokenFilter tokenFilter = new TokenFilter(reader);
            if (!this.byLine) {
                tokenFilter.add(new FileTokenizer());
            }
            tokenFilter.add(this);
            return tokenFilter;
        }

        public void setByLine(boolean z) {
            this.byLine = z;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/filters/TokenFilter$ContainsRegex.class */
    public static class ContainsRegex extends ChainableReaderFilter {
        private String from;
        private int options;
        private Regexp regexp;
        private RegularExpression regularExpression;
        private Substitution substitution;
        private String to;
        private boolean initialized = false;
        private String flags = "";

        private void initialize() {
            if (this.initialized) {
                return;
            }
            this.options = TokenFilter.convertRegexOptions(this.flags);
            if (this.from == null) {
                throw new BuildException("Missing from in containsregex");
            }
            this.regularExpression = new RegularExpression();
            this.regularExpression.setPattern(this.from);
            this.regexp = this.regularExpression.getRegexp(getProject());
            if (this.to == null) {
                return;
            }
            this.substitution = new Substitution();
            this.substitution.setExpression(this.to);
        }

        @Override // org.apache.tools.ant.filters.TokenFilter.Filter
        public String filter(String str) {
            String str2;
            initialize();
            if (!this.regexp.matches(str, this.options)) {
                str2 = null;
            } else {
                str2 = str;
                if (this.substitution != null) {
                    str2 = this.regexp.substitute(str, this.substitution.getExpression(getProject()), this.options);
                }
            }
            return str2;
        }

        public void setFlags(String str) {
            this.flags = str;
        }

        public void setPattern(String str) {
            this.from = str;
        }

        public void setReplace(String str) {
            this.to = str;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/filters/TokenFilter$ContainsString.class */
    public static class ContainsString extends ProjectComponent implements Filter {
        private String contains;

        @Override // org.apache.tools.ant.filters.TokenFilter.Filter
        public String filter(String str) {
            if (this.contains == null) {
                throw new BuildException("Missing contains in containsstring");
            }
            if (str.indexOf(this.contains) <= -1) {
                str = null;
            }
            return str;
        }

        public void setContains(String str) {
            this.contains = str;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/filters/TokenFilter$DeleteCharacters.class */
    public static class DeleteCharacters extends ProjectComponent implements Filter, ChainableReader {
        private String deleteChars = "";

        public boolean isDeleteCharacter(char c) {
            boolean z;
            int i = 0;
            while (true) {
                if (i >= this.deleteChars.length()) {
                    z = false;
                    break;
                } else if (this.deleteChars.charAt(i) == c) {
                    z = true;
                    break;
                } else {
                    i++;
                }
            }
            return z;
        }

        @Override // org.apache.tools.ant.filters.ChainableReader
        public Reader chain(Reader reader) {
            return new BaseFilterReader(this, reader) { // from class: org.apache.tools.ant.filters.TokenFilter.1
                private final DeleteCharacters this$0;

                {
                    this.this$0 = this;
                }

                @Override // java.io.FilterReader, java.io.Reader
                public int read() throws IOException {
                    int read;
                    do {
                        read = this.in.read();
                        if (read == -1) {
                            break;
                        }
                    } while (this.this$0.isDeleteCharacter((char) read));
                    return read;
                }
            };
        }

        @Override // org.apache.tools.ant.filters.TokenFilter.Filter
        public String filter(String str) {
            StringBuffer stringBuffer = new StringBuffer(str.length());
            for (int i = 0; i < str.length(); i++) {
                char charAt = str.charAt(i);
                if (!isDeleteCharacter(charAt)) {
                    stringBuffer.append(charAt);
                }
            }
            return stringBuffer.toString();
        }

        public void setChars(String str) {
            this.deleteChars = TokenFilter.resolveBackSlash(str);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/filters/TokenFilter$FileTokenizer.class */
    public static class FileTokenizer extends org.apache.tools.ant.util.FileTokenizer {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/filters/TokenFilter$Filter.class */
    public interface Filter {
        String filter(String str);
    }

    /* loaded from: classes.jar:org/apache/tools/ant/filters/TokenFilter$IgnoreBlank.class */
    public static class IgnoreBlank extends ChainableReaderFilter {
        @Override // org.apache.tools.ant.filters.TokenFilter.Filter
        public String filter(String str) {
            String str2 = str;
            if (str.trim().length() == 0) {
                str2 = null;
            }
            return str2;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/filters/TokenFilter$ReplaceRegex.class */
    public static class ReplaceRegex extends ChainableReaderFilter {
        private String from;
        private int options;
        private Regexp regexp;
        private RegularExpression regularExpression;
        private Substitution substitution;
        private String to;
        private boolean initialized = false;
        private String flags = "";

        private void initialize() {
            if (this.initialized) {
                return;
            }
            this.options = TokenFilter.convertRegexOptions(this.flags);
            if (this.from == null) {
                throw new BuildException("Missing pattern in replaceregex");
            }
            this.regularExpression = new RegularExpression();
            this.regularExpression.setPattern(this.from);
            this.regexp = this.regularExpression.getRegexp(getProject());
            if (this.to == null) {
                this.to = "";
            }
            this.substitution = new Substitution();
            this.substitution.setExpression(this.to);
        }

        @Override // org.apache.tools.ant.filters.TokenFilter.Filter
        public String filter(String str) {
            initialize();
            if (this.regexp.matches(str, this.options)) {
                str = this.regexp.substitute(str, this.substitution.getExpression(getProject()), this.options);
            }
            return str;
        }

        public void setFlags(String str) {
            this.flags = str;
        }

        public void setPattern(String str) {
            this.from = str;
        }

        public void setReplace(String str) {
            this.to = str;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/filters/TokenFilter$ReplaceString.class */
    public static class ReplaceString extends ChainableReaderFilter {
        private String from;
        private String to;

        @Override // org.apache.tools.ant.filters.TokenFilter.Filter
        public String filter(String str) {
            if (this.from == null) {
                throw new BuildException("Missing from in stringreplace");
            }
            StringBuffer stringBuffer = new StringBuffer();
            int i = 0;
            int indexOf = str.indexOf(this.from);
            while (true) {
                int i2 = indexOf;
                if (i2 < 0) {
                    break;
                }
                if (i2 > i) {
                    stringBuffer.append(str.substring(i, i2));
                }
                if (this.to != null) {
                    stringBuffer.append(this.to);
                }
                i = i2 + this.from.length();
                indexOf = str.indexOf(this.from, i);
            }
            if (str.length() > i) {
                stringBuffer.append(str.substring(i, str.length()));
            }
            return stringBuffer.toString();
        }

        public void setFrom(String str) {
            this.from = str;
        }

        public void setTo(String str) {
            this.to = str;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/filters/TokenFilter$StringTokenizer.class */
    public static class StringTokenizer extends org.apache.tools.ant.util.StringTokenizer {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/filters/TokenFilter$Trim.class */
    public static class Trim extends ChainableReaderFilter {
        @Override // org.apache.tools.ant.filters.TokenFilter.Filter
        public String filter(String str) {
            return str.trim();
        }
    }

    public TokenFilter() {
    }

    public TokenFilter(Reader reader) {
        super(reader);
    }

    public static int convertRegexOptions(String str) {
        return RegexpUtil.asOptions(str);
    }

    public static String resolveBackSlash(String str) {
        return StringUtils.resolveBackSlash(str);
    }

    public void add(Filter filter) {
        this.filters.addElement(filter);
    }

    public void add(Tokenizer tokenizer) {
        if (this.tokenizer != null) {
            throw new BuildException("Only one tokenizer allowed");
        }
        this.tokenizer = tokenizer;
    }

    public void addContainsRegex(ContainsRegex containsRegex) {
        this.filters.addElement(containsRegex);
    }

    public void addContainsString(ContainsString containsString) {
        this.filters.addElement(containsString);
    }

    public void addDeleteCharacters(DeleteCharacters deleteCharacters) {
        this.filters.addElement(deleteCharacters);
    }

    public void addFileTokenizer(FileTokenizer fileTokenizer) {
        add(fileTokenizer);
    }

    public void addIgnoreBlank(IgnoreBlank ignoreBlank) {
        this.filters.addElement(ignoreBlank);
    }

    public void addLineTokenizer(LineTokenizer lineTokenizer) {
        add(lineTokenizer);
    }

    public void addReplaceRegex(ReplaceRegex replaceRegex) {
        this.filters.addElement(replaceRegex);
    }

    public void addReplaceString(ReplaceString replaceString) {
        this.filters.addElement(replaceString);
    }

    public void addStringTokenizer(StringTokenizer stringTokenizer) {
        add(stringTokenizer);
    }

    public void addTrim(Trim trim) {
        this.filters.addElement(trim);
    }

    @Override // org.apache.tools.ant.filters.ChainableReader
    public final Reader chain(Reader reader) {
        TokenFilter tokenFilter = new TokenFilter(reader);
        tokenFilter.filters = this.filters;
        tokenFilter.tokenizer = this.tokenizer;
        tokenFilter.delimOutput = this.delimOutput;
        tokenFilter.setProject(getProject());
        return tokenFilter;
    }

    @Override // java.io.FilterReader, java.io.Reader
    public int read() throws IOException {
        char c;
        if (this.tokenizer == null) {
            this.tokenizer = new LineTokenizer();
        }
        while (true) {
            if (this.line == null || this.line.length() == 0) {
                this.line = this.tokenizer.getToken(this.in);
                if (this.line == null) {
                    c = 65535;
                    break;
                }
                Enumeration elements = this.filters.elements();
                while (elements.hasMoreElements()) {
                    this.line = ((Filter) elements.nextElement()).filter(this.line);
                    if (this.line == null) {
                        break;
                    }
                }
                this.linePos = 0;
                if (this.line != null && this.tokenizer.getPostToken().length() != 0) {
                    if (this.delimOutput != null) {
                        this.line = new StringBuffer().append(this.line).append(this.delimOutput).toString();
                    } else {
                        this.line = new StringBuffer().append(this.line).append(this.tokenizer.getPostToken()).toString();
                    }
                }
            } else {
                char charAt = this.line.charAt(this.linePos);
                this.linePos++;
                c = charAt;
                if (this.linePos == this.line.length()) {
                    this.line = null;
                    c = charAt;
                }
            }
        }
        return c;
    }

    public void setDelimOutput(String str) {
        this.delimOutput = resolveBackSlash(str);
    }
}
