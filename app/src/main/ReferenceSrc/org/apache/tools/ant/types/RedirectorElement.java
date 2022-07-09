package org.apache.tools.ant.types;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Stack;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Redirector;

/* loaded from: classes.jar:org/apache/tools/ant/types/RedirectorElement.class */
public class RedirectorElement extends DataType {
    static Class class$org$apache$tools$ant$util$MergingMapper;
    private Boolean alwaysLog;
    private Boolean append;
    private Boolean createEmptyFiles;
    private String errorEncoding;
    private Mapper errorMapper;
    private String errorProperty;
    private String inputEncoding;
    private Mapper inputMapper;
    private String inputString;
    private Boolean logError;
    private Boolean logInputString;
    private String outputEncoding;
    private Mapper outputMapper;
    private String outputProperty;
    private boolean usingInput = false;
    private boolean usingOutput = false;
    private boolean usingError = false;
    private Vector inputFilterChains = new Vector();
    private Vector outputFilterChains = new Vector();
    private Vector errorFilterChains = new Vector();

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private RedirectorElement getRef() {
        return (RedirectorElement) getCheckedRef();
    }

    public void addConfiguredErrorMapper(Mapper mapper) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        if (this.errorMapper != null) {
            if (!this.usingError) {
                throw new BuildException("Cannot have > 1 <errormapper>");
            }
            throw new BuildException("attribute \"error\" cannot coexist with a nested <errormapper>");
        }
        setChecked(false);
        this.errorMapper = mapper;
    }

    public void addConfiguredInputMapper(Mapper mapper) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        if (this.inputMapper != null) {
            if (!this.usingInput) {
                throw new BuildException("Cannot have > 1 <inputmapper>");
            }
            throw new BuildException("attribute \"input\" cannot coexist with a nested <inputmapper>");
        }
        setChecked(false);
        this.inputMapper = mapper;
    }

    public void addConfiguredOutputMapper(Mapper mapper) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        if (this.outputMapper != null) {
            if (!this.usingOutput) {
                throw new BuildException("Cannot have > 1 <outputmapper>");
            }
            throw new BuildException("attribute \"output\" cannot coexist with a nested <outputmapper>");
        }
        setChecked(false);
        this.outputMapper = mapper;
    }

    public void configure(Redirector redirector) {
        configure(redirector, null);
    }

    public void configure(Redirector redirector, String str) {
        if (isReference()) {
            getRef().configure(redirector, str);
            return;
        }
        dieOnCircularReference();
        if (this.alwaysLog != null) {
            redirector.setAlwaysLog(this.alwaysLog.booleanValue());
        }
        if (this.logError != null) {
            redirector.setLogError(this.logError.booleanValue());
        }
        if (this.append != null) {
            redirector.setAppend(this.append.booleanValue());
        }
        if (this.createEmptyFiles != null) {
            redirector.setCreateEmptyFiles(this.createEmptyFiles.booleanValue());
        }
        if (this.outputProperty != null) {
            redirector.setOutputProperty(this.outputProperty);
        }
        if (this.errorProperty != null) {
            redirector.setErrorProperty(this.errorProperty);
        }
        if (this.inputString != null) {
            redirector.setInputString(this.inputString);
        }
        if (this.logInputString != null) {
            redirector.setLogInputString(this.logInputString.booleanValue());
        }
        if (this.inputMapper != null) {
            String[] strArr = null;
            try {
                strArr = this.inputMapper.getImplementation().mapFileName(str);
            } catch (NullPointerException e) {
                if (str != null) {
                    throw e;
                }
            }
            if (strArr != null && strArr.length > 0) {
                redirector.setInput(toFileArray(strArr));
            }
        }
        if (this.outputMapper != null) {
            String[] strArr2 = null;
            try {
                strArr2 = this.outputMapper.getImplementation().mapFileName(str);
            } catch (NullPointerException e2) {
                if (str != null) {
                    throw e2;
                }
            }
            if (strArr2 != null && strArr2.length > 0) {
                redirector.setOutput(toFileArray(strArr2));
            }
        }
        if (this.errorMapper != null) {
            String[] strArr3 = null;
            try {
                strArr3 = this.errorMapper.getImplementation().mapFileName(str);
            } catch (NullPointerException e3) {
                if (str != null) {
                    throw e3;
                }
            }
            if (strArr3 != null && strArr3.length > 0) {
                redirector.setError(toFileArray(strArr3));
            }
        }
        if (this.inputFilterChains.size() > 0) {
            redirector.setInputFilterChains(this.inputFilterChains);
        }
        if (this.outputFilterChains.size() > 0) {
            redirector.setOutputFilterChains(this.outputFilterChains);
        }
        if (this.errorFilterChains.size() > 0) {
            redirector.setErrorFilterChains(this.errorFilterChains);
        }
        if (this.inputEncoding != null) {
            redirector.setInputEncoding(this.inputEncoding);
        }
        if (this.outputEncoding != null) {
            redirector.setOutputEncoding(this.outputEncoding);
        }
        if (this.errorEncoding == null) {
            return;
        }
        redirector.setErrorEncoding(this.errorEncoding);
    }

    public FilterChain createErrorFilterChain() {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        FilterChain filterChain = new FilterChain();
        filterChain.setProject(getProject());
        this.errorFilterChains.add(filterChain);
        setChecked(false);
        return filterChain;
    }

    public FilterChain createInputFilterChain() {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        FilterChain filterChain = new FilterChain();
        filterChain.setProject(getProject());
        this.inputFilterChains.add(filterChain);
        setChecked(false);
        return filterChain;
    }

    protected Mapper createMergeMapper(File file) {
        Class cls;
        Mapper mapper = new Mapper(getProject());
        if (class$org$apache$tools$ant$util$MergingMapper == null) {
            cls = class$("org.apache.tools.ant.util.MergingMapper");
            class$org$apache$tools$ant$util$MergingMapper = cls;
        } else {
            cls = class$org$apache$tools$ant$util$MergingMapper;
        }
        mapper.setClassname(cls.getName());
        mapper.setTo(file.getAbsolutePath());
        return mapper;
    }

    public FilterChain createOutputFilterChain() {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        FilterChain filterChain = new FilterChain();
        filterChain.setProject(getProject());
        this.outputFilterChains.add(filterChain);
        setChecked(false);
        return filterChain;
    }

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        if (isChecked()) {
            return;
        }
        if (isReference()) {
            super.dieOnCircularReference(stack, project);
            return;
        }
        Mapper[] mapperArr = {this.inputMapper, this.outputMapper, this.errorMapper};
        for (int i = 0; i < mapperArr.length; i++) {
            if (mapperArr[i] != null) {
                stack.push(mapperArr[i]);
                mapperArr[i].dieOnCircularReference(stack, project);
                stack.pop();
            }
        }
        Vector[] vectorArr = {this.inputFilterChains, this.outputFilterChains, this.errorFilterChains};
        for (int i2 = 0; i2 < vectorArr.length; i2++) {
            if (vectorArr[i2] != null) {
                Iterator it = vectorArr[i2].iterator();
                while (it.hasNext()) {
                    pushAndInvokeCircularReferenceCheck((FilterChain) it.next(), stack, project);
                }
            }
        }
        setChecked(true);
    }

    public void setAlwaysLog(boolean z) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        this.alwaysLog = z ? Boolean.TRUE : Boolean.FALSE;
    }

    public void setAppend(boolean z) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        this.append = z ? Boolean.TRUE : Boolean.FALSE;
    }

    public void setCreateEmptyFiles(boolean z) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        this.createEmptyFiles = z ? Boolean.TRUE : Boolean.FALSE;
    }

    public void setError(File file) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        if (file == null) {
            throw new IllegalArgumentException("error file specified as null");
        }
        this.usingError = true;
        this.errorMapper = createMergeMapper(file);
    }

    public void setErrorEncoding(String str) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        this.errorEncoding = str;
    }

    public void setErrorProperty(String str) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        this.errorProperty = str;
    }

    public void setInput(File file) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        if (this.inputString != null) {
            throw new BuildException("The \"input\" and \"inputstring\" attributes cannot both be specified");
        }
        this.usingInput = true;
        this.inputMapper = createMergeMapper(file);
    }

    public void setInputEncoding(String str) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        this.inputEncoding = str;
    }

    public void setInputString(String str) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        if (this.usingInput) {
            throw new BuildException("The \"input\" and \"inputstring\" attributes cannot both be specified");
        }
        this.inputString = str;
    }

    public void setLogError(boolean z) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        this.logError = z ? Boolean.TRUE : Boolean.FALSE;
    }

    public void setLogInputString(boolean z) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        this.logInputString = z ? Boolean.TRUE : Boolean.FALSE;
    }

    public void setOutput(File file) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        if (file == null) {
            throw new IllegalArgumentException("output file specified as null");
        }
        this.usingOutput = true;
        this.outputMapper = createMergeMapper(file);
    }

    public void setOutputEncoding(String str) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        this.outputEncoding = str;
    }

    public void setOutputProperty(String str) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        this.outputProperty = str;
    }

    @Override // org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) throws BuildException {
        if (!this.usingInput && !this.usingOutput && !this.usingError && this.inputString == null && this.logError == null && this.append == null && this.createEmptyFiles == null && this.inputEncoding == null && this.outputEncoding == null && this.errorEncoding == null && this.outputProperty == null && this.errorProperty == null && this.logInputString == null) {
            super.setRefid(reference);
            return;
        }
        throw tooManyAttributes();
    }

    protected File[] toFileArray(String[] strArr) {
        File[] fileArr;
        if (strArr == null) {
            fileArr = null;
        } else {
            ArrayList arrayList = new ArrayList(strArr.length);
            for (int i = 0; i < strArr.length; i++) {
                if (strArr[i] != null) {
                    arrayList.add(getProject().resolveFile(strArr[i]));
                }
            }
            fileArr = (File[]) arrayList.toArray(new File[arrayList.size()]);
        }
        return fileArr;
    }
}
