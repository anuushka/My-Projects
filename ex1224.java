/* Continuously compounded interest. Write a program that calculates and 
prints the amount of money you would have after t years if you invested P dollars
at an annual interest rate r (compounded continuously). 
The desired value is given by the formula Pe rt */

public class ex1224 {
    public static void main(String[] args) {
        double time = Double.parseDouble(args[0]);
        double t = Math.abs(time);
        double r = Double.parseDouble(args[1]);
        double P = Double.parseDouble(args[2]);
        double value = P*Math.pow(Math.E, r*t);
        System.out.println(value);
    }
}