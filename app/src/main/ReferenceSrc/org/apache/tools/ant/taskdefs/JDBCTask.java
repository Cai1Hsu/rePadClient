package org.apache.tools.ant.taskdefs;

import com.edutech.idauthentication.AppEnvironment;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.Driver;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Locale;
import java.util.Properties;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;
import org.jivesoftware.smackx.workgroup.packet.UserID;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/JDBCTask.class */
public abstract class JDBCTask extends Task {
    private static final int HASH_TABLE_SIZE = 3;
    private static Hashtable loaderMap = new Hashtable(3);
    private Path classpath;
    private AntClassLoader loader;
    private boolean caching = true;
    private boolean autocommit = false;
    private String driver = null;
    private String url = null;
    private String userId = null;
    private String password = null;
    private String rdbms = null;
    private String version = null;
    private boolean failOnConnectionError = true;
    private List connectionProperties = new ArrayList();

    private Driver getDriver() throws BuildException {
        Class<?> cls;
        if (this.driver == null) {
            throw new BuildException("Driver attribute must be set!", getLocation());
        }
        try {
            if (this.classpath != null) {
                synchronized (loaderMap) {
                    if (this.caching) {
                        this.loader = (AntClassLoader) loaderMap.get(this.driver);
                    }
                    if (this.loader == null) {
                        log(new StringBuffer().append("Loading ").append(this.driver).append(" using AntClassLoader with classpath ").append(this.classpath).toString(), 3);
                        this.loader = getProject().createClassLoader(this.classpath);
                        if (this.caching) {
                            loaderMap.put(this.driver, this.loader);
                        }
                    } else {
                        log(new StringBuffer().append("Loading ").append(this.driver).append(" using a cached AntClassLoader.").toString(), 3);
                    }
                }
                cls = this.loader.loadClass(this.driver);
            } else {
                log(new StringBuffer().append("Loading ").append(this.driver).append(" using system loader.").toString(), 3);
                cls = Class.forName(this.driver);
            }
            return (Driver) cls.newInstance();
        } catch (ClassNotFoundException e) {
            throw new BuildException(new StringBuffer().append("Class Not Found: JDBC driver ").append(this.driver).append(" could not be loaded").toString(), e, getLocation());
        } catch (IllegalAccessException e2) {
            throw new BuildException(new StringBuffer().append("Illegal Access: JDBC driver ").append(this.driver).append(" could not be loaded").toString(), e2, getLocation());
        } catch (InstantiationException e3) {
            throw new BuildException(new StringBuffer().append("Instantiation Exception: JDBC driver ").append(this.driver).append(" could not be loaded").toString(), e3, getLocation());
        }
    }

    protected static Hashtable getLoaderMap() {
        return loaderMap;
    }

    public void addConnectionProperty(Property property) {
        this.connectionProperties.add(property);
    }

    public Path createClasspath() {
        if (this.classpath == null) {
            this.classpath = new Path(getProject());
        }
        return this.classpath.createPath();
    }

    public Path getClasspath() {
        return this.classpath;
    }

    protected Connection getConnection() throws BuildException {
        Connection connection;
        if (this.userId == null) {
            throw new BuildException("UserId attribute must be set!", getLocation());
        }
        if (this.password == null) {
            throw new BuildException("Password attribute must be set!", getLocation());
        }
        if (this.url == null) {
            throw new BuildException("Url attribute must be set!", getLocation());
        }
        try {
            log(new StringBuffer().append("connecting to ").append(getUrl()).toString(), 3);
            Properties properties = new Properties();
            properties.put(UserID.ELEMENT_NAME, getUserId());
            properties.put(AppEnvironment.PASSWORD, getPassword());
            for (Property property : this.connectionProperties) {
                String name = property.getName();
                String value = property.getValue();
                if (name == null || value == null) {
                    log("Only name/value pairs are supported as connection properties.", 1);
                } else {
                    log(new StringBuffer().append("Setting connection property ").append(name).append(" to ").append(value).toString(), 3);
                    properties.put(name, value);
                }
            }
            connection = getDriver().connect(getUrl(), properties);
        } catch (SQLException e) {
            if (this.failOnConnectionError) {
                throw new BuildException(e, getLocation());
            }
            log(new StringBuffer().append("Failed to connect: ").append(e.getMessage()).toString(), 1);
            connection = null;
        }
        if (connection == null) {
            throw new SQLException(new StringBuffer().append("No suitable Driver for ").append(this.url).toString());
        }
        connection.setAutoCommit(this.autocommit);
        return connection;
    }

    protected AntClassLoader getLoader() {
        return this.loader;
    }

    public String getPassword() {
        return this.password;
    }

    public String getRdbms() {
        return this.rdbms;
    }

    public String getUrl() {
        return this.url;
    }

    public String getUserId() {
        return this.userId;
    }

    public String getVersion() {
        return this.version;
    }

    public boolean isAutocommit() {
        return this.autocommit;
    }

    public void isCaching(boolean z) {
        this.caching = z;
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x00e6, code lost:
        if (r0.indexOf(new java.lang.StringBuffer().append(" ").append(r4.version).toString()) < 0) goto L30;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    protected boolean isValidRdbms(Connection connection) {
        boolean z;
        if (this.rdbms == null && this.version == null) {
            z = true;
        } else {
            try {
                DatabaseMetaData metaData = connection.getMetaData();
                if (this.rdbms != null) {
                    String lowerCase = metaData.getDatabaseProductName().toLowerCase();
                    log(new StringBuffer().append("RDBMS = ").append(lowerCase).toString(), 3);
                    if (lowerCase == null || lowerCase.indexOf(this.rdbms) < 0) {
                        log(new StringBuffer().append("Not the required RDBMS: ").append(this.rdbms).toString(), 3);
                        z = false;
                    }
                }
                z = true;
                if (this.version != null) {
                    String lowerCase2 = metaData.getDatabaseProductVersion().toLowerCase(Locale.ENGLISH);
                    log(new StringBuffer().append("Version = ").append(lowerCase2).toString(), 3);
                    if (lowerCase2 != null) {
                        z = true;
                        if (!lowerCase2.startsWith(this.version)) {
                            z = true;
                        }
                    }
                    log(new StringBuffer().append("Not the required version: \"").append(this.version).append("\"").toString(), 3);
                    z = false;
                }
            } catch (SQLException e) {
                log("Failed to obtain required RDBMS information", 0);
                z = false;
            }
        }
        return z;
    }

    public void setAutocommit(boolean z) {
        this.autocommit = z;
    }

    public void setCaching(boolean z) {
        this.caching = z;
    }

    public void setClasspath(Path path) {
        this.classpath = path;
    }

    public void setClasspathRef(Reference reference) {
        createClasspath().setRefid(reference);
    }

    public void setDriver(String str) {
        this.driver = str.trim();
    }

    public void setFailOnConnectionError(boolean z) {
        this.failOnConnectionError = z;
    }

    public void setPassword(String str) {
        this.password = str;
    }

    public void setRdbms(String str) {
        this.rdbms = str;
    }

    public void setUrl(String str) {
        this.url = str;
    }

    public void setUserid(String str) {
        this.userId = str;
    }

    public void setVersion(String str) {
        this.version = str;
    }
}
