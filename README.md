\documentclass{article}
\usepackage[utf8]{inputenc}
\usepackage[russian]{babel}
\usepackage{amsmath}
\usepackage{indentfirst}
\usepackage{hyperref}

 \begin{document}

\begin{center}
\hfill \break
\hfill \break
\hfill \break
\hfill \break
\hfill \break
\hfill \break
\hfill \break
\hfill \break

\large{Национальный исследовательский университет}

\LARGE{\textbf{«Университет ИТМО»}}\\
\hfill \break
\normalsize{Факультет информационных технологий и программирования}\\
 \hfill \break
\normalsize{Кафедра прикладной математики и информатики}\\
\hfill \break
\huge{Странные аттракторы}\\
\hfill \break
\large{Владислав Павлов, Данила Курябов M3236}\\

\hfill \break
\hfill \break
\hfill \break
\hfill \break
\hfill \break
\hfill \break
\hfill \break
\hfill \break
\hfill \break
\hfill \break
\hfill \break
\hfill \break
\hfill \break
\hfill \break
\hfill \break
\hfill \break

\small{Январь 2021\\
Санкт-Петербург}

\end{center}

\newpage

\section{Введение}

\large
Аттрактор — компактное подмножество фазового пространства динамической системы, все траектории из некоторой окрестности которого стремятся к нему при времени, стремящемся к бесконечности. Странный аттрактор — это притягивающее множество неустойчивых траекторий в фазовом пространстве диссипативной динамической системы. В отличие от аттрактора, не является многообразием, то есть не является кривой или поверхностью.

Рассмотрим два странных аттрактора: аттрактор Лоренца и аттрактор Chen - Lee. 

\newpage

\section{Аттрактор Лоренца}

Аттрактор Лоренца описывается следующей системой дифференциальных уравнений:

\begin{equation}
    \begin{cases}
        $$\overset{.}{x} = a * (y - x)$$
        \\
        $$\overset{.}{y} = x * (b - z) - y$$
        \\
        $$\overset{.}{z} = x * y - c * z$$
    \end{cases}
\end{equation}\\

Распишем ту же систему через дифференциалы. Заметим, что каждое уравнение можно рассматривать как последовательность.

\begin{equation}
    \begin{cases}
        $$\partial x = a * (y - x) * \partial t = x^{}_{n + 1} - x^{}_{n}$$
        \\
        $$\partial y = (x * (b - z) - y)  * \partial t = y^{}_{n + 1} - y^{}_{n}$$
        \\
        $$\partial z = (x * y - c * z) * \partial t = z^{}_{n + 1} - z^{}_{n}$$
    \end{cases}
\end{equation}\\

Выражаем следующюю (n + 1) точку по координатно из координат, полученных на предыдущем шаге (n). Таким образом, получаем систему рекурсивно заданных уравнений. 

\begin{equation}
    \begin{cases}
        $$x^{}_{n + 1} = x^{}_{n} + a * (y^{}_{n} - x^{}_{n}) * \partial t$$
        \\
        $$y^{}_{n + 1} = y^{}_{n} + (x^{}_{n} * (b - z^{}_{n}) - y^{}_{n})  * \partial t$$
        \\
        $$z^{}_{n + 1} = z^{}_{n} + (x^{}_{n} * y^{}_{n} - c * z^{}_{n}) * \partial t$$
    \end{cases}
\end{equation}\\

Так как каждое уравнение в системе задано рекукрсивно необходимо задать начальные значения. 

\begin{equation}
    \begin{cases}
        $$x^{}_{0} = 0.1$$
        \\
        $$y^{}_{0} = 0.1$$
        \\
        $$z^{}_{0} = 0.1$$
    \end{cases}
\end{equation}\\

Таким образом, подставив значения параметров (a, b, c), получим решение для данной системы и смоделируем его.

\newpage


\section{Аттрактор Chen - Lee}

Аттрактор Chen - Lee описывается следующей системой дифференциальных уравнений:

\begin{equation}
    \begin{cases}
        $$\overset{.}{x} = a * x - y * z$$
        \\
        $$\overset{.}{y} = b * y + x * z$$
        \\
        $$\overset{.}{z} = c * z + \frac{x * y}{3}$$
    \end{cases}
\end{equation}\\

Распишем ту же систему через дифференциалы. Заметим, что каждое уравнение можно рассматривать как последовательность.

\begin{equation}
    \begin{cases}
        $$\partial x = (a * x - y * z) * \partial t = x^{}_{n + 1} - x^{}_{n}$$
        \\
        $$\partial y = (b * y + x * z)  * \partial t = y^{}_{n + 1} - y^{}_{n}$$
        \\
        $$\partial z = (c * z + \frac{x * y}{3}) * \partial t = z^{}_{n + 1} - z^{}_{n}$$
    \end{cases}
\end{equation}\\

Выражаем следующюю (n + 1) точку по координатно из координат, полученных на предыдущем шаге (n). Таким образом, получаем систему рекурсивно заданных уравнений. 

\begin{equation}
    \begin{cases}
        $$x^{}_{n + 1} = x^{}_{n} + (a * x^{}_{n} - y^{}_{n} * z^{}_{n}) * \partial t$$
        \\
        $$y^{}_{n + 1} = y^{}_{n} + (b * y^{}_{n} + x^{}_{n} * z^{}_{n})  * \partial t$$
        \\
        $$z^{}_{n + 1} = z^{}_{n} + (c * z^{}_{n} + \frac{x^{}_{n} * y^{}_{n}}{3}) * \partial t$$
    \end{cases}
\end{equation}\\

Так как каждое уравнение в системе задано рекукрсивно необходимо задать начальные значения. 

\begin{equation}
    \begin{cases}
        $$x^{}_{0} = 0.1$$
        \\
        $$y^{}_{0} = 0.1$$
        \\
        $$z^{}_{0} = 0.1$$
    \end{cases}
\end{equation}\\

Таким образом, подставив значения параметров (a, b, c), получим решение для данной системы и смоделируем его.

\newpage

\section{Описание модели}
\large
Программа моделирует решение системы: строит аттрактор для указанных параметров. В центре окна запущенной программы изображается трехмерная система координат. Значения параметров (a, b, c) задаются с помощью ползунков снизу. Программа отрисовывает полученную систему в режиме реального времени.

\section{Список литературы}
\begin{center}
    \href{http://www.fizmatlit.narod.ru/webrary/kuzn/CHAPTER3.pdf}{Аттрактор Лоренца}\\
    \href{http://www.3d-meier.de/tut5/Seite2.html}{Lorenz Attraktor}\\
    \href{https://www.deviantart.com/chaoticatmospheres/art/Strange-Attractors-The-Chen-Lee-Attractor-375986645}{Изображение Аттрактора Chen - Lee}
\end{center}


\end{document}
