public class ex1220 {
    public static void main(String[] args) {
        double p1 = 6*Math.random()+1;
        double p2 = 6*Math.random()+1;
        double s = p1+p2;
        long sum = Math.round(s);
        System.out.println(p1);
        System.out.println(p2);
        System.out.println(s);
        System.out.println(sum);
    }
}