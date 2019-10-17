// three sort, ascending order
public class ex1234 {
    public static void main(String args[])  {
        int a, b, c, sum, min, max, mid;
            a = Integer.parseInt(args[0]);
            b = Integer.parseInt(args[1]);
            c = Integer.parseInt(args[2]);
                sum = a + b + c;
                min = Math.min(a, Math.min(b, c));
                max = Math.max(a, Math.max(b, c));
                mid = sum - min - max;
            System.out.println(min + " " + mid + " "+ max);
            }
    }




