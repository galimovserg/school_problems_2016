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
            Int64 a,max;
            a = Convert.ToInt64(Console.ReadLine());
            max = a;
            a = Convert.ToInt64(Console.ReadLine());
            if (a > max) {
                max = a;
            }
            a = Convert.ToInt64(Console.ReadLine());
            if (a>max)
            {
                max = a;
            }
            Console.WriteLine(Convert.ToString(max));
        }
    }
}
