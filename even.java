public class even {
    public static void main(String args[]) {
        int first = 24690;
        int i =0; 
        int num = 0;
        while(first != 0) {
                first = first /10;
                num = num + 1;
                    if (first % 2 ==  0) {
                    i = i+1; 
               }
            }
                System.out.println("Num of digits: " + num);
                System.out.println("Evens: " + i);
        }        
    }
