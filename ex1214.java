public class ex1214{
    public static void main(String[] args) {
        int x1 = Integer.parseInt(args[0]);
        int x2 = Integer.parseInt(args[1]);
        int r1 = x1%x2;
        int r2 = x2%x1;
        boolean div = (r1==0) && (r2 ==0);
        System.out.println(r1);
        System.out.println(r2);
        System.out.println(div);
    }
}