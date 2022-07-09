package com.edutech.appmanage.utils;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

/* loaded from: classes.jar:com/edutech/appmanage/utils/ShellUtils.class */
public class ShellUtils {
    public static final String COMMAND_EXIT = "exit\n";
    public static final String COMMAND_LINE_END = "\n";
    public static final String COMMAND_SH = "sh";
    public static final String COMMAND_SU = "su";

    /* loaded from: classes.jar:com/edutech/appmanage/utils/ShellUtils$CommandResult.class */
    public static class CommandResult {
        public String errorMsg;
        public int result;
        public String successMsg;

        public CommandResult(int i) {
            this.result = i;
        }

        public CommandResult(int i, String str, String str2) {
            this.result = i;
            this.successMsg = str;
            this.errorMsg = str2;
        }
    }

    private ShellUtils() {
        throw new AssertionError();
    }

    public static boolean checkRootPermission() {
        boolean z = true;
        if (execCommand("echo root", true, false).result != 0) {
            z = false;
        }
        return z;
    }

    public static CommandResult execCommand(String str, boolean z) {
        return execCommand(new String[]{str}, z, true);
    }

    public static CommandResult execCommand(String str, boolean z, boolean z2) {
        return execCommand(new String[]{str}, z, z2);
    }

    public static CommandResult execCommand(List<String> list, boolean z) {
        return execCommand(list == null ? null : (String[]) list.toArray(new String[0]), z, true);
    }

    public static CommandResult execCommand(List<String> list, boolean z, boolean z2) {
        return execCommand(list == null ? null : (String[]) list.toArray(new String[0]), z, z2);
    }

    public static CommandResult execCommand(String[] strArr, boolean z) {
        return execCommand(strArr, z, true);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:113:0x0330  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x0378  */
    /* JADX WARN: Removed duplicated region for block: B:138:0x0392  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x039c  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x01d8  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x01df  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x028b  */
    /* JADX WARN: Type inference failed for: r0v100, types: [java.lang.StringBuilder] */
    /* JADX WARN: Type inference failed for: r0v177, types: [java.io.BufferedReader] */
    /* JADX WARN: Type inference failed for: r0v203, types: [java.lang.StringBuilder] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static CommandResult execCommand(String[] strArr, boolean z, boolean z2) {
        CommandResult commandResult;
        BufferedReader bufferedReader;
        DataOutputStream dataOutputStream;
        Process process;
        StringBuilder sb;
        BufferedReader bufferedReader2;
        BufferedReader bufferedReader3;
        BufferedReader bufferedReader4;
        DataOutputStream dataOutputStream2;
        StringBuilder sb2;
        BufferedReader bufferedReader5;
        Throwable th;
        DataOutputStream dataOutputStream3;
        BufferedReader bufferedReader6;
        int i;
        StringBuilder sb3;
        int i2 = -1;
        if (strArr == null || strArr.length == 0) {
            commandResult = new CommandResult(-1, null, null);
        } else {
            BufferedReader bufferedReader7 = null;
            BufferedReader bufferedReader8 = null;
            BufferedReader bufferedReader9 = null;
            DataOutputStream dataOutputStream4 = null;
            BufferedReader bufferedReader10 = null;
            BufferedReader bufferedReader11 = null;
            Process process2 = null;
            Process process3 = null;
            try {
                try {
                    process = Runtime.getRuntime().exec(z ? COMMAND_SU : COMMAND_SH);
                    bufferedReader9 = null;
                    dataOutputStream4 = null;
                    bufferedReader11 = null;
                    process2 = process;
                    process3 = process;
                    DataOutputStream dataOutputStream5 = new DataOutputStream(process.getOutputStream());
                    int i3 = -1;
                    int i4 = -1;
                    try {
                        for (String str : strArr) {
                            if (str != null) {
                                dataOutputStream5.write(str.getBytes());
                                dataOutputStream5.writeBytes("\n");
                                dataOutputStream5.flush();
                            }
                        }
                        dataOutputStream5.writeBytes(COMMAND_EXIT);
                        dataOutputStream5.flush();
                        i2 = process.waitFor();
                        bufferedReader6 = null;
                        bufferedReader10 = null;
                        StringBuilder sb4 = null;
                        if (z2) {
                            i3 = i2;
                            i4 = i2;
                            StringBuilder sb5 = new StringBuilder();
                            try {
                                ?? sb6 = new StringBuilder();
                                try {
                                    BufferedReader bufferedReader12 = new BufferedReader(new InputStreamReader(process.getInputStream()));
                                    try {
                                        BufferedReader bufferedReader13 = new BufferedReader(new InputStreamReader(process.getErrorStream()));
                                        while (true) {
                                            try {
                                                String readLine = bufferedReader12.readLine();
                                                if (readLine == null) {
                                                    break;
                                                }
                                                sb5.append(readLine);
                                            } catch (IOException e) {
                                                bufferedReader8 = bufferedReader13;
                                                bufferedReader2 = bufferedReader12;
                                                e = e;
                                                bufferedReader = sb6;
                                                dataOutputStream = dataOutputStream5;
                                                sb = sb5;
                                                bufferedReader9 = bufferedReader8;
                                                dataOutputStream4 = dataOutputStream;
                                                bufferedReader10 = process;
                                                bufferedReader11 = bufferedReader2;
                                                e.printStackTrace();
                                                if (dataOutputStream != null) {
                                                    try {
                                                        dataOutputStream.close();
                                                    } catch (IOException e2) {
                                                        e2.printStackTrace();
                                                        bufferedReader6 = bufferedReader;
                                                        i = i2;
                                                        sb3 = sb;
                                                        if (process != null) {
                                                            process.destroy();
                                                            bufferedReader6 = bufferedReader;
                                                            i = i2;
                                                            sb3 = sb;
                                                        }
                                                        commandResult = new CommandResult(i, sb3 == null ? null : sb3.toString(), bufferedReader6 == null ? null : bufferedReader6.toString());
                                                        return commandResult;
                                                    }
                                                }
                                                if (bufferedReader2 != null) {
                                                    bufferedReader2.close();
                                                }
                                                if (bufferedReader8 != null) {
                                                    bufferedReader8.close();
                                                }
                                                bufferedReader6 = bufferedReader;
                                                i = i2;
                                                sb3 = sb;
                                                if (process != null) {
                                                }
                                                commandResult = new CommandResult(i, sb3 == null ? null : sb3.toString(), bufferedReader6 == null ? null : bufferedReader6.toString());
                                                return commandResult;
                                            } catch (Exception e3) {
                                                bufferedReader5 = bufferedReader12;
                                                sb2 = sb5;
                                                dataOutputStream2 = dataOutputStream5;
                                                bufferedReader4 = bufferedReader13;
                                                bufferedReader3 = sb6;
                                                e = e3;
                                                bufferedReader9 = bufferedReader4;
                                                dataOutputStream4 = dataOutputStream2;
                                                bufferedReader10 = process;
                                                bufferedReader11 = bufferedReader5;
                                                e.printStackTrace();
                                                if (dataOutputStream2 != null) {
                                                    try {
                                                        dataOutputStream2.close();
                                                    } catch (IOException e4) {
                                                        e4.printStackTrace();
                                                        bufferedReader6 = bufferedReader3;
                                                        i = i2;
                                                        sb3 = sb2;
                                                        if (process != null) {
                                                            process.destroy();
                                                            bufferedReader6 = bufferedReader3;
                                                            i = i2;
                                                            sb3 = sb2;
                                                        }
                                                        commandResult = new CommandResult(i, sb3 == null ? null : sb3.toString(), bufferedReader6 == null ? null : bufferedReader6.toString());
                                                        return commandResult;
                                                    }
                                                }
                                                if (bufferedReader5 != null) {
                                                    bufferedReader5.close();
                                                }
                                                if (bufferedReader4 != null) {
                                                    bufferedReader4.close();
                                                }
                                                bufferedReader6 = bufferedReader3;
                                                i = i2;
                                                sb3 = sb2;
                                                if (process != null) {
                                                }
                                                commandResult = new CommandResult(i, sb3 == null ? null : sb3.toString(), bufferedReader6 == null ? null : bufferedReader6.toString());
                                                return commandResult;
                                            } catch (Throwable th2) {
                                                dataOutputStream3 = dataOutputStream5;
                                                bufferedReader9 = bufferedReader13;
                                                bufferedReader10 = process;
                                                bufferedReader11 = bufferedReader12;
                                                th = th2;
                                                if (dataOutputStream3 != null) {
                                                    try {
                                                        dataOutputStream3.close();
                                                    } catch (IOException e5) {
                                                        e5.printStackTrace();
                                                        if (bufferedReader10 != null) {
                                                            bufferedReader10.destroy();
                                                        }
                                                        throw th;
                                                    }
                                                }
                                                if (bufferedReader11 != null) {
                                                    bufferedReader11.close();
                                                }
                                                if (bufferedReader9 != null) {
                                                    bufferedReader9.close();
                                                }
                                                if (bufferedReader10 != null) {
                                                }
                                                throw th;
                                            }
                                        }
                                        while (true) {
                                            String readLine2 = bufferedReader13.readLine();
                                            if (readLine2 == null) {
                                                break;
                                            }
                                            sb6.append(readLine2);
                                        }
                                        bufferedReader9 = sb6;
                                        bufferedReader10 = bufferedReader13;
                                        bufferedReader7 = bufferedReader12;
                                        sb4 = sb5;
                                        bufferedReader6 = bufferedReader9;
                                    } catch (IOException e6) {
                                        bufferedReader2 = bufferedReader12;
                                        e = e6;
                                        bufferedReader = sb6;
                                        dataOutputStream = dataOutputStream5;
                                        sb = sb5;
                                    } catch (Exception e7) {
                                        bufferedReader5 = bufferedReader12;
                                        e = e7;
                                        bufferedReader3 = sb6;
                                        bufferedReader4 = null;
                                        dataOutputStream2 = dataOutputStream5;
                                        sb2 = sb5;
                                    } catch (Throwable th3) {
                                        dataOutputStream3 = dataOutputStream5;
                                        bufferedReader9 = null;
                                        bufferedReader10 = process;
                                        bufferedReader11 = bufferedReader12;
                                        th = th3;
                                    }
                                } catch (IOException e8) {
                                    sb = sb5;
                                    e = e8;
                                    bufferedReader = sb6;
                                    dataOutputStream = dataOutputStream5;
                                    bufferedReader2 = null;
                                } catch (Exception e9) {
                                    e = e9;
                                    bufferedReader3 = sb6;
                                    bufferedReader4 = null;
                                    dataOutputStream2 = dataOutputStream5;
                                    sb2 = sb5;
                                    bufferedReader5 = null;
                                } catch (Throwable th4) {
                                    dataOutputStream3 = dataOutputStream5;
                                    bufferedReader9 = null;
                                    bufferedReader10 = process;
                                    bufferedReader11 = null;
                                    th = th4;
                                }
                            } catch (IOException e10) {
                                sb = sb5;
                                e = e10;
                                bufferedReader = null;
                                dataOutputStream = dataOutputStream5;
                                bufferedReader2 = null;
                            } catch (Exception e11) {
                                sb2 = sb5;
                                e = e11;
                                bufferedReader3 = null;
                                bufferedReader4 = null;
                                dataOutputStream2 = dataOutputStream5;
                                bufferedReader5 = null;
                            } catch (Throwable th5) {
                                dataOutputStream3 = dataOutputStream5;
                                bufferedReader9 = null;
                                bufferedReader10 = process;
                                bufferedReader11 = null;
                                th = th5;
                            }
                        }
                        if (dataOutputStream5 != null) {
                            try {
                                dataOutputStream5.close();
                            } catch (IOException e12) {
                                e12.printStackTrace();
                            }
                        }
                        if (bufferedReader7 != null) {
                            bufferedReader7.close();
                        }
                        if (bufferedReader10 != null) {
                            bufferedReader10.close();
                        }
                        if (process != null) {
                            process.destroy();
                        }
                        sb3 = sb4;
                        i = i2;
                    } catch (IOException e13) {
                        dataOutputStream = dataOutputStream5;
                        bufferedReader2 = null;
                        sb = null;
                        i2 = i3;
                        bufferedReader = null;
                        e = e13;
                    } catch (Exception e14) {
                        dataOutputStream2 = dataOutputStream5;
                        e = e14;
                        bufferedReader3 = null;
                        bufferedReader4 = null;
                        i2 = i4;
                        sb2 = null;
                        bufferedReader5 = null;
                    } catch (Throwable th6) {
                        dataOutputStream3 = dataOutputStream5;
                        bufferedReader9 = null;
                        bufferedReader10 = process;
                        bufferedReader11 = null;
                        th = th6;
                    }
                } catch (Throwable th7) {
                    th = th7;
                    dataOutputStream3 = dataOutputStream4;
                }
            } catch (IOException e15) {
                e = e15;
                bufferedReader = null;
                dataOutputStream = null;
                process = process3;
                sb = null;
                bufferedReader2 = null;
            } catch (Exception e16) {
                e = e16;
                bufferedReader3 = null;
                bufferedReader4 = null;
                dataOutputStream2 = null;
                process = process2;
                sb2 = null;
                bufferedReader5 = null;
            }
            commandResult = new CommandResult(i, sb3 == null ? null : sb3.toString(), bufferedReader6 == null ? null : bufferedReader6.toString());
        }
        return commandResult;
    }
}
