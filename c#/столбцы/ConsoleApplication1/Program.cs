using System;
//using System.Collections.Generic;
using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            Double x = Convert.ToDouble(Console.ReadLine());
            Int64 n = Convert.ToInt64(Console.ReadLine()),
                i=0,j=0;
            Int64[] st;
            Int64[,] mas=new Int64[101,101];
            for (i = 1; i <= n; i++)
            {
                j = 1;
                st = Console.ReadLine().Split(' ').Select(Int64.Parse).ToArray();
                for (j=1;j<= n; j++)
                {
                    mas[i, j ] = st[j-1];

                }
                Array.Resize(ref st, 0);
            }
            i = 0;j = 0;
           // for (i=1;i<= n; i++)
            //{
              //  j = 0;
                //for (j=1; j<=n; j++)
                //{
                  //  Console.Write(Convert.ToString(mas[i, j]) + " ");
                //}
                //Console.WriteLine("");
            //}
            for (j=1; j<=n; j++) 
            {
                for (i=1;i<= n; i++)
                {
                    if (x == mas[i, j])
                    {
                        Console.WriteLine("YES");
                        goto yess;
                    }
                }
                Console.WriteLine("NO");
                yess:
                {
             
                }

            }
            //Console.ReadKey();
        }
    }
}
