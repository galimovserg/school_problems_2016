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
            Int64 count=0,m;
            m = Convert.ToInt64(Console.ReadLine());
            while (m != 0)
            {
                if (m % 2 == 0) { count++; }
                m = Convert.ToInt64(Console.ReadLine());
            }
            Console.WriteLine(Convert.ToString(count));
            //Console.ReadKey();
        }
    }
}
