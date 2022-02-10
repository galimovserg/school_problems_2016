import java.util.Scanner;
public class program {
	
	
		public static void main(String args[]){ 
			Scanner scan= new Scanner(System.in);
			int n=scan.nextInt();
			int[] mas= new int[100001];
			int count=1;
			int i=1;
			int j=0;
			int flag=0;
			mas[1]=2;
			
			while (count<n){
				i+=2;
				flag=0;
				for (j=1;mas[j]*mas[j]<=i;j++){
					if (i%mas[j]==0){
						flag=1;
						break;
					}
				}
				if (flag==0){
					count++;
					mas[count]=i;
				}
			}
		    System.out.println(mas[count]);
		
	}

}
