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
            Int64 x1, x2, x3, count;
            x1 = Convert.ToInt64(Console.ReadLine());
            x2 = Convert.ToInt64(Console.ReadLine());
            x3 = Convert.ToInt64(Console.ReadLine());
            count = 1;
            if (x1 == x2) {count++;}
            if (x2 == x3) {count++;}
            if (x3 == x1) {count++;}
            if (count == 4) {count=3;}
            if (count ==1 ) {count=0;}
            Console.WriteLine(Convert.ToString(count));
           
        }
    }
}
