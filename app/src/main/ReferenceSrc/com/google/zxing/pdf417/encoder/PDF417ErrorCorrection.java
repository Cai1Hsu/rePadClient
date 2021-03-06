package com.google.zxing.pdf417.encoder;

import android.support.v4.media.TransportMediator;
import com.google.zxing.WriterException;
import com.handmark.pulltorefresh.library.PullToRefreshBase;
import de.javawi.jstun.header.MessageHeaderInterface;
import org.apache.commons.compress.archivers.tar.TarConstants;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.commons.net.nntp.NNTP;
import org.apache.commons.net.nntp.NNTPReply;
import org.apache.commons.net.smtp.SMTPReply;
import org.apache.commons.net.telnet.TelnetCommand;
import org.apache.http.HttpStatus;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class PDF417ErrorCorrection {
    private static final int[][] EC_COEFFICIENTS = {new int[]{27, 917}, new int[]{522, 568, 723, 809}, new int[]{TelnetCommand.SUSP, 308, NNTPReply.TRANSFER_FAILED, 284, 646, 653, 428, 379}, new int[]{MessageHeaderInterface.SHAREDSECRETERRORRESPONSE, 562, 232, 755, 599, 524, 801, 132, 295, 116, 442, 428, 295, 42, 176, 65}, new int[]{361, 575, 922, 525, 176, 586, 640, 321, FTPReply.REQUESTED_PROT_LEVEL_NOT_SUPPORTED, 742, 677, 742, 687, 284, 193, 517, MessageHeaderInterface.BINDINGERRORRESPONSE, 494, TarConstants.VERSION_OFFSET, 147, 593, 800, 571, 320, 803, 133, NNTPReply.NEW_NEWSGROUP_LIST_FOLLOWS, 390, 685, 330, 63, HttpStatus.SC_GONE}, new int[]{539, 422, 6, 93, 862, 771, 453, 106, 610, 287, 107, HttpStatus.SC_HTTP_VERSION_NOT_SUPPORTED, 733, 877, NNTPReply.MORE_AUTH_INFO_REQUIRED, 612, 723, 476, 462, 172, NNTPReply.NO_SUCH_ARTICLE_FOUND, 609, 858, 822, 543, 376, 511, 400, 672, 762, 283, 184, NNTPReply.POSTING_NOT_ALLOWED, 35, 519, 31, 460, 594, FTPReply.DATA_CONNECTION_OPEN, FTPReply.FAILED_SECURITY_CHECK, 517, 352, 605, 158, 651, 201, 488, 502, 648, 733, 717, 83, HttpStatus.SC_NOT_FOUND, 97, 280, 771, 840, 629, 4, NNTPReply.MORE_AUTH_INFO_REQUIRED, 843, 623, 264, 543}, new int[]{521, 310, 864, 547, 858, 580, 296, 379, 53, 779, 897, 444, 400, 925, 749, HttpStatus.SC_UNSUPPORTED_MEDIA_TYPE, 822, 93, 217, 208, 928, TelnetCommand.IP, 583, 620, TelnetCommand.AYT, 148, 447, 631, 292, 908, 490, 704, 516, 258, 457, 907, 594, 723, 674, 292, 272, 96, 684, 432, 686, 606, 860, 569, 193, 219, 129, 186, TelnetCommand.EOF, 287, 192, 775, 278, 173, 40, 379, 712, 463, 646, 776, 171, 491, 297, 763, 156, 732, 95, 270, 447, 90, HttpStatus.SC_INSUFFICIENT_STORAGE, 48, 228, 821, 808, 898, 784, 663, 627, 378, 382, 262, 380, 602, 754, 336, 89, 614, 87, 432, 670, 616, 157, 374, 242, 726, 600, 269, 375, 898, 845, 454, SMTPReply.START_MAIL_INPUT, TransportMediator.KEYCODE_MEDIA_RECORD, 814, 587, 804, 34, 211, 330, 539, 297, 827, 865, 37, 517, 834, 315, 550, 86, 801, 4, 108, 539}, new int[]{524, 894, 75, 766, 882, 857, 74, HttpStatus.SC_NO_CONTENT, 82, 586, 708, 250, 905, 786, 138, 720, 858, 194, 311, 913, 275, 190, 375, 850, 438, 733, 194, 280, 201, 280, 828, 757, 710, 814, 919, 89, 68, 569, 11, HttpStatus.SC_NO_CONTENT, 796, 605, 540, 913, 801, 700, 799, 137, 439, 418, 592, 668, 353, 859, 370, 694, PullToRefreshBase.SMOOTH_SCROLL_LONG_DURATION_MS, 240, 216, 257, 284, 549, 209, 884, 315, 70, 329, 793, 490, MessageHeaderInterface.SHAREDSECRETERRORRESPONSE, 877, 162, 749, 812, 684, 461, FTPReply.SECURITY_MECHANISM_IS_OK, 376, 849, 521, HttpStatus.SC_TEMPORARY_REDIRECT, 291, 803, 712, 19, 358, 399, 908, 103, 511, 51, 8, 517, FTPReply.DATA_CONNECTION_OPEN, 289, 470, 637, 731, 66, 255, 917, 269, 463, 830, 730, 433, 848, 585, 136, 538, 906, 90, 2, 290, 743, NNTPReply.DEBUG_OUTPUT, 655, 903, 329, 49, 802, 580, 355, 588, 188, 462, 10, 134, 628, 320, 479, TransportMediator.KEYCODE_MEDIA_RECORD, 739, 71, TarConstants.VERSION_OFFSET, 318, 374, 601, 192, 605, 142, 673, 687, FTPReply.SECURITY_DATA_EXCHANGE_COMPLETE, 722, 384, 177, 752, 607, 640, 455, 193, 689, 707, 805, 641, 48, 60, 732, 621, 895, 544, 261, 852, 655, 309, 697, 755, 756, 60, NNTPReply.NEW_NEWSGROUP_LIST_FOLLOWS, 773, 434, 421, 726, 528, 503, 118, 49, 795, 32, 144, 500, TelnetCommand.ABORT, 836, 394, 280, 566, 319, 9, 647, 550, 73, 914, 342, TransportMediator.KEYCODE_MEDIA_PLAY, 32, 681, FTPReply.NEED_PASSWORD, 792, 620, 60, 609, NNTPReply.POSTING_FAILED, 180, 791, 893, 754, 605, 383, 228, 749, 760, FTPReply.FILE_STATUS, 54, 297, 134, 54, 834, 299, 922, 191, 910, FTPReply.NEED_ACCOUNT_FOR_STORING_FILES, 609, 829, 189, 20, 167, 29, 872, 449, 83, HttpStatus.SC_PAYMENT_REQUIRED, 41, 656, HttpStatus.SC_HTTP_VERSION_NOT_SUPPORTED, 579, 481, 173, HttpStatus.SC_NOT_FOUND, 251, 688, 95, 497, 555, 642, 543, HttpStatus.SC_TEMPORARY_REDIRECT, 159, 924, 558, 648, 55, 497, 10}, new int[]{352, 77, 373, 504, 35, 599, 428, HttpStatus.SC_MULTI_STATUS, HttpStatus.SC_CONFLICT, 574, 118, 498, 285, 380, FTPReply.FILE_ACTION_PENDING, 492, 197, 265, 920, TarConstants.PREFIXLEN, 914, 299, FTPReply.ENTERING_EPSV_MODE, 643, 294, 871, 306, 88, 87, 193, 352, 781, 846, 75, 327, 520, NNTPReply.ARTICLE_NOT_WANTED, 543, HttpStatus.SC_NON_AUTHORITATIVE_INFORMATION, 666, TelnetCommand.GA, 346, 781, 621, 640, 268, 794, FTPReply.REQUEST_DENIED, 539, 781, HttpStatus.SC_REQUEST_TIMEOUT, 390, 644, HttpStatus.SC_PROCESSING, 476, 499, 290, 632, 545, 37, 858, 916, 552, 41, 542, 289, 122, 272, 383, 800, 485, 98, 752, 472, 761, 107, 784, 860, 658, 741, 290, HttpStatus.SC_NO_CONTENT, 681, HttpStatus.SC_PROXY_AUTHENTICATION_REQUIRED, 855, 85, 99, 62, NNTPReply.AUTHENTICATION_REJECTED, 180, 20, 297, 451, 593, 913, 142, 808, 684, 287, FTPReply.REQUESTED_PROT_LEVEL_NOT_SUPPORTED, 561, 76, 653, 899, 729, 567, 744, 390, 513, 192, 516, 258, 240, 518, 794, 395, 768, 848, 51, 610, 384, 168, 190, 826, 328, 596, 786, HttpStatus.SC_SEE_OTHER, 570, NNTPReply.MORE_AUTH_INFO_REQUIRED, HttpStatus.SC_UNSUPPORTED_MEDIA_TYPE, 641, 156, TelnetCommand.SUSP, 151, 429, 531, HttpStatus.SC_MULTI_STATUS, 676, 710, 89, 168, HttpStatus.SC_NOT_MODIFIED, HttpStatus.SC_PAYMENT_REQUIRED, 40, 708, 575, 162, 864, FTPReply.ENTERING_EPSV_MODE, 65, 861, 841, 512, 164, 477, 221, 92, 358, 785, 288, 357, 850, 836, 827, 736, 707, 94, 8, 494, 114, 521, 2, 499, 851, 543, 152, 729, 771, 95, TelnetCommand.EL, 361, 578, 323, 856, 797, 289, 51, 684, 466, FTPReply.DENIED_FOR_POLICY_REASONS, 820, 669, 45, 902, 452, 167, 342, TelnetCommand.IP, 173, 35, 463, 651, 51, 699, 591, 452, 578, 37, 124, 298, FTPReply.NEED_ACCOUNT, 552, 43, 427, NNTP.DEFAULT_PORT, 662, 777, 475, 850, 764, 364, 578, 911, 283, 711, 472, 420, TelnetCommand.AO, 288, 594, 394, 511, 327, 589, 777, 699, 688, 43, HttpStatus.SC_REQUEST_TIMEOUT, 842, 383, 721, 521, 560, 644, 714, 559, 62, 145, 873, 663, 713, 159, 672, 729, 624, 59, 193, HttpStatus.SC_EXPECTATION_FAILED, 158, 209, 563, 564, 343, 693, 109, 608, 563, 365, 181, 772, 677, 310, TelnetCommand.EL, 353, 708, HttpStatus.SC_GONE, 579, 870, 617, 841, 632, 860, 289, FTPReply.REQUESTED_PROT_LEVEL_NOT_SUPPORTED, 35, 777, 618, 586, HttpStatus.SC_FAILED_DEPENDENCY, 833, 77, 597, 346, 269, 757, 632, 695, 751, FTPReply.NEED_PASSWORD, TelnetCommand.EC, 184, 45, 787, 680, 18, 66, HttpStatus.SC_PROXY_AUTHENTICATION_REQUIRED, 369, 54, 492, 228, 613, 830, 922, NNTPReply.ARTICLE_REJECTED, 519, 644, 905, 789, 420, HttpStatus.SC_USE_PROXY, NNTPReply.POSTING_FAILED, HttpStatus.SC_MULTI_STATUS, HttpStatus.SC_MULTIPLE_CHOICES, 892, 827, 141, 537, NNTPReply.MORE_AUTH_INFO_REQUIRED, 662, 513, 56, TelnetCommand.WONT, 341, 242, 797, 838, 837, 720, 224, HttpStatus.SC_TEMPORARY_REDIRECT, 631, 61, 87, 560, 310, 756, 665, 397, 808, 851, 309, 473, 795, 378, 31, 647, 915, 459, 806, 590, 731, FTPReply.CANNOT_OPEN_DATA_CONNECTION, 216, 548, TelnetCommand.GA, 321, 881, 699, FTPReply.FAILED_SECURITY_CHECK, 673, 782, 210, 815, 905, HttpStatus.SC_SEE_OTHER, 843, 922, NNTPReply.AUTHENTICATION_ACCEPTED, 73, 469, 791, 660, 162, 498, 308, TarConstants.PREFIXLEN, 422, 907, 817, 187, 62, 16, FTPReply.CANNOT_OPEN_DATA_CONNECTION, FTPReply.FAILED_SECURITY_CHECK, 336, 286, NNTPReply.ARTICLE_REJECTED, 375, MessageHeaderInterface.BINDINGERRORRESPONSE, 610, 296, 183, 923, 116, 667, 751, 353, 62, 366, 691, 379, 687, 842, 37, 357, 720, 742, 330, 5, 39, 923, 311, HttpStatus.SC_FAILED_DEPENDENCY, 242, 749, 321, 54, 669, 316, 342, 299, FTPReply.REQUEST_DENIED, 105, 667, 488, 640, 672, 576, 540, 316, 486, 721, 610, 46, 656, 447, 171, 616, 464, 190, 531, 297, 321, 762, 752, FTPReply.DENIED_FOR_POLICY_REASONS, 175, 134, 14, NNTPReply.MORE_AUTH_INFO_REQUIRED, 433, 717, 45, 111, 20, 596, 284, 736, 138, 646, 411, 877, 669, 141, 919, 45, 780, HttpStatus.SC_PROXY_AUTHENTICATION_REQUIRED, 164, FTPReply.NEED_ACCOUNT, 899, 165, 726, 600, PullToRefreshBase.SMOOTH_SCROLL_LONG_DURATION_MS, 498, 655, 357, 752, 768, NNTPReply.ARTICLE_RETRIEVED_REQUEST_TEXT_SEPARATELY, 849, 647, 63, 310, 863, 251, 366, HttpStatus.SC_NOT_MODIFIED, 282, 738, 675, HttpStatus.SC_GONE, 389, TelnetCommand.IP, 31, 121, HttpStatus.SC_SEE_OTHER, TarConstants.VERSION_OFFSET}};

    private PDF417ErrorCorrection() {
    }

    public static int getErrorCorrectionCodewordCount(int errorCorrectionLevel) {
        if (errorCorrectionLevel < 0 || errorCorrectionLevel > 8) {
            throw new IllegalArgumentException("Error correction level must be between 0 and 8!");
        }
        return 1 << (errorCorrectionLevel + 1);
    }

    static int getRecommendedMinimumErrorCorrectionLevel(int n) throws WriterException {
        if (n <= 0) {
            throw new IllegalArgumentException("n must be > 0");
        }
        if (n <= 40) {
            return 2;
        }
        if (n <= 160) {
            return 3;
        }
        if (n <= 320) {
            return 4;
        }
        if (n <= 863) {
            return 5;
        }
        throw new WriterException("No recommendation possible");
    }

    public static String generateErrorCorrection(CharSequence dataCodewords, int errorCorrectionLevel) {
        int k = getErrorCorrectionCodewordCount(errorCorrectionLevel);
        char[] e = new char[k];
        int sld = dataCodewords.length();
        for (int i = 0; i < sld; i++) {
            int t1 = (dataCodewords.charAt(i) + e[e.length - 1]) % 929;
            for (int j = k - 1; j >= 1; j--) {
                int t2 = (EC_COEFFICIENTS[errorCorrectionLevel][j] * t1) % 929;
                int t3 = 929 - t2;
                e[j] = (char) ((e[j - 1] + t3) % 929);
            }
            int t22 = (EC_COEFFICIENTS[errorCorrectionLevel][0] * t1) % 929;
            int t32 = 929 - t22;
            e[0] = (char) (t32 % 929);
        }
        StringBuilder sb = new StringBuilder(k);
        for (int j2 = k - 1; j2 >= 0; j2--) {
            if (e[j2] != 0) {
                e[j2] = (char) (929 - e[j2]);
            }
            sb.append(e[j2]);
        }
        return sb.toString();
    }
}
