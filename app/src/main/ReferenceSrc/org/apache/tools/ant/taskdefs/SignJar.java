package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.condition.IsSigned;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.util.FileNameMapper;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.IdentityMapper;
import org.apache.tools.ant.util.ResourceUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/SignJar.class */
public class SignJar extends AbstractJarSignerTask {
    public static final String ERROR_BAD_MAP = "Cannot map source file to anything sensible: ";
    public static final String ERROR_MAPPER_WITHOUT_DEST = "The destDir attribute is required if a mapper is set";
    public static final String ERROR_NO_ALIAS = "alias attribute must be set";
    public static final String ERROR_NO_STOREPASS = "storepass attribute must be set";
    public static final String ERROR_SIGNEDJAR_AND_PATHS = "You cannot specify the signed JAR when using paths or filesets";
    public static final String ERROR_TODIR_AND_SIGNEDJAR = "'destdir' and 'signedjar' cannot both be set";
    public static final String ERROR_TOO_MANY_MAPPERS = "Too many mappers";
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    protected File destDir;
    private String digestAlg;
    private boolean force = false;
    protected boolean internalsf;
    protected boolean lazy;
    private FileNameMapper mapper;
    private boolean preserveLastModified;
    protected boolean sectionsonly;
    private String sigAlg;
    protected String sigfile;
    protected File signedjar;
    protected String tsacert;
    protected String tsaurl;

    private void addTimestampAuthorityCommands(ExecTask execTask) {
        if (this.tsaurl != null) {
            addValue(execTask, "-tsa");
            addValue(execTask, this.tsaurl);
        }
        if (this.tsacert != null) {
            addValue(execTask, "-tsacert");
            addValue(execTask, this.tsacert);
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private void signOneJar(File file, File file2) throws BuildException {
        File file3 = file2;
        if (file2 == null) {
            file3 = file;
        }
        if (isUpToDate(file, file3)) {
            return;
        }
        long lastModified = file.lastModified();
        ExecTask createJarSigner = createJarSigner();
        setCommonOptions(createJarSigner);
        bindToKeystore(createJarSigner);
        if (this.sigfile != null) {
            addValue(createJarSigner, "-sigfile");
            addValue(createJarSigner, this.sigfile);
        }
        try {
            if (!FILE_UTILS.areSame(file, file3)) {
                addValue(createJarSigner, "-signedjar");
                addValue(createJarSigner, file3.getPath());
            }
            if (this.internalsf) {
                addValue(createJarSigner, "-internalsf");
            }
            if (this.sectionsonly) {
                addValue(createJarSigner, "-sectionsonly");
            }
            if (this.sigAlg != null) {
                addValue(createJarSigner, "-sigalg");
                addValue(createJarSigner, this.sigAlg);
            }
            if (this.digestAlg != null) {
                addValue(createJarSigner, "-digestalg");
                addValue(createJarSigner, this.digestAlg);
            }
            addTimestampAuthorityCommands(createJarSigner);
            addValue(createJarSigner, file.getPath());
            addValue(createJarSigner, this.alias);
            log(new StringBuffer().append("Signing JAR: ").append(file.getAbsolutePath()).append(" to ").append(file3.getAbsolutePath()).append(" as ").append(this.alias).toString());
            createJarSigner.execute();
            if (!this.preserveLastModified) {
                return;
            }
            FILE_UTILS.setFileLastModified(file3, lastModified);
        } catch (IOException e) {
            throw new BuildException(e);
        }
    }

    public void add(FileNameMapper fileNameMapper) {
        if (this.mapper != null) {
            throw new BuildException(ERROR_TOO_MANY_MAPPERS);
        }
        this.mapper = fileNameMapper;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v65, types: [org.apache.tools.ant.util.FileNameMapper] */
    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Class cls;
        boolean z = this.jar != null;
        boolean z2 = this.signedjar != null;
        boolean z3 = this.destDir != null;
        boolean z4 = this.mapper != null;
        if (z || hasResources()) {
            if (this.alias == null) {
                throw new BuildException(ERROR_NO_ALIAS);
            }
            if (this.storepass == null) {
                throw new BuildException(ERROR_NO_STOREPASS);
            }
            if (z3 && z2) {
                throw new BuildException(ERROR_TODIR_AND_SIGNEDJAR);
            }
            if (hasResources() && z2) {
                throw new BuildException(ERROR_SIGNEDJAR_AND_PATHS);
            }
            if (!z3 && z4) {
                throw new BuildException(ERROR_MAPPER_WITHOUT_DEST);
            }
            beginExecution();
            try {
                if (z && z2) {
                    signOneJar(this.jar, this.signedjar);
                    return;
                }
                Path createUnifiedSourcePath = createUnifiedSourcePath();
                IdentityMapper identityMapper = z4 ? this.mapper : new IdentityMapper();
                Iterator it = createUnifiedSourcePath.iterator();
                while (it.hasNext()) {
                    Resource resource = (Resource) it.next();
                    if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                        cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                        class$org$apache$tools$ant$types$resources$FileProvider = cls;
                    } else {
                        cls = class$org$apache$tools$ant$types$resources$FileProvider;
                    }
                    FileResource asFileResource = ResourceUtils.asFileResource((FileProvider) resource.as(cls));
                    File baseDir = z3 ? this.destDir : asFileResource.getBaseDir();
                    String[] mapFileName = identityMapper.mapFileName(asFileResource.getName());
                    if (mapFileName == null || mapFileName.length != 1) {
                        throw new BuildException(new StringBuffer().append(ERROR_BAD_MAP).append(asFileResource.getFile()).toString());
                    }
                    signOneJar(asFileResource.getFile(), new File(baseDir, mapFileName[0]));
                }
                return;
            } finally {
                endExecution();
            }
        }
        throw new BuildException(AbstractJarSignerTask.ERROR_NO_SOURCE);
    }

    public String getDigestAlg() {
        return this.digestAlg;
    }

    public FileNameMapper getMapper() {
        return this.mapper;
    }

    public String getSigAlg() {
        return this.sigAlg;
    }

    public String getTsacert() {
        return this.tsacert;
    }

    public String getTsaurl() {
        return this.tsaurl;
    }

    public boolean isForce() {
        return this.force;
    }

    protected boolean isSigned(File file) {
        boolean z;
        try {
            z = IsSigned.isSigned(file, this.sigfile == null ? this.alias : this.sigfile);
        } catch (IOException e) {
            log(e.toString(), 3);
            z = false;
        }
        return z;
    }

    protected boolean isUpToDate(File file, File file2) {
        boolean z = false;
        if (!isForce()) {
            z = false;
            if (file != null) {
                if (!file.exists()) {
                    z = false;
                } else {
                    File file3 = file2;
                    if (file2 == null) {
                        file3 = file;
                    }
                    if (file.equals(file3)) {
                        z = false;
                        if (this.lazy) {
                            z = isSigned(file);
                        }
                    } else {
                        z = FILE_UTILS.isUpToDate(file, file3);
                    }
                }
            }
        }
        return z;
    }

    public void setDestDir(File file) {
        this.destDir = file;
    }

    public void setDigestAlg(String str) {
        this.digestAlg = str;
    }

    public void setForce(boolean z) {
        this.force = z;
    }

    public void setInternalsf(boolean z) {
        this.internalsf = z;
    }

    public void setLazy(boolean z) {
        this.lazy = z;
    }

    public void setPreserveLastModified(boolean z) {
        this.preserveLastModified = z;
    }

    public void setSectionsonly(boolean z) {
        this.sectionsonly = z;
    }

    public void setSigAlg(String str) {
        this.sigAlg = str;
    }

    public void setSigfile(String str) {
        this.sigfile = str;
    }

    public void setSignedjar(File file) {
        this.signedjar = file;
    }

    public void setTsacert(String str) {
        this.tsacert = str;
    }

    public void setTsaurl(String str) {
        this.tsaurl = str;
    }
}
