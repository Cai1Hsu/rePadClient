package org.apache.tools.ant.listener;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.util.Properties;
import org.apache.tools.ant.DefaultLogger;

/* loaded from: classes.jar:org/apache/tools/ant/listener/AnsiColorLogger.class */
public class AnsiColorLogger extends DefaultLogger {
    private static final int ATTR_DIM = 2;
    private static final String END_COLOR = "\u001b[m";
    private static final int FG_BLUE = 34;
    private static final int FG_CYAN = 36;
    private static final int FG_GREEN = 32;
    private static final int FG_MAGENTA = 35;
    private static final int FG_RED = 31;
    private static final String PREFIX = "\u001b[";
    private static final char SEPARATOR = ';';
    private static final String SUFFIX = "m";
    private String errColor = "\u001b[2;31m";
    private String warnColor = "\u001b[2;35m";
    private String infoColor = "\u001b[2;36m";
    private String verboseColor = "\u001b[2;32m";
    private String debugColor = "\u001b[2;34m";
    private boolean colorsSet = false;

    private void setColors() {
        String property = System.getProperty("ant.logger.defaults");
        InputStream inputStream = null;
        InputStream inputStream2 = null;
        try {
            try {
                Properties properties = new Properties();
                InputStream fileInputStream = property != null ? new FileInputStream(property) : getClass().getResourceAsStream("/org/apache/tools/ant/listener/defaults.properties");
                if (fileInputStream != null) {
                    properties.load(fileInputStream);
                }
                InputStream inputStream3 = fileInputStream;
                String property2 = properties.getProperty("AnsiColorLogger.ERROR_COLOR");
                InputStream inputStream4 = fileInputStream;
                String property3 = properties.getProperty("AnsiColorLogger.WARNING_COLOR");
                InputStream inputStream5 = fileInputStream;
                String property4 = properties.getProperty("AnsiColorLogger.INFO_COLOR");
                InputStream inputStream6 = fileInputStream;
                String property5 = properties.getProperty("AnsiColorLogger.VERBOSE_COLOR");
                InputStream inputStream7 = fileInputStream;
                String property6 = properties.getProperty("AnsiColorLogger.DEBUG_COLOR");
                if (property2 != null) {
                    InputStream inputStream8 = fileInputStream;
                    InputStream inputStream9 = fileInputStream;
                    this.errColor = new StringBuffer().append(PREFIX).append(property2).append(SUFFIX).toString();
                }
                if (property3 != null) {
                    InputStream inputStream10 = fileInputStream;
                    InputStream inputStream11 = fileInputStream;
                    this.warnColor = new StringBuffer().append(PREFIX).append(property3).append(SUFFIX).toString();
                }
                if (property4 != null) {
                    InputStream inputStream12 = fileInputStream;
                    InputStream inputStream13 = fileInputStream;
                    this.infoColor = new StringBuffer().append(PREFIX).append(property4).append(SUFFIX).toString();
                }
                if (property5 != null) {
                    InputStream inputStream14 = fileInputStream;
                    InputStream inputStream15 = fileInputStream;
                    this.verboseColor = new StringBuffer().append(PREFIX).append(property5).append(SUFFIX).toString();
                }
                if (property6 != null) {
                    InputStream inputStream16 = fileInputStream;
                    inputStream = fileInputStream;
                    inputStream2 = fileInputStream;
                    this.debugColor = new StringBuffer().append(PREFIX).append(property6).append(SUFFIX).toString();
                }
                if (fileInputStream == null) {
                    return;
                }
                fileInputStream.close();
            } catch (IOException e) {
                if (inputStream2 == null) {
                    return;
                }
                inputStream2.close();
            } catch (Throwable th) {
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException e2) {
                    }
                }
                throw th;
            }
        } catch (IOException e3) {
        }
    }

    @Override // org.apache.tools.ant.DefaultLogger
    protected void printMessage(String str, PrintStream printStream, int i) {
        if (str == null || printStream == null) {
            return;
        }
        if (!this.colorsSet) {
            setColors();
            this.colorsSet = true;
        }
        StringBuffer stringBuffer = new StringBuffer(str);
        switch (i) {
            case 0:
                stringBuffer.insert(0, this.errColor);
                stringBuffer.append(END_COLOR);
                break;
            case 1:
                stringBuffer.insert(0, this.warnColor);
                stringBuffer.append(END_COLOR);
                break;
            case 2:
                stringBuffer.insert(0, this.infoColor);
                stringBuffer.append(END_COLOR);
                break;
            case 3:
                stringBuffer.insert(0, this.verboseColor);
                stringBuffer.append(END_COLOR);
                break;
            default:
                stringBuffer.insert(0, this.debugColor);
                stringBuffer.append(END_COLOR);
                break;
        }
        printStream.println(stringBuffer.toString());
    }
}
