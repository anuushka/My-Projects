public class ex1217{
    public static void main(String[] args) {
        int total = 0;
            for (int a = 1; a < 9; a+=a) {
                System.out.println(a);
                total += a;
    }
        System.out.println(total);      
        }
    }

            /*int a = 1;
            a+=a; 2
            a+=a; 4
            a+=a; 8
            System.out.println(a); 
            answer: 8 
            
            boolean a =true;
            a =! a; false
            a =! a; true
            a =! a; false
            System.out.println(a);  
            answer: false

             int a = 2;
            a = a*a; 4
            a = a*a; 16
            a = a*a; 256
            System.out.println(a);
            answer: 256

            */
            