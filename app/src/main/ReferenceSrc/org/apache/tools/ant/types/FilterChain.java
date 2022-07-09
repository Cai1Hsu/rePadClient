package org.apache.tools.ant.types;

import java.util.Iterator;
import java.util.Stack;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.filters.ChainableReader;
import org.apache.tools.ant.filters.ClassConstants;
import org.apache.tools.ant.filters.EscapeUnicode;
import org.apache.tools.ant.filters.ExpandProperties;
import org.apache.tools.ant.filters.HeadFilter;
import org.apache.tools.ant.filters.LineContains;
import org.apache.tools.ant.filters.LineContainsRegExp;
import org.apache.tools.ant.filters.PrefixLines;
import org.apache.tools.ant.filters.ReplaceTokens;
import org.apache.tools.ant.filters.StripJavaComments;
import org.apache.tools.ant.filters.StripLineBreaks;
import org.apache.tools.ant.filters.StripLineComments;
import org.apache.tools.ant.filters.SuffixLines;
import org.apache.tools.ant.filters.TabsToSpaces;
import org.apache.tools.ant.filters.TailFilter;
import org.apache.tools.ant.filters.TokenFilter;

/* loaded from: classes.jar:org/apache/tools/ant/types/FilterChain.class */
public class FilterChain extends DataType implements Cloneable {
    private Vector filterReaders = new Vector();

    public void add(ChainableReader chainableReader) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(chainableReader);
    }

    public void addClassConstants(ClassConstants classConstants) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(classConstants);
    }

    public void addContainsRegex(TokenFilter.ContainsRegex containsRegex) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(containsRegex);
    }

    public void addDeleteCharacters(TokenFilter.DeleteCharacters deleteCharacters) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(deleteCharacters);
    }

    public void addEscapeUnicode(EscapeUnicode escapeUnicode) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(escapeUnicode);
    }

    public void addExpandProperties(ExpandProperties expandProperties) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(expandProperties);
    }

    public void addFilterReader(AntFilterReader antFilterReader) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(antFilterReader);
    }

    public void addHeadFilter(HeadFilter headFilter) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(headFilter);
    }

    public void addIgnoreBlank(TokenFilter.IgnoreBlank ignoreBlank) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(ignoreBlank);
    }

    public void addLineContains(LineContains lineContains) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(lineContains);
    }

    public void addLineContainsRegExp(LineContainsRegExp lineContainsRegExp) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(lineContainsRegExp);
    }

    public void addPrefixLines(PrefixLines prefixLines) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(prefixLines);
    }

    public void addReplaceRegex(TokenFilter.ReplaceRegex replaceRegex) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(replaceRegex);
    }

    public void addReplaceString(TokenFilter.ReplaceString replaceString) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(replaceString);
    }

    public void addReplaceTokens(ReplaceTokens replaceTokens) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(replaceTokens);
    }

    public void addStripJavaComments(StripJavaComments stripJavaComments) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(stripJavaComments);
    }

    public void addStripLineBreaks(StripLineBreaks stripLineBreaks) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(stripLineBreaks);
    }

    public void addStripLineComments(StripLineComments stripLineComments) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(stripLineComments);
    }

    public void addSuffixLines(SuffixLines suffixLines) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(suffixLines);
    }

    public void addTabsToSpaces(TabsToSpaces tabsToSpaces) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(tabsToSpaces);
    }

    public void addTailFilter(TailFilter tailFilter) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(tailFilter);
    }

    public void addTokenFilter(TokenFilter tokenFilter) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(tokenFilter);
    }

    public void addTrim(TokenFilter.Trim trim) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.filterReaders.addElement(trim);
    }

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        synchronized (this) {
            if (!isChecked()) {
                if (isReference()) {
                    super.dieOnCircularReference(stack, project);
                } else {
                    Iterator it = this.filterReaders.iterator();
                    while (it.hasNext()) {
                        Object next = it.next();
                        if (next instanceof DataType) {
                            pushAndInvokeCircularReferenceCheck((DataType) next, stack, project);
                        }
                    }
                    setChecked(true);
                }
            }
        }
    }

    public Vector getFilterReaders() {
        Vector vector;
        if (isReference()) {
            vector = ((FilterChain) getCheckedRef()).getFilterReaders();
        } else {
            dieOnCircularReference();
            vector = this.filterReaders;
        }
        return vector;
    }

    @Override // org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) throws BuildException {
        if (!this.filterReaders.isEmpty()) {
            throw tooManyAttributes();
        }
        super.setRefid(reference);
    }
}
