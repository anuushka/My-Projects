/* Write a program that takes two integer command-line arguments a and b
and prints a random integer between a and b, inclusive.*/
public class ex1219 {
    public static void main(String[] args) {
        int a, b;
            a = Integer.parseInt(args[0]);
            b = Integer.parseInt(args[1]);
            double c = Math.random();
            double r =  (c*(b-a)+a);
            long s = Math.round(r);
            System.out.println(c);
            System.out.println(r);
            System.out.println(s);

    }
}   
