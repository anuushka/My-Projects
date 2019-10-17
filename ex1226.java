public class ex1226 {

    public static void main(String args[]) {
        double x, y, r, a;
        x = Double.parseDouble(args[0]);
        y = Double.parseDouble(args[1]);
        r = Math.sqrt(Math.pow(x,2) + Math.pow(y,2));
        a = Math.atan2(y, x);
        String pc = "polar coordinate:" + " " + r + ", "+ a;
            System.out.println(pc);
        }
    }
