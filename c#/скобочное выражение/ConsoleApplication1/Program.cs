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
            Char[] steckmas = new Char[1000];
            Char ch;
            Int64 lenpos = 0;

            ch = Convert.ToChar(Console.Read());
            while (ch != '\n')
            {
                if ((ch == '<') | (ch == '(') | (ch == '[') | (ch == '{'))
                {
                    lenpos++;
                    steckmas[lenpos] = ch;
                }
                else
                {
                    if (((ch == '>') & (steckmas[lenpos] == '<')) |
                        ((ch == ')') & (steckmas[lenpos] == '(')) |
                        ((ch == '}') & (steckmas[lenpos] == '{')) |
                        ((ch == ']') & (steckmas[lenpos] == '[')))
                    {
                        if (lenpos > 0)
                        {
                            lenpos--;
                        } else
                        {
                            lenpos = 1;
                            break;
                        }
                    }
                    else
                    {
                        if ((ch == '>') | (ch == ')') | (ch == ']') | (ch == '}'))
                        {
                            lenpos = 1;
                            break;
                        }
                    }
                }
                ch = Convert.ToChar(Console.Read());
            }
            if (lenpos == 0) {
                Console.WriteLine("YES");
            } else
            {
                Console.WriteLine("NO");
            }
            //Console.ReadKey();

        }
    }
}
