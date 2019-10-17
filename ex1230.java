// find the max, min value from randomly generated 5 numbers between 0, 1

public class ex1230 {
    public static void main(String args[]) {
        double r, min, max, minimum, maximum;
            min = Math.random();
            max = min;
            System.out.println("const random: " + min);
                for(int i = 0; i < 4; i++) {
                    r = Math.random(); 
                    minimum = Math.min(min, r);
                    min = minimum;
                    maximum = Math.max(max, r);
                    max = maximum;
                    System.out.println("r: " + r);   
                    }      
                        System.out.println("Min: " + min);  
                        System.out.println("Max: "+ max); 
                }
            }
    
    
