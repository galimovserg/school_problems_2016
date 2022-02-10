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
            Int64 n,i,count;
            n = Convert.ToInt64(Console.ReadLine());
            Int64[] mas= Console.ReadLine().Split(' ').Select(Int64.Parse).ToArray();
            count = 0;
            for (i=0;i<= n-1;i++)
            {
               if (mas[i] > 0)
                    {
                    count++;
                    }

            }
            Console.WriteLine(Convert.ToString(count));
        }
    }
}
