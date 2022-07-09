package org.apache.tools.ant.taskdefs.optional.ejb;

import java.io.File;
import java.io.IOException;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Definer;
import org.apache.tools.ant.taskdefs.optional.ejb.IPlanetEjbc;
import org.apache.tools.ant.types.Path;
import org.xml.sax.SAXException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask.class */
public class IPlanetEjbcTask extends Task {
    private Path classpath;
    private File dest;
    private File ejbdescriptor;
    private File iasdescriptor;
    private File iashome;
    private boolean keepgenerated = false;
    private boolean debug = false;

    private void checkConfiguration() throws BuildException {
        if (this.ejbdescriptor == null) {
            throw new BuildException("The standard EJB descriptor must be specified using the \"ejbdescriptor\" attribute.", getLocation());
        }
        if (!this.ejbdescriptor.exists() || !this.ejbdescriptor.isFile()) {
            throw new BuildException(new StringBuffer().append("The standard EJB descriptor (").append(this.ejbdescriptor).append(") was not found or isn't a file.").toString(), getLocation());
        }
        if (this.iasdescriptor == null) {
            throw new BuildException("The iAS-speific XML descriptor must be specified using the \"iasdescriptor\" attribute.", getLocation());
        }
        if (!this.iasdescriptor.exists() || !this.iasdescriptor.isFile()) {
            throw new BuildException(new StringBuffer().append("The iAS-specific XML descriptor (").append(this.iasdescriptor).append(") was not found or isn't a file.").toString(), getLocation());
        }
        if (this.dest == null) {
            throw new BuildException("The destination directory must be specified using the \"dest\" attribute.", getLocation());
        }
        if (!this.dest.exists() || !this.dest.isDirectory()) {
            throw new BuildException(new StringBuffer().append("The destination directory (").append(this.dest).append(") was not ").append("found or isn't a directory.").toString(), getLocation());
        }
        if (this.iashome != null && !this.iashome.isDirectory()) {
            throw new BuildException(new StringBuffer().append("If \"iashome\" is specified, it must be a valid directory (it was set to ").append(this.iashome).append(").").toString(), getLocation());
        }
    }

    private void executeEjbc(SAXParser sAXParser) throws BuildException {
        IPlanetEjbc iPlanetEjbc = new IPlanetEjbc(this.ejbdescriptor, this.iasdescriptor, this.dest, getClasspath().toString(), sAXParser);
        iPlanetEjbc.setRetainSource(this.keepgenerated);
        iPlanetEjbc.setDebugOutput(this.debug);
        if (this.iashome != null) {
            iPlanetEjbc.setIasHomeDir(this.iashome);
        }
        try {
            iPlanetEjbc.execute();
        } catch (IOException e) {
            throw new BuildException(new StringBuffer().append("An IOException occurred while trying to read the XML descriptor file: ").append(e.getMessage()).toString(), e, getLocation());
        } catch (IPlanetEjbc.EjbcException e2) {
            throw new BuildException(new StringBuffer().append("An exception occurred while trying to run the ejbc utility: ").append(e2.getMessage()).toString(), e2, getLocation());
        } catch (SAXException e3) {
            throw new BuildException(new StringBuffer().append("A SAXException occurred while trying to read the XML descriptor file: ").append(e3.getMessage()).toString(), e3, getLocation());
        }
    }

    private Path getClasspath() {
        return this.classpath == null ? new Path(getProject()).concatSystemClasspath("last") : this.classpath.concatSystemClasspath(Definer.OnError.POLICY_IGNORE);
    }

    private SAXParser getParser() throws BuildException {
        try {
            SAXParserFactory newInstance = SAXParserFactory.newInstance();
            newInstance.setValidating(true);
            return newInstance.newSAXParser();
        } catch (ParserConfigurationException e) {
            throw new BuildException(new StringBuffer().append("Unable to create a SAXParser: ").append(e.getMessage()).toString(), e, getLocation());
        } catch (SAXException e2) {
            throw new BuildException(new StringBuffer().append("Unable to create a SAXParser: ").append(e2.getMessage()).toString(), e2, getLocation());
        }
    }

    public Path createClasspath() {
        if (this.classpath == null) {
            this.classpath = new Path(getProject());
        }
        return this.classpath.createPath();
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        checkConfiguration();
        executeEjbc(getParser());
    }

    public void setClasspath(Path path) {
        if (this.classpath == null) {
            this.classpath = path;
        } else {
            this.classpath.append(path);
        }
    }

    public void setDebug(boolean z) {
        this.debug = z;
    }

    public void setDest(File file) {
        this.dest = file;
    }

    public void setEjbdescriptor(File file) {
        this.ejbdescriptor = file;
    }

    public void setIasdescriptor(File file) {
        this.iasdescriptor = file;
    }

    public void setIashome(File file) {
        this.iashome = file;
    }

    public void setKeepgenerated(boolean z) {
        this.keepgenerated = z;
    }
}
