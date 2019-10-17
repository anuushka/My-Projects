public class ex1215{
    public static void main(String[] args) {
        int a, b, c;
        a = Integer.parseInt(args[0]);
        b = Integer.parseInt(args[1]);
        c = Integer.parseInt(args[2]);
        boolean positive = a>0 && b>0 && c>0;
        int sum1 = a+b;
        int sum2 = a+c;
        int sum3 = b+c;
        boolean triangle = (sum1 > c) && (sum2>b) && (sum3 > a);
        System.out.println(positive);
        System.out.println(triangle);
    }
}