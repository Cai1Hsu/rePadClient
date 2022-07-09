package org.apache.tools.ant.taskdefs.optional;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.Expand;
import org.apache.tools.ant.taskdefs.MatchingTask;
import org.apache.tools.ant.taskdefs.optional.native2ascii.Native2AsciiAdapter;
import org.apache.tools.ant.taskdefs.optional.native2ascii.Native2AsciiAdapterFactory;
import org.apache.tools.ant.types.Mapper;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.FileNameMapper;
import org.apache.tools.ant.util.IdentityMapper;
import org.apache.tools.ant.util.SourceFileScanner;
import org.apache.tools.ant.util.facade.FacadeTaskHelper;
import org.apache.tools.ant.util.facade.ImplementationSpecificArgument;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/Native2Ascii.class */
public class Native2Ascii extends MatchingTask {
    private FacadeTaskHelper facade;
    private Mapper mapper;
    private boolean reverse = false;
    private String encoding = null;
    private File srcDir = null;
    private File destDir = null;
    private String extension = null;
    private Native2AsciiAdapter nestedAdapter = null;

    /* renamed from: org.apache.tools.ant.taskdefs.optional.Native2Ascii$1 */
    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/Native2Ascii$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/Native2Ascii$ExtMapper.class */
    private class ExtMapper implements FileNameMapper {
        private final Native2Ascii this$0;

        private ExtMapper(Native2Ascii native2Ascii) {
            this.this$0 = native2Ascii;
        }

        ExtMapper(Native2Ascii native2Ascii, AnonymousClass1 anonymousClass1) {
            this(native2Ascii);
        }

        @Override // org.apache.tools.ant.util.FileNameMapper
        public String[] mapFileName(String str) {
            int lastIndexOf = str.lastIndexOf(46);
            return lastIndexOf >= 0 ? new String[]{new StringBuffer().append(str.substring(0, lastIndexOf)).append(this.this$0.extension).toString()} : new String[]{new StringBuffer().append(str).append(this.this$0.extension).toString()};
        }

        @Override // org.apache.tools.ant.util.FileNameMapper
        public void setFrom(String str) {
        }

        @Override // org.apache.tools.ant.util.FileNameMapper
        public void setTo(String str) {
        }
    }

    public Native2Ascii() {
        this.facade = null;
        this.facade = new FacadeTaskHelper(Native2AsciiAdapterFactory.getDefault());
    }

    private void convert(String str, String str2) throws BuildException {
        File file = new File(this.srcDir, str);
        File file2 = new File(this.destDir, str2);
        if (file.equals(file2)) {
            throw new BuildException(new StringBuffer().append("file ").append(file).append(" would overwrite its self").toString());
        }
        String parent = file2.getParent();
        if (parent != null) {
            File file3 = new File(parent);
            if (!file3.exists() && !file3.mkdirs()) {
                throw new BuildException(new StringBuffer().append("cannot create parent directory ").append(parent).toString());
            }
        }
        log(new StringBuffer().append("converting ").append(str).toString(), 3);
        if ((this.nestedAdapter != null ? this.nestedAdapter : Native2AsciiAdapterFactory.getAdapter(this.facade.getImplementation(), this, createImplementationClasspath())).convert(this, file, file2)) {
            return;
        }
        throw new BuildException("conversion failed");
    }

    public void add(Native2AsciiAdapter native2AsciiAdapter) {
        if (this.nestedAdapter != null) {
            throw new BuildException("Can't have more than one native2ascii adapter");
        }
        this.nestedAdapter = native2AsciiAdapter;
    }

    public void add(FileNameMapper fileNameMapper) {
        createMapper().add(fileNameMapper);
    }

    public ImplementationSpecificArgument createArg() {
        ImplementationSpecificArgument implementationSpecificArgument = new ImplementationSpecificArgument();
        this.facade.addImplementationArgument(implementationSpecificArgument);
        return implementationSpecificArgument;
    }

    public Path createImplementationClasspath() {
        return this.facade.getImplementationClasspath(getProject());
    }

    public Mapper createMapper() throws BuildException {
        if (this.mapper != null) {
            throw new BuildException(Expand.ERROR_MULTIPLE_MAPPERS, getLocation());
        }
        this.mapper = new Mapper(getProject());
        return this.mapper;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (this.srcDir == null) {
            this.srcDir = getProject().resolveFile(".");
        }
        if (this.destDir == null) {
            throw new BuildException("The dest attribute must be set.");
        }
        if (this.srcDir.equals(this.destDir) && this.extension == null && this.mapper == null) {
            throw new BuildException("The ext attribute or a mapper must be set if src and dest dirs are the same.");
        }
        IdentityMapper identityMapper = this.mapper == null ? this.extension == null ? new IdentityMapper() : new ExtMapper(this, null) : this.mapper.getImplementation();
        String[] restrict = new SourceFileScanner(this).restrict(getDirectoryScanner(this.srcDir).getIncludedFiles(), this.srcDir, this.destDir, identityMapper);
        int length = restrict.length;
        if (length == 0) {
            return;
        }
        log(new StringBuffer().append(new StringBuffer().append("Converting ").append(length).append(" file").append(length != 1 ? "s" : "").append(" from ").toString()).append(this.srcDir).append(" to ").append(this.destDir).toString());
        for (int i = 0; i < restrict.length; i++) {
            convert(restrict[i], identityMapper.mapFileName(restrict[i])[0]);
        }
    }

    public String[] getCurrentArgs() {
        return this.facade.getArgs();
    }

    public String getEncoding() {
        return this.encoding;
    }

    public boolean getReverse() {
        return this.reverse;
    }

    public void setDest(File file) {
        this.destDir = file;
    }

    public void setEncoding(String str) {
        this.encoding = str;
    }

    public void setExt(String str) {
        this.extension = str;
    }

    public void setImplementation(String str) {
        if ("default".equals(str)) {
            this.facade.setImplementation(Native2AsciiAdapterFactory.getDefault());
        } else {
            this.facade.setImplementation(str);
        }
    }

    public void setReverse(boolean z) {
        this.reverse = z;
    }

    public void setSrc(File file) {
        this.srcDir = file;
    }
}
