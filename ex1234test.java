import java.util.Scanner;

public class ex1234test {
    static int largest() {
        int i;
        Scanner input = new Scanner(System.in);
        System.out.println("User input: ");
    
        int array[] = new int[5];
        for(i = 0; i < 5; i++) {
            array[i] = input.nextInt();
        }

        int max = array[0];
        for(i = 1; i < array.length; i++) {
            if(array[i] > max) {
                max = array[i];
            }
        }
        return max;
    }
        public static void main(String args[]) {
            System.out.println("largest:" + largest());

        }
}

                
