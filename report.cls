% Define the document class 'report' and specify it requires LaTeX2e
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{report}[LaTeX class for typesetting report]

% Load the 'article' class with a 12pt font size
\LoadClass[12pt]{article}

% Define custom commands for various document metadata
\newcommand\@id{}
\newcommand\@project{}
\newcommand\@reportnum{}
\newcommand\@subtitle{}
\newcommand\@void{}

% Define commands for setting metadata values
\newcommand{\id}[1]{\def\@id{#1}}
\newcommand{\project}[1]{\def\@project{#1}}
\newcommand{\reportnum}[1]{\def\@reportnum{#1}}
\newcommand{\subtitle}[1]{\def\@subtitle{#1}}

% Include necessary packages
\RequirePackage[margin=1in]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{caption}

% Include optional packages
\RequirePackage{multicol}
\RequirePackage{fontspec}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{chemfig}
\RequirePackage{pgf/tikz}
\RequirePackage{graphicx}

% Set fonts for main text and captions
\setmainfont{Times}
\setsansfont{Helvetica Neue}
\captionsetup[table]{labelsep=quad, labelfont=bf}
\captionsetup[figure]{labelsep=quad, labelfont=bf}

% Customize page headers and footers using 'fancyhdr
\renewcommand\headrulewidth{0pt}
\renewcommand\footrulewidth{0pt}
\linespread{1.3}

% Define two page styles: 'plain' and 'fancy'
\fancypagestyle{plain}
{
    \fancyhf{}
    \fancyfoot[C]{\small\textsf\thepage}
}
\fancypagestyle{fancy}
{
    \fancyhf{}
    \fancyhead[L]{\small\textsf\@project}
    \fancyhead[R]{\small\textsf{\ifx\@reportnum\@void\else\textbf{No.\ \@reportnum}\quad\fi\@title}}
    \fancyfoot[C]{\small\textsf\thepage}
    \fancyfoot[L]{\small\textsf{\textbf{\@author}\ifx\@id\@void\else\ \textbf{|}\ \@id\fi}}
    \fancyfoot[R]{\small\textsf\@date}
}

% Set the default page style to 'fancy'
\pagestyle{fancy}

% Configure the 'swift' option using 'kvoptions'
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=rp,
  prefix=RP@,
}
\DeclareVoidOption{swift}{\pagestyle{plain}}
\DeclareVoidOption{zh-cn}{
    \RequirePackage{xeCJK}
    \setCJKmainfont{Songti SC}
    \setCJKsansfont{PingFang SC}
}
\ProcessKeyvalOptions*

% Redefine the '\maketitle' command to customize the title
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
        \rule{\linewidth}{1.5pt}
    \end{flushleft}
    \begin{flushleft}
        \vskip -0.8em
        \sffamily\small\textbf{\@author}\ifx\@id\@void\else\ \textbf{|}\ \@id\fi\par
    \end{flushleft}
\par
}

% Customize the appearance of section and subsection titles using 'titlesec'
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
