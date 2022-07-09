package org.apache.tools.ant.types.resources;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Stack;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.PropertyHelper;
import org.apache.tools.ant.filters.util.ChainReaderHelper;
import org.apache.tools.ant.types.DataType;
import org.apache.tools.ant.types.FilterChain;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/ResourceList.class */
public class ResourceList extends DataType implements ResourceCollection {
    private final Vector filterChains = new Vector();
    private final ArrayList textDocuments = new ArrayList();
    private final Union cachedResources = new Union();
    private volatile boolean cached = false;
    private String encoding = null;

    public ResourceList() {
        this.cachedResources.setCache(true);
    }

    private ResourceCollection cache() {
        Union union;
        synchronized (this) {
            if (!this.cached) {
                dieOnCircularReference();
                Iterator it = this.textDocuments.iterator();
                while (it.hasNext()) {
                    for (Resource resource : (ResourceCollection) it.next()) {
                        this.cachedResources.add(read(resource));
                    }
                }
                this.cached = true;
            }
            union = this.cachedResources;
        }
        return union;
    }

    private Resource parse(String str) {
        Resource uRLResource;
        Object parseProperties = PropertyHelper.getPropertyHelper(getProject()).parseProperties(str);
        if (parseProperties instanceof Resource) {
            uRLResource = (Resource) parseProperties;
        } else {
            String obj = parseProperties.toString();
            if (obj.indexOf(":") != -1) {
                try {
                    uRLResource = new URLResource(obj);
                } catch (BuildException e) {
                }
            }
            uRLResource = new FileResource(getProject(), obj);
        }
        return uRLResource;
    }

    private ResourceCollection read(Resource resource) {
        BufferedInputStream bufferedInputStream;
        Throwable th;
        BufferedInputStream bufferedInputStream2 = null;
        try {
            try {
                bufferedInputStream = new BufferedInputStream(resource.getInputStream());
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (IOException e) {
            e = e;
            bufferedInputStream = null;
        }
        try {
            InputStreamReader inputStreamReader = this.encoding == null ? new InputStreamReader(bufferedInputStream) : new InputStreamReader(bufferedInputStream, this.encoding);
            ChainReaderHelper chainReaderHelper = new ChainReaderHelper();
            chainReaderHelper.setPrimaryReader(inputStreamReader);
            chainReaderHelper.setFilterChains(this.filterChains);
            chainReaderHelper.setProject(getProject());
            BufferedReader bufferedReader = new BufferedReader(chainReaderHelper.getAssembledReader());
            Union union = new Union();
            union.setCache(true);
            while (true) {
                String readLine = bufferedReader.readLine();
                if (readLine == null) {
                    FileUtils.close(bufferedInputStream);
                    return union;
                }
                union.add(parse(readLine));
            }
        } catch (IOException e2) {
            e = e2;
            BufferedInputStream bufferedInputStream3 = bufferedInputStream;
            BufferedInputStream bufferedInputStream4 = bufferedInputStream;
            BufferedInputStream bufferedInputStream5 = bufferedInputStream;
            BufferedInputStream bufferedInputStream6 = bufferedInputStream;
            throw new BuildException(new StringBuffer().append("Unable to read resource ").append(resource.getName()).append(": ").append(e).toString(), e, getLocation());
        } catch (Throwable th3) {
            th = th3;
            bufferedInputStream2 = bufferedInputStream;
            FileUtils.close(bufferedInputStream2);
            throw th;
        }
    }

    public void add(ResourceCollection resourceCollection) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        this.textDocuments.add(resourceCollection);
        setChecked(false);
    }

    public final void addFilterChain(FilterChain filterChain) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        this.filterChains.add(filterChain);
        setChecked(false);
    }

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        synchronized (this) {
            if (!isChecked()) {
                if (isReference()) {
                    super.dieOnCircularReference(stack, project);
                } else {
                    Iterator it = this.textDocuments.iterator();
                    while (it.hasNext()) {
                        Object next = it.next();
                        if (next instanceof DataType) {
                            pushAndInvokeCircularReferenceCheck((DataType) next, stack, project);
                        }
                    }
                    Iterator it2 = this.filterChains.iterator();
                    while (it2.hasNext()) {
                        pushAndInvokeCircularReferenceCheck((FilterChain) it2.next(), stack, project);
                    }
                    setChecked(true);
                }
            }
        }
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public boolean isFilesystemOnly() {
        boolean isFilesystemOnly;
        synchronized (this) {
            isFilesystemOnly = isReference() ? ((ResourceList) getCheckedRef()).isFilesystemOnly() : cache().isFilesystemOnly();
        }
        return isFilesystemOnly;
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public final Iterator iterator() {
        Iterator it;
        synchronized (this) {
            it = isReference() ? ((ResourceList) getCheckedRef()).iterator() : cache().iterator();
        }
        return it;
    }

    public final void setEncoding(String str) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        this.encoding = str;
    }

    @Override // org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) throws BuildException {
        if (this.encoding != null) {
            throw tooManyAttributes();
        }
        if (this.filterChains.size() > 0 || this.textDocuments.size() > 0) {
            throw noChildrenAllowed();
        }
        super.setRefid(reference);
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public int size() {
        int size;
        synchronized (this) {
            size = isReference() ? ((ResourceList) getCheckedRef()).size() : cache().size();
        }
        return size;
    }
}
