/*Gaussian random numbers. Write a program RandomGaussian
that prints a random number r drawn from the Gaussian distribution. One way to
do so is to use the Box–Muller formula
where u and v are real numbers between 0 and 1 generated by the Math.random()
method.*/

public class ex1227 {
    public static void main(String args[]) {
        double u, v, r;
            u = Math.random() + 1;
            v = Math.random() + 1;
            r = (Math.sin(2 * Math.PI * v) * Math.pow(-2*Math.log(u), 1 / 2));
        System.out.println(r);
    }
}