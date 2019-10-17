public class ex1216{
    public static void main(String[] args){
        double G = 6.67408e-15;
        double mass1 = Integer.parseInt(args[0]);
        double mass2 = Integer.parseInt(args[1]);
        double r = Integer.parseInt(args[2]);
        boolean  mass = (mass1 > 0.0) && (mass2 > 0.0) && (r > 0.0);
        double radius = Math.pow(r, 2);
        double force = (G * mass1 * mass2) / radius;
        System.out.println(mass);
        System.out.println(force);
    }
}