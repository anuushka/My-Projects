//1.2.21 sin(2t)+sin(3t)

public class ex1221 {
    public static void main(String[] args) {
        double t = Double.parseDouble(args[0]);
        double radians = Math.toRadians(t);
        double sum = Math.sin(2*radians) + Math.sin(3*radians);
        System.out.println(t);
        System.out.println(radians);
        System.out.println(sum);
    }
}