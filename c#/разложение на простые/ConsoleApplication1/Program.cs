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
            Int64 m =Convert.ToInt64( Console.ReadLine());
            Int64 del,msqrt;
            del = 2;
            msqrt =Convert.ToInt64( Math.Round(Math.Sqrt(m))) + 1;
            while (del <= msqrt)
            {
    
                while (m % del == 0)
                {
                    Console.Write(Convert.ToString(del) + " ");
                    m = m / del;
                }
                
                del++;
            }
            if (m > 1)
            {
                Console.Write(Convert.ToString(m) + " ");
            }
            //Console.ReadKey();
        }
    }
}
