using System;
/*using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;*/

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            String[] mas = Console.ReadLine().Split(' ');
            Int32 n = Convert.ToInt32(mas[0]);
            Int32 m = Convert.ToInt32(mas[1]);
            Int32 i,j,jm;
            Int64[,] masnew=new Int64[n+1,m+13];
           
            for (i=1;i<= n;i++)
            {
                mas = Console.ReadLine().Split(' ');
                j = 0;
               for (jm = 0; jm <= mas.Length - 1; jm++)
                {
                    if (mas[jm].Length>0)
                    {
                        j++;
                        masnew[i, j] = Convert.ToInt64(mas[jm]);
                    }
                }
            }
            Console.WriteLine(Convert.ToString(m) + " " + Convert.ToString(n));
            for (i=1;i<= m; i++)
            {
                for (j=n;j>=1; j--)
                {
                    Console.Write(Convert.ToString(masnew[j, i])+' ');

                }
                Console.WriteLine();
            }
            //Console.ReadKey();
        }

    }
}
