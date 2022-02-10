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
            String s=Console.ReadLine();
            Int32 len, i;
            len = s.Length-1;
            Console.Write(s[0]);
            for (i=1; i <= len; i++)
            {
                if ((s[i]==' ')&&(s[i-1]==' ')) { } else
                {
                    Console.Write(s[i]);
                }
            }
            //Console.ReadKey();
        }
    }
}
