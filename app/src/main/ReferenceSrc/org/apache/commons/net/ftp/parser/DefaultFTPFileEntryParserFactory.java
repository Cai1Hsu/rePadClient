package org.apache.commons.net.ftp.parser;

import java.util.Locale;
import java.util.regex.Pattern;
import org.apache.commons.net.ftp.Configurable;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFileEntryParser;

/* loaded from: classes.jar:org/apache/commons/net/ftp/parser/DefaultFTPFileEntryParserFactory.class */
public class DefaultFTPFileEntryParserFactory implements FTPFileEntryParserFactory {
    private static final String JAVA_IDENTIFIER = "\\p{javaJavaIdentifierStart}(\\p{javaJavaIdentifierPart})*";
    private static final String JAVA_QUALIFIED_NAME = "(\\p{javaJavaIdentifierStart}(\\p{javaJavaIdentifierPart})*\\.)+\\p{javaJavaIdentifierStart}(\\p{javaJavaIdentifierPart})*";
    private static final Pattern JAVA_QUALIFIED_NAME_PATTERN = Pattern.compile(JAVA_QUALIFIED_NAME);

    private FTPFileEntryParser createFileEntryParser(String str, FTPClientConfig fTPClientConfig) {
        Class<?> cls;
        UnixFTPEntryParser unixFTPEntryParser = null;
        if (JAVA_QUALIFIED_NAME_PATTERN.matcher(str).matches()) {
            try {
                try {
                    try {
                        try {
                            unixFTPEntryParser = (FTPFileEntryParser) Class.forName(str).newInstance();
                        } catch (ClassCastException e) {
                            throw new ParserInitializationException(cls.getName() + " does not implement the interface org.apache.commons.net.ftp.FTPFileEntryParser.", e);
                        }
                    } catch (ExceptionInInitializerError e2) {
                        throw new ParserInitializationException("Error initializing parser", e2);
                    }
                } catch (Exception e3) {
                    throw new ParserInitializationException("Error initializing parser", e3);
                }
            } catch (ClassNotFoundException e4) {
                unixFTPEntryParser = null;
            }
        }
        UnixFTPEntryParser unixFTPEntryParser2 = unixFTPEntryParser;
        if (unixFTPEntryParser == null) {
            String upperCase = str.toUpperCase(Locale.ENGLISH);
            if (upperCase.indexOf(FTPClientConfig.SYST_UNIX) >= 0) {
                unixFTPEntryParser2 = new UnixFTPEntryParser(fTPClientConfig);
            } else if (upperCase.indexOf(FTPClientConfig.SYST_VMS) >= 0) {
                unixFTPEntryParser2 = new VMSVersioningFTPEntryParser(fTPClientConfig);
            } else if (upperCase.indexOf(FTPClientConfig.SYST_NT) >= 0) {
                unixFTPEntryParser2 = createNTFTPEntryParser(fTPClientConfig);
            } else if (upperCase.indexOf(FTPClientConfig.SYST_OS2) >= 0) {
                unixFTPEntryParser2 = new OS2FTPEntryParser(fTPClientConfig);
            } else if (upperCase.indexOf(FTPClientConfig.SYST_OS400) >= 0 || upperCase.indexOf(FTPClientConfig.SYST_AS400) >= 0) {
                unixFTPEntryParser2 = createOS400FTPEntryParser(fTPClientConfig);
            } else if (upperCase.indexOf(FTPClientConfig.SYST_MVS) >= 0) {
                unixFTPEntryParser2 = new MVSFTPEntryParser();
            } else if (upperCase.indexOf(FTPClientConfig.SYST_NETWARE) >= 0) {
                unixFTPEntryParser2 = new NetwareFTPEntryParser(fTPClientConfig);
            } else if (upperCase.indexOf(FTPClientConfig.SYST_MACOS_PETER) >= 0) {
                unixFTPEntryParser2 = new MacOsPeterFTPEntryParser(fTPClientConfig);
            } else if (upperCase.indexOf(FTPClientConfig.SYST_L8) < 0) {
                throw new ParserInitializationException("Unknown parser type: " + str);
            } else {
                unixFTPEntryParser2 = new UnixFTPEntryParser(fTPClientConfig);
            }
        }
        if (unixFTPEntryParser2 instanceof Configurable) {
            unixFTPEntryParser2.configure(fTPClientConfig);
        }
        return unixFTPEntryParser2;
    }

    private FTPFileEntryParser createNTFTPEntryParser(FTPClientConfig fTPClientConfig) {
        return (fTPClientConfig == null || !FTPClientConfig.SYST_NT.equals(fTPClientConfig.getServerSystemKey())) ? new CompositeFileEntryParser(new FTPFileEntryParser[]{new NTFTPEntryParser(fTPClientConfig), new UnixFTPEntryParser(fTPClientConfig)}) : new NTFTPEntryParser(fTPClientConfig);
    }

    private FTPFileEntryParser createOS400FTPEntryParser(FTPClientConfig fTPClientConfig) {
        return (fTPClientConfig == null || !FTPClientConfig.SYST_OS400.equals(fTPClientConfig.getServerSystemKey())) ? new CompositeFileEntryParser(new FTPFileEntryParser[]{new OS400FTPEntryParser(fTPClientConfig), new UnixFTPEntryParser(fTPClientConfig)}) : new OS400FTPEntryParser(fTPClientConfig);
    }

    @Override // org.apache.commons.net.ftp.parser.FTPFileEntryParserFactory
    public FTPFileEntryParser createFileEntryParser(String str) {
        if (str == null) {
            throw new ParserInitializationException("Parser key cannot be null");
        }
        return createFileEntryParser(str, null);
    }

    @Override // org.apache.commons.net.ftp.parser.FTPFileEntryParserFactory
    public FTPFileEntryParser createFileEntryParser(FTPClientConfig fTPClientConfig) throws ParserInitializationException {
        return createFileEntryParser(fTPClientConfig.getServerSystemKey(), fTPClientConfig);
    }

    public FTPFileEntryParser createMVSEntryParser() {
        return new MVSFTPEntryParser();
    }

    public FTPFileEntryParser createNTFTPEntryParser() {
        return createNTFTPEntryParser(null);
    }

    public FTPFileEntryParser createNetwareFTPEntryParser() {
        return new NetwareFTPEntryParser();
    }

    public FTPFileEntryParser createOS2FTPEntryParser() {
        return new OS2FTPEntryParser();
    }

    public FTPFileEntryParser createOS400FTPEntryParser() {
        return createOS400FTPEntryParser(null);
    }

    public FTPFileEntryParser createUnixFTPEntryParser() {
        return new UnixFTPEntryParser();
    }

    public FTPFileEntryParser createVMSVersioningFTPEntryParser() {
        return new VMSVersioningFTPEntryParser();
    }
}
