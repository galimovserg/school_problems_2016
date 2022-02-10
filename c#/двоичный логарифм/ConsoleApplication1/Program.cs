using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            Int64 n, k,m;
            n = Convert.ToInt64(Console.ReadLine());
            m = 1;
            k = 0;
            while (m < n)
            {
                k = k + 1;
                m = m * 2;
            }
            Console.WriteLine(Convert.ToString(k));
            //Console.ReadKey();
        }
    }
}
