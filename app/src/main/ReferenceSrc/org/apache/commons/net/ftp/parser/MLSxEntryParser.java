package org.apache.commons.net.ftp.parser;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.TimeZone;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPFileEntryParserImpl;
import org.apache.commons.net.nntp.NNTP;
import org.apache.http.HttpStatus;

/* loaded from: classes.jar:org/apache/commons/net/ftp/parser/MLSxEntryParser.class */
public class MLSxEntryParser extends FTPFileEntryParserImpl {
    private static final MLSxEntryParser PARSER = new MLSxEntryParser();
    private static final HashMap<String, Integer> TYPE_TO_INT = new HashMap<>();
    private static int[] UNIX_GROUPS = {0, 1, 2};
    private static int[][] UNIX_PERMS = {new int[0], new int[]{2}, new int[]{1}, new int[]{2, 1}, new int[]{0}, new int[]{0, 2}, new int[]{0, 1}, new int[]{0, 1, 2}};

    /* JADX WARN: Type inference failed for: r0v21, types: [int[], int[][]] */
    static {
        TYPE_TO_INT.put("file", 0);
        TYPE_TO_INT.put("cdir", 1);
        TYPE_TO_INT.put("pdir", 1);
        TYPE_TO_INT.put("dir", 1);
    }

    private void doUnixPerms(FTPFile fTPFile, String str) {
        for (char c : str.toCharArray()) {
            switch (c) {
                case 'a':
                    fTPFile.setPermission(0, 1, true);
                    break;
                case 'c':
                    fTPFile.setPermission(0, 1, true);
                    break;
                case 'd':
                    fTPFile.setPermission(0, 1, true);
                    break;
                case HttpStatus.SC_SWITCHING_PROTOCOLS /* 101 */:
                    fTPFile.setPermission(0, 0, true);
                    break;
                case 'l':
                    fTPFile.setPermission(0, 2, true);
                    break;
                case 'm':
                    fTPFile.setPermission(0, 1, true);
                    break;
                case 'p':
                    fTPFile.setPermission(0, 1, true);
                    break;
                case 'r':
                    fTPFile.setPermission(0, 0, true);
                    break;
                case NNTP.DEFAULT_PORT /* 119 */:
                    fTPFile.setPermission(0, 1, true);
                    break;
            }
        }
    }

    public static MLSxEntryParser getInstance() {
        return PARSER;
    }

    public static FTPFile parseEntry(String str) {
        return PARSER.parseFTPEntry(str);
    }

    @Override // org.apache.commons.net.ftp.FTPFileEntryParser
    public FTPFile parseFTPEntry(String str) {
        FTPFile fTPFile;
        String[] split = str.split(" ", 2);
        if (split.length == 2) {
            FTPFile fTPFile2 = new FTPFile();
            fTPFile2.setRawListing(str);
            fTPFile2.setName(split[1]);
            String[] split2 = split[0].split(";");
            boolean contains = split[0].toLowerCase(Locale.ENGLISH).contains("unix.mode=");
            int length = split2.length;
            int i = 0;
            while (true) {
                fTPFile = fTPFile2;
                if (i >= length) {
                    break;
                }
                String[] split3 = split2[i].split("=");
                if (split3.length == 2) {
                    String lowerCase = split3[0].toLowerCase(Locale.ENGLISH);
                    String str2 = split3[1];
                    String lowerCase2 = str2.toLowerCase(Locale.ENGLISH);
                    if ("size".equals(lowerCase)) {
                        fTPFile2.setSize(Long.parseLong(str2));
                    } else if ("sizd".equals(lowerCase)) {
                        fTPFile2.setSize(Long.parseLong(str2));
                    } else if ("modify".equals(lowerCase)) {
                        SimpleDateFormat simpleDateFormat = str2.contains(".") ? new SimpleDateFormat("yyyyMMddHHmmss.SSS") : new SimpleDateFormat("yyyyMMddHHmmss");
                        TimeZone timeZone = TimeZone.getTimeZone("GMT");
                        simpleDateFormat.setTimeZone(timeZone);
                        GregorianCalendar gregorianCalendar = new GregorianCalendar(timeZone);
                        try {
                            gregorianCalendar.setTime(simpleDateFormat.parse(str2));
                        } catch (ParseException e) {
                        }
                        fTPFile2.setTimestamp(gregorianCalendar);
                    } else if ("type".equals(lowerCase)) {
                        Integer num = TYPE_TO_INT.get(lowerCase2);
                        if (num == null) {
                            fTPFile2.setType(3);
                        } else {
                            fTPFile2.setType(num.intValue());
                        }
                    } else if (lowerCase.startsWith("unix.")) {
                        String lowerCase3 = lowerCase.substring("unix.".length()).toLowerCase(Locale.ENGLISH);
                        if ("group".equals(lowerCase3)) {
                            fTPFile2.setGroup(str2);
                        } else if ("owner".equals(lowerCase3)) {
                            fTPFile2.setUser(str2);
                        } else if ("mode".equals(lowerCase3)) {
                            int length2 = str2.length();
                            for (int i2 = 0; i2 < 3; i2++) {
                                int charAt = str2.charAt((length2 - 3) + i2) - '0';
                                if (charAt >= 0 && charAt <= 7) {
                                    for (int i3 : UNIX_PERMS[charAt]) {
                                        fTPFile2.setPermission(UNIX_GROUPS[i2], i3, true);
                                    }
                                }
                            }
                        }
                    } else if (!contains && "perm".equals(lowerCase)) {
                        doUnixPerms(fTPFile2, lowerCase2);
                    }
                }
                i++;
            }
        } else {
            fTPFile = null;
        }
        return fTPFile;
    }
}
