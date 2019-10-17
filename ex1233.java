// Great Circle
public class ex1233 {
    public static void main(String args[]) {
        double x1, x2, y1, y2, d;
            x1 = Double.parseDouble(args[0]);
            y1 = Double.parseDouble(args[1]);
            x2 = Double.parseDouble(args[2]);
            y2 = Double.parseDouble(args[3]);
            x1 = Math.toRadians(x1);
            x2 = Math.toRadians(x2);
            y1 = Math.toRadians(y1);
            y2 = Math.toRadians(y2);
        d = 60*Math.acos((Math.sin(x1)*Math.sin(x2))+(Math.cos(x1)*Math.cos(x2)*Math.cos(y2-y1)));
        System.out.println(d);
    }
}