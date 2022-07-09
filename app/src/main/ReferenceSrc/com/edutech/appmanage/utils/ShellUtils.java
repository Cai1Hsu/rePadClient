package com.edutech.appmanage.utils;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

/* loaded from: classes.dex */
public class ShellUtils {
    public static final String COMMAND_EXIT = "exit\n";
    public static final String COMMAND_LINE_END = "\n";
    public static final String COMMAND_SH = "sh";
    public static final String COMMAND_SU = "su";

    private ShellUtils() {
        throw new AssertionError();
    }

    public static boolean checkRootPermission() {
        return execCommand("echo root", true, false).result == 0;
    }

    public static CommandResult execCommand(String command, boolean isRoot) {
        return execCommand(new String[]{command}, isRoot, true);
    }

    public static CommandResult execCommand(List<String> commands, boolean isRoot) {
        return execCommand(commands == null ? null : (String[]) commands.toArray(new String[0]), isRoot, true);
    }

    public static CommandResult execCommand(String[] commands, boolean isRoot) {
        return execCommand(commands, isRoot, true);
    }

    public static CommandResult execCommand(String command, boolean isRoot, boolean isNeedResultMsg) {
        return execCommand(new String[]{command}, isRoot, isNeedResultMsg);
    }

    public static CommandResult execCommand(List<String> commands, boolean isRoot, boolean isNeedResultMsg) {
        return execCommand(commands == null ? null : (String[]) commands.toArray(new String[0]), isRoot, isNeedResultMsg);
    }

    /* JADX DEBUG: Don't trust debug lines info. Repeating lines: [199=4, 200=4, 202=4, 203=4, 205=4, 206=4, 208=4, 209=4, 212=4, 213=4] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00ad  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00fa  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x012a  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x014b  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x015a  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0162  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static CommandResult execCommand(String[] commands, boolean isRoot, boolean isNeedResultMsg) {
        Throwable th;
        int result = -1;
        if (commands == null || commands.length == 0) {
            return new CommandResult(-1, null, null);
        }
        Process process = null;
        BufferedReader successResult = null;
        BufferedReader errorResult = null;
        StringBuilder successMsg = null;
        StringBuilder errorMsg = null;
        DataOutputStream os = null;
        try {
            try {
                process = Runtime.getRuntime().exec(isRoot ? COMMAND_SU : COMMAND_SH);
                DataOutputStream os2 = new DataOutputStream(process.getOutputStream());
                try {
                    for (String command : commands) {
                        if (command != null) {
                            os2.write(command.getBytes());
                            os2.writeBytes("\n");
                            os2.flush();
                        }
                    }
                    os2.writeBytes(COMMAND_EXIT);
                    os2.flush();
                    result = process.waitFor();
                    if (isNeedResultMsg) {
                        StringBuilder successMsg2 = new StringBuilder();
                        try {
                            StringBuilder errorMsg2 = new StringBuilder();
                            try {
                                BufferedReader successResult2 = new BufferedReader(new InputStreamReader(process.getInputStream()));
                                try {
                                    BufferedReader errorResult2 = new BufferedReader(new InputStreamReader(process.getErrorStream()));
                                    while (true) {
                                        try {
                                            String s = successResult2.readLine();
                                            if (s == null) {
                                                break;
                                            }
                                            successMsg2.append(s);
                                        } catch (IOException e) {
                                            e = e;
                                            os = os2;
                                            errorMsg = errorMsg2;
                                            successMsg = successMsg2;
                                            errorResult = errorResult2;
                                            successResult = successResult2;
                                            e.printStackTrace();
                                            if (os != null) {
                                                try {
                                                    os.close();
                                                } catch (IOException e2) {
                                                    e2.printStackTrace();
                                                    if (process != null) {
                                                        process.destroy();
                                                    }
                                                    return new CommandResult(result, successMsg == null ? null : successMsg.toString(), errorMsg == null ? null : errorMsg.toString());
                                                }
                                            }
                                            if (successResult != null) {
                                                successResult.close();
                                            }
                                            if (errorResult != null) {
                                                errorResult.close();
                                            }
                                            if (process != null) {
                                            }
                                            return new CommandResult(result, successMsg == null ? null : successMsg.toString(), errorMsg == null ? null : errorMsg.toString());
                                        } catch (Exception e3) {
                                            e = e3;
                                            os = os2;
                                            errorMsg = errorMsg2;
                                            successMsg = successMsg2;
                                            errorResult = errorResult2;
                                            successResult = successResult2;
                                            e.printStackTrace();
                                            if (os != null) {
                                                try {
                                                    os.close();
                                                } catch (IOException e4) {
                                                    e4.printStackTrace();
                                                    if (process != null) {
                                                        process.destroy();
                                                    }
                                                    return new CommandResult(result, successMsg == null ? null : successMsg.toString(), errorMsg == null ? null : errorMsg.toString());
                                                }
                                            }
                                            if (successResult != null) {
                                                successResult.close();
                                            }
                                            if (errorResult != null) {
                                                errorResult.close();
                                            }
                                            if (process != null) {
                                            }
                                            return new CommandResult(result, successMsg == null ? null : successMsg.toString(), errorMsg == null ? null : errorMsg.toString());
                                        } catch (Throwable th2) {
                                            th = th2;
                                            os = os2;
                                            errorResult = errorResult2;
                                            successResult = successResult2;
                                            if (os != null) {
                                                try {
                                                    os.close();
                                                } catch (IOException e5) {
                                                    e5.printStackTrace();
                                                    if (process != null) {
                                                        process.destroy();
                                                    }
                                                    throw th;
                                                }
                                            }
                                            if (successResult != null) {
                                                successResult.close();
                                            }
                                            if (errorResult != null) {
                                                errorResult.close();
                                            }
                                            if (process != null) {
                                            }
                                            throw th;
                                        }
                                    }
                                    while (true) {
                                        String s2 = errorResult2.readLine();
                                        if (s2 == null) {
                                            break;
                                        }
                                        errorMsg2.append(s2);
                                    }
                                    errorMsg = errorMsg2;
                                    successMsg = successMsg2;
                                    errorResult = errorResult2;
                                    successResult = successResult2;
                                } catch (IOException e6) {
                                    e = e6;
                                    os = os2;
                                    errorMsg = errorMsg2;
                                    successMsg = successMsg2;
                                    successResult = successResult2;
                                } catch (Exception e7) {
                                    e = e7;
                                    os = os2;
                                    errorMsg = errorMsg2;
                                    successMsg = successMsg2;
                                    successResult = successResult2;
                                } catch (Throwable th3) {
                                    th = th3;
                                    os = os2;
                                    successResult = successResult2;
                                }
                            } catch (IOException e8) {
                                e = e8;
                                os = os2;
                                errorMsg = errorMsg2;
                                successMsg = successMsg2;
                            } catch (Exception e9) {
                                e = e9;
                                os = os2;
                                errorMsg = errorMsg2;
                                successMsg = successMsg2;
                            } catch (Throwable th4) {
                                th = th4;
                                os = os2;
                            }
                        } catch (IOException e10) {
                            e = e10;
                            os = os2;
                            successMsg = successMsg2;
                        } catch (Exception e11) {
                            e = e11;
                            os = os2;
                            successMsg = successMsg2;
                        } catch (Throwable th5) {
                            th = th5;
                            os = os2;
                        }
                    }
                    if (os2 != null) {
                        try {
                            os2.close();
                        } catch (IOException e12) {
                            e12.printStackTrace();
                        }
                    }
                    if (successResult != null) {
                        successResult.close();
                    }
                    if (errorResult != null) {
                        errorResult.close();
                    }
                    if (process != null) {
                        process.destroy();
                    }
                    os = os2;
                } catch (IOException e13) {
                    e = e13;
                    os = os2;
                } catch (Exception e14) {
                    e = e14;
                    os = os2;
                } catch (Throwable th6) {
                    th = th6;
                    os = os2;
                }
            } catch (Throwable th7) {
                th = th7;
            }
        } catch (IOException e15) {
            e = e15;
        } catch (Exception e16) {
            e = e16;
        }
        return new CommandResult(result, successMsg == null ? null : successMsg.toString(), errorMsg == null ? null : errorMsg.toString());
    }

    /* loaded from: classes.dex */
    public static class CommandResult {
        public String errorMsg;
        public int result;
        public String successMsg;

        public CommandResult(int result) {
            this.result = result;
        }

        public CommandResult(int result, String successMsg, String errorMsg) {
            this.result = result;
            this.successMsg = successMsg;
            this.errorMsg = errorMsg;
        }
    }
}
