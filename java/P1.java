// project euler #1 in java by antekone
// http://anadoxin.org/blog
//
// usage:
//
// $ javac P1.java
// $ java P1

public class P1 {
    public static void main(String[] args) {
        int sum = 0;

        for(int i = 0; i < 1000; i++) {
            if(i % 3 == 0 || i % 5 == 0) {
                sum += i;
            }
        }

        System.out.println(sum);
    }
}
