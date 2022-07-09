package org.apache.tools.ant.taskdefs.optional.sos;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/sos/SOSCmd.class */
public interface SOSCmd {
    public static final String COMMAND_CHECKIN_FILE = "CheckInFile";
    public static final String COMMAND_CHECKIN_PROJECT = "CheckInProject";
    public static final String COMMAND_CHECKOUT_FILE = "CheckOutFile";
    public static final String COMMAND_CHECKOUT_PROJECT = "CheckOutProject";
    public static final String COMMAND_GET_FILE = "GetFile";
    public static final String COMMAND_GET_PROJECT = "GetProject";
    public static final String COMMAND_HISTORY = "GetFileHistory";
    public static final String COMMAND_LABEL = "AddLabel";
    public static final String COMMAND_SOS_EXE = "soscmd";
    public static final String FLAG_COMMAND = "-command";
    public static final String FLAG_COMMENT = "-log";
    public static final String FLAG_FILE = "-file";
    public static final String FLAG_LABEL = "-label";
    public static final String FLAG_NO_CACHE = "-nocache";
    public static final String FLAG_NO_COMPRESSION = "-nocompress";
    public static final String FLAG_PASSWORD = "-password";
    public static final String FLAG_PROJECT = "-project";
    public static final String FLAG_RECURSION = "-recursive";
    public static final String FLAG_SOS_HOME = "-soshome";
    public static final String FLAG_SOS_SERVER = "-server";
    public static final String FLAG_USERNAME = "-name";
    public static final String FLAG_VERBOSE = "-verbose";
    public static final String FLAG_VERSION = "-revision";
    public static final String FLAG_VSS_SERVER = "-database";
    public static final String FLAG_WORKING_DIR = "-workdir";
    public static final String PROJECT_PREFIX = "$";
}
