//Descending Insertion sort with given array
//array [i] < key 


public class InSortDes {  
    public static void insertionSort(int array[]) {  
        int n = array.length;  
        for (int j = 1; j < n; j++) 
        {  
            int key = array[j];  
            int i = j-1;  
            while ( (i > -1) && ( array [i] < key ) ) 
            {  
                array [i+1] = array [i];  
                i--;  
            }  
            array[i+1] = key;  
        }  
    }  
       
    public static void main(String a[]){    
        int[] arr1 = {9,14,3,2,43,11,58,22};    
        for(int i:arr1)
        {    
            System.out.print(i+" ");    
        }    
            System.out.println();    
            
        insertionSort(arr1);//sorting array using insertion sort    
           
        for(int i:arr1)
        {    
            System.out.print(i+" ");    
        }    
    }    
}    