package org.apache.tools.ant.filters;

import java.io.IOException;
import java.io.Reader;
import java.util.Vector;
import org.apache.tools.ant.types.Parameter;

/* loaded from: classes.jar:org/apache/tools/ant/filters/StripLineComments.class */
public final class StripLineComments extends BaseParamFilterReader implements ChainableReader {
    private static final String COMMENTS_KEY = "comment";
    private Vector comments = new Vector();
    private String line = null;

    /* loaded from: classes.jar:org/apache/tools/ant/filters/StripLineComments$Comment.class */
    public static class Comment {
        private String value;

        public void addText(String str) {
            setValue(str);
        }

        public final String getValue() {
            return this.value;
        }

        public final void setValue(String str) {
            if (this.value != null) {
                throw new IllegalStateException("Comment value already set.");
            }
            this.value = str;
        }
    }

    public StripLineComments() {
    }

    public StripLineComments(Reader reader) {
        super(reader);
    }

    private Vector getComments() {
        return this.comments;
    }

    private void initialize() {
        Parameter[] parameters = getParameters();
        if (parameters != null) {
            for (int i = 0; i < parameters.length; i++) {
                if ("comment".equals(parameters[i].getType())) {
                    this.comments.addElement(parameters[i].getValue());
                }
            }
        }
    }

    private void setComments(Vector vector) {
        this.comments = vector;
    }

    public void addConfiguredComment(Comment comment) {
        this.comments.addElement(comment.getValue());
    }

    @Override // org.apache.tools.ant.filters.ChainableReader
    public Reader chain(Reader reader) {
        StripLineComments stripLineComments = new StripLineComments(reader);
        stripLineComments.setComments(getComments());
        stripLineComments.setInitialized(true);
        return stripLineComments;
    }

    @Override // java.io.FilterReader, java.io.Reader
    public int read() throws IOException {
        char c;
        if (!getInitialized()) {
            initialize();
            setInitialized(true);
        }
        if (this.line != null) {
            c = this.line.charAt(0);
            if (this.line.length() == 1) {
                this.line = null;
            } else {
                this.line = this.line.substring(1);
            }
        } else {
            this.line = readLine();
            int size = this.comments.size();
            while (this.line != null) {
                int i = 0;
                while (true) {
                    if (i >= size) {
                        break;
                    }
                    if (this.line.startsWith((String) this.comments.elementAt(i))) {
                        this.line = null;
                        break;
                    }
                    i++;
                }
                if (this.line != null) {
                    break;
                }
                this.line = readLine();
            }
            c = 65535;
            if (this.line != null) {
                c = read();
            }
        }
        return c;
    }
}
