public class ex1212{
    public static void main(String[] args){
        double b = Integer.parseInt(args[0]);
        double c = Integer.parseInt(args[1]);
        double discriminant = Math.pow(b, 2)-4*c;
        double d = Math.sqrt(discriminant);
        
        if (d > 0) {
            double x1 = (-b-d)/2.0;
            double x2 = (-b+d)/2.0;
            System.out.println(x1);
            System.out.println(x2);
        } else if (d == 0.0) {
            double x = (-b/2.0);
            System.out.println(x);
        } else {
            System.out.println("no real roots");
        }
        System.out.println("d: " + d);
    }
}

  /* TURSHILT:
      public class ex1212 {
        public static void main(String[] args) {
            double x1 = Integer.parseInt(args[0]);
            double x2 = Integer.parseInt(args[1]);
            double b = -(x1+x2);
            double c = x1*x2;
            double D = Math.sqrt(Math.pow(b, 2)-4*c);
            boolean roots = D >=0;
            System.out.println(b);
            System.out.println(c);
            System.out.println(D);
            System.out.println(roots); 
      }
    }
        
        
        */