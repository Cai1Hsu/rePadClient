package com.mongodb;

import com.edutech.publicedu.log.LogHelp;
import com.mongodb.DBPort;
import com.mongodb.MongoClientOptions;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Logger;
import javax.net.ssl.SSLSocketFactory;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class MongoClientURI {
    private static final String PREFIX = "mongodb://";
    private static final String UTF_8 = "UTF-8";
    private final String collection;
    private final MongoCredential credentials;
    private final String database;
    private final List<String> hosts;
    private final MongoClientOptions options;
    private final String uri;
    static Set<String> generalOptionsKeys = new HashSet();
    static Set<String> authKeys = new HashSet();
    static Set<String> readPreferenceKeys = new HashSet();
    static Set<String> writeConcernKeys = new HashSet();
    static Set<String> allKeys = new HashSet();
    static final Logger LOGGER = Logger.getLogger("com.mongodb.MongoURI");

    public MongoClientURI(String uri) {
        this(uri, new MongoClientOptions.Builder());
    }

    public MongoClientURI(String uri, MongoClientOptions.Builder builder) {
        String serverPart;
        String nsPart;
        String optionsPart;
        try {
            this.uri = uri;
            if (!uri.startsWith("mongodb://")) {
                throw new IllegalArgumentException("uri needs to start with mongodb://");
            }
            String uri2 = uri.substring("mongodb://".length());
            String userName = null;
            char[] password = null;
            int idx = uri2.lastIndexOf("/");
            if (idx < 0) {
                if (uri2.contains("?")) {
                    throw new IllegalArgumentException("URI contains options without trailing slash");
                }
                serverPart = uri2;
                nsPart = null;
                optionsPart = "";
            } else {
                serverPart = uri2.substring(0, idx);
                nsPart = uri2.substring(idx + 1);
                int idx2 = nsPart.indexOf("?");
                if (idx2 >= 0) {
                    optionsPart = nsPart.substring(idx2 + 1);
                    nsPart = nsPart.substring(0, idx2);
                } else {
                    optionsPart = "";
                }
            }
            List<String> all = new LinkedList<>();
            int idx3 = serverPart.indexOf("@");
            if (idx3 > 0) {
                String authPart = serverPart.substring(0, idx3);
                serverPart = serverPart.substring(idx3 + 1);
                int idx4 = authPart.indexOf(":");
                if (idx4 == -1) {
                    userName = URLDecoder.decode(authPart, "UTF-8");
                } else {
                    userName = URLDecoder.decode(authPart.substring(0, idx4), "UTF-8");
                    password = URLDecoder.decode(authPart.substring(idx4 + 1), "UTF-8").toCharArray();
                }
            }
            Collections.addAll(all, serverPart.split(","));
            this.hosts = Collections.unmodifiableList(all);
            if (nsPart != null && nsPart.length() != 0) {
                int idx5 = nsPart.indexOf(".");
                if (idx5 < 0) {
                    this.database = nsPart;
                    this.collection = null;
                } else {
                    this.database = nsPart.substring(0, idx5);
                    this.collection = nsPart.substring(idx5 + 1);
                }
            } else {
                this.database = null;
                this.collection = null;
            }
            Map<String, List<String>> optionsMap = parseOptions(optionsPart);
            this.options = createOptions(optionsMap, builder);
            this.credentials = createCredentials(optionsMap, userName, password, this.database);
            warnOnUnsupportedOptions(optionsMap);
        } catch (UnsupportedEncodingException e) {
            throw new MongoInternalException("This should not happen", e);
        }
    }

    static {
        generalOptionsKeys.add("minpoolsize");
        generalOptionsKeys.add("maxpoolsize");
        generalOptionsKeys.add("waitqueuemultiple");
        generalOptionsKeys.add("waitqueuetimeoutms");
        generalOptionsKeys.add("connecttimeoutms");
        generalOptionsKeys.add("maxidletimems");
        generalOptionsKeys.add("maxlifetimems");
        generalOptionsKeys.add("sockettimeoutms");
        generalOptionsKeys.add("sockettimeoutms");
        generalOptionsKeys.add("autoconnectretry");
        generalOptionsKeys.add("ssl");
        generalOptionsKeys.add("replicaset");
        readPreferenceKeys.add("slaveok");
        readPreferenceKeys.add("readpreference");
        readPreferenceKeys.add("readpreferencetags");
        writeConcernKeys.add("safe");
        writeConcernKeys.add("w");
        writeConcernKeys.add("wtimeout");
        writeConcernKeys.add("fsync");
        writeConcernKeys.add("j");
        authKeys.add("authmechanism");
        authKeys.add("authsource");
        authKeys.add("gssapiservicename");
        allKeys.addAll(generalOptionsKeys);
        allKeys.addAll(authKeys);
        allKeys.addAll(readPreferenceKeys);
        allKeys.addAll(writeConcernKeys);
    }

    private void warnOnUnsupportedOptions(Map<String, List<String>> optionsMap) {
        for (String key : optionsMap.keySet()) {
            if (!allKeys.contains(key)) {
                LOGGER.warning("Unknown or Unsupported Option '" + key + "'");
            }
        }
    }

    private MongoClientOptions createOptions(Map<String, List<String>> optionsMap, MongoClientOptions.Builder builder) {
        for (String key : generalOptionsKeys) {
            String value = getLastValue(optionsMap, key);
            if (value != null) {
                if (key.equals("maxpoolsize")) {
                    builder.connectionsPerHost(Integer.parseInt(value));
                } else if (key.equals("minpoolsize")) {
                    builder.minConnectionsPerHost(Integer.parseInt(value));
                } else if (key.equals("maxidletimems")) {
                    builder.maxConnectionIdleTime(Integer.parseInt(value));
                } else if (key.equals("maxlifetimems")) {
                    builder.maxConnectionLifeTime(Integer.parseInt(value));
                } else if (key.equals("waitqueuemultiple")) {
                    builder.threadsAllowedToBlockForConnectionMultiplier(Integer.parseInt(value));
                } else if (key.equals("waitqueuetimeoutms")) {
                    builder.maxWaitTime(Integer.parseInt(value));
                } else if (key.equals("connecttimeoutms")) {
                    builder.connectTimeout(Integer.parseInt(value));
                } else if (key.equals("sockettimeoutms")) {
                    builder.socketTimeout(Integer.parseInt(value));
                } else if (key.equals("autoconnectretry")) {
                    builder.autoConnectRetry(_parseBoolean(value));
                } else if (key.equals("replicaset")) {
                    builder.requiredReplicaSetName(value);
                } else if (key.equals("ssl") && _parseBoolean(value)) {
                    builder.socketFactory(SSLSocketFactory.getDefault());
                }
            }
        }
        WriteConcern writeConcern = createWriteConcern(optionsMap);
        ReadPreference readPreference = createReadPreference(optionsMap);
        if (writeConcern != null) {
            builder.writeConcern(writeConcern);
        }
        if (readPreference != null) {
            builder.readPreference(readPreference);
        }
        return builder.build();
    }

    private WriteConcern createWriteConcern(Map<String, List<String>> optionsMap) {
        Boolean safe = null;
        String w = null;
        int wTimeout = 0;
        boolean fsync = false;
        boolean journal = false;
        for (String key : writeConcernKeys) {
            String value = getLastValue(optionsMap, key);
            if (value != null) {
                if (key.equals("safe")) {
                    safe = Boolean.valueOf(_parseBoolean(value));
                } else if (key.equals("w")) {
                    w = value;
                } else if (key.equals("wtimeout")) {
                    wTimeout = Integer.parseInt(value);
                } else if (key.equals("fsync")) {
                    fsync = _parseBoolean(value);
                } else if (key.equals("j")) {
                    journal = _parseBoolean(value);
                }
            }
        }
        return buildWriteConcern(safe, w, wTimeout, fsync, journal);
    }

    private ReadPreference createReadPreference(Map<String, List<String>> optionsMap) {
        Boolean slaveOk = null;
        String readPreferenceType = null;
        DBObject firstTagSet = null;
        List<DBObject> remainingTagSets = new ArrayList<>();
        for (String key : readPreferenceKeys) {
            String value = getLastValue(optionsMap, key);
            if (value != null) {
                if (key.equals("slaveok")) {
                    slaveOk = Boolean.valueOf(_parseBoolean(value));
                } else if (key.equals("readpreference")) {
                    readPreferenceType = value;
                } else if (key.equals("readpreferencetags")) {
                    for (String cur : optionsMap.get(key)) {
                        DBObject tagSet = getTagSet(cur.trim());
                        if (firstTagSet == null) {
                            firstTagSet = tagSet;
                        } else {
                            remainingTagSets.add(tagSet);
                        }
                    }
                }
            }
        }
        return buildReadPreference(readPreferenceType, firstTagSet, remainingTagSets, slaveOk);
    }

    private MongoCredential createCredentials(Map<String, List<String>> optionsMap, String userName, char[] password, String database) {
        if (userName == null) {
            return null;
        }
        if (database == null) {
            database = "admin";
        }
        String mechanism = MongoCredential.MONGODB_CR_MECHANISM;
        String authSource = database;
        String gssapiServiceName = null;
        for (String key : authKeys) {
            String value = getLastValue(optionsMap, key);
            if (value != null) {
                if (key.equals("authmechanism")) {
                    mechanism = value;
                } else if (key.equals("authsource")) {
                    authSource = value;
                } else if (key.equals("gssapiservicename")) {
                    gssapiServiceName = value;
                }
            }
        }
        if (mechanism.equals("GSSAPI")) {
            MongoCredential gssapiCredential = MongoCredential.createGSSAPICredential(userName);
            if (gssapiServiceName != null) {
                return gssapiCredential.withMechanismProperty(DBPort.GSSAPIAuthenticator.SERVICE_NAME_KEY, gssapiServiceName);
            }
            return gssapiCredential;
        } else if (mechanism.equals(MongoCredential.PLAIN_MECHANISM)) {
            return MongoCredential.createPlainCredential(userName, authSource, password);
        } else {
            if (mechanism.equals(MongoCredential.MONGODB_CR_MECHANISM)) {
                return MongoCredential.createMongoCRCredential(userName, authSource, password);
            }
            if (mechanism.equals(MongoCredential.MONGODB_X509_MECHANISM)) {
                return MongoCredential.createMongoX509Credential(userName);
            }
            throw new IllegalArgumentException("Unsupported authMechanism: " + mechanism);
        }
    }

    private String getLastValue(Map<String, List<String>> optionsMap, String key) {
        List<String> valueList = optionsMap.get(key);
        if (valueList == null) {
            return null;
        }
        return valueList.get(valueList.size() - 1);
    }

    private Map<String, List<String>> parseOptions(String optionsPart) {
        Map<String, List<String>> optionsMap = new HashMap<>();
        String[] arr$ = optionsPart.split("&|;");
        for (String _part : arr$) {
            int idx = _part.indexOf("=");
            if (idx >= 0) {
                String key = _part.substring(0, idx).toLowerCase();
                String value = _part.substring(idx + 1);
                List<String> valueList = optionsMap.get(key);
                if (valueList == null) {
                    valueList = new ArrayList<>(1);
                }
                valueList.add(value);
                optionsMap.put(key, valueList);
            }
        }
        return optionsMap;
    }

    private ReadPreference buildReadPreference(String readPreferenceType, DBObject firstTagSet, List<DBObject> remainingTagSets, Boolean slaveOk) {
        if (readPreferenceType != null) {
            if (firstTagSet == null) {
                return ReadPreference.valueOf(readPreferenceType);
            }
            return ReadPreference.valueOf(readPreferenceType, firstTagSet, (DBObject[]) remainingTagSets.toArray(new DBObject[remainingTagSets.size()]));
        } else if (slaveOk != null && slaveOk.equals(Boolean.TRUE)) {
            return ReadPreference.secondaryPreferred();
        } else {
            return null;
        }
    }

    private WriteConcern buildWriteConcern(Boolean safe, String w, int wTimeout, boolean fsync, boolean journal) {
        if (w != null || wTimeout != 0 || fsync || journal) {
            if (w == null) {
                return new WriteConcern(1, wTimeout, fsync, journal);
            }
            try {
                return new WriteConcern(Integer.parseInt(w), wTimeout, fsync, journal);
            } catch (NumberFormatException e) {
                return new WriteConcern(w, wTimeout, fsync, journal);
            }
        } else if (safe != null) {
            if (safe.booleanValue()) {
                return WriteConcern.ACKNOWLEDGED;
            }
            return WriteConcern.UNACKNOWLEDGED;
        } else {
            return null;
        }
    }

    private DBObject getTagSet(String tagSetString) {
        DBObject tagSet = new BasicDBObject();
        if (tagSetString.length() > 0) {
            String[] arr$ = tagSetString.split(",");
            for (String tag : arr$) {
                String[] tagKeyValuePair = tag.split(":");
                if (tagKeyValuePair.length != 2) {
                    throw new IllegalArgumentException("Bad read preference tags: " + tagSetString);
                }
                tagSet.put(tagKeyValuePair[0].trim(), tagKeyValuePair[1].trim());
            }
        }
        return tagSet;
    }

    boolean _parseBoolean(String _in) {
        String in = _in.trim();
        return in != null && in.length() > 0 && (in.equals(LogHelp.TYPE_GUIDANCE) || in.toLowerCase().equals("true") || in.toLowerCase().equals("yes"));
    }

    public String getUsername() {
        if (this.credentials != null) {
            return this.credentials.getUserName();
        }
        return null;
    }

    public char[] getPassword() {
        if (this.credentials != null) {
            return this.credentials.getPassword();
        }
        return null;
    }

    public List<String> getHosts() {
        return this.hosts;
    }

    public String getDatabase() {
        return this.database;
    }

    public String getCollection() {
        return this.collection;
    }

    public String getURI() {
        return this.uri;
    }

    public MongoCredential getCredentials() {
        return this.credentials;
    }

    public MongoClientOptions getOptions() {
        return this.options;
    }

    public String toString() {
        return this.uri;
    }
}
