// RGB to CMYK
public class ex1232 {
    public static void main(String args[]) {
        double r, g, b, w, c, m, y, k;
        r = Integer.parseInt(args[0]);
        g = Integer.parseInt(args[1]);
        b = Integer.parseInt(args[2]);
            if (((r>=0)&&(r<=255)) && ((g>=0)&&(g<=255)) && ((b>=0)&&(b<=255))) {
                w = Math.max(Math.max(Math.max(r/255, g/255), Math.max(r/255, b/255)), Math.max(g/255, b/255));
                c = (w-(r/255))/w;
                m = (w-(g/255))/w;
                y = (w-(b/255))/w;
                k = 1 - w;
                    System.out.println("w: " + w);
                    System.out.println("c: " + c);
                    System.out.println("m: " + m);
                    System.out.println("y: " + y);
                    System.out.println("k: " + k);
            }
        }
    }
