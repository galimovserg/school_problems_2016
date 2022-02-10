using System;
using System.Drawing;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        Bitmap mm;
        Graphics fig;
        bool arm = false;
        double stepmove=1;
        double posx, posy,mh=100,mpx,mpy;
       public struct mygp
        {
            public string str;
            public Double a, b, c;
            public Double speeds, steps;
            public mygp(string str, Double a,Double b, Double c,Double speeds,Double steps)
            {
                this.str = str;
                this.a = a;
                this.b = b;
                this.c = c;
                this.steps = steps;
                this.speeds = speeds;
            }
        }
        mygp[] mas= new mygp[20];
        int sizegp = 0;
        Boolean proisv = true;
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            textBox1.Text = Convert.ToString(viir.f(textBox1.Text,0));
        }

        private void button6_Click(object sender, EventArgs e)
        {
            string st = textBox1.Text;
            textBox1.Text="";
            
            if (st.Length > 0)
            {
                int i = 0;
                for (i = 0; i < st.Length - 1; i++)
                {
                    textBox1.Text = textBox1.Text + st[i];
                }
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + '(';
        }

        private void button3_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + ')';
        }

        private void button4_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + '*';
        }

        private void button5_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + '/';
        }

        private void button7_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + '^';
        }

        private void button8_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + '0';
        }

        private void button9_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + '1';
        }

        private void button10_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + '2';
        }

        private void button11_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + '3';
        }

        private void button12_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + '+';
        }

        private void button13_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + '4';
        }

        private void button14_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + '5';
        }

        private void button15_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + '6';
        }

        private void button16_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + '7';
        }

        private void button17_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + '-';
        }

        private void button18_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + '8';
        }

        private void button19_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + '9';
        }

        private void button20_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + '.';
        }

        private void button21_Click(object sender, EventArgs e)
        {
            textBox1.Text = "";
        }

        private void button22_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + "3,14159265358979323";
        }

        private void button23_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + "e";
        }

        private void button26_Click(object sender, EventArgs e)
        {
            posx = posx + 0.1;
            drawss(textBox1.Text);
        }

        private void button25_Click(object sender, EventArgs e)
        {
            posx= posx - 0.1;
            drawss(textBox1.Text);
        }

        private void button24_Click(object sender, EventArgs e)
        {
            panel1.Visible = true;
            Form1.ActiveForm.Width = panel1.Width + 50;
            label2.Text = "y = " + textBox1.Text;
            drawss(textBox1.Text);
        }

        private void button27_Click(object sender, EventArgs e)
        {
            posy = posy -1; drawss(textBox1.Text);
        }

        private void button28_Click(object sender, EventArgs e)
        {
            posy = posy +1; drawss(textBox1.Text);
        }


        private void timer1_Tick(object sender, EventArgs e)
        {
            try {
                double a, a1, a2, stepd;
                a = Convert.ToDouble(textBox4.Text);
                a1 = Convert.ToDouble(textBox7.Text);
                a2 = Convert.ToDouble(textBox8.Text);
                stepd = Convert.ToDouble(textBox9.Text);
                a = a + stepd;
                if (a > a2)
                {
                    a = a1;
                }
                if (a < a1)
                {
                    a = a1;
                }
                viir.a = a;
                textBox4.Text = Convert.ToString(a);
                
            } catch
            {
                timer1.Enabled = false;
            }
        }

        private void button31_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + "Abs(";
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button32_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + "Sin(";
        }

        private void button27_Click_1(object sender, EventArgs e)
        {
            stepmove = Math.Truncate((Convert.ToDouble(textBox3.Text) - Convert.ToDouble(textBox2.Text))/10);
            posy = posy - stepmove;
            drawss(textBox1.Text);
        }

        private void button28_Click_1(object sender, EventArgs e)
        {
            stepmove = Math.Truncate((Convert.ToDouble(textBox3.Text) - Convert.ToDouble(textBox2.Text)) / 10);
            posy = posy + stepmove;
            drawss(textBox1.Text);
        }

        private void button25_Click_1(object sender, EventArgs e)
        {
            try
            {
                stepmove = (Convert.ToDouble(textBox3.Text) - Convert.ToDouble(textBox2.Text)) / 10;
                textBox2.Text = Convert.ToString(Convert.ToDouble(textBox2.Text) - stepmove);
                textBox3.Text = Convert.ToString(Convert.ToDouble(textBox3.Text) - stepmove);
                drawss(textBox1.Text);
            }
            catch
            {

            }
        }

        private void button26_Click_1(object sender, EventArgs e)
        {
            try
            {
                stepmove = (Convert.ToDouble(textBox3.Text) - Convert.ToDouble(textBox2.Text)) / 10;
                textBox2.Text = Convert.ToString(Convert.ToDouble(textBox2.Text) + stepmove);
                textBox3.Text = Convert.ToString(Convert.ToDouble(textBox3.Text) + stepmove);
                drawss(textBox1.Text);
            }
            catch
            {

            }
        }

        private void button30_Click_1(object sender, EventArgs e)
        {
            double inter = Convert.ToDouble(textBox3.Text) - Convert.ToDouble(textBox2.Text);
            textBox3.Text = Convert.ToString(Convert.ToDouble(textBox3.Text) + inter * 0.1);
            textBox2.Text = Convert.ToString(Convert.ToDouble(textBox2.Text) - inter * 0.1);
            stepmove = stepmove * 1.1;
            drawss(textBox1.Text);
        }

        private void button29_Click_1(object sender, EventArgs e)
        {
            double inter = Convert.ToDouble(textBox3.Text) - Convert.ToDouble(textBox2.Text);
            textBox3.Text = Convert.ToString(Convert.ToDouble(textBox3.Text) - inter * 0.1);
            textBox2.Text = Convert.ToString(Convert.ToDouble(textBox2.Text) + inter * 0.1);
            stepmove = stepmove/ 1.1;
            drawss(textBox1.Text);
        }

        private void button33_Click(object sender, EventArgs e)
        {
            Form1.ActiveForm.Width = 400;
            timer1.Enabled = false;
            timer2.Enabled = false;
            timer3.Enabled = false;
            timer4.Enabled = false;
            panel1.Visible = false;
        }

        private void button39_Click(object sender, EventArgs e)
        {
            viir.a = Convert.ToDouble(textBox4.Text);
            drawss(textBox1.Text);
        }

        private void button40_Click(object sender, EventArgs e)
        {
            timer1.Interval = 1000/Convert.ToInt16(textBox10.Text);
            timer1.Enabled = true;
            timer4.Enabled = true;
        }

        private void button41_Click(object sender, EventArgs e)
        {
            timer1.Enabled = false;
        }

        private void button42_Click(object sender, EventArgs e)
        {
            viir.b = Convert.ToDouble(textBox5.Text);
            drawss(textBox1.Text);
        }

        private void button43_Click(object sender, EventArgs e)
        {
            timer2.Interval = 1000 / Convert.ToInt16(textBox14.Text);
            timer2.Enabled = true;
            timer4.Enabled = true;
        }

        private void timer2_Tick(object sender, EventArgs e)
        {
            try {
                double b, b1, b2, stepd;
                b = Convert.ToDouble(textBox5.Text);
                b1 = Convert.ToDouble(textBox11.Text);
                b2 = Convert.ToDouble(textBox12.Text);
                stepd = Convert.ToDouble(textBox13.Text);
                b = b + stepd;
                if (b > b2)
                {
                    b = b1;
                }
                if (b < b1)
                {
                    b = b1;
                }
                viir.b = b;
                textBox5.Text = Convert.ToString(b);
            
            }
            catch
            {
                timer2.Enabled = false;
            }
        }

        private void button44_Click(object sender, EventArgs e)
        {
            timer2.Enabled = false;
        }

        private void button45_Click(object sender, EventArgs e)
        {
            viir.c = Convert.ToDouble(textBox6.Text);
            drawss(textBox1.Text);
        }

        private void textBox18_TextChanged(object sender, EventArgs e)
        {

        }

        private void timer3_Tick(object sender, EventArgs e)
        {
            try
            {
                double c, c1, c2, stepd;
                c = Convert.ToDouble(textBox6.Text);
                c1 = Convert.ToDouble(textBox15.Text);
                c2 = Convert.ToDouble(textBox16.Text);
                stepd = Convert.ToDouble(textBox17.Text);
                c = c + stepd;
                if (c > c2)
                {
                    c = c1;
                }
                if (c < c1)
                {
                    c = c1;
                }
                viir.c = c;
                textBox6.Text = Convert.ToString(c);
                
            }
            catch
            {
                timer3.Enabled = false;
            }
        }

        private void button46_Click(object sender, EventArgs e)
        {
            timer3.Interval = 1000 / Convert.ToInt16(textBox18.Text);
            timer3.Enabled = true;
            timer4.Enabled = true;
        }

        private void button47_Click(object sender, EventArgs e)
        {
            timer3.Enabled = false;
        }

        private void button38_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + "ln(";
        }

        private void button48_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + "log(";
        }

        private void button34_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + "x";
        }

        private void button35_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + "a";
        }

        private void button36_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + "b";
        }

        private void button37_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + "c";
        }

        private void timer4_Tick(object sender, EventArgs e)
        {
            if ((timer1.Enabled == true)||(timer2.Enabled == true) ||(timer3.Enabled == true))
            {
                drawss(textBox1.Text);
            }
        }

        private void button50_Click(object sender, EventArgs e)
        {

        }

        private void button53_Click(object sender, EventArgs e)
        {
            if (colorDialog1.AllowFullOpen)
            {
                colorDialog1.ShowDialog();
                label23.BackColor = colorDialog1.Color;
            }
        }

        private void button56_Click(object sender, EventArgs e)
        {
            if (proisv)
            {
                proisv = false;
                button56.Text = "производная выкл.";
            }
            else
            {
                proisv = true;
                button56.Text = "производная вкл.";
            }
            drawss(textBox1.Text);
        }

        private void button57_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + "Cos(";
        }

        private void button30_Click(object sender, EventArgs e)
        {
            mh = mh - 10;
            if (mh == 0)
            {
                mh = 10;
            }
            drawss(textBox1.Text);
        }

        private void pictureBox1_MouseDown(object sender, MouseEventArgs e)
        {
            arm = true;
            mpx = Cursor.Position.X;
            mpy = Cursor.Position.Y;
            drawss(textBox1.Text);
        }

        private void button29_Click(object sender, EventArgs e)
        {
            mh = mh + 10;
            drawss(textBox1.Text);
        }

        void drawss(string s)
        {  
            mm = new Bitmap(pictureBox1.Width, pictureBox1.Height);
            fig = Graphics.FromImage(mm);
            double y1 = 0, y2 = 0;
            double i = 0, steps = (Convert.ToDouble( textBox3.Text)-Convert.ToDouble( textBox2.Text))/ pictureBox1.Width; ;
            Pen fg = new Pen(Color.Red);
            fg.Width = 3;
            
                label6.Text = Convert.ToString(-posy);
                label7.Text = Convert.ToString(-posy + Math.Round(pictureBox1.Height * steps));
            double yp = 0;
            for (i = -1; i < Convert.ToDouble(textBox3.Text)- Convert.ToDouble(textBox2.Text); i = i + steps*0.5)
            {
                try { 
                    y1 = viir.f(s, i+ Convert.ToDouble(textBox2.Text));
                    if ((Math.Abs( yp)<100000)&&(Math.Abs(y1) < 100000)&&(Math.Abs(y2) < 100))
                    {
                        fg = new Pen(Color.Red); fg.Width = 3;
                        //рисуем график
                        fig.DrawLine(fg, Convert.ToInt64((i - steps) / steps), pictureBox1.Height - Convert.ToInt64((y2 + posy) / steps), Convert.ToInt64((i) / steps), pictureBox1.Height - Convert.ToInt64((y1 + posy) / steps));
                        if (proisv)//рисуем производную
                        {
                            fg = new Pen(Color.Yellow); fg.Width = 3;
                            fig.DrawLine(fg, Convert.ToInt64((i - steps) / steps), pictureBox1.Height - Convert.ToInt64((posy + yp) / steps), Convert.ToInt64((i) / steps), pictureBox1.Height - Convert.ToInt64((posy + (y1 - y2) / 0.5 / steps) / steps));
                        }
                    }
                    else { i = i + steps * 0.5; }
                        yp = (y1 - y2)/0.5/steps;
                        y2 = y1;
                    
                }
                catch
                {
                    i = i + steps*0.5;
                    y2 = y1;
                }
            }
            fg = new Pen(Color.Black);
            fg.Width = 2;
            if (Convert.ToDouble(textBox3.Text)* Convert.ToDouble(textBox2.Text)<0) {
                fig.DrawLine(fg,Convert.ToInt64( -Convert.ToDouble(textBox2.Text)/steps),0,Convert.ToInt64( -Convert.ToDouble(textBox2.Text)/steps),pictureBox1.Height);
            }
            if (Math.Abs(posy / steps) < pictureBox1.Height)
            {
                fig.DrawLine(fg,0, pictureBox1.Height - Convert.ToInt64(posy / steps), pictureBox1.Width, pictureBox1.Height - Convert.ToInt64(posy / steps));
            }
            fg = new Pen(Color.Blue);
             fg.Width = 1;
            for (i=Math.Truncate(-Math.Abs( posy))-Math.Truncate( pictureBox1.Width*steps);i<= Math.Abs(posy) + Math.Truncate( pictureBox1.Width * steps); i = i + 1)
            {
                fig.DrawLine(fg, 0, pictureBox1.Height - Convert.ToInt64((i) / steps), pictureBox1.Width, pictureBox1.Height - Convert.ToInt64((i)/ steps));
                //fig.DrawLine(fg, 0, pictureBox1.Height - Convert.ToInt64(( -i) / steps), pictureBox1.Width, pictureBox1.Height - Convert.ToInt64((-i) / steps));
            }
            pictureBox1.Image = mm;
        }
    }
    
    class viir
    {
        const int split = 2;//деление
        const int app = 3;//умножение
        const int stepp = 4;//возведение в степень
        static int i = 0;
        static public double x = 0, a = 0, b = 0, c = 0;
        
        static double stepen(double a, double n)
        {
            return Math.Pow(a, n);
        }
        static double chet(string s)
        {
            
            #region здесь обьявляю локальные переменные
            double itog = 0;//локальное значение выражения
            double locl1 = 1,
                   locl2 = 0,
                   stepdrob = 0.1, stepn = 1;
            bool drob = false;
            int type2 = app,
                 type1 = app;
            #endregion
            while (true)
            {

                switch (s[i])
                {
                    #region x,a,b,c~parametrs
                    case 'x':
                        {
                            locl2 = x;
                            break;
                        }
                    case 'a':
                        {
                            locl2 = a;
                            break;
                        }
                    case 'b':
                        {
                            locl2 = b;
                            break;
                        }
                    case 'c':
                        {
                            locl2 = c;
                            break;
                        }
                    #endregion
                  
                    #region (
                    case '(':
                        {
                            i++;
                            drob = false;
                            locl2 = chet(s);
                            drob = false;
                            stepdrob = 0.1;
                            break;
                        }
                    #endregion

                    #region ln
                    case 'l':
                        {
                            i++;
                            drob = false;
                            stepdrob = 0.1;
                            if (s[i] == 'n')
                            {
                                i++;
                                
                                    if (s[i] == '(')
                                    {
                                        i++;
                                        double kk = chet(s);
                                        locl2 = Math.Log(kk);
                                    }
                                
                            }
                            else
                            if(s[i]=='o') {
                                i++;
                                if (s[i] == 'g')
                                {
                                    i++;

                                    if (s[i] == '(')
                                    {
                                        i++;
                                        double kk = chet(s);
                                        locl2 = Math.Log10(kk);
                                    }

                                }
                            }
                            drob = false;
                            stepdrob = 0.1;
                            break;
                        }
                    #endregion
                    
                    #region abs
                    case 'A':
                        {
                            i++;
                            drob = false;
                            stepdrob = 0.1;
                            if (s[i ] == 'b')
                            {
                                i++;
                                if (s[i]== 's')
                                {
                                    i++;
                                    if (s[i] == '(')
                                    {
                                        i++;
                                        double kk = chet(s);
                                        locl2 = Math.Abs( kk);
                                    }
                                }
                            }
                            drob = false;
                            stepdrob = 0.1;
                            break;
                        }
                    #endregion

                    #region e
                    case 'e':
                        {
                                          
                            locl2 = Math.E;       
                            drob = false;
                            stepdrob = 0.1;
                            break;
                        }
                    #endregion
                  
                    #region sin
                    case 'S':
                        {
                            i++;
                            drob = false;
                            if (s[i] == 'i')
                            {
                                i++;
                                if (s[i] == 'n')
                                {
                                    i++;
                                    if (s[i] == '(')
                                    {
                                        i++;
                                        locl2 = Math.Sin(chet(s));
                                    }
                                }
                            }
                            drob = false;
                            stepdrob = 0.1;
                            break;
                        }
                    #endregion

                    #region cos
                    case 'C':
                        {
                            i++;
                            drob = false;
                            if (s[i] == 'o')
                            {
                                i++;
                                if (s[i] == 's')
                                {
                                    i++;
                                    if (s[i] == '(')
                                    {
                                        i++;
                                        locl2 = Math.Cos(chet(s));
                                    }
                                }
                            }
                            drob = false;
                            stepdrob = 0.1;
                            break;
                        }
                    #endregion

                    #region  )
                    case ')':
                        {
                            drob = false;
                            stepdrob = 0.1;
                            
                            goto outwhile;
                        }
                    #endregion
                    
                    #region *,/
                    case '*':
                    case '/':
                        {
                            if (type2 == split)
                            {
                                locl1 = locl1 / locl2;
                            }
                            else
                            if (type2 == app)
                            {
                                locl1 = locl1 * locl2;
                            }
                            else
                            {
                                if (type1 == app)
                                {
                                    locl1 = locl1 * stepen(stepn, locl2);
                                }
                                else
                                if (type1 == split)
                                {
                                    locl1 = locl1 / stepen(stepn, locl2);
                                }
                            }
                            if (s[i] == '*')
                            {
                                type2 = app;
                                type1 = app;

                            }
                            else
                            if (s[i] == '/')
                            {
                                type2 = split;
                                type1 = split;
                            }

                            locl2 = 0;
                            drob = false;
                            stepdrob = 0.1;
                            break;
                        }
                    #endregion
                    
                    #region ^
                    case '^':
                        {
                            if (type2 == stepp)
                            {
                                stepn = stepen(stepn, locl2);
                                locl2 = 0;
                            }
                            else {
                                type2 = stepp;
                                stepn = locl2;
                            }
                            locl2 = 0;
                            drob = false;
                            stepdrob = 0.1;

                            break;
                        }
                    #endregion
                    
                    #region -+
                    case '-':
                    case '+':
                        {

                            if (type2 == split)
                            {
                                itog = itog + locl1 / locl2;
                            }
                            else
                            if (type2 == app)
                            {
                                itog = itog + locl1 * locl2;
                            }
                            else
                            if (type2 == stepp)
                            {
                                if (type1 == app)
                                {
                                    itog = itog + locl1 * stepen(stepn, locl2);
                                }
                                else
                                {
                                    itog = itog + locl1 / stepen(stepn, locl2);
                                }
                                type2 = app;
                            }
                            if (s[i] == '-')
                            {
                                locl1 = -1;
                            }
                            else
                            {
                                locl1 = 1;
                            }
                            locl2 = 0;
                            type2 = app;
                            type1 = app;
                            drob = false;
                            stepdrob = 0.1;

                            break;
                        }
                    #endregion
                    
                    #region .,
                    case '.':
                    case ',':
                        {
                            drob = true;
                            stepdrob = 0.1;

                            break;
                        }
                    #endregion
                    
                    #region  0123456789
                    default:
                        {
                            if (drob)
                            {
                                locl2 = locl2 + stepdrob * Convert.ToDouble(s[i] + "");
                                stepdrob = stepdrob * 0.1;
                            }
                            else {
                                //Console.WriteLine(s[i]);
                                locl2 = locl2 * 10 + Convert.ToDouble(s[i] + "");

                            }

                            break;
                        }
                        #endregion
                }
                //двигаем указатель дальше
                i++;
                //если  конец строки то выходим 
                if (i == s.Length)
                {
                    goto outwhile;
                }
            }
            outwhile:
            {
                /*
                прибавим к(вычтим от)  itog locl1*(/)
                перед выходом
                */
                #region outwhile
                if (type2 == split)
                {
                    itog = itog + locl1 / locl2;
                }
                else
                if (type2 == app)
                {
                    itog = itog + locl1 * locl2;
                }
                else
                if (type2 == stepp)
                {
                    if (type1 == app)
                    {
                        itog = itog + locl1 * stepen(stepn, locl2);
                    }
                    else
                    {
                        itog = itog + locl1 / stepen(stepn, locl2);
                    }
                }
                #endregion
                type2 = app;
            }
            return itog;
        }
        public static double f(string s, double xx)
        {
            x=xx;
            i = 0;
            if (s.Length > 0)
            {
                return chet(s);
               
            } else
            {
                return 0;
            }
        }
        static string chetp(string s)
        {
            return "fgg";
        }
        public static void fp()
        {
            return;
        }
    }
    
}
