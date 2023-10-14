\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{report}[LaTeX class for typesetting report]

\LoadClass[12pt]{article}

\newcommand\@id{}
\newcommand\@project{}
\newcommand\@reportnum{}
\newcommand\@subtitle{}
\newcommand\@void{}

\newcommand{\id}[1]{\def\@id{#1}}
\newcommand{\project}[1]{\def\@project{#1}}
\newcommand{\reportnum}[1]{\def\@reportnum{#1}}
\newcommand{\subtitle}[1]{\def\@subtitle{#1}}
 
\RequirePackage[margin=1in]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{xeCJK}
\RequirePackage{fontspec}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage{chemfig}
\RequirePackage{pgf/tikz}
\RequirePackage{graphicx}
\RequirePackage{titlesec}

\setCJKmainfont{SimSong}
\setmainfont{Times New Roman}
\setsansfont{Helvetica}
\setCJKsansfont{PingFang SC}
\captionsetup[table]{labelsep=quad}
\captionsetup[figure]{labelsep=quad}
\renewcommand\headrulewidth{0pt}
\renewcommand\footrulewidth{0pt}
\linespread{1.5}

\fancypagestyle{plain}
{
    \fancyhf{}
    \fancyfoot[C]{\small\textsf\thepage}
}
\fancypagestyle{fancy}
{
    \fancyhf{}
    \fancyhead[L]{\small\textsf\@project}
    \fancyhead[R]{\small\textsf{\ifx\@reportnum\@void\else No.\ \@reportnum\quad\fi\@title}}
    \fancyfoot[C]{\small\textsf\thepage}
    \fancyfoot[L]{\small\textsf{\@author\ifx\@id\@void\else\ |\ \@id\fi}}
    \fancyfoot[R]{\small\textsf\@date}
}

\pagestyle{fancy}

\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=rp,
  prefix=RP@,
}
\DeclareVoidOption{swift}{\pagestyle{plain}}
\ProcessKeyvalOptions*

\renewcommand\maketitle{
    \thispagestyle{plain}
    \linespread{1.2}
    \begin{flushleft}
        \sffamily\large\bfseries\@project\ifx\@reportnum\@void\else\quad No.\ \@reportnum\fi\par
    \end{flushleft}
    \begin{flushleft}
        \vskip -1em
        \sffamily\LARGE\bfseries\@title\par
        \Large\@subtitle\par
        \vskip -0.8em
        \rule{\textwidth}{1.5pt}
    \end{flushleft}
    \begin{flushleft}
        \vskip -0.8em
        \sffamily\small\@author\ifx\@id\@void\else\ | \@id\fi\par
    \end{flushleft}
\par
}

\titleformat{\section}
    {\sffamily\bfseries\Large}
    {\thesection}
    {1em}
    {}
    [{\titlerule[1pt]}]

\titleformat{\subsection}
    {\sffamily\bfseries\large}
    {\thesubsection}
    {1em}
    {}