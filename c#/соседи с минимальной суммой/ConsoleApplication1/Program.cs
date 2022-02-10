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
            Int64 a = Convert.ToInt64(mas[0]);
            Int64 b = Convert.ToInt64(mas[1]);
            Int64 n = Convert.ToInt64(mas[2]);
            Int64 x1, x2, i,n1,min;
            Random rand = new Random();
            x2 = rand.Next(Convert.ToInt32( a), Convert.ToInt32(b+1));
            Console.Write(Convert.ToString(x2) + " ");
            x1 = rand.Next(Convert.ToInt32(a), Convert.ToInt32(b + 1));
            Console.Write(Convert.ToString(x1) + " ");
            min = x2 + x1;
            x2 = x1;
            n1 = 2;
            for (i=3;i<= n; i++)
            {
                x1= rand.Next(Convert.ToInt32(a), Convert.ToInt32(b + 1));
                Console.Write(Convert.ToString(x1) + " ");
                if (x1 + x2 <= min)
                {
                    min = x1 + x2;
                    n1 = i;
                }
                x2 = x1;
            }
            Console.WriteLine();
            Console.WriteLine("{0} {1}",n1-1,n1);
           // Console.ReadKey();
        }
    }
}
