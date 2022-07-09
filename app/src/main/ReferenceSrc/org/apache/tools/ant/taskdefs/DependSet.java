package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.util.Iterator;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.FileList;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.TimeComparison;
import org.apache.tools.ant.types.resources.Resources;
import org.apache.tools.ant.types.resources.Restrict;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.types.resources.comparators.Date;
import org.apache.tools.ant.types.resources.comparators.ResourceComparator;
import org.apache.tools.ant.types.resources.comparators.Reverse;
import org.apache.tools.ant.types.resources.selectors.Exists;
import org.apache.tools.ant.types.resources.selectors.Not;
import org.apache.tools.ant.types.resources.selectors.ResourceSelector;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/DependSet.class */
public class DependSet extends MatchingTask {
    private Union sources = null;
    private Path targets = null;
    private boolean verbose;
    private static final ResourceSelector NOT_EXISTS = new Not(new Exists());
    private static final ResourceComparator DATE = new Date();
    private static final ResourceComparator REVERSE_DATE = new Reverse(DATE);

    /* renamed from: org.apache.tools.ant.taskdefs.DependSet$1 */
    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/DependSet$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/DependSet$HideMissingBasedir.class */
    private static final class HideMissingBasedir implements ResourceCollection {
        private FileSet fs;

        private HideMissingBasedir(FileSet fileSet) {
            this.fs = fileSet;
        }

        HideMissingBasedir(FileSet fileSet, AnonymousClass1 anonymousClass1) {
            this(fileSet);
        }

        private boolean basedirExists() {
            File dir = this.fs.getDir();
            return dir == null || dir.exists();
        }

        @Override // org.apache.tools.ant.types.ResourceCollection
        public boolean isFilesystemOnly() {
            return true;
        }

        @Override // org.apache.tools.ant.types.ResourceCollection
        public Iterator iterator() {
            return basedirExists() ? this.fs.iterator() : Resources.EMPTY_ITERATOR;
        }

        @Override // org.apache.tools.ant.types.ResourceCollection
        public int size() {
            return basedirExists() ? this.fs.size() : 0;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/DependSet$NonExistent.class */
    private static final class NonExistent extends Restrict {
        private NonExistent(ResourceCollection resourceCollection) {
            super.add(resourceCollection);
            super.add(DependSet.NOT_EXISTS);
        }

        NonExistent(ResourceCollection resourceCollection, AnonymousClass1 anonymousClass1) {
            this(resourceCollection);
        }
    }

    private Resource getNewest(ResourceCollection resourceCollection) {
        return getXest(resourceCollection, DATE);
    }

    private Resource getOldest(ResourceCollection resourceCollection) {
        return getXest(resourceCollection, REVERSE_DATE);
    }

    private Resource getXest(ResourceCollection resourceCollection, ResourceComparator resourceComparator) {
        Resource resource;
        Iterator it = resourceCollection.iterator();
        if (it.hasNext()) {
            Resource resource2 = (Resource) it.next();
            while (true) {
                resource = resource2;
                if (!it.hasNext()) {
                    break;
                }
                Resource resource3 = (Resource) it.next();
                if (resourceComparator.compare(resource2, resource3) < 0) {
                    resource2 = resource3;
                }
            }
        } else {
            resource = null;
        }
        return resource;
    }

    private void logFuture(ResourceCollection resourceCollection, ResourceSelector resourceSelector) {
        Restrict restrict = new Restrict();
        restrict.add(resourceSelector);
        restrict.add(resourceCollection);
        Iterator it = restrict.iterator();
        while (it.hasNext()) {
            log(new StringBuffer().append("Warning: ").append(it.next()).append(" modified in the future.").toString(), 1);
        }
    }

    private void logMissing(ResourceCollection resourceCollection, String str) {
        if (this.verbose) {
            Iterator it = resourceCollection.iterator();
            while (it.hasNext()) {
                log(new StringBuffer().append("Expected ").append(str).append(" ").append(((Resource) it.next()).toLongString()).append(" is missing.").toString());
            }
        }
    }

    private void logWithModificationTime(Resource resource, String str) {
        log(new StringBuffer().append(resource.toLongString()).append(" is ").append(str).append(", modified at ").append(new java.util.Date(resource.getLastModified())).toString(), this.verbose ? 2 : 3);
    }

    private boolean uptodate(ResourceCollection resourceCollection, ResourceCollection resourceCollection2) {
        boolean z = false;
        org.apache.tools.ant.types.resources.selectors.Date date = new org.apache.tools.ant.types.resources.selectors.Date();
        date.setMillis(System.currentTimeMillis());
        date.setWhen(TimeComparison.AFTER);
        date.setGranularity(0L);
        logFuture(this.targets, date);
        ResourceCollection nonExistent = new NonExistent(this.targets, null);
        int size = nonExistent.size();
        if (size > 0) {
            log(new StringBuffer().append(size).append(" nonexistent targets").toString(), 3);
            logMissing(nonExistent, "target");
        } else {
            Resource oldest = getOldest(this.targets);
            logWithModificationTime(oldest, "oldest target file");
            logFuture(this.sources, date);
            ResourceCollection nonExistent2 = new NonExistent(this.sources, null);
            int size2 = nonExistent2.size();
            if (size2 > 0) {
                log(new StringBuffer().append(size2).append(" nonexistent sources").toString(), 3);
                logMissing(nonExistent2, "source");
            } else {
                Resource newest = getNewest(this.sources);
                logWithModificationTime(newest, "newest source");
                if (oldest.getLastModified() >= newest.getLastModified()) {
                    z = true;
                }
            }
        }
        return z;
    }

    public void addSrcfilelist(FileList fileList) {
        createSources().add(fileList);
    }

    public void addSrcfileset(FileSet fileSet) {
        createSources().add(fileSet);
    }

    public void addTargetfilelist(FileList fileList) {
        createTargets().add(fileList);
    }

    public void addTargetfileset(FileSet fileSet) {
        createTargets().add(new HideMissingBasedir(fileSet, null));
    }

    public Union createSources() {
        Union union;
        synchronized (this) {
            this.sources = this.sources == null ? new Union() : this.sources;
            union = this.sources;
        }
        return union;
    }

    public Path createTargets() {
        Path path;
        synchronized (this) {
            this.targets = this.targets == null ? new Path(getProject()) : this.targets;
            path = this.targets;
        }
        return path;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (this.sources == null) {
            throw new BuildException("At least one set of source resources must be specified");
        }
        if (this.targets == null) {
            throw new BuildException("At least one set of target files must be specified");
        }
        if (this.sources.size() <= 0 || this.targets.size() <= 0 || uptodate(this.sources, this.targets)) {
            return;
        }
        log("Deleting all target files.", 3);
        if (this.verbose) {
            for (String str : this.targets.list()) {
                log(new StringBuffer().append("Deleting ").append(str).toString());
            }
        }
        Delete delete = new Delete();
        delete.bindToOwner(this);
        delete.add(this.targets);
        delete.perform();
    }

    public void setVerbose(boolean z) {
        this.verbose = z;
    }
}
