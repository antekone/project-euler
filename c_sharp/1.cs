// project euler #1 in C# by antekone
// http://anadoxin.org/blog
//
// usage:
//
// $ mcs 1.cs
// $ ./1.exe

public class P1 {
    public static void Main() {
        int sum = 0;

        for(int i = 0; i < 1000; i++) {
            if(i % 3 == 0 || i % 5 == 0) {
                sum += i;
            }
        }

        System.Console.WriteLine(sum);
    }
}
