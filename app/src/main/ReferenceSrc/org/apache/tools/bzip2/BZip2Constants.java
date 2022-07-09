package org.apache.tools.bzip2;

import android.support.v4.media.TransportMediator;
import de.javawi.jstun.header.MessageHeaderInterface;
import org.apache.commons.compress.archivers.tar.TarConstants;
import org.apache.commons.net.bsd.RCommandClient;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.commons.net.ftp.FTPSClient;
import org.apache.commons.net.nntp.NNTPReply;
import org.apache.commons.net.smtp.SMTPReply;
import org.apache.commons.net.telnet.TelnetCommand;
import org.apache.http.HttpStatus;

/* loaded from: classes.jar:org/apache/tools/bzip2/BZip2Constants.class */
public interface BZip2Constants {
    public static final int G_SIZE = 50;
    public static final int MAX_ALPHA_SIZE = 258;
    public static final int MAX_CODE_LEN = 23;
    public static final int MAX_SELECTORS = 18002;
    public static final int NUM_OVERSHOOT_BYTES = 20;
    public static final int N_GROUPS = 6;
    public static final int N_ITERS = 4;
    public static final int RUNA = 0;
    public static final int RUNB = 1;
    public static final int baseBlockSize = 100000;
    public static final int[] rNums = {619, 720, 127, 481, 931, 816, 813, 233, 566, TelnetCommand.EC, 985, 724, 205, 454, 863, 491, 741, 242, 949, 214, 733, 859, 335, 708, 621, 574, 73, 654, 730, 472, HttpStatus.SC_INSUFFICIENT_SPACE_ON_RESOURCE, NNTPReply.TRANSFER_FAILED, 278, 496, 867, 210, 399, 680, NNTPReply.AUTHENTICATION_REQUIRED, 51, 878, 465, 811, 169, 869, 675, 611, 697, 867, 561, 862, 687, HttpStatus.SC_INSUFFICIENT_STORAGE, 283, NNTPReply.AUTHENTICATION_REJECTED, 129, 807, 591, 733, 623, FTPReply.FILE_STATUS_OK, TelnetCommand.ABORT, 59, 379, 684, 877, 625, 169, 643, 105, 170, 607, 520, 932, 727, 476, 693, FTPReply.CANNOT_OPEN_DATA_CONNECTION, 174, 647, 73, 122, 335, FTPReply.NOT_LOGGED_IN, 442, 853, 695, TelnetCommand.GA, 445, 515, 909, 545, 703, 919, 874, 474, 882, 500, 594, 612, 641, 801, 220, 162, 819, 984, 589, 513, 495, 799, 161, 604, 958, FTPReply.DENIED_FOR_POLICY_REASONS, 221, 400, 386, 867, 600, 782, 382, 596, HttpStatus.SC_REQUEST_URI_TOO_LONG, 171, 516, 375, 682, 485, 911, 276, 98, 553, 163, SMTPReply.START_MAIL_INPUT, 666, 933, HttpStatus.SC_FAILED_DEPENDENCY, 341, FTPReply.DENIED_FOR_POLICY_REASONS, 870, FTPReply.ENTERING_PASSIVE_MODE, 730, 475, 186, TarConstants.VERSION_OFFSET, 647, 537, 686, 600, 224, 469, 68, 770, 919, 190, 373, 294, 822, 808, HttpStatus.SC_PARTIAL_CONTENT, 184, 943, 795, 384, 383, 461, HttpStatus.SC_NOT_FOUND, 758, 839, 887, 715, 67, 618, 276, HttpStatus.SC_NO_CONTENT, 918, 873, 777, 604, 560, 951, 160, 578, 722, 79, 804, 96, HttpStatus.SC_CONFLICT, 713, 940, 652, 934, 970, 447, 318, 353, 859, 672, 112, 785, 645, 863, 803, FTPReply.FILE_ACTION_PENDING, 139, 93, SMTPReply.START_MAIL_INPUT, 99, 820, 908, 609, 772, 154, MessageHeaderInterface.SHAREDSECRETERRORRESPONSE, 580, 184, 79, 626, 630, 742, 653, 282, 762, 623, 680, 81, 927, 626, 789, FTPReply.DATA_CONNECTION_ALREADY_OPEN, 411, 521, 938, HttpStatus.SC_MULTIPLE_CHOICES, 821, 78, 343, 175, 128, 250, 170, 774, 972, 275, 999, 639, 495, 78, 352, TransportMediator.KEYCODE_MEDIA_PLAY, 857, 956, 358, 619, 580, 124, 737, 594, 701, 612, 669, 112, 134, 694, 363, 992, 809, 743, 168, 974, 944, 375, 748, 52, 600, 747, 642, 182, 862, 81, 344, 805, 988, 739, 511, 655, 814, FTPReply.SECURITY_MECHANISM_IS_OK, TelnetCommand.GA, 515, 897, 955, 664, 981, 649, 113, 974, 459, 893, 228, 433, 837, 553, 268, 926, 240, HttpStatus.SC_PROCESSING, 654, 459, 51, 686, 754, 806, 760, 493, HttpStatus.SC_FORBIDDEN, HttpStatus.SC_UNSUPPORTED_MEDIA_TYPE, 394, 687, 700, 946, 670, 656, 610, 738, 392, 760, 799, 887, 653, 978, 321, 576, 617, 626, 502, 894, 679, TelnetCommand.BREAK, NNTPReply.POSTING_NOT_ALLOWED, 680, 879, 194, 572, 640, 724, 926, 56, HttpStatus.SC_NO_CONTENT, 700, 707, 151, 457, 449, 797, 195, 791, 558, 945, 679, 297, 59, 87, 824, 713, 663, 412, 693, 342, 606, 134, 108, 571, 364, 631, FTPReply.DIRECTORY_STATUS, 174, 643, HttpStatus.SC_NOT_MODIFIED, 329, 343, 97, NNTPReply.NO_SUCH_ARTICLE_FOUND, 751, 497, 314, 983, 374, 822, 928, 140, HttpStatus.SC_PARTIAL_CONTENT, 73, TarConstants.VERSION_OFFSET, 980, 736, 876, 478, NNTPReply.NO_SUCH_ARTICLE_FOUND, HttpStatus.SC_USE_PROXY, 170, RCommandClient.DEFAULT_PORT, 364, 692, 829, 82, 855, 953, 676, TelnetCommand.AYT, 369, 970, 294, 750, 807, 827, FTPReply.FILE_STATUS_OK, 790, 288, 923, 804, 378, FTPReply.NAME_SYSTEM_TYPE, 828, 592, NNTPReply.AUTHENTICATION_ACCEPTED, 565, 555, 710, 82, 896, 831, 547, 261, 524, 462, 293, 465, 502, 56, 661, 821, 976, 991, 658, 869, 905, 758, 745, 193, 768, 550, 608, 933, 378, 286, FTPReply.NAME_SYSTEM_TYPE, 979, 792, 961, 61, 688, 793, 644, 986, HttpStatus.SC_FORBIDDEN, 106, 366, 905, 644, 372, 567, 466, 434, 645, 210, 389, 550, 919, 135, 780, 773, 635, 389, 707, 100, 626, 958, 165, 504, 920, 176, 193, 713, 857, 265, HttpStatus.SC_NON_AUTHORITATIVE_INFORMATION, 50, 668, 108, 645, FTPSClient.DEFAULT_FTPS_PORT, 626, 197, 510, 357, 358, 850, 858, 364, 936, 638};
}
