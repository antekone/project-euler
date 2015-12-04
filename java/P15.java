// Brute-force, without assumption of existence of any Pascal properties in the
// triangle.

import java.util.*;

public class P15 {
    public static void log(String fmt, Object... args) {
        String s = String.format(fmt, args);
        System.out.println(s);
    }

    public static void log() {
        System.out.println();
    }

    public static void logn(String fmt, Object... args) {
        String s = String.format(fmt, args);
        System.out.print(s);
    }

    public long countMatrix(int n) {
        int[] num = new int[n];
        int[] num2 = new int[n];
        int[] fullnum = new int[2 * n];

        zeroNum(num);
        zeroNum(num2);
        zeroNum(fullnum);

        HashMap<Long, Long> bitcache = new HashMap<Long, Long>();

        int max = ((int) Math.pow(2, n));
        long matches = 0;

        long localmatches = 0;
        for(int i = 0; i < max; ++i) {
            long num1bits = countBits(num);
            if(bitcache.containsKey(num1bits)) {
                localmatches = bitcache.get(num1bits);
                matches += localmatches;
            } else {
                zeroNum(num2);
                localmatches = 0;
                for(int j = 0; j < max; ++j) {
                    makeFullNum(fullnum, num, num2);
                    int bits = countBits(fullnum);

                    if(bits == n) {
                        matches++;
                        localmatches++;
                    }

                    incNum(num2);
                    bitcache.put(num1bits, localmatches);
                }
            }

            incNum(num);
        }

        return matches;
    }

    public int countBits(int[] n) {
        int bits = 0;
        for(int i = 0; i < n.length; i++) {
            bits += n[i];
        }

        return bits;
    }

    public void zeroNum(int[] n) {
        for(int i = 0; i < n.length; i++)
            n[i] = 0;
    }

    public void incNum(int[] n) {
        for(int i = n.length - 1; i != -1; --i) {
            if(n[i] == 0) {
                n[i] = 1;
                return;
            } else {
                n[i] = 0;
            }
        }
    }

    public void makeFullNum(int[] fn, int[] a, int[] b) {
        for(int i = 0; i < a.length; i++) {
            fn[i] = a[i];
        }

        for(int i = 0; i < b.length; i++) {
            fn[i + a.length] = b[i];
        }
    }

    public void printNum(int[] num) {
        for(int i = 0; i < num.length; i++) {
            logn("%d,", num[i]);

        }

        log();
    }

    public static void main(String[] args) {
        P15 obj = new P15();
        int n = 19;
        long len = obj.countMatrix(n);
        log("%d=%d", n, len);
    }
}
