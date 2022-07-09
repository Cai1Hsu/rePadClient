package org.apache.tools.ant.util.optional;

import java.security.Permission;
import org.apache.tools.ant.ExitException;

/* loaded from: classes.jar:org/apache/tools/ant/util/optional/NoExitSecurityManager.class */
public class NoExitSecurityManager extends SecurityManager {
    @Override // java.lang.SecurityManager
    public void checkExit(int i) {
        throw new ExitException(i);
    }

    @Override // java.lang.SecurityManager
    public void checkPermission(Permission permission) {
    }
}
