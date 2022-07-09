package org.apache.tools.ant.filters;

import java.io.IOException;
import java.io.Reader;
import org.apache.tools.ant.types.Parameter;

/* loaded from: classes.jar:org/apache/tools/ant/filters/TabsToSpaces.class */
public final class TabsToSpaces extends BaseParamFilterReader implements ChainableReader {
    private static final int DEFAULT_TAB_LENGTH = 8;
    private static final String TAB_LENGTH_KEY = "tablength";
    private int tabLength = 8;
    private int spacesRemaining = 0;

    public TabsToSpaces() {
    }

    public TabsToSpaces(Reader reader) {
        super(reader);
    }

    private int getTablength() {
        return this.tabLength;
    }

    private void initialize() {
        Parameter[] parameters = getParameters();
        if (parameters != null) {
            for (int i = 0; i < parameters.length; i++) {
                if (parameters[i] != null && TAB_LENGTH_KEY.equals(parameters[i].getName())) {
                    this.tabLength = Integer.parseInt(parameters[i].getValue());
                    return;
                }
            }
        }
    }

    @Override // org.apache.tools.ant.filters.ChainableReader
    public Reader chain(Reader reader) {
        TabsToSpaces tabsToSpaces = new TabsToSpaces(reader);
        tabsToSpaces.setTablength(getTablength());
        tabsToSpaces.setInitialized(true);
        return tabsToSpaces;
    }

    @Override // java.io.FilterReader, java.io.Reader
    public int read() throws IOException {
        int i;
        if (!getInitialized()) {
            initialize();
            setInitialized(true);
        }
        if (this.spacesRemaining > 0) {
            this.spacesRemaining--;
            i = 32;
        } else {
            int read = this.in.read();
            i = read;
            if (read == 9) {
                this.spacesRemaining = this.tabLength - 1;
                i = 32;
            }
        }
        return i;
    }

    public void setTablength(int i) {
        this.tabLength = i;
    }
}
