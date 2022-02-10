using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            /*ЗАПИСЬ В ФАЙЛ МАССИВА СТРОК*/
            string[] list = { "hello !!","My name is Galimov Sergey","My age is eighteen years"};
            System.IO.File.WriteAllLines(@"D:\sergey.txt",list);
            
            /*ДОБАВЛЕНИЕ СТРОКИ В ФАЙЛ*/
            string str = "I am from Russia and I love my country";
            Int32 i = 0;
            System.IO.FileStream fs = new System.IO.FileStream(@"D:\sergey.txt", System.IO.FileMode.Append);
            for (i = 0; i < str.Length; i++)
            {
                fs.WriteByte(Convert.ToByte( str[i]));
            }
            fs.Close();

            /*ПОСТРОЧНОЕ ЧТЕНИЕ ИЗ ФАЙЛА И ВЫВОД НА КОНСОЛЬ*/
            try {
                System.IO.StreamReader file = new System.IO.StreamReader(@"D:\sergey.txt");
                string line = file.ReadLine();
                while (line != null)
                {
                    Console.WriteLine(line);
                    line = file.ReadLine();
                }
                file.Close();


                Console.ReadKey();
            } catch
            {
                Console.WriteLine("ошибка чтения файла");
            
            }
            /*ПОСИМВОЛЬНОЕ СЧИТЫВАНИЕ ИЗ ФАЙЛА*/
            try
            {
                System.IO.StreamReader FILE = new System.IO.StreamReader(@"D:\sergey.txt");//создаем файловый ввода
                char ch; 
                while (FILE.Peek()>-1)//признак конца файла или ошибка
                {
                    ch = Convert.ToChar( FILE.Read());//чтение из потока
                    Console.Write(ch);
                }
            }
            catch
            {
                
            }

            /*СОЗДАНИЕ ДИРЕКТОРИИ*/
            string DirName = @"D:\sergey\galimov";
            if (!System.IO.Directory.Exists(DirName))
            {
                System.IO.Directory.CreateDirectory(DirName);
                
                Console.WriteLine("директория созданна");
            } else
            {
                Console.WriteLine("директория существует");
            }

            /*копирование файла*/
            try
            {
                    /*если  файла нет*/
                if (!System.IO.File.Exists(@"D:\sergey\galimov\sergeys.txt"))
                {
                    System.IO.File.Copy(@"D:\sergey.txt", @"D:\sergey\galimov\sergeys.txt");
                } else
                {
                    /*иначе перезаписываем*/
                    System.IO.File.Delete(@"D:\sergey\galimov\sergeys.txt");
                    System.IO.File.Copy(@"D:\sergey.txt", @"D:\sergey\galimov\sergeys.txt");

                }
            }
            catch
            {
                Console.WriteLine("ошибка при копировании");
            }

            /*УДАЛЕНИЕ ФАЙЛА*/
            System.IO.FileInfo fi = new System.IO.FileInfo(@"D:\sergey.txt");
            try
            {
                fi.Delete();
                Console.WriteLine("удаление успешно завершено");
            }
            catch
            {
                Console.WriteLine("ошибка удаления");
            }
            Console.WriteLine("оk");
            Console.ReadKey();
            //ПРИОСТАНОВКА ОСНОВНОГО ПОТОКА НА 2 СЕКУНДЫ
            System.Threading.Thread.Sleep(2000);
        }
    }
}
