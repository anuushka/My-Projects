//Insertion sort with user prompt 

import java.util.Scanner;;

public class InSort2
{
    int n;
    int a[];

    public InSort2(int size) 
    {
        n = size;
        a = new int[n];
    }

    public void readArray() 
    {
        Scanner s = new Scanner(System.in);
        System.out.println("Enter " + n + " elements");
            for(int i = 0; i < n; i++)
            {
                a[i] = s.nextInt();
            }
    }

    public void showArray() {
        System.out.println("");
            for(int i = 0; i < n; i++) 
            {
                System.out.print(a[i] + " ");
            }
        System.out.println("");
    }

    public void InsertionSort() {
        for (int j = 1; j < n; j++) 
        {  
            int key = a[j];  
            int i = j-1;  
                while ( (i > -1) && ( a[i] > key ) ) 
                {  
                    a[i+1] = a[i];  
                    i--;  
                }  
        a[i+1] = key;  
        System.out.println("After " + j + " phase: " );
        showArray();
        }  
    }
    public static void main(String args[]) 
    {
        Scanner s = new Scanner(System.in);
        System.out.println("Enter Array size: ");
        int n = s.nextInt();
        InSort2 sort = new InSort2(n);
        sort.readArray();
        System.out.println("Before sort: ");
        sort.showArray();
        sort.InsertionSort();
        System.out.println("After sort: ");
        sort.showArray();
    }
}