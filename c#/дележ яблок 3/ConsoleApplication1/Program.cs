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
            Int64 n = Convert.ToInt64(Console.ReadLine());
            Int64 k = Convert.ToInt64(Console.ReadLine());
            Console.WriteLine(Convert.ToString((n - k % n) % n));
           
            // Console.ReadKey();
        }
    }
}
