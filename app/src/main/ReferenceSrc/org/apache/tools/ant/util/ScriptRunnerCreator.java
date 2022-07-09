package org.apache.tools.ant.util;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;

/* loaded from: classes.jar:org/apache/tools/ant/util/ScriptRunnerCreator.class */
public class ScriptRunnerCreator {
    private static final String AUTO = "auto";
    private static final String BSF = "bsf";
    private static final String BSF_MANAGER = "org.apache.bsf.BSFManager";
    private static final String BSF_PACK = "org.apache.bsf";
    private static final String BSF_RUNNER = "org.apache.tools.ant.util.optional.ScriptRunner";
    private static final String JAVAX = "javax";
    private static final String JAVAX_MANAGER = "javax.script.ScriptEngineManager";
    private static final String JAVAX_RUNNER = "org.apache.tools.ant.util.optional.JavaxScriptRunner";
    private static final String OATAU = "org.apache.tools.ant.util";
    private static final String UTIL_OPT = "org.apache.tools.ant.util.optional";
    private String language;
    private String manager;
    private Project project;
    private ClassLoader scriptLoader = null;

    public ScriptRunnerCreator(Project project) {
        this.project = project;
    }

    private ScriptRunnerBase createRunner(String str, String str2, String str3) {
        ScriptRunnerBase scriptRunnerBase;
        if (this.manager.equals("auto") || this.manager.equals(str)) {
            scriptRunnerBase = null;
            if (this.scriptLoader.getResource(LoaderUtils.classNameToResource(str2)) != null) {
                if (str2.equals(BSF_MANAGER)) {
                    new ScriptFixBSFPath().fixClassLoader(this.scriptLoader, this.language);
                }
                try {
                    scriptRunnerBase = (ScriptRunnerBase) Class.forName(str3, true, this.scriptLoader).newInstance();
                    scriptRunnerBase.setProject(this.project);
                    scriptRunnerBase.setLanguage(this.language);
                    scriptRunnerBase.setScriptClassLoader(this.scriptLoader);
                } catch (Exception e) {
                    throw ReflectUtil.toBuildException(e);
                }
            }
        } else {
            scriptRunnerBase = null;
        }
        return scriptRunnerBase;
    }

    public ScriptRunnerBase createRunner(String str, String str2, ClassLoader classLoader) {
        ScriptRunnerBase scriptRunnerBase;
        synchronized (this) {
            this.manager = str;
            this.language = str2;
            this.scriptLoader = classLoader;
            if (str2 == null) {
                throw new BuildException("script language must be specified");
            }
            if (!str.equals("auto") && !str.equals(JAVAX) && !str.equals(BSF)) {
                throw new BuildException(new StringBuffer().append("Unsupported language prefix ").append(str).toString());
            }
            ScriptRunnerBase createRunner = createRunner(BSF, BSF_MANAGER, BSF_RUNNER);
            scriptRunnerBase = createRunner;
            if (createRunner == null) {
                scriptRunnerBase = createRunner(JAVAX, JAVAX_MANAGER, JAVAX_RUNNER);
            }
            if (scriptRunnerBase == null) {
                if (JAVAX.equals(str)) {
                    throw new BuildException("Unable to load the script engine manager (javax.script.ScriptEngineManager)");
                }
                if (!BSF.equals(str)) {
                    throw new BuildException("Unable to load a script engine manager (org.apache.bsf.BSFManager or javax.script.ScriptEngineManager)");
                }
                throw new BuildException("Unable to load the BSF script engine manager (org.apache.bsf.BSFManager)");
            }
        }
        return scriptRunnerBase;
    }
}
