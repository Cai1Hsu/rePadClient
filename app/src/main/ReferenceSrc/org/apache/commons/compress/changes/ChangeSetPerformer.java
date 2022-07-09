package org.apache.commons.compress.changes;

import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;
import org.apache.commons.compress.archivers.ArchiveEntry;
import org.apache.commons.compress.archivers.ArchiveInputStream;
import org.apache.commons.compress.archivers.ArchiveOutputStream;
import org.apache.commons.compress.utils.IOUtils;

/* loaded from: classes.jar:org/apache/commons/compress/changes/ChangeSetPerformer.class */
public class ChangeSetPerformer {
    private final Set<Change> changes;

    public ChangeSetPerformer(ChangeSet changeSet) {
        this.changes = changeSet.getChanges();
    }

    private void copyStream(InputStream inputStream, ArchiveOutputStream archiveOutputStream, ArchiveEntry archiveEntry) throws IOException {
        archiveOutputStream.putArchiveEntry(archiveEntry);
        IOUtils.copy(inputStream, archiveOutputStream);
        archiveOutputStream.closeArchiveEntry();
    }

    private boolean isDeletedLater(Set<Change> set, ArchiveEntry archiveEntry) {
        boolean z = true;
        String name = archiveEntry.getName();
        if (!set.isEmpty()) {
            for (Change change : set) {
                int type = change.type();
                String targetFile = change.targetFile();
                if ((type == 1 && name.equals(targetFile)) || (type == 4 && name.startsWith(targetFile + "/"))) {
                    break;
                }
            }
        }
        z = false;
        return z;
    }

    public ChangeSetResults perform(ArchiveInputStream archiveInputStream, ArchiveOutputStream archiveOutputStream) throws IOException {
        boolean z;
        ChangeSetResults changeSetResults = new ChangeSetResults();
        LinkedHashSet linkedHashSet = new LinkedHashSet(this.changes);
        Iterator<Change> it = linkedHashSet.iterator();
        while (it.hasNext()) {
            Change next = it.next();
            if (next.type() == 2 && next.isReplaceMode()) {
                copyStream(next.getInput(), archiveOutputStream, next.getEntry());
                it.remove();
                changeSetResults.addedFromChangeSet(next.getEntry().getName());
            }
        }
        while (true) {
            ArchiveEntry nextEntry = archiveInputStream.getNextEntry();
            if (nextEntry == null) {
                break;
            }
            Iterator<Change> it2 = linkedHashSet.iterator();
            while (true) {
                z = true;
                if (!it2.hasNext()) {
                    break;
                }
                Change next2 = it2.next();
                int type = next2.type();
                String name = nextEntry.getName();
                if (type != 1 || name == null) {
                    if (type == 4 && name != null && name.startsWith(next2.targetFile() + "/")) {
                        z = false;
                        changeSetResults.deleted(name);
                        break;
                    }
                } else if (name.equals(next2.targetFile())) {
                    z = false;
                    it2.remove();
                    changeSetResults.deleted(name);
                    break;
                }
            }
            if (z && !isDeletedLater(linkedHashSet, nextEntry) && !changeSetResults.hasBeenAdded(nextEntry.getName())) {
                copyStream(archiveInputStream, archiveOutputStream, nextEntry);
                changeSetResults.addedFromStream(nextEntry.getName());
            }
        }
        Iterator<Change> it3 = linkedHashSet.iterator();
        while (it3.hasNext()) {
            Change next3 = it3.next();
            if (next3.type() == 2 && !next3.isReplaceMode() && !changeSetResults.hasBeenAdded(next3.getEntry().getName())) {
                copyStream(next3.getInput(), archiveOutputStream, next3.getEntry());
                it3.remove();
                changeSetResults.addedFromChangeSet(next3.getEntry().getName());
            }
        }
        archiveOutputStream.finish();
        return changeSetResults;
    }
}
