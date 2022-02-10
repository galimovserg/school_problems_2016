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
            Int64 len = Convert.ToInt64(Console.ReadLine());
            Int64 i, stecksize;
            Char[] mas = new Char[len + 1];
            Char ch;
            if (len % 2 == 0)
            {
                stecksize = 0;
                for (i = 1; i <= len; i++)
                {
                    ch = Convert.ToChar(Console.Read());

                    if (((ch == ']') & (mas[stecksize] == '[')) |
                       ((ch == ')') & (mas[stecksize] == '(')) |
                       ((ch == '}') & (mas[stecksize] == '{')))
                    {
                        stecksize--;
                    }
                    else
                    {
                        stecksize++;
                        mas[stecksize] = ch;
                        if ((ch == ')') | (ch == '}') | (ch == '}'))
                        {
                            break;
                        }

                    }
                }

                if (stecksize > 0) { Console.WriteLine("No"); }
                else
                { Console.WriteLine("Yes"); }
            }
            else
            {
                Console.WriteLine("No");
            }
             Console.ReadKey();

        }
    }
}
