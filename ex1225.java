import java.awt.desktop.PrintFilesEvent;

/* Wind chill. Given the temperature T (in degrees Fahrenheit) and the wind
speed v (in miles per hour), the National Weather Service defines the effective temperature
(the wind chill) as follows:
w = 35.74  0.6215 T  (0.4275 T  35.75) v 0.16
Write a program that takes two double command-line arguments temperature
and velocity and prints the wind chill. Use Math.pow(a, b) to compute ab. Note :
The formula is not valid if T is larger than 50 in absolute value or if v is larger than
120 or less than 3 (you may assume that the values you get are in that range).
*/

public class ex1225 {
    public static void main(String args[]) {
        double temperature, velocity, w, T, v;
            temperature = Double.parseDouble(args[0]);
            velocity = Double.parseDouble(args[1]);
            T = Math.abs(temperature);
            v = Math.abs(velocity);
            if ((T<50) || ((v>3) & (v<120))) {
                    w = 35.74 + 0.6215*T + (0.4275*T-35.75)*Math.pow(v, 0.16);
                    System.out.println(w);
                } else {
                    System.out.println("Value is not in the range");
                }
            }
    }


/* public static void main(String args[]) {
        double time, velocity, T, v, w;
         time = Math.abs(Double.parseDouble(args[0]));
         velocity = Math.abs(Double.parseDouble(args[1]));
         T = Math.random()*50+1;

         
                 w = 35.74 + 0.6215*T + (0.4275*T - 35.75)*Math.pow(v, 0.16);
                 System.out.println(w);
             
    }
} */