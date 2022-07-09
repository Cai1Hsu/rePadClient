package org.apache.tools.ant.filters;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.Parameter;

/* loaded from: classes.jar:org/apache/tools/ant/filters/SortFilter.class */
public final class SortFilter extends BaseParamFilterReader implements ChainableReader {
    private static final String COMPARATOR_KEY = "comparator";
    private static final String REVERSE_KEY = "reverse";
    private List lines;
    private boolean reverse;
    private Comparator comparator = null;
    private String line = null;
    private Iterator iterator = null;

    public SortFilter() {
    }

    public SortFilter(Reader reader) {
        super(reader);
    }

    private void initialize() throws IOException {
        Parameter[] parameters = getParameters();
        if (parameters != null) {
            for (int i = 0; i < parameters.length; i++) {
                String name = parameters[i].getName();
                if (REVERSE_KEY.equals(name)) {
                    setReverse(Boolean.valueOf(parameters[i].getValue()).booleanValue());
                } else if (COMPARATOR_KEY.equals(name)) {
                    try {
                        setComparator((Comparator) Class.forName(parameters[i].getValue()).newInstance());
                    } catch (ClassCastException e) {
                        throw new BuildException("Value of comparator attribute should implement java.util.Comparator interface");
                    } catch (ClassNotFoundException e2) {
                        throw new BuildException(e2);
                    } catch (IllegalAccessException e3) {
                        throw new BuildException(e3);
                    } catch (InstantiationException e4) {
                        throw new BuildException(e4);
                    } catch (Exception e5) {
                        throw new BuildException(e5);
                    }
                } else {
                    continue;
                }
            }
        }
    }

    private void sort() {
        if (this.comparator != null) {
            Collections.sort(this.lines, this.comparator);
        } else if (this.reverse) {
            Collections.sort(this.lines, new Comparator(this) { // from class: org.apache.tools.ant.filters.SortFilter.1
                private final SortFilter this$0;

                {
                    this.this$0 = this;
                }

                @Override // java.util.Comparator
                public int compare(Object obj, Object obj2) {
                    return -((String) obj).compareTo((String) obj2);
                }
            });
        } else {
            Collections.sort(this.lines);
        }
    }

    public void add(Comparator comparator) {
        if (this.comparator == null || comparator == null) {
            setComparator(comparator);
            return;
        }
        throw new BuildException("can't have more than one comparator");
    }

    @Override // org.apache.tools.ant.filters.ChainableReader
    public Reader chain(Reader reader) {
        SortFilter sortFilter = new SortFilter(reader);
        sortFilter.setReverse(isReverse());
        sortFilter.setComparator(getComparator());
        sortFilter.setInitialized(true);
        return sortFilter;
    }

    public Comparator getComparator() {
        return this.comparator;
    }

    public boolean isReverse() {
        return this.reverse;
    }

    @Override // java.io.FilterReader, java.io.Reader
    public int read() throws IOException {
        if (!getInitialized()) {
            initialize();
            setInitialized(true);
        }
        char c = 65535;
        if (this.line != null) {
            c = this.line.charAt(0);
            if (this.line.length() == 1) {
                this.line = null;
            } else {
                this.line = this.line.substring(1);
            }
        } else {
            if (this.lines == null) {
                this.lines = new ArrayList();
                this.line = readLine();
                while (this.line != null) {
                    this.lines.add(this.line);
                    this.line = readLine();
                }
                sort();
                this.iterator = this.lines.iterator();
            }
            if (this.iterator.hasNext()) {
                this.line = (String) this.iterator.next();
            } else {
                this.line = null;
                this.lines = null;
                this.iterator = null;
            }
            if (this.line != null) {
                c = read();
            }
        }
        return c;
    }

    public void setComparator(Comparator comparator) {
        this.comparator = comparator;
    }

    public void setReverse(boolean z) {
        this.reverse = z;
    }
}
