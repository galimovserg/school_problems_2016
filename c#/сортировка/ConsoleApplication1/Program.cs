using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
       static Int64[] mas;
        static Int32 n;
        static Int64 key, buf;
        static void Main(string[] args)
        {
            
         n =Convert.ToInt32( Console.ReadLine());
           
            mas =new Int64[n+10] ;
            int ii = 0;
            Random rn = new Random();
            for (ii=1;ii<= n; ii++)
            {
                string ss = "";
                 char ch =Convert.ToChar(Console.Read());
                 while ((ch!=' ')&&(ch != '\n')) {
                     ss = ss + ch;
                     ch = Convert.ToChar(Console.Read());
                 }
                 if (ss != "") { mas[ii] = Convert.ToInt64(ss); }
                 else { ii--; }
                //mas[ii] =rn.Next(1000)-500 ;
            }
           
            qsort(1, n);
            for (ii = 1; ii <= n; ii++)
            {
                Console.Write(Convert.ToString(mas[ii])+' ');
            }
            
           // Console.ReadKey();
        }

        static void qsort(int left,int right)
       
        {
            Int64 buf = 0;
            int i = left, j = right;
            Int64 key = mas[left + (right - left) / 2];
            while (i<=j)
            {
                while (key>mas[i]) { i++; }
                while (key<mas[j]) { j--; }
                if (i<=j)
                {
                    buf = mas[i];
                    mas[i] = mas[j];
                    mas[j] = buf;
                    i++;
                    j--;
                }
            }
            if (i<right) { qsort(i, right); }
            if (j>left) {  qsort(left, j); }
        }
    }
}
