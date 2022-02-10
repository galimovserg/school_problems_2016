import java.util.Scanner;
public class programm {
	public static void main(String args[]){
		Scanner scan=new Scanner(System.in);
		int a=scan.nextInt();
		int b=scan.nextInt();
		int c=0;
		if (a<b){
			c=a;
			a=b;
			b=c;
		}
		int count=0;
		
		while (b>0){
			count++;
			c=b;
			b=a%b;
			a=c;
		}
		System.out.println(a+" "+count);
	}
}
