﻿using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Globalization;
using System.Text;
using System.Web;

namespace bewell.common
{
    /// <summary>
    /// CAPTCHA изображение
    /// </summary>
    public class CaptchaImage
    {
        private int _height;
        private int _width;
        private readonly Random _rand;

        #region Статические свойства

        /// <summary>
        /// Установка кеширования CAPTCHA
        /// </summary>
        /// <param name="guid">GUID</param>
        /// <returns></returns>
        public static CaptchaImage GetCachedCaptcha(string guid)
        {
            if (String.IsNullOrEmpty(guid))
                return null;

            return (CaptchaImage)HttpRuntime.Cache.Get(guid);
        }

        /// <summary>
        /// Набор шрифтов
        /// </summary>
        private static readonly string[] RandomFontFamily = { "arial", "arial black", "comic sans ms", "courier new", "estrangelo edessa", "franklin gothic medium", "georgia", "lucida console", "lucida sans unicode", "mangal", "microsoft sans serif", "palatino linotype", "sylfaen", "tahoma", "times new roman", "trebuchet ms", "verdana" };

        /// <summary>
        /// Набор цветов
        /// </summary>
        private static readonly Color[] RandomColor = { Color.Red, Color.Green, Color.Blue, Color.Black, Color.Purple, Color.Orange };

        /// <summary>
        /// Получает или устанавливает набор символов, используемых при генерации
        /// </summary>
        /// <value>Набор символов.</value>
        public static string TextChars { get; set; }

        /// <summary>
        /// Получает или устанавливает длину текста.
        /// </summary>
        /// <value>Дллина текста.</value>
        public static int TextLength { get; set; }

        /// <summary>
        /// Получает или устанавливает степень кривизны шрифта
        /// </summary>
        /// <value>Кривизна шрифта.</value>
        public static FontWarpFactor FontWarp { get; set; }

        /// <summary>
        /// Получает или устанавливает степень зашумленности фона
        /// </summary>
        /// <value>Шум фона</value>
        public static BackgroundNoiseLevel BackgroundNoise { get; set; }

        /// <summary>
        /// Получает или устанавливает степень кривизны шумовых линий
        /// </summary>
        /// <value>Кривизна линий</value>
        public static LineNoiseLevel LineNoise { get; set; }

        /// <summary>
        /// Получает или устанавливает таймаут кеша
        /// </summary>
        /// <value>Таймаут кеша</value>
        public static double CacheTimeOut { get; set; }

        #endregion


        #region Открытые свойства

        /// <summary>
        /// Возвращает GUID, уникально идентифицирующий Captcha
        /// </summary>
        /// <value>Уникальный ID.</value>
        public string UniqueId { get; private set; }

        /// <summary>
        /// Возвращает дату и время последней генерации изображения
        /// </summary>
        /// <value>Время генерации</value>
        public DateTime RenderedAt { get; private set; }

        /// <summary>
        /// Возвращает случайный сгенерированный текс Captcha
        /// </summary>
        /// <value>Текст</value>
        public string Text { get; private set; }

        /// <summary>
        /// Ширина генерируемого Captcha-изображения в пикселях
        /// </summary>
        /// <value>Ширина</value>
        public int Width
        {
            get { return _width; }
            set
            {
                if ((value <= 60))
                    throw new ArgumentOutOfRangeException("width", value, "ширина должна быть больше 60.");

                _width = value;
            }
        }

        /// <summary>
        /// Высота генерируемого Captcha-изображения в пикселях
        /// </summary>
        /// <value>Высота</value>
        public int Height
        {
            get { return _height; }
            set
            {
                if (value <= 30)
                    throw new ArgumentOutOfRangeException("height", value, "высота должна быть больше 30.");

                _height = value;
            }
        }

        #endregion

        #region Конструктор
        /// <summary>
        /// Инициализация статического объекта класса
        /// </summary>
        static CaptchaImage()
        {
            FontWarp = FontWarpFactor.Medium;
            BackgroundNoise = BackgroundNoiseLevel.Low;
            LineNoise = LineNoiseLevel.Low;
            TextLength = 5;
            TextChars = "ACDEFGHJKLNPQRTUVXYZ2346789";
            CacheTimeOut = 90D;
        }

        /// <summary>
        /// Инициализация нового объекта класса
        /// </summary>
        public CaptchaImage()
        {
            _rand = new Random();
            Width = 180;
            Height = 50;
            Text = GenerateRandomText();
            RenderedAt = DateTime.Now;
            UniqueId = Guid.NewGuid().ToString("N");
        }
        #endregion


        /// <summary>
        /// Создание нового Captcha изображения на основе текущих установок
        /// </summary>
        /// <returns></returns>
        public Bitmap RenderImage()
        {
            return GenerateImagePrivate();
        }

        /// <summary>
        /// Возвращает случайный шрифт
        /// </summary>
        /// <returns></returns>
        private string GetRandomFontFamily()
        {
            return RandomFontFamily[_rand.Next(0, RandomFontFamily.Length)];
        }

        /// <summary>
        /// Генерация случайного текста для CAPTCHA
        /// </summary>
        /// <returns></returns>
        private string GenerateRandomText()
        {
            var sb = new StringBuilder(TextLength);
            int maxLength = TextChars.Length;
            for (int n = 0; n <= TextLength - 1; n++)
                sb.Append(TextChars.Substring(_rand.Next(maxLength), 1));

            return sb.ToString();
        }

        /// <summary>
        /// Случайная точка в пределах х и у диапазона
        /// </summary>
        /// <param name="xmin">The xmin.</param>
        /// <param name="xmax">The xmax.</param>
        /// <param name="ymin">The ymin.</param>
        /// <param name="ymax">The ymax.</param>
        /// <returns></returns>
        private PointF RandomPoint(int xmin, int xmax, int ymin, int ymax)
        {
            return new PointF(_rand.Next(xmin, xmax), _rand.Next(ymin, ymax));
        }

        /// <summary>
        /// Случайный цвет
        /// </summary>
        /// <returns></returns>
        private Color GetRandomColor()
        {
            return RandomColor[_rand.Next(0, RandomColor.Length)];
        }

        /// <summary>
        /// Случайная точка в пределах в пределах прямоугольника
        /// </summary>
        /// <param name="rect">Прямоугольник</param>
        /// <returns></returns>
        private PointF RandomPoint(Rectangle rect)
        {
            return RandomPoint(rect.Left, rect.Width, rect.Top, rect.Bottom);
        }

        /// <summary>
        /// Returns a GraphicsPath containing the specified string and font
        /// </summary>
        /// <param name="s">The s.</param>
        /// <param name="f">The f.</param>
        /// <param name="r">The r.</param>
        /// <returns></returns>
        private GraphicsPath TextPath(string s, Font f, Rectangle r)
        {
            var sf = new StringFormat {Alignment = StringAlignment.Near, LineAlignment = StringAlignment.Near};
            var gp = new GraphicsPath();
            gp.AddString(s, f.FontFamily, (int)f.Style, f.Size, r, sf);
            return gp;
        }

        /// <summary>
        /// Returns the CAPTCHA font in an appropriate size
        /// </summary>
        /// <returns></returns>
        private Font GetFont()
        {
            float fsize;
            string fname = GetRandomFontFamily();

            switch (FontWarp)
            {
                case FontWarpFactor.None:
                    goto default;
                case FontWarpFactor.Low:
                    fsize = Convert.ToInt32(_height * 0.8);
                    break;
                case FontWarpFactor.Medium:
                    fsize = Convert.ToInt32(_height * 0.85);
                    break;
                case FontWarpFactor.High:
                    fsize = Convert.ToInt32(_height * 0.9);
                    break;
                case FontWarpFactor.Extreme:
                    fsize = Convert.ToInt32(_height * 0.95);
                    break;
                default:
                    fsize = Convert.ToInt32(_height * 0.7);
                    break;
            }
            return new Font(fname, fsize, FontStyle.Bold);
        }

        /// <summary>
        /// Renders the CAPTCHA image
        /// </summary>
        /// <returns></returns>
        private Bitmap GenerateImagePrivate()
        {
            var bmp = new Bitmap(_width, _height, PixelFormat.Format24bppRgb);

            using (Graphics gr = Graphics.FromImage(bmp))
            {
                gr.SmoothingMode = SmoothingMode.AntiAlias;
                gr.Clear(Color.White);

                int charOffset = 0;
                double charWidth = _width / TextLength;
                Rectangle rectChar;

                foreach (char c in Text)
                {
                    // establish font and draw area
                    using (Font fnt = GetFont())
                    {
                        using (Brush fontBrush = new SolidBrush(GetRandomColor()))
                        {
                            rectChar = new Rectangle(Convert.ToInt32(charOffset * charWidth), 0, Convert.ToInt32(charWidth), _height);

                            // warp the character
                            GraphicsPath gp = TextPath(c.ToString(CultureInfo.InvariantCulture), fnt, rectChar);
                            WarpText(gp, rectChar);

                            // draw the character
                            gr.FillPath(fontBrush, gp);

                            charOffset += 1;
                        }
                    }
                }

                var rect = new Rectangle(new Point(0, 0), bmp.Size);
                AddNoise(gr, rect);
                AddLine(gr, rect);
            }

            return bmp;
        }

        #region Функции защиты изображения
        /// <summary>
        /// Warp the provided text GraphicsPath by a variable amount
        /// </summary>
        /// <param name="textPath">The text path.</param>
        /// <param name="rect">The rect.</param>
        private void WarpText(GraphicsPath textPath, Rectangle rect)
        {
            float WarpDivisor;
            float RangeModifier;

            switch (FontWarp)
            {
                case FontWarpFactor.None:
                    goto default;
                case FontWarpFactor.Low:
                    WarpDivisor = 6F;
                    RangeModifier = 1F;
                    break;
                case FontWarpFactor.Medium:
                    WarpDivisor = 5F;
                    RangeModifier = 1.3F;
                    break;
                case FontWarpFactor.High:
                    WarpDivisor = 4.5F;
                    RangeModifier = 1.4F;
                    break;
                case FontWarpFactor.Extreme:
                    WarpDivisor = 4F;
                    RangeModifier = 1.5F;
                    break;
                default:
                    return;
            }

            var rectF = new RectangleF(Convert.ToSingle(rect.Left), 0, Convert.ToSingle(rect.Width), rect.Height);

            int hrange = Convert.ToInt32(rect.Height / WarpDivisor);
            int wrange = Convert.ToInt32(rect.Width / WarpDivisor);
            int left = rect.Left - Convert.ToInt32(wrange * RangeModifier);
            int top = rect.Top - Convert.ToInt32(hrange * RangeModifier);
            int width = rect.Left + rect.Width + Convert.ToInt32(wrange * RangeModifier);
            int height = rect.Top + rect.Height + Convert.ToInt32(hrange * RangeModifier);

            if (left < 0)
                left = 0;
            if (top < 0)
                top = 0;
            if (width > Width)
                width = Width;
            if (height > Height)
                height = Height;

            PointF leftTop = RandomPoint(left, left + wrange, top, top + hrange);
            PointF rightTop = RandomPoint(width - wrange, width, top, top + hrange);
            PointF leftBottom = RandomPoint(left, left + wrange, height - hrange, height);
            PointF rightBottom = RandomPoint(width - wrange, width, height - hrange, height);

            PointF[] points = { leftTop, rightTop, leftBottom, rightBottom };
            var m = new Matrix();
            m.Translate(0, 0);
            textPath.Warp(points, rectF, m, WarpMode.Perspective, 0);
        }

        /// <summary>
        /// Add a variable level of graphic noise to the image
        /// </summary>
        /// <param name="g">The graphics1.</param>
        /// <param name="rect">The rect.</param>
        private void AddNoise(Graphics g, Rectangle rect)
        {
            int density;
            int size;

            switch (BackgroundNoise)
            {
                case BackgroundNoiseLevel.None:
                    goto default;
                case BackgroundNoiseLevel.Low:
                    density = 30;
                    size = 40;
                    break;
                case BackgroundNoiseLevel.Medium:
                    density = 18;
                    size = 40;
                    break;
                case BackgroundNoiseLevel.High:
                    density = 16;
                    size = 39;
                    break;
                case BackgroundNoiseLevel.Extreme:
                    density = 12;
                    size = 38;
                    break;
                default:
                    return;
            }

            var br = new SolidBrush(GetRandomColor());
            int max = Convert.ToInt32(Math.Max(rect.Width, rect.Height) / size);

            for (int i = 0; i <= Convert.ToInt32((rect.Width * rect.Height) / density); i++)
                g.FillEllipse(br, _rand.Next(rect.Width), _rand.Next(rect.Height), _rand.Next(max), _rand.Next(max));

            br.Dispose();
        }


        /// <summary>
        /// Add variable level of curved lines to the image
        /// </summary>
        /// <param name="g">The graphics1.</param>
        /// <param name="rect">The rect.</param>
        private void AddLine(Graphics g, Rectangle rect)
        {
            int length;
            float width;
            int linecount;

            switch (LineNoise)
            {
                case LineNoiseLevel.None:
                    goto default;
                case LineNoiseLevel.Low:
                    length = 4;
                    width = Convert.ToSingle(_height / 31.25);
                    linecount = 1;
                    break;
                case LineNoiseLevel.Medium:
                    length = 5;
                    width = Convert.ToSingle(_height / 27.7777);
                    linecount = 1;
                    break;
                case LineNoiseLevel.High:
                    length = 3;
                    width = Convert.ToSingle(_height / 25);
                    linecount = 2;
                    break;
                case LineNoiseLevel.Extreme:
                    length = 3;
                    width = Convert.ToSingle(_height / 22.7272);
                    linecount = 3;
                    break;
                default:
                    return;
            }

            var pf = new PointF[length + 1];
            using (var p = new Pen(GetRandomColor(), width))
            {
                for (int l = 1; l <= linecount; l++)
                {
                    for (int i = 0; i <= length; i++)
                        pf[i] = RandomPoint(rect);

                    g.DrawCurve(p, pf, 1.75F);
                }
            }
        }

        #endregion
    }

    #region Настройки степени защиты изображения
    /// <summary>
    /// Степень искривления шрифта сгенерированного текста
    /// </summary>
    public enum FontWarpFactor
    {
        /// <summary>
        /// Нет
        /// </summary>
        None,
        /// <summary>
        /// Малое
        /// </summary>
        Low,
        /// <summary>
        /// Среднее
        /// </summary>
        Medium,
        /// <summary>
        /// Высокое
        /// </summary>
        High,
        /// <summary>
        /// Экстримальное
        /// </summary>
        Extreme
    }

    /// <summary>
    /// Степень зашумленности фона изображения
    /// </summary>
    public enum BackgroundNoiseLevel
    {
        /// <summary>
        /// Нет
        /// </summary>
        None,
        /// <summary>
        /// Малое
        /// </summary>
        Low,
        /// <summary>
        /// Среднее
        /// </summary>
        Medium,
        /// <summary>
        /// Высокое
        /// </summary>
        High,
        /// <summary>
        /// Экстримальное
        /// </summary>
        Extreme
    }

    /// <summary>
    /// Степень кривизны шумовых линий в изображении
    /// </summary>
    public enum LineNoiseLevel
    {
        /// <summary>
        /// Нет
        /// </summary>
        None,
        /// <summary>
        /// Малое
        /// </summary>
        Low,
        /// <summary>
        /// Среднее
        /// </summary>
        Medium,
        /// <summary>
        /// Высокое
        /// </summary>
        High,
        /// <summary>
        /// Экстримальное
        /// </summary>
        Extreme
    }

    #endregion
}