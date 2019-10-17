public class ex1231 {
    public static void main(String args[]) {
        double la, lo, lo0, x, y;
            lo0 = Double.parseDouble(args[0]);
            lo = Double.parseDouble(args[1]);
            la = Double.parseDouble(args[2]);
            x = lo0 - lo;
            y = 0.5 * Math.log((1+Math.sin(la))/(1-Math.sin(la)));
        System.out.println("Mercator projection coordinate (" + x + " , " + y + ")");
    }
}