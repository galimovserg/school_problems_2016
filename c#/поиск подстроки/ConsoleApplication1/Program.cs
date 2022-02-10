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
            String s2 = Console.ReadLine(),
                   s1 = Console.ReadLine();
            Int32 len1 = s1.Length-1,
                  len2 = s2.Length-1,
                  i, j;
            if (len2 <= len1)
            {
                for (i = 0; i <= len1-len2; i++)
                {
                    for (j = 0; j <= len2; j++)
                    {
                       if (s1[i+j] != s2[j])
                        {
                            goto endi;
                        }
                        
                    }
                    Console.WriteLine("yes");
                    goto endik;
                    endi: { }
                }
                Console.WriteLine("no");
                endik: { }
            } else
            {
                Console.WriteLine("no");
            }
           // Console.ReadKey();
        }
    }
}
