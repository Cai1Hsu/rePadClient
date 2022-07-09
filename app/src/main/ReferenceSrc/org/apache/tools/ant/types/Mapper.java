package org.apache.tools.ant.types;

import java.util.Properties;
import org.apache.http.protocol.HTTP;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.util.CompositeMapper;
import org.apache.tools.ant.util.ContainerMapper;
import org.apache.tools.ant.util.FileNameMapper;

/* loaded from: classes.jar:org/apache/tools/ant/types/Mapper.class */
public class Mapper extends DataType implements Cloneable {
    protected MapperType type = null;
    protected String classname = null;
    protected Path classpath = null;
    protected String from = null;
    protected String to = null;
    private ContainerMapper container = null;

    /* loaded from: classes.jar:org/apache/tools/ant/types/Mapper$MapperType.class */
    public static class MapperType extends EnumeratedAttribute {
        private Properties implementations = new Properties();

        public MapperType() {
            this.implementations.put(HTTP.IDENTITY_CODING, "org.apache.tools.ant.util.IdentityMapper");
            this.implementations.put("flatten", "org.apache.tools.ant.util.FlatFileNameMapper");
            this.implementations.put("glob", "org.apache.tools.ant.util.GlobPatternMapper");
            this.implementations.put("merge", "org.apache.tools.ant.util.MergingMapper");
            this.implementations.put(RegularExpression.DATA_TYPE_NAME, "org.apache.tools.ant.util.RegexpPatternMapper");
            this.implementations.put("package", "org.apache.tools.ant.util.PackageNameMapper");
            this.implementations.put("unpackage", "org.apache.tools.ant.util.UnPackageNameMapper");
        }

        public String getImplementation() {
            return this.implementations.getProperty(getValue());
        }

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{HTTP.IDENTITY_CODING, "flatten", "glob", "merge", RegularExpression.DATA_TYPE_NAME, "package", "unpackage"};
        }
    }

    public Mapper(Project project) {
        setProject(project);
    }

    public void add(FileNameMapper fileNameMapper) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        if (this.container == null) {
            if (this.type == null && this.classname == null) {
                this.container = new CompositeMapper();
            } else {
                FileNameMapper implementation = getImplementation();
                if (!(implementation instanceof ContainerMapper)) {
                    throw new BuildException(new StringBuffer().append(String.valueOf(implementation)).append(" mapper implementation does not support nested mappers!").toString());
                }
                this.container = (ContainerMapper) implementation;
            }
        }
        this.container.add(fileNameMapper);
        setChecked(false);
    }

    public void addConfigured(FileNameMapper fileNameMapper) {
        add(fileNameMapper);
    }

    public void addConfiguredMapper(Mapper mapper) {
        add(mapper.getImplementation());
    }

    public Path createClasspath() {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        if (this.classpath == null) {
            this.classpath = new Path(getProject());
        }
        setChecked(false);
        return this.classpath.createPath();
    }

    public FileNameMapper getImplementation() throws BuildException {
        ContainerMapper containerMapper;
        if (isReference()) {
            dieOnCircularReference();
            Reference refid = getRefid();
            Object referencedObject = refid.getReferencedObject(getProject());
            if (referencedObject instanceof FileNameMapper) {
                containerMapper = (FileNameMapper) referencedObject;
            } else if (!(referencedObject instanceof Mapper)) {
                throw new BuildException(new StringBuffer().append(referencedObject == null ? "null" : referencedObject.getClass().getName()).append(" at reference '").append(refid.getRefId()).append("' is not a valid mapper reference.").toString());
            } else {
                containerMapper = ((Mapper) referencedObject).getImplementation();
            }
        } else if (this.type == null && this.classname == null && this.container == null) {
            throw new BuildException("nested mapper or one of the attributes type or classname is required");
        } else {
            if (this.container != null) {
                containerMapper = this.container;
            } else if (this.type != null && this.classname != null) {
                throw new BuildException("must not specify both type and classname attribute");
            } else {
                try {
                    containerMapper = (FileNameMapper) getImplementationClass().newInstance();
                    Project project = getProject();
                    if (project != null) {
                        project.setProjectReference(containerMapper);
                    }
                    containerMapper.setFrom(this.from);
                    containerMapper.setTo(this.to);
                } catch (BuildException e) {
                    throw e;
                } catch (Throwable th) {
                    throw new BuildException(th);
                }
            }
        }
        return containerMapper;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v13, types: [java.lang.ClassLoader] */
    protected Class getImplementationClass() throws ClassNotFoundException {
        String str = this.classname;
        if (this.type != null) {
            str = this.type.getImplementation();
        }
        return Class.forName(str, true, this.classpath == null ? getClass().getClassLoader() : getProject().createClassLoader(this.classpath));
    }

    protected Mapper getRef() {
        return (Mapper) getCheckedRef();
    }

    public void setClassname(String str) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        this.classname = str;
    }

    public void setClasspath(Path path) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        if (this.classpath == null) {
            this.classpath = path;
        } else {
            this.classpath.append(path);
        }
    }

    public void setClasspathRef(Reference reference) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        createClasspath().setRefid(reference);
    }

    public void setFrom(String str) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        this.from = str;
    }

    @Override // org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) throws BuildException {
        if (this.type == null && this.from == null && this.to == null) {
            super.setRefid(reference);
            return;
        }
        throw tooManyAttributes();
    }

    public void setTo(String str) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        this.to = str;
    }

    public void setType(MapperType mapperType) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        this.type = mapperType;
    }
}
