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
            Double x, y;
            Int64 count;
            x = Convert.ToDouble(Console.ReadLine());
            y = Convert.ToDouble(Console.ReadLine());
            count = 1;
            while (x<y)
                {
                  x = x + x * 0.1;
                count++;
                }
            Console.WriteLine(Convert.ToString(count));
           Console.ReadKey();
                 
        }
    }
}
