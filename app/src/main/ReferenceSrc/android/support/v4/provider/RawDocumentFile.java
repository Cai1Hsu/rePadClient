package android.support.v4.provider;

import android.net.Uri;
import android.util.Log;
import android.webkit.MimeTypeMap;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

/* loaded from: classes.jar:android/support/v4/provider/RawDocumentFile.class */
class RawDocumentFile extends DocumentFile {
    private File mFile;

    RawDocumentFile(DocumentFile documentFile, File file) {
        super(documentFile);
        this.mFile = file;
    }

    private static boolean deleteContents(File file) {
        File[] listFiles = file.listFiles();
        boolean z = true;
        boolean z2 = true;
        if (listFiles != null) {
            int length = listFiles.length;
            int i = 0;
            while (true) {
                z = z2;
                if (i >= length) {
                    break;
                }
                File file2 = listFiles[i];
                boolean z3 = z2;
                if (file2.isDirectory()) {
                    z3 = z2 & deleteContents(file2);
                }
                z2 = z3;
                if (!file2.delete()) {
                    Log.w("DocumentFile", "Failed to delete " + file2);
                    z2 = false;
                }
                i++;
            }
        }
        return z;
    }

    /* JADX WARN: Code restructure failed: missing block: B:5:0x001f, code lost:
        if (r4 != null) goto L6;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static String getTypeForName(String str) {
        String str2;
        int lastIndexOf = str.lastIndexOf(46);
        if (lastIndexOf >= 0) {
            str2 = MimeTypeMap.getSingleton().getMimeTypeFromExtension(str.substring(lastIndexOf + 1).toLowerCase());
        }
        str2 = "application/octet-stream";
        return str2;
    }

    @Override // android.support.v4.provider.DocumentFile
    public boolean canRead() {
        return this.mFile.canRead();
    }

    @Override // android.support.v4.provider.DocumentFile
    public boolean canWrite() {
        return this.mFile.canWrite();
    }

    @Override // android.support.v4.provider.DocumentFile
    public DocumentFile createDirectory(String str) {
        File file = new File(this.mFile, str);
        return (file.isDirectory() || file.mkdir()) ? new RawDocumentFile(this, file) : null;
    }

    @Override // android.support.v4.provider.DocumentFile
    public DocumentFile createFile(String str, String str2) {
        RawDocumentFile rawDocumentFile;
        String extensionFromMimeType = MimeTypeMap.getSingleton().getExtensionFromMimeType(str);
        String str3 = str2;
        if (extensionFromMimeType != null) {
            str3 = str2 + "." + extensionFromMimeType;
        }
        File file = new File(this.mFile, str3);
        try {
            file.createNewFile();
            rawDocumentFile = new RawDocumentFile(this, file);
        } catch (IOException e) {
            Log.w("DocumentFile", "Failed to createFile: " + e);
            rawDocumentFile = null;
        }
        return rawDocumentFile;
    }

    @Override // android.support.v4.provider.DocumentFile
    public boolean delete() {
        deleteContents(this.mFile);
        return this.mFile.delete();
    }

    @Override // android.support.v4.provider.DocumentFile
    public boolean exists() {
        return this.mFile.exists();
    }

    @Override // android.support.v4.provider.DocumentFile
    public String getName() {
        return this.mFile.getName();
    }

    @Override // android.support.v4.provider.DocumentFile
    public String getType() {
        return this.mFile.isDirectory() ? null : getTypeForName(this.mFile.getName());
    }

    @Override // android.support.v4.provider.DocumentFile
    public Uri getUri() {
        return Uri.fromFile(this.mFile);
    }

    @Override // android.support.v4.provider.DocumentFile
    public boolean isDirectory() {
        return this.mFile.isDirectory();
    }

    @Override // android.support.v4.provider.DocumentFile
    public boolean isFile() {
        return this.mFile.isFile();
    }

    @Override // android.support.v4.provider.DocumentFile
    public boolean isVirtual() {
        return false;
    }

    @Override // android.support.v4.provider.DocumentFile
    public long lastModified() {
        return this.mFile.lastModified();
    }

    @Override // android.support.v4.provider.DocumentFile
    public long length() {
        return this.mFile.length();
    }

    @Override // android.support.v4.provider.DocumentFile
    public DocumentFile[] listFiles() {
        ArrayList arrayList = new ArrayList();
        File[] listFiles = this.mFile.listFiles();
        if (listFiles != null) {
            for (File file : listFiles) {
                arrayList.add(new RawDocumentFile(this, file));
            }
        }
        return (DocumentFile[]) arrayList.toArray(new DocumentFile[arrayList.size()]);
    }

    @Override // android.support.v4.provider.DocumentFile
    public boolean renameTo(String str) {
        boolean z;
        File file = new File(this.mFile.getParentFile(), str);
        if (this.mFile.renameTo(file)) {
            this.mFile = file;
            z = true;
        } else {
            z = false;
        }
        return z;
    }
}
