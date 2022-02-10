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
            Int64 i, n,l;
            n = Convert.ToInt64(Console.ReadLine());
            Int64[] mas = Console.ReadLine().Split(' ').Select(Int64.Parse).ToArray();
            l = 0; 
            for (i=0; i<= n-1; i++)
            {
                if (mas[i]>mas[l])
                {
                    l = i;

                }

            }
            Console.WriteLine(Convert.ToString(l+1));
            

        }
    }
}
