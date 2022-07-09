package org.apache.tools.ant.filters;

import org.apache.tools.ant.filters.TokenFilter;

/* loaded from: classes.jar:org/apache/tools/ant/filters/UniqFilter.class */
public class UniqFilter extends TokenFilter.ChainableReaderFilter {
    private String lastLine = null;

    @Override // org.apache.tools.ant.filters.TokenFilter.Filter
    public String filter(String str) {
        if (this.lastLine == null || !this.lastLine.equals(str)) {
            this.lastLine = str;
        } else {
            str = null;
        }
        return str;
    }
}
