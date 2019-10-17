//find the day (Monday, Tue etc) from the Gregorian calendar year, month, date. 

class Days 
{ 
    public int roll_no; 
    public String name; 
    Days(int roll_no, String name) 
    { 
        this.roll_no = roll_no; 
        this.name = name; 
    } 
} 
 
public class ex1229 {
     public static void main(String args[]) {

        int m, d, y, x, y0, m0, d0;

        Days[] arr;
        arr = new Days[8];
        arr[0] = new Days(0, "Sunday");
        arr[1] = new Days(1, "Monday");
        arr[2] = new Days(2, "Tuesday");
        arr[3] = new Days(3, "Wednesday");
        arr[4] = new Days(4, "Thursday");
        arr[5] = new Days(5, "Friday");
        arr[6] = new Days(6, "Saturday");
            
            y = Integer.parseInt(args[0]);
            m = Integer.parseInt(args[1]);
            d = Integer.parseInt(args[2]);
                if (((m>0)&&(m<=12))&&((d>0)&&(d<32))&&(y>0)) {
                        y0 = y - (14-m)/12;
                        x = y0 + y0/4 - y0/100 + y0/400;
                        m0 = m + 12*((14-m)/12)-2;
                        d0 = (d + x + (31*m0)/12)%7;
                            System.out.println(d0);

                                for(int i = 0; i < arr.length; i++) {
                                    if(i==d0) {
                                        System.out.println(arr[i].roll_no + " " + arr[i].name );
                                    }
                                }
                }

    }
}