package org.apache.tools.ant.taskdefs;

import android.support.v4.os.EnvironmentCompat;
import java.io.File;
import java.io.PrintStream;
import java.util.Iterator;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.condition.Condition;
import org.apache.tools.ant.types.Comparison;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.types.resources.Resources;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.PropertyOutputStream;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Length.class */
public class Length extends Task implements Condition {
    private static final String ALL = "all";
    private static final String EACH = "each";
    private static final String LENGTH_REQUIRED = "Use of the Length condition requires that the length attribute be set.";
    private static final String STRING = "string";
    private Long length;
    private String property;
    private Resources resources;
    private String string;
    private Boolean trim;
    private String mode = ALL;
    private Comparison when = Comparison.EQUAL;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Length$AccumHandler.class */
    private class AccumHandler extends Handler {
        private long accum = 0;
        private final Length this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AccumHandler(Length length) {
            super(length, null);
            this.this$0 = length;
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        protected AccumHandler(Length length, PrintStream printStream) {
            super(length, printStream);
            this.this$0 = length;
        }

        protected long getAccum() {
            return this.accum;
        }

        @Override // org.apache.tools.ant.taskdefs.Length.Handler
        protected void handle(Resource resource) {
            synchronized (this) {
                long size = resource.getSize();
                if (size == -1) {
                    this.this$0.log(new StringBuffer().append("Size unknown for ").append(resource.toString()).toString(), 1);
                } else {
                    this.accum += size;
                }
            }
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Length$AllHandler.class */
    private class AllHandler extends AccumHandler {
        private final Length this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AllHandler(Length length, PrintStream printStream) {
            super(length, printStream);
            this.this$0 = length;
        }

        @Override // org.apache.tools.ant.taskdefs.Length.Handler
        void complete() {
            getPs().print(getAccum());
            super.complete();
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Length$EachHandler.class */
    private class EachHandler extends Handler {
        private final Length this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        EachHandler(Length length, PrintStream printStream) {
            super(length, printStream);
            this.this$0 = length;
        }

        @Override // org.apache.tools.ant.taskdefs.Length.Handler
        protected void handle(Resource resource) {
            getPs().print(resource.toString());
            getPs().print(" : ");
            long size = resource.getSize();
            if (size == -1) {
                getPs().println(EnvironmentCompat.MEDIA_UNKNOWN);
            } else {
                getPs().println(size);
            }
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Length$FileMode.class */
    public static class FileMode extends EnumeratedAttribute {
        static final String[] MODES = {Length.EACH, Length.ALL};

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return MODES;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Length$Handler.class */
    private abstract class Handler {
        private PrintStream ps;
        private final Length this$0;

        Handler(Length length, PrintStream printStream) {
            this.this$0 = length;
            this.ps = printStream;
        }

        void complete() {
            FileUtils.close(this.ps);
        }

        protected PrintStream getPs() {
            return this.ps;
        }

        protected abstract void handle(Resource resource);
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Length$When.class */
    public static class When extends Comparison {
    }

    private static long getLength(String str, boolean z) {
        String str2 = str;
        if (z) {
            str2 = str.trim();
        }
        return str2.length();
    }

    private void handleResources(Handler handler) {
        Iterator it = this.resources.iterator();
        while (it.hasNext()) {
            Resource resource = (Resource) it.next();
            if (!resource.isExists()) {
                log(new StringBuffer().append(resource).append(" does not exist").toString(), 1);
            }
            if (resource.isDirectory()) {
                log(new StringBuffer().append(resource).append(" is a directory; length may not be meaningful").toString(), 1);
            }
            handler.handle(resource);
        }
        handler.complete();
    }

    private void validate() {
        if (this.string != null) {
            if (this.resources != null) {
                throw new BuildException("the string length function is incompatible with the file/resource length function");
            }
            if (STRING.equals(this.mode)) {
                return;
            }
            throw new BuildException("the mode attribute is for use with the file/resource length function");
        } else if (this.resources == null) {
            throw new BuildException("you must set either the string attribute or specify one or more files using the file attribute or nested resource collections");
        } else {
            if (!EACH.equals(this.mode) && !ALL.equals(this.mode)) {
                throw new BuildException(new StringBuffer().append("invalid mode setting for file/resource length function: \"").append(this.mode).append("\"").toString());
            }
            if (this.trim == null) {
                return;
            }
            throw new BuildException("the trim attribute is for use with the string length function only");
        }
    }

    public void add(FileSet fileSet) {
        synchronized (this) {
            add((ResourceCollection) fileSet);
        }
    }

    public void add(ResourceCollection resourceCollection) {
        synchronized (this) {
            if (resourceCollection != null) {
                this.resources = this.resources == null ? new Resources() : this.resources;
                this.resources.add(resourceCollection);
            }
        }
    }

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() {
        Long l;
        validate();
        if (this.length == null) {
            throw new BuildException(LENGTH_REQUIRED);
        }
        if (STRING.equals(this.mode)) {
            l = new Long(getLength(this.string, getTrim()));
        } else {
            AccumHandler accumHandler = new AccumHandler(this);
            handleResources(accumHandler);
            l = new Long(accumHandler.getAccum());
        }
        return this.when.evaluate(l.compareTo(this.length));
    }

    @Override // org.apache.tools.ant.Task
    public void execute() {
        validate();
        PrintStream printStream = new PrintStream(this.property != null ? new PropertyOutputStream(getProject(), this.property) : new LogOutputStream((Task) this, 2));
        if (STRING.equals(this.mode)) {
            printStream.print(getLength(this.string, getTrim()));
            printStream.close();
        } else if (EACH.equals(this.mode)) {
            handleResources(new EachHandler(this, printStream));
        } else if (!ALL.equals(this.mode)) {
        } else {
            handleResources(new AllHandler(this, printStream));
        }
    }

    public boolean getTrim() {
        return this.trim != null && this.trim.booleanValue();
    }

    public void setFile(File file) {
        synchronized (this) {
            add(new FileResource(file));
        }
    }

    public void setLength(long j) {
        synchronized (this) {
            this.length = new Long(j);
        }
    }

    public void setMode(FileMode fileMode) {
        synchronized (this) {
            this.mode = fileMode.getValue();
        }
    }

    public void setProperty(String str) {
        synchronized (this) {
            this.property = str;
        }
    }

    public void setResource(Resource resource) {
        synchronized (this) {
            add(resource);
        }
    }

    public void setString(String str) {
        synchronized (this) {
            this.string = str;
            this.mode = STRING;
        }
    }

    public void setTrim(boolean z) {
        synchronized (this) {
            this.trim = z ? Boolean.TRUE : Boolean.FALSE;
        }
    }

    public void setWhen(When when) {
        synchronized (this) {
            setWhen((Comparison) when);
        }
    }

    public void setWhen(Comparison comparison) {
        synchronized (this) {
            this.when = comparison;
        }
    }
}
