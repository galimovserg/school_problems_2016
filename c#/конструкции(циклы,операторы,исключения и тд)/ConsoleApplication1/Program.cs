using System;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            /*ВЕТВЛЕНИЕ*/
            bool flag1 = false,
                 flag2 = true;

            if (/*первое условие*/ flag1)
            {
                /*действия...*/
                Console.WriteLine("первое условие истинно");
            }
            else
            if (/*второе условие*/ flag2)
            {
                /*действия...*/
                Console.WriteLine("второе условие истинно а первое ложно");
            }
            else
            { /*альтернатива*/
                /*действия...*/
                Console.WriteLine("первое и второе условия ложные");
            }


            /*ОПЕРАТОР ВЫБОРА SWITCH*/
            Int64 i = 0;


            switch (i)
            {
                case 2 - 3 + 1: { Console.WriteLine("0"); break; }//0
                case 1: case 2: case 3: { Console.WriteLine("1 or 2 or 3"); break; }//1 or 2 or 3
                default: { Console.WriteLine("null"); break; }
            }



            /*ЦИКЛ FOR*/
            for (i = 1; (i <= 10)|(i%11==i*2); i++)
            {
                Console.Write(Convert.ToString(i) + ' ');
            }
            Console.WriteLine();



            /*ЦИКЛ WHILE*/
            i = 0;
            while (i < 40) //пока i<40 выполняем:
            {
                i++;
                if (i % 3 == 0)
                {
                    Console.WriteLine(Convert.ToString(i));
                }
            }


            /*ОПЕРАТОР GOTO(ПЕРЕХОД)*/
            i = 0;
            hello: {
                  i++;
                 /*этот блок выполняется только при переходе!!!*/
                }

            Console.WriteLine(Convert.ToString(i));
            if (i < 10)
            {
                goto hello;
            }


            /*ОПЕРАТОР CONTINE(ПРОДОЛЖЕНИЕ)*/
             /*работает с while, do, for, foreach*/
            for (i = 1; i <= 100; i++)
            {
                if (i < 96)
                {
                    continue;
                }
                Console.WriteLine(Convert.ToString(i));
            }

            
            
            /*ИСКЛЮЧЕНИЕ TRY-CATCH*/
            i = 0;
            try
            {
                Console.WriteLine(Convert.ToString(123/i));
            } catch
            {
                Console.WriteLine("ошибка при делении");
            }
            Console.ReadKey();
        }
    }
}
