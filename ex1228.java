/* Order check. Write a program that takes three double command-line
arguments x, y, and z and prints true if the values are strictly ascending or descending
( x < y < z or x > y > z ), and false otherwise. */

public class ex1228 {
    public static void main(String args[]) {
        double x, y, z;
            x = Double.parseDouble(args[0]);
            y = Double.parseDouble(args[1]);
            z = Double.parseDouble(args[2]);
		if (((x < y) && (y < z)) || ((x > y) && (y > z))) {
            System.out.println("true");
        } else {
            System.out.println("false");
        }
    }
}