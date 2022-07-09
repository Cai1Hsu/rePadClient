package org.apache.tools.ant.types;

import java.net.SocketPermission;
import java.security.UnresolvedPermission;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import java.util.PropertyPermission;
import java.util.Set;
import java.util.StringTokenizer;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ExitException;

/* loaded from: classes.jar:org/apache/tools/ant/types/Permissions.class */
public class Permissions {
    private static final Class[] PARAMS;
    static Class class$java$lang$String;
    private boolean active;
    private boolean delegateToOldSM;
    private java.security.Permissions granted;
    private List grantedPermissions;
    private SecurityManager origSm;
    private List revokedPermissions;

    /* renamed from: org.apache.tools.ant.types.Permissions$1 */
    /* loaded from: classes.jar:org/apache/tools/ant/types/Permissions$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/types/Permissions$MySM.class */
    private class MySM extends SecurityManager {
        private final Permissions this$0;

        private MySM(Permissions permissions) {
            this.this$0 = permissions;
        }

        MySM(Permissions permissions, AnonymousClass1 anonymousClass1) {
            this(permissions);
        }

        private void checkRevoked(java.security.Permission permission) {
            ListIterator listIterator = this.this$0.revokedPermissions.listIterator();
            while (listIterator.hasNext()) {
                if (((Permission) listIterator.next()).matches(permission)) {
                    throw new SecurityException(new StringBuffer().append("Permission ").append(permission).append(" was revoked.").toString());
                }
            }
        }

        @Override // java.lang.SecurityManager
        public void checkExit(int i) {
            try {
                checkPermission(new RuntimePermission("exitVM", null));
            } catch (SecurityException e) {
                throw new ExitException(e.getMessage(), i);
            }
        }

        @Override // java.lang.SecurityManager
        public void checkPermission(java.security.Permission permission) {
            if (this.this$0.active) {
                if (!this.this$0.delegateToOldSM || permission.getName().equals("exitVM")) {
                    if (!this.this$0.granted.implies(permission)) {
                        throw new SecurityException(new StringBuffer().append("Permission ").append(permission).append(" was not granted.").toString());
                    }
                    checkRevoked(permission);
                    return;
                }
                boolean z = false;
                if (this.this$0.granted.implies(permission)) {
                    z = true;
                }
                checkRevoked(permission);
                if (z || this.this$0.origSm == null) {
                    return;
                }
                this.this$0.origSm.checkPermission(permission);
            }
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/types/Permissions$Permission.class */
    public static class Permission {
        private String actionString;
        private Set actions;
        private String className;
        private String name;

        private Set parseActions(String str) {
            HashSet hashSet = new HashSet();
            StringTokenizer stringTokenizer = new StringTokenizer(str, ",");
            while (stringTokenizer.hasMoreTokens()) {
                String trim = stringTokenizer.nextToken().trim();
                if (!trim.equals("")) {
                    hashSet.add(trim);
                }
            }
            return hashSet;
        }

        public String getActions() {
            return this.actionString;
        }

        public String getClassName() {
            return this.className;
        }

        public String getName() {
            return this.name;
        }

        /* JADX WARN: Code restructure failed: missing block: B:12:0x0044, code lost:
            if (r7.getName().startsWith(r6.name.substring(0, r6.name.length() - 1)) != false) goto L13;
         */
        /* JADX WARN: Code restructure failed: missing block: B:16:0x0074, code lost:
            if (r0.size() != r0) goto L17;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        boolean matches(java.security.Permission permission) {
            boolean z;
            if (!this.className.equals(permission.getClass().getName())) {
                z = false;
            } else {
                if (this.name != null) {
                    if (this.name.endsWith("*")) {
                        z = false;
                    } else if (!this.name.equals(permission.getName())) {
                        z = false;
                    }
                }
                if (this.actions != null) {
                    Set parseActions = parseActions(permission.getActions());
                    int size = parseActions.size();
                    parseActions.removeAll(this.actions);
                    z = false;
                }
                z = true;
            }
            return z;
        }

        public void setActions(String str) {
            this.actionString = str;
            if (str.length() > 0) {
                this.actions = parseActions(str);
            }
        }

        public void setClass(String str) {
            this.className = str.trim();
        }

        public void setName(String str) {
            this.name = str.trim();
        }

        public String toString() {
            return new StringBuffer().append("Permission: ").append(this.className).append(" (\"").append(this.name).append("\", \"").append(this.actions).append("\")").toString();
        }
    }

    static {
        Class cls;
        Class cls2;
        if (class$java$lang$String == null) {
            cls = class$("java.lang.String");
            class$java$lang$String = cls;
        } else {
            cls = class$java$lang$String;
        }
        if (class$java$lang$String == null) {
            cls2 = class$("java.lang.String");
            class$java$lang$String = cls2;
        } else {
            cls2 = class$java$lang$String;
        }
        PARAMS = new Class[]{cls, cls2};
    }

    public Permissions() {
        this(false);
    }

    public Permissions(boolean z) {
        this.grantedPermissions = new LinkedList();
        this.revokedPermissions = new LinkedList();
        this.granted = null;
        this.origSm = null;
        this.active = false;
        this.delegateToOldSM = z;
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v12, types: [java.security.Permission] */
    private java.security.Permission createPermission(Permission permission) {
        UnresolvedPermission unresolvedPermission;
        try {
            unresolvedPermission = (java.security.Permission) Class.forName(permission.getClassName()).getConstructor(PARAMS).newInstance(permission.getName(), permission.getActions());
        } catch (Exception e) {
            unresolvedPermission = new UnresolvedPermission(permission.getClassName(), permission.getName(), permission.getActions(), null);
        }
        return unresolvedPermission;
    }

    private void init() throws BuildException {
        this.granted = new java.security.Permissions();
        ListIterator listIterator = this.revokedPermissions.listIterator();
        while (listIterator.hasNext()) {
            Permission permission = (Permission) listIterator.next();
            if (permission.getClassName() == null) {
                throw new BuildException(new StringBuffer().append("Revoked permission ").append(permission).append(" does not contain a class.").toString());
            }
        }
        ListIterator listIterator2 = this.grantedPermissions.listIterator();
        while (listIterator2.hasNext()) {
            Permission permission2 = (Permission) listIterator2.next();
            if (permission2.getClassName() == null) {
                throw new BuildException(new StringBuffer().append("Granted permission ").append(permission2).append(" does not contain a class.").toString());
            }
            this.granted.add(createPermission(permission2));
        }
        this.granted.add(new SocketPermission("localhost:1024-", "listen"));
        this.granted.add(new PropertyPermission("java.version", "read"));
        this.granted.add(new PropertyPermission("java.vendor", "read"));
        this.granted.add(new PropertyPermission("java.vendor.url", "read"));
        this.granted.add(new PropertyPermission("java.class.version", "read"));
        this.granted.add(new PropertyPermission("os.name", "read"));
        this.granted.add(new PropertyPermission("os.version", "read"));
        this.granted.add(new PropertyPermission("os.arch", "read"));
        this.granted.add(new PropertyPermission("file.encoding", "read"));
        this.granted.add(new PropertyPermission("file.separator", "read"));
        this.granted.add(new PropertyPermission("path.separator", "read"));
        this.granted.add(new PropertyPermission("line.separator", "read"));
        this.granted.add(new PropertyPermission("java.specification.version", "read"));
        this.granted.add(new PropertyPermission("java.specification.vendor", "read"));
        this.granted.add(new PropertyPermission("java.specification.name", "read"));
        this.granted.add(new PropertyPermission("java.vm.specification.version", "read"));
        this.granted.add(new PropertyPermission("java.vm.specification.vendor", "read"));
        this.granted.add(new PropertyPermission("java.vm.specification.name", "read"));
        this.granted.add(new PropertyPermission("java.vm.version", "read"));
        this.granted.add(new PropertyPermission("java.vm.vendor", "read"));
        this.granted.add(new PropertyPermission("java.vm.name", "read"));
    }

    public void addConfiguredGrant(Permission permission) {
        this.grantedPermissions.add(permission);
    }

    public void addConfiguredRevoke(Permission permission) {
        this.revokedPermissions.add(permission);
    }

    public void restoreSecurityManager() {
        synchronized (this) {
            this.active = false;
            System.setSecurityManager(this.origSm);
        }
    }

    public void setSecurityManager() throws BuildException {
        synchronized (this) {
            this.origSm = System.getSecurityManager();
            init();
            System.setSecurityManager(new MySM(this, null));
            this.active = true;
        }
    }
}
