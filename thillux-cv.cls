% Intro Options
\ProvidesClass{thillux-cv}[2015/06/17 thillux's class for resumes]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{scrartcl}
}
\ProcessOptions\relax
\LoadClass{scrartcl}

% Package Imports
\RequirePackage[hmargin=1.25cm, top=1cm,bottom=2.5cm]{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage[utf8]{luainputenc}
\RequirePackage{fontspec}
\RequirePackage{hyperref}
\RequirePackage{ngerman}
\RequirePackage{paracol}
\RequirePackage{titlesec}
\RequirePackage{wasysym}

\newenvironment{Figure}
  {\par\medskip\noindent\minipage{\linewidth}}
  {\endminipage\par\medskip}

\setlength{\parindent}{0pt}

% Color definitions
\definecolor{primaryTextColor}{HTML}{2b2b2b}
\definecolor{headingsColor}{HTML}{343838}
\definecolor{descriptColor}{HTML}{7C7C7C}
\definecolor{contactColor}{HTML}{8C8C8C}

% Font definitions
\setmainfont[Color=primaryTextColor,%
             Path=fonts/source-sans-pro/,%
             BoldItalicFont=SourceSansPro-It,%
             BoldFont=SourceSansPro-Bold,ItalicFont=SourceSansPro-LightIt]%
             {SourceSansPro-Light}
\setsansfont[Scale=MatchLowercase,%
             Mapping=tex-text,%
             Path = fonts/source-sans-pro/]%
             {SourceSansPro-Light}

% Name command
\newcommand{\namesection}[3]{
    % Image
    \begin{minipage}{0.2\textwidth}
        \begin{Figure}
            \includegraphics[width=\columnwidth]{#3}
        \end{Figure}
    \end{minipage}
    \hfill
    % Name
    \begin{minipage}{0.5\textwidth}
        \centering{
            \fontsize{43pt}{63pt}
            \fontspec[Path = fonts/lato/]{Lato-Light}\selectfont #1
        } \\[1ex]
        \centering{ %
            \color{contactColor}
            \fontspec[Path = fonts/source-sans-pro/]
            {SourceSansPro-Regular}
            \fontsize{11pt}{14pt}
            \selectfont #2
        } %
    \end{minipage}

    \vspace{1ex}

    % Line
    \noindent\makebox[\linewidth]{
    	\color{headingsColor}
    	\rule{\paperwidth}{0.4pt}
    }

    \vspace{1ex}
}

% My Bold
\newcommand{\boldKeyword}[1]{
    \fontspec[Path = fonts/source-sans-pro/]
    {SourceSansPro-Regular}
    \fontsize{11pt}{14pt}\selectfont {#1} \normalfont
}

% Section seperators
\titlespacing{\section}{0pt}{0.5ex}{1ex}

% headings command
\titleformat{\section}{
    \color{headingsColor} %
    %\scshape %
    \fontspec[Path = fonts/source-sans-pro/]{SourceSansPro-Regular} %
    \fontsize{16pt}{24pt}\selectfont %
}{}{0em}{}

\renewcommand{\labelitemi}{$\bullet$}

% Bullet Lists with fewer gaps command
\newenvironment{tightemizeLeft}{
    \vspace{-\topsep} %
    \begin{list}{\labelitemi}{\leftmargin=1em \parskip=1pt \parsep=1pt} %
}{
    \end{list}\vspace{-\topsep}
}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{
    \begin{list}{\labelitemi}{\parskip=1pt \parsep=1pt} %
}{
    \end{list}
}

% Descriptors command
\newcommand{\descript}[1]{
    \color{descriptColor} %
    \fontspec[Path = fonts/source-sans-pro/]{SourceSansPro-Regular} %
    \fontsize{11pt}{13pt}\selectfont {#1} \normalfont %
}

% Location command
\newcommand{\location}[1]{
    \color{headingsColor}
    \fontspec[Path = fonts/source-sans-pro/]{SourceSansPro-Light}
    \fontsize{10pt}{12pt}\selectfont {#1} \normalfont
}

% List entry with date and location
\newcommand{\dateEntry}[4]{%
    \columnratio{0.15,0.8}
    \begin{paracol}{2}
    #1 %
    \switchcolumn %
    \boldKeyword{#2} %
    \hfill %
    \location{#3}\\%
    #4 %
    \end{paracol} %
    \vspace{1ex}
}

% List entry with keyword and value
\newcommand{\keywordEntry}[2]{%
    \columnratio{0.18,0.8}
    \begin{paracol}{2}
    \boldKeyword{#1} %
    \switchcolumn %
    #2
    \end{paracol} %
    \vspace{0.5ex}
}
