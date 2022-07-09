package org.apache.tools.ant;

/* loaded from: classes.jar:org/apache/tools/ant/BuildException.class */
public class BuildException extends RuntimeException {
    private static final long serialVersionUID = -5419014565354664240L;
    private Location location;

    public BuildException() {
        this.location = Location.UNKNOWN_LOCATION;
    }

    public BuildException(String str) {
        super(str);
        this.location = Location.UNKNOWN_LOCATION;
    }

    public BuildException(String str, Throwable th) {
        super(str);
        this.location = Location.UNKNOWN_LOCATION;
        initCause(th);
    }

    public BuildException(String str, Throwable th, Location location) {
        this(str, th);
        this.location = location;
    }

    public BuildException(String str, Location location) {
        super(str);
        this.location = Location.UNKNOWN_LOCATION;
        this.location = location;
    }

    public BuildException(Throwable th) {
        super(th);
        this.location = Location.UNKNOWN_LOCATION;
    }

    public BuildException(Throwable th, Location location) {
        this(th);
        this.location = location;
    }

    public Throwable getException() {
        return getCause();
    }

    public Location getLocation() {
        return this.location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    @Override // java.lang.Throwable
    public String toString() {
        return new StringBuffer().append(this.location.toString()).append(getMessage()).toString();
    }
}
