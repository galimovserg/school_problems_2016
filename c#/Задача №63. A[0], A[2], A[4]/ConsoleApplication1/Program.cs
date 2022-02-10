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
            Char ch;
            Int64 count;
            ch=Convert.ToChar( Console.Read());
            count = 0;
            while ((Convert.ToInt32(ch) - 48>=0)) {
                switch (Convert.ToInt32(ch)-48)
                {
                    case 0 : { count=count+1; break; }
                    case 9:  { count = count + 1; break; }
                    case 6: { count = count + 1; break; }
                    case 8: { count += 2; break; }
                    default: { break; }
                }
                ch = Convert.ToChar(Console.Read());
            }
            Console.WriteLine(Convert.ToString(count));
            Console.ReadKey();
        }
    }
}
