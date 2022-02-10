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
            String s = Console.ReadLine();
            Int32 len = s.Length /2, i, n=s.Length-1;
            for (i=0;i<= len;i++)
            {
                if (s[i] != s[n - i])
                {
                    Console.WriteLine("no");
                    goto nots;
                }
            }
            Console.WriteLine("yes");
            nots: { }
            //Console.ReadKey();
        }
    }
}
