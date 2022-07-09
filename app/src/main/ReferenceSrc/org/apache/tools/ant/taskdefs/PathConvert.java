package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.Mapper;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.Resources;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.util.FileNameMapper;
import org.apache.tools.ant.util.IdentityMapper;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/PathConvert.class */
public class PathConvert extends Task {
    private static boolean onWindows = Os.isFamily(Os.FAMILY_DOS);
    private boolean preserveDuplicates;
    private Resources path = null;
    private Reference refid = null;
    private String targetOS = null;
    private boolean targetWindows = false;
    private boolean setonempty = true;
    private String property = null;
    private Vector prefixMap = new Vector();
    private String pathSep = null;
    private String dirSep = null;
    private Mapper mapper = null;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/PathConvert$MapEntry.class */
    public class MapEntry {
        private final PathConvert this$0;
        private String from = null;
        private String to = null;

        public MapEntry(PathConvert pathConvert) {
            this.this$0 = pathConvert;
        }

        public String apply(String str) {
            if (this.from == null || this.to == null) {
                throw new BuildException("Both 'from' and 'to' must be set in a map entry");
            }
            String str2 = str;
            if ((PathConvert.onWindows ? str.toLowerCase().replace('\\', '/') : str).startsWith(PathConvert.onWindows ? this.from.toLowerCase().replace('\\', '/') : this.from)) {
                str2 = new StringBuffer().append(this.to).append(str.substring(this.from.length())).toString();
            }
            return str2;
        }

        public void setFrom(String str) {
            this.from = str;
        }

        public void setTo(String str) {
            this.to = str;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/PathConvert$TargetOs.class */
    public static class TargetOs extends EnumeratedAttribute {
        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{Os.FAMILY_WINDOWS, Os.FAMILY_UNIX, Os.FAMILY_NETWARE, Os.FAMILY_OS2, Os.FAMILY_TANDEM};
        }
    }

    private Resources getPath() {
        Resources resources;
        synchronized (this) {
            if (this.path == null) {
                this.path = new Resources(getProject());
                this.path.setCache(true);
            }
            resources = this.path;
        }
        return resources;
    }

    private String mapElement(String str) {
        int size = this.prefixMap.size();
        String str2 = str;
        if (size != 0) {
            int i = 0;
            while (true) {
                str2 = str;
                if (i >= size) {
                    break;
                }
                str2 = ((MapEntry) this.prefixMap.elementAt(i)).apply(str);
                if (str2 != str) {
                    break;
                }
                i++;
            }
        }
        return str2;
    }

    private BuildException noChildrenAllowed() {
        return new BuildException("You must not specify nested elements when using the refid attribute.");
    }

    private void validateSetup() throws BuildException {
        if (this.path == null) {
            throw new BuildException("You must specify a path to convert");
        }
        String str = File.separator;
        String str2 = File.pathSeparator;
        if (this.targetOS != null) {
            str2 = this.targetWindows ? ";" : ":";
            str = this.targetWindows ? "\\" : "/";
        }
        if (this.pathSep != null) {
            str2 = this.pathSep;
        }
        if (this.dirSep != null) {
            str = this.dirSep;
        }
        this.pathSep = str2;
        this.dirSep = str;
    }

    public void add(ResourceCollection resourceCollection) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        getPath().add(resourceCollection);
    }

    public void add(FileNameMapper fileNameMapper) {
        Mapper mapper = new Mapper(getProject());
        mapper.add(fileNameMapper);
        addMapper(mapper);
    }

    public void addMapper(Mapper mapper) {
        if (this.mapper != null) {
            throw new BuildException(Expand.ERROR_MULTIPLE_MAPPERS);
        }
        this.mapper = mapper;
    }

    public MapEntry createMap() {
        MapEntry mapEntry = new MapEntry(this);
        this.prefixMap.addElement(mapEntry);
        return mapEntry;
    }

    public Path createPath() {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        Path path = new Path(getProject());
        add(path);
        return path;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Resources resources = this.path;
        String str = this.pathSep;
        String str2 = this.dirSep;
        try {
            if (isReference()) {
                Object referencedObject = this.refid.getReferencedObject(getProject());
                if (!(referencedObject instanceof ResourceCollection)) {
                    throw new BuildException(new StringBuffer().append("refid '").append(this.refid.getRefId()).append("' does not refer to a resource collection.").toString());
                }
                getPath().add((ResourceCollection) referencedObject);
            }
            validateSetup();
            String str3 = onWindows ? "\\" : "/";
            StringBuffer stringBuffer = new StringBuffer();
            ResourceCollection<Object> union = isPreserveDuplicates() ? this.path : new Union(this.path);
            ArrayList<String> arrayList = new ArrayList();
            FileNameMapper identityMapper = this.mapper == null ? new IdentityMapper() : this.mapper.getImplementation();
            for (Object obj : union) {
                String[] mapFileName = identityMapper.mapFileName(String.valueOf(obj));
                for (int i = 0; mapFileName != null && i < mapFileName.length; i++) {
                    arrayList.add(mapFileName[i]);
                }
            }
            boolean z = true;
            for (String str4 : arrayList) {
                String mapElement = mapElement(str4);
                if (!z) {
                    stringBuffer.append(this.pathSep);
                }
                StringTokenizer stringTokenizer = new StringTokenizer(mapElement, str3, true);
                while (true) {
                    z = false;
                    if (stringTokenizer.hasMoreTokens()) {
                        String nextToken = stringTokenizer.nextToken();
                        String str5 = nextToken;
                        if (str3.equals(nextToken)) {
                            str5 = this.dirSep;
                        }
                        stringBuffer.append(str5);
                    }
                }
            }
            if (this.setonempty || stringBuffer.length() > 0) {
                String stringBuffer2 = stringBuffer.toString();
                if (this.property == null) {
                    log(stringBuffer2);
                } else {
                    log(new StringBuffer().append("Set property ").append(this.property).append(" = ").append(stringBuffer2).toString(), 3);
                    getProject().setNewProperty(this.property, stringBuffer2);
                }
            }
        } finally {
            this.path = resources;
            this.dirSep = str2;
            this.pathSep = str;
        }
    }

    public boolean isPreserveDuplicates() {
        return this.preserveDuplicates;
    }

    public boolean isReference() {
        return this.refid != null;
    }

    public void setDirSep(String str) {
        this.dirSep = str;
    }

    public void setPathSep(String str) {
        this.pathSep = str;
    }

    public void setPreserveDuplicates(boolean z) {
        this.preserveDuplicates = z;
    }

    public void setProperty(String str) {
        this.property = str;
    }

    public void setRefid(Reference reference) {
        if (this.path != null) {
            throw noChildrenAllowed();
        }
        this.refid = reference;
    }

    public void setSetonempty(boolean z) {
        this.setonempty = z;
    }

    public void setTargetos(String str) {
        TargetOs targetOs = new TargetOs();
        targetOs.setValue(str);
        setTargetos(targetOs);
    }

    public void setTargetos(TargetOs targetOs) {
        this.targetOS = targetOs.getValue();
        this.targetWindows = !this.targetOS.equals(Os.FAMILY_UNIX) && !this.targetOS.equals(Os.FAMILY_TANDEM);
    }
}
