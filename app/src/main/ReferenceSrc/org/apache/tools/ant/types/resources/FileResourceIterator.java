package org.apache.tools.ant.types.resources;

import java.io.File;
import java.util.Iterator;
import java.util.NoSuchElementException;
import org.apache.tools.ant.Project;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/FileResourceIterator.class */
public class FileResourceIterator implements Iterator {
    private File basedir;
    private String[] files;
    private int pos;
    private Project project;

    public FileResourceIterator() {
        this.pos = 0;
    }

    public FileResourceIterator(File file) {
        this((Project) null, file);
    }

    public FileResourceIterator(File file, String[] strArr) {
        this(null, file, strArr);
    }

    public FileResourceIterator(Project project) {
        this.pos = 0;
        this.project = project;
    }

    public FileResourceIterator(Project project, File file) {
        this(project);
        this.basedir = file;
    }

    public FileResourceIterator(Project project, File file, String[] strArr) {
        this(project, file);
        addFiles(strArr);
    }

    public void addFiles(String[] strArr) {
        int length = this.files == null ? 0 : this.files.length;
        String[] strArr2 = new String[strArr.length + length];
        if (length > 0) {
            System.arraycopy(this.files, 0, strArr2, 0, length);
        }
        this.files = strArr2;
        System.arraycopy(strArr, 0, this.files, length, strArr.length);
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        return this.pos < this.files.length;
    }

    @Override // java.util.Iterator
    public Object next() {
        return nextResource();
    }

    public FileResource nextResource() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        File file = this.basedir;
        String[] strArr = this.files;
        int i = this.pos;
        this.pos = i + 1;
        FileResource fileResource = new FileResource(file, strArr[i]);
        fileResource.setProject(this.project);
        return fileResource;
    }

    @Override // java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException();
    }
}
