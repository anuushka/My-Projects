public class ex1223 {
    public static void main(String[] args) {
    int m, d, days, d2;
    m = Integer.parseInt(args[0]);
    d = Integer.parseInt(args[1]);
    days = 31;
    d2 = days -d;
     Boolean bool = (m >= 3 && d2<=11) && (m < 6 && d2 < 31)|| (m == 6 && d2 >=11);
     System.out.println(bool);
    }
}
