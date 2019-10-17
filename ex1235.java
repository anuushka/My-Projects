/* 
n = 0: F
n = 1: FLF
n = 2: FLFLFRF
n = 3: FLFLFRFLFLFRFRF
n = 4: FLFLFRFLFLFRFRFFLFLFRFRFLFRFRF
n = 5: FLFLFRFLFLFRFRFFLFLFRFRFLFRFRFLFLFLFRFLRLFRFRFFLFLFRFRFLRFRF    
*/
public class ex1235 {
    public static void main(String args[]) {
        String dragon = "F";
        String reverse = "F";
        for (int i = 0 ; i < 6; i++) {
            dragon = dragon + "L" + reverse;
            reverse = dragon + "R" + reverse;
        System.out.println(dragon);
            }
        }
    }


