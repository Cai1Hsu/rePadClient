package org.apache.commons.compress.archivers.dump;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/dump/Dirent.class */
class Dirent {
    private int ino;
    private String name;
    private int parentIno;
    private int type;

    Dirent(int i, int i2, int i3, String str) {
        this.ino = i;
        this.parentIno = i2;
        this.type = i3;
        this.name = str;
    }

    int getIno() {
        return this.ino;
    }

    String getName() {
        return this.name;
    }

    int getParentIno() {
        return this.parentIno;
    }

    int getType() {
        return this.type;
    }

    public String toString() {
        return String.format("[%d]: %s", Integer.valueOf(this.ino), this.name);
    }
}
