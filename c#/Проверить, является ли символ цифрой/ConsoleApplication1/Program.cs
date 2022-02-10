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
            Char ch = Convert.ToChar( Console.Read());
            if ((Convert.ToByte(ch)>= Convert.ToByte('0'))&((Convert.ToByte(ch) <= Convert.ToByte('9'))))
            {
                Console.WriteLine("yes");
            } else
            {
                Console.WriteLine("no");
            }
          //Console.ReadKey();
        }
    }
}
