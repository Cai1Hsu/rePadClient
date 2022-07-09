package org.apache.tools.ant.util;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.nio.channels.FileChannel;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Vector;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.filters.util.ChainReaderHelper;
import org.apache.tools.ant.types.FilterSetCollection;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.ResourceFactory;
import org.apache.tools.ant.types.TimeComparison;
import org.apache.tools.ant.types.resources.Appendable;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.types.resources.Resources;
import org.apache.tools.ant.types.resources.Restrict;
import org.apache.tools.ant.types.resources.Touchable;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.types.resources.selectors.Date;
import org.apache.tools.ant.types.resources.selectors.ResourceSelector;
import org.apache.tools.ant.types.selectors.SelectorUtils;

/* loaded from: classes.jar:org/apache/tools/ant/util/ResourceUtils.class */
public class ResourceUtils {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    public static final String ISO_8859_1 = "ISO-8859-1";
    private static final long MAX_IO_CHUNK_SIZE = 16777216;
    static Class class$org$apache$tools$ant$types$resources$Appendable;
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    static Class class$org$apache$tools$ant$types$resources$Touchable;

    /* renamed from: org.apache.tools.ant.util.ResourceUtils$1 */
    /* loaded from: classes.jar:org/apache/tools/ant/util/ResourceUtils$1.class */
    class AnonymousClass1 implements ResourceSelectorProvider {
        private final long val$granularity;

        AnonymousClass1(long j) {
            this.val$granularity = j;
        }

        @Override // org.apache.tools.ant.util.ResourceUtils.ResourceSelectorProvider
        public ResourceSelector getTargetSelectorForSource(Resource resource) {
            return new ResourceSelector(this, resource) { // from class: org.apache.tools.ant.util.ResourceUtils.2
                private final AnonymousClass1 this$0;
                private final Resource val$sr;

                {
                    this.this$0 = this;
                    this.val$sr = resource;
                }

                @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelector
                public boolean isSelected(Resource resource2) {
                    return SelectorUtils.isOutOfDate(this.val$sr, resource2, this.this$0.val$granularity);
                }
            };
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/util/ResourceUtils$ResourceSelectorProvider.class */
    public interface ResourceSelectorProvider {
        ResourceSelector getTargetSelectorForSource(Resource resource);
    }

    public static FileResource asFileResource(FileProvider fileProvider) {
        FileResource fileResource;
        if ((fileProvider instanceof FileResource) || fileProvider == null) {
            fileResource = (FileResource) fileProvider;
        } else {
            FileResource fileResource2 = new FileResource(fileProvider.getFile());
            fileResource2.setProject(Project.getProject(fileProvider));
            fileResource = fileResource2;
        }
        return fileResource;
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0062, code lost:
        if (r0.read() != (-1)) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0065, code lost:
        r5 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0067, code lost:
        org.apache.tools.ant.util.FileUtils.close(r0);
        org.apache.tools.ant.util.FileUtils.close(r0);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static int binaryCompare(Resource resource, Resource resource2) throws IOException {
        BufferedInputStream bufferedInputStream;
        Throwable th;
        BufferedInputStream bufferedInputStream2;
        int i = -1;
        try {
            BufferedInputStream bufferedInputStream3 = new BufferedInputStream(resource.getInputStream());
            try {
                BufferedInputStream bufferedInputStream4 = new BufferedInputStream(resource2.getInputStream());
                try {
                    int read = bufferedInputStream3.read();
                    while (true) {
                        if (read == -1) {
                            break;
                        }
                        int read2 = bufferedInputStream4.read();
                        if (read != read2) {
                            if (read > read2) {
                                i = 1;
                            }
                            FileUtils.close(bufferedInputStream3);
                            FileUtils.close(bufferedInputStream4);
                        } else {
                            read = bufferedInputStream3.read();
                        }
                    }
                    return i;
                } catch (Throwable th2) {
                    th = th2;
                    bufferedInputStream2 = bufferedInputStream3;
                    bufferedInputStream = bufferedInputStream4;
                    FileUtils.close(bufferedInputStream2);
                    FileUtils.close(bufferedInputStream);
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                bufferedInputStream2 = bufferedInputStream3;
                bufferedInputStream = null;
            }
        } catch (Throwable th4) {
            th = th4;
            bufferedInputStream = null;
            bufferedInputStream2 = null;
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public static int compareContent(Resource resource, Resource resource2, boolean z) throws IOException {
        int i = 1;
        if (resource.equals(resource2)) {
            i = 0;
        } else {
            boolean isExists = resource.isExists();
            boolean isExists2 = resource2.isExists();
            if (!isExists && !isExists2) {
                i = 0;
            } else if (isExists == isExists2) {
                boolean isDirectory = resource.isDirectory();
                boolean isDirectory2 = resource2.isDirectory();
                i = (!isDirectory || !isDirectory2) ? (isDirectory || isDirectory2) ? isDirectory ? -1 : 1 : z ? textCompare(resource, resource2) : binaryCompare(resource, resource2) : 0;
            } else if (!isExists) {
                i = -1;
            }
        }
        return i;
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x0073, code lost:
        if (r0 == r0) goto L25;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean contentEquals(Resource resource, Resource resource2, boolean z) throws IOException {
        boolean z2;
        if (resource.isExists() != resource2.isExists()) {
            z2 = false;
        } else if (!resource.isExists()) {
            z2 = true;
        } else {
            z2 = false;
            if (!resource.isDirectory()) {
                z2 = false;
                if (!resource2.isDirectory()) {
                    if (resource.equals(resource2)) {
                        z2 = true;
                    } else {
                        if (!z) {
                            long size = resource.getSize();
                            long size2 = resource2.getSize();
                            if (size != -1 && size2 != -1) {
                                z2 = false;
                            }
                        }
                        z2 = compareContent(resource, resource2, z) == 0;
                    }
                }
            }
        }
        return z2;
    }

    public static void copyResource(Resource resource, Resource resource2) throws IOException {
        copyResource(resource, resource2, null);
    }

    public static void copyResource(Resource resource, Resource resource2, Project project) throws IOException {
        copyResource(resource, resource2, null, null, false, false, null, null, project);
    }

    public static void copyResource(Resource resource, Resource resource2, FilterSetCollection filterSetCollection, Vector vector, boolean z, boolean z2, String str, String str2, Project project) throws IOException {
        copyResource(resource, resource2, filterSetCollection, vector, z, z2, false, str, str2, project);
    }

    public static void copyResource(Resource resource, Resource resource2, FilterSetCollection filterSetCollection, Vector vector, boolean z, boolean z2, boolean z3, String str, String str2, Project project) throws IOException {
        copyResource(resource, resource2, filterSetCollection, vector, z, z2, z3, str, str2, project, false);
    }

    /* JADX DEBUG: Incorrect finally slice size: {[MOVE, INVOKE, MOVE, INVOKE, MOVE] complete}, expected: {[MOVE, INVOKE, MOVE, INVOKE] complete} */
    /* JADX WARN: Finally extract failed */
    public static void copyResource(Resource resource, Resource resource2, FilterSetCollection filterSetCollection, Vector vector, boolean z, boolean z2, boolean z3, String str, String str2, Project project, boolean z4) throws IOException {
        Class cls;
        BufferedReader bufferedReader;
        BufferedWriter bufferedWriter;
        Class cls2;
        int read;
        Class cls3;
        FileOutputStream fileOutputStream;
        Throwable th;
        FileInputStream fileInputStream;
        Class cls4;
        BufferedReader bufferedReader2;
        BufferedWriter bufferedWriter2;
        BufferedWriter bufferedWriter3;
        BufferedReader bufferedReader3;
        Class cls5;
        if (z || SelectorUtils.isOutOfDate(resource, resource2, FileUtils.getFileUtils().getFileTimestampGranularity())) {
            boolean z5 = filterSetCollection != null && filterSetCollection.hasFilters();
            boolean z6 = vector != null && vector.size() > 0;
            File file = null;
            if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                class$org$apache$tools$ant$types$resources$FileProvider = cls;
            } else {
                cls = class$org$apache$tools$ant$types$resources$FileProvider;
            }
            if (resource2.as(cls) != null) {
                if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                    cls5 = class$("org.apache.tools.ant.types.resources.FileProvider");
                    class$org$apache$tools$ant$types$resources$FileProvider = cls5;
                } else {
                    cls5 = class$org$apache$tools$ant$types$resources$FileProvider;
                }
                file = ((FileProvider) resource2.as(cls5)).getFile();
            }
            if (file != null && file.isFile() && !file.canWrite()) {
                if (!z4) {
                    throw new IOException(new StringBuffer().append("can't write to read-only destination file ").append(file).toString());
                }
                if (!FILE_UTILS.tryHardToDelete(file)) {
                    throw new IOException(new StringBuffer().append("failed to delete read-only destination file ").append(file).toString());
                }
            }
            if (z5) {
                try {
                    BufferedReader bufferedReader4 = new BufferedReader(str == null ? new InputStreamReader(resource.getInputStream()) : new InputStreamReader(resource.getInputStream(), str));
                    try {
                        OutputStream outputStream = getOutputStream(resource2, z3, project);
                        bufferedWriter3 = new BufferedWriter(str2 == null ? new OutputStreamWriter(outputStream) : new OutputStreamWriter(outputStream, str2));
                        if (z6) {
                            try {
                                ChainReaderHelper chainReaderHelper = new ChainReaderHelper();
                                chainReaderHelper.setBufferSize(8192);
                                chainReaderHelper.setPrimaryReader(bufferedReader4);
                                chainReaderHelper.setFilterChains(vector);
                                chainReaderHelper.setProject(project);
                                bufferedReader3 = new BufferedReader(chainReaderHelper.getAssembledReader());
                            } catch (Throwable th2) {
                                th = th2;
                                bufferedWriter2 = bufferedWriter3;
                                bufferedReader2 = bufferedReader4;
                                FileUtils.close(bufferedWriter2);
                                FileUtils.close(bufferedReader2);
                                throw th;
                            }
                        } else {
                            bufferedReader3 = bufferedReader4;
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        bufferedReader2 = bufferedReader4;
                        bufferedWriter2 = null;
                    }
                    try {
                        LineTokenizer lineTokenizer = new LineTokenizer();
                        lineTokenizer.setIncludeDelims(true);
                        for (String token = lineTokenizer.getToken(bufferedReader3); token != null; token = lineTokenizer.getToken(bufferedReader3)) {
                            if (token.length() == 0) {
                                bufferedWriter3.newLine();
                            } else {
                                bufferedWriter3.write(filterSetCollection.replaceTokens(token));
                            }
                        }
                        FileUtils.close(bufferedWriter3);
                        FileUtils.close(bufferedReader3);
                    } catch (Throwable th4) {
                        th = th4;
                        bufferedWriter2 = bufferedWriter3;
                        bufferedReader2 = bufferedReader3;
                        FileUtils.close(bufferedWriter2);
                        FileUtils.close(bufferedReader2);
                        throw th;
                    }
                } catch (Throwable th5) {
                    th = th5;
                    bufferedReader2 = null;
                    bufferedWriter2 = null;
                }
            } else if (z6 || ((str != null && !str.equals(str2)) || (str == null && str2 != null))) {
                try {
                    BufferedReader bufferedReader5 = new BufferedReader(str == null ? new InputStreamReader(resource.getInputStream()) : new InputStreamReader(resource.getInputStream(), str));
                    try {
                        OutputStream outputStream2 = getOutputStream(resource2, z3, project);
                        BufferedWriter bufferedWriter4 = new BufferedWriter(str2 == null ? new OutputStreamWriter(outputStream2) : new OutputStreamWriter(outputStream2, str2));
                        if (z6) {
                            try {
                                ChainReaderHelper chainReaderHelper2 = new ChainReaderHelper();
                                chainReaderHelper2.setBufferSize(8192);
                                chainReaderHelper2.setPrimaryReader(bufferedReader5);
                                chainReaderHelper2.setFilterChains(vector);
                                chainReaderHelper2.setProject(project);
                                bufferedReader5 = new BufferedReader(chainReaderHelper2.getAssembledReader());
                            } catch (Throwable th6) {
                                th = th6;
                                bufferedWriter = bufferedWriter4;
                                bufferedReader = bufferedReader5;
                                FileUtils.close(bufferedWriter);
                                FileUtils.close(bufferedReader);
                                throw th;
                            }
                        }
                        try {
                            char[] cArr = new char[8192];
                            while (true) {
                                int read2 = bufferedReader5.read(cArr, 0, cArr.length);
                                if (read2 == -1) {
                                    break;
                                }
                                bufferedWriter4.write(cArr, 0, read2);
                            }
                            FileUtils.close(bufferedWriter4);
                            FileUtils.close(bufferedReader5);
                        } catch (Throwable th7) {
                            th = th7;
                            bufferedWriter = bufferedWriter4;
                            bufferedReader = bufferedReader5;
                            FileUtils.close(bufferedWriter);
                            FileUtils.close(bufferedReader);
                            throw th;
                        }
                    } catch (Throwable th8) {
                        th = th8;
                        bufferedReader = bufferedReader5;
                        bufferedWriter = null;
                    }
                } catch (Throwable th9) {
                    th = th9;
                    bufferedReader = null;
                    bufferedWriter = null;
                }
            } else {
                if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                    cls2 = class$("org.apache.tools.ant.types.resources.FileProvider");
                    class$org$apache$tools$ant$types$resources$FileProvider = cls2;
                } else {
                    cls2 = class$org$apache$tools$ant$types$resources$FileProvider;
                }
                if (resource.as(cls2) == null || file == null) {
                    InputStream inputStream = null;
                    OutputStream outputStream3 = null;
                    try {
                        InputStream inputStream2 = resource.getInputStream();
                        OutputStream outputStream4 = getOutputStream(resource2, z3, project);
                        byte[] bArr = new byte[8192];
                        int i = 0;
                        do {
                            inputStream = inputStream2;
                            outputStream3 = outputStream4;
                            outputStream4.write(bArr, 0, i);
                            read = inputStream2.read(bArr, 0, bArr.length);
                            i = read;
                        } while (read != -1);
                        FileUtils.close(outputStream4);
                        FileUtils.close(inputStream2);
                    } catch (Throwable th10) {
                        FileUtils.close(outputStream3);
                        FileUtils.close(inputStream);
                        throw th10;
                    }
                } else {
                    if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                        cls3 = class$("org.apache.tools.ant.types.resources.FileProvider");
                        class$org$apache$tools$ant$types$resources$FileProvider = cls3;
                    } else {
                        cls3 = class$org$apache$tools$ant$types$resources$FileProvider;
                    }
                    File file2 = ((FileProvider) resource.as(cls3)).getFile();
                    File parentFile = file.getParentFile();
                    if (parentFile != null && !parentFile.isDirectory() && !file.getParentFile().mkdirs()) {
                        throw new IOException(new StringBuffer().append("failed to create the parent directory for ").append(file).toString());
                    }
                    FileChannel fileChannel = null;
                    FileChannel fileChannel2 = null;
                    try {
                        FileInputStream fileInputStream2 = new FileInputStream(file2);
                        try {
                            FileOutputStream fileOutputStream2 = new FileOutputStream(file);
                            fileChannel2 = null;
                            fileChannel = null;
                            try {
                                FileChannel channel = fileInputStream2.getChannel();
                                FileChannel channel2 = fileOutputStream2.getChannel();
                                long size = channel.size();
                                for (long j = 0; j < size; j += channel2.transferFrom(channel, j, Math.min((long) MAX_IO_CHUNK_SIZE, size - j))) {
                                    fileChannel2 = channel2;
                                    fileChannel = channel;
                                }
                                FileUtils.close(channel);
                                FileUtils.close(channel2);
                                FileUtils.close(fileOutputStream2);
                                FileUtils.close(fileInputStream2);
                            } catch (Throwable th11) {
                                th = th11;
                                fileInputStream = fileInputStream2;
                                fileOutputStream = fileOutputStream2;
                                FileUtils.close(fileChannel);
                                FileUtils.close(fileChannel2);
                                FileUtils.close(fileOutputStream);
                                FileUtils.close(fileInputStream);
                                throw th;
                            }
                        } catch (Throwable th12) {
                            th = th12;
                            fileInputStream = fileInputStream2;
                            fileOutputStream = null;
                        }
                    } catch (Throwable th13) {
                        th = th13;
                        fileOutputStream = null;
                        fileInputStream = null;
                    }
                }
            }
            if (!z2) {
                return;
            }
            if (class$org$apache$tools$ant$types$resources$Touchable == null) {
                cls4 = class$("org.apache.tools.ant.types.resources.Touchable");
                class$org$apache$tools$ant$types$resources$Touchable = cls4;
            } else {
                cls4 = class$org$apache$tools$ant$types$resources$Touchable;
            }
            Touchable touchable = (Touchable) resource2.as(cls4);
            if (touchable == null) {
                return;
            }
            setLastModified(touchable, resource.getLastModified());
        }
    }

    private static OutputStream getOutputStream(Resource resource, boolean z, Project project) throws IOException {
        OutputStream outputStream;
        Class cls;
        if (z) {
            if (class$org$apache$tools$ant$types$resources$Appendable == null) {
                cls = class$("org.apache.tools.ant.types.resources.Appendable");
                class$org$apache$tools$ant$types$resources$Appendable = cls;
            } else {
                cls = class$org$apache$tools$ant$types$resources$Appendable;
            }
            Appendable appendable = (Appendable) resource.as(cls);
            if (appendable != null) {
                outputStream = appendable.getAppendOutputStream();
                return outputStream;
            }
            project.log(new StringBuffer().append("Appendable OutputStream not available for non-appendable resource ").append(resource).append("; using plain OutputStream").toString(), 3);
        }
        outputStream = resource.getOutputStream();
        return outputStream;
    }

    private static void logFuture(ProjectComponent projectComponent, ResourceCollection resourceCollection, long j) {
        long currentTimeMillis = System.currentTimeMillis();
        Date date = new Date();
        date.setMillis(currentTimeMillis + j);
        date.setWhen(TimeComparison.AFTER);
        Restrict restrict = new Restrict();
        restrict.add(date);
        restrict.add(resourceCollection);
        Iterator it = restrict.iterator();
        while (it.hasNext()) {
            projectComponent.log(new StringBuffer().append("Warning: ").append(((Resource) it.next()).getName()).append(" modified in the future.").toString(), 1);
        }
    }

    public static ResourceCollection selectOutOfDateSources(ProjectComponent projectComponent, ResourceCollection resourceCollection, FileNameMapper fileNameMapper, ResourceFactory resourceFactory, long j) {
        logFuture(projectComponent, resourceCollection, j);
        return selectSources(projectComponent, resourceCollection, fileNameMapper, resourceFactory, new AnonymousClass1(j));
    }

    public static Resource[] selectOutOfDateSources(ProjectComponent projectComponent, Resource[] resourceArr, FileNameMapper fileNameMapper, ResourceFactory resourceFactory) {
        return selectOutOfDateSources(projectComponent, resourceArr, fileNameMapper, resourceFactory, FILE_UTILS.getFileTimestampGranularity());
    }

    public static Resource[] selectOutOfDateSources(ProjectComponent projectComponent, Resource[] resourceArr, FileNameMapper fileNameMapper, ResourceFactory resourceFactory, long j) {
        Union union = new Union();
        union.addAll(Arrays.asList(resourceArr));
        ResourceCollection selectOutOfDateSources = selectOutOfDateSources(projectComponent, union, fileNameMapper, resourceFactory, j);
        return selectOutOfDateSources.size() == 0 ? new Resource[0] : ((Union) selectOutOfDateSources).listResources();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v68, types: [org.apache.tools.ant.types.ResourceCollection] */
    public static ResourceCollection selectSources(ProjectComponent projectComponent, ResourceCollection resourceCollection, FileNameMapper fileNameMapper, ResourceFactory resourceFactory, ResourceSelectorProvider resourceSelectorProvider) {
        Union union;
        String[] strArr;
        if (resourceCollection.size() != 0) {
            Union union2 = Union.getInstance(resourceCollection);
            Union union3 = new Union();
            Iterator it = union2.iterator();
            while (true) {
                union = union3;
                if (!it.hasNext()) {
                    break;
                }
                Resource resource = (Resource) it.next();
                String name = resource.getName();
                if (name != null) {
                    name = name.replace('/', File.separatorChar);
                }
                try {
                    strArr = fileNameMapper.mapFileName(name);
                } catch (Exception e) {
                    projectComponent.log(new StringBuffer().append("Caught ").append(e).append(" mapping resource ").append(resource).toString(), 3);
                    strArr = null;
                }
                if (strArr == null || strArr.length == 0) {
                    projectComponent.log(new StringBuffer().append(resource).append(" skipped - don't know how to handle it").toString(), 3);
                } else {
                    for (int i = 0; i < strArr.length; i++) {
                        if (strArr[i] == null) {
                            strArr[i] = "(no name)";
                        }
                    }
                    Union union4 = new Union();
                    for (String str : strArr) {
                        union4.add(resourceFactory.getResource(str.replace(File.separatorChar, '/')));
                    }
                    Restrict restrict = new Restrict();
                    restrict.add(resourceSelectorProvider.getTargetSelectorForSource(resource));
                    restrict.add(union4);
                    if (restrict.size() > 0) {
                        union3.add(resource);
                        Resource resource2 = (Resource) restrict.iterator().next();
                        projectComponent.log(new StringBuffer().append(resource.getName()).append(" added as ").append(resource2.getName()).append(resource2.isExists() ? " is outdated." : " doesn't exist.").toString(), 3);
                    } else {
                        projectComponent.log(new StringBuffer().append(resource.getName()).append(" omitted as ").append(union4.toString()).append(union4.size() == 1 ? " is" : " are ").append(" up to date.").toString(), 3);
                    }
                }
            }
        } else {
            projectComponent.log("No sources found.", 3);
            union = Resources.NONE;
        }
        return union;
    }

    public static void setLastModified(Touchable touchable, long j) {
        long j2 = j;
        if (j < 0) {
            j2 = System.currentTimeMillis();
        }
        touchable.touch(j2);
    }

    private static int textCompare(Resource resource, Resource resource2) throws IOException {
        BufferedReader bufferedReader;
        Throwable th;
        BufferedReader bufferedReader2;
        int i;
        try {
            BufferedReader bufferedReader3 = new BufferedReader(new InputStreamReader(resource.getInputStream()));
            try {
                BufferedReader bufferedReader4 = new BufferedReader(new InputStreamReader(resource2.getInputStream()));
                try {
                    String readLine = bufferedReader3.readLine();
                    while (true) {
                        if (readLine != null) {
                            String readLine2 = bufferedReader4.readLine();
                            if (readLine.equals(readLine2)) {
                                readLine = bufferedReader3.readLine();
                            } else if (readLine2 == null) {
                                i = 1;
                                FileUtils.close(bufferedReader3);
                                FileUtils.close(bufferedReader4);
                            } else {
                                i = readLine.compareTo(readLine2);
                                FileUtils.close(bufferedReader3);
                                FileUtils.close(bufferedReader4);
                            }
                        } else {
                            i = bufferedReader4.readLine() == null ? 0 : -1;
                            FileUtils.close(bufferedReader3);
                            FileUtils.close(bufferedReader4);
                        }
                    }
                    return i;
                } catch (Throwable th2) {
                    th = th2;
                    bufferedReader2 = bufferedReader3;
                    bufferedReader = bufferedReader4;
                    FileUtils.close(bufferedReader2);
                    FileUtils.close(bufferedReader);
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                bufferedReader2 = bufferedReader3;
                bufferedReader = null;
            }
        } catch (Throwable th4) {
            th = th4;
            bufferedReader = null;
            bufferedReader2 = null;
        }
    }
}
