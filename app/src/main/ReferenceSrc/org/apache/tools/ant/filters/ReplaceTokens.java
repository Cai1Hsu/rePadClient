package org.apache.tools.ant.filters;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.Parameter;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/filters/ReplaceTokens.class */
public final class ReplaceTokens extends BaseParamFilterReader implements ChainableReader {
    private static final char DEFAULT_BEGIN_TOKEN = '@';
    private static final char DEFAULT_END_TOKEN = '@';
    private String queuedData = null;
    private String replaceData = null;
    private int replaceIndex = -1;
    private int queueIndex = -1;
    private Hashtable hash = new Hashtable();
    private char beginToken = (char) 64;
    private char endToken = (char) 64;

    /* loaded from: classes.jar:org/apache/tools/ant/filters/ReplaceTokens$Token.class */
    public static class Token {
        private String key;
        private String value;

        public final String getKey() {
            return this.key;
        }

        public final String getValue() {
            return this.value;
        }

        public final void setKey(String str) {
            this.key = str;
        }

        public final void setValue(String str) {
            this.value = str;
        }
    }

    public ReplaceTokens() {
    }

    public ReplaceTokens(Reader reader) {
        super(reader);
    }

    private char getBeginToken() {
        return this.beginToken;
    }

    private char getEndToken() {
        return this.endToken;
    }

    private int getNextChar() throws IOException {
        char read;
        if (this.queueIndex != -1) {
            String str = this.queuedData;
            int i = this.queueIndex;
            this.queueIndex = i + 1;
            char charAt = str.charAt(i);
            read = charAt;
            if (this.queueIndex >= this.queuedData.length()) {
                this.queueIndex = -1;
                read = charAt;
            }
        } else {
            read = this.in.read();
        }
        return read;
    }

    private Properties getProperties(Resource resource) {
        InputStream inputStream = null;
        InputStream inputStream2 = null;
        Properties properties = new Properties();
        try {
            try {
                InputStream inputStream3 = resource.getInputStream();
                inputStream2 = inputStream3;
                inputStream = inputStream3;
                properties.load(inputStream3);
                FileUtils.close(inputStream3);
            } catch (IOException e) {
                inputStream = inputStream2;
                e.printStackTrace();
                FileUtils.close(inputStream2);
            }
            return properties;
        } catch (Throwable th) {
            FileUtils.close(inputStream);
            throw th;
        }
    }

    private Hashtable getTokens() {
        return this.hash;
    }

    private void initialize() {
        Parameter[] parameters = getParameters();
        if (parameters != null) {
            for (int i = 0; i < parameters.length; i++) {
                if (parameters[i] != null) {
                    String type = parameters[i].getType();
                    if ("tokenchar".equals(type)) {
                        String name = parameters[i].getName();
                        String value = parameters[i].getValue();
                        if ("begintoken".equals(name)) {
                            if (value.length() == 0) {
                                throw new BuildException("Begin token cannot be empty");
                            }
                            this.beginToken = parameters[i].getValue().charAt(0);
                        } else if (!"endtoken".equals(name)) {
                            continue;
                        } else if (value.length() == 0) {
                            throw new BuildException("End token cannot be empty");
                        } else {
                            this.endToken = parameters[i].getValue().charAt(0);
                        }
                    } else if ("token".equals(type)) {
                        this.hash.put(parameters[i].getName(), parameters[i].getValue());
                    } else if ("propertiesfile".equals(type)) {
                        makeTokensFromProperties(new FileResource(new File(parameters[i].getValue())));
                    }
                }
            }
        }
    }

    private void makeTokensFromProperties(Resource resource) {
        Properties properties = getProperties(resource);
        Enumeration keys = properties.keys();
        while (keys.hasMoreElements()) {
            String str = (String) keys.nextElement();
            this.hash.put(str, properties.getProperty(str));
        }
    }

    private void setTokens(Hashtable hashtable) {
        this.hash = hashtable;
    }

    public void addConfiguredToken(Token token) {
        this.hash.put(token.getKey(), token.getValue());
    }

    @Override // org.apache.tools.ant.filters.ChainableReader
    public Reader chain(Reader reader) {
        ReplaceTokens replaceTokens = new ReplaceTokens(reader);
        replaceTokens.setBeginToken(getBeginToken());
        replaceTokens.setEndToken(getEndToken());
        replaceTokens.setTokens(getTokens());
        replaceTokens.setInitialized(true);
        return replaceTokens;
    }

    @Override // java.io.FilterReader, java.io.Reader
    public int read() throws IOException {
        char nextChar;
        int nextChar2;
        if (!getInitialized()) {
            initialize();
            setInitialized(true);
        }
        if (this.replaceIndex != -1) {
            String str = this.replaceData;
            int i = this.replaceIndex;
            this.replaceIndex = i + 1;
            nextChar = str.charAt(i);
            if (this.replaceIndex >= this.replaceData.length()) {
                this.replaceIndex = -1;
            }
        } else {
            nextChar = getNextChar();
            if (nextChar == this.beginToken) {
                StringBuffer stringBuffer = new StringBuffer("");
                do {
                    nextChar2 = getNextChar();
                    if (nextChar2 == -1) {
                        break;
                    }
                    stringBuffer.append((char) nextChar2);
                } while (nextChar2 != this.endToken);
                if (nextChar2 == -1) {
                    if (this.queuedData == null || this.queueIndex == -1) {
                        this.queuedData = stringBuffer.toString();
                    } else {
                        this.queuedData = new StringBuffer().append(stringBuffer.toString()).append(this.queuedData.substring(this.queueIndex)).toString();
                    }
                    if (this.queuedData.length() > 0) {
                        this.queueIndex = 0;
                    } else {
                        this.queueIndex = -1;
                    }
                    nextChar = this.beginToken;
                } else {
                    stringBuffer.setLength(stringBuffer.length() - 1);
                    String str2 = (String) this.hash.get(stringBuffer.toString());
                    if (str2 != null) {
                        if (str2.length() > 0) {
                            this.replaceData = str2;
                            this.replaceIndex = 0;
                        }
                        nextChar = read();
                    } else {
                        String stringBuffer2 = new StringBuffer().append(stringBuffer.toString()).append(this.endToken).toString();
                        if (this.queuedData == null || this.queueIndex == -1) {
                            this.queuedData = stringBuffer2;
                        } else {
                            this.queuedData = new StringBuffer().append(stringBuffer2).append(this.queuedData.substring(this.queueIndex)).toString();
                        }
                        this.queueIndex = 0;
                        nextChar = this.beginToken;
                    }
                }
            }
        }
        return nextChar;
    }

    public void setBeginToken(char c) {
        this.beginToken = c;
    }

    public void setEndToken(char c) {
        this.endToken = c;
    }

    public void setPropertiesResource(Resource resource) {
        makeTokensFromProperties(resource);
    }
}
