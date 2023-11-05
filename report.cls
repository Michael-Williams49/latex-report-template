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
\newcommand\@titlelinespread{1}

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
\RequirePackage{subcaption}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[numbered]{bookmark}
\RequirePackage{mathptmx}

% Include optional packages
\RequirePackage{multicol}
\RequirePackage{fontspec}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{chemfig}
\RequirePackage{pgf/tikz}
\RequirePackage{graphicx}
\RequirePackage{mathtools}
\RequirePackage{apacite}
\RequirePackage{pgfplots}

% Set fonts for main text and captions
\setmainfont{Times}
\setsansfont{Helvetica Neue}
\captionsetup[table]{labelsep=quad, labelfont=bf}
\captionsetup[figure]{labelsep=quad, labelfont=bf}
\captionsetup[subfigure]{labelformat=simple}
\captionsetup[subtable]{labelformat=simple}
\renewcommand{\thesubfigure}{\Alph{subfigure}}
\renewcommand{\thesubtable}{\Alph{subtable}}

% Customize page headers and footers using 'fancyhdr
\def\headrulewidth{0pt}
\def\footrulewidth{0pt}

% Define two page styles: 'plain' and 'fancy'
\fancypagestyle{plain}
{
    \fancyhf{}
    \fancyfoot[C]{\small\textsf\thepage}
}
\fancypagestyle{fancy}
{
    \fancyhf{}
    \fancyhead[L]{\parbox[b]{0.5\textwidth}{\raggedright\small\textsf{\textbf\@project}}}
    \fancyhead[R]{\parbox[b]{0.5\textwidth}{\raggedleft\small\textsf{\ifx\@reportnum\@void\else\textbf{No.\ \@reportnum}\quad\fi\@title}}}
    \fancyfoot[C]{\small\textsf\thepage}
    \fancyfoot[L]{\parbox[t]{0.45\textwidth}{\raggedright\small\textsf{\textbf{\@author}\ifx\@id\@void\else\ \textbf{|}\ \@id\fi}}}
    \fancyfoot[R]{\parbox[t]{0.45\textwidth}{\raggedleft\small\textsf\@date}}
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
    \def\@titlelinespread{1.15}
    \linespread{1.35}
    \setCJKmainfont{Songti SC}
    \setCJKsansfont{PingFang SC}
}
\ProcessKeyvalOptions*

% Redefine the '\maketitle' command to customize the title
\renewcommand\maketitle{
    \thispagestyle{plain}
    \linespread{\@titlelinespread}
    \begin{flushleft}
        \sffamily\large\bfseries\ifx\@project\@void\else\@project\quad\fi\ifx\@reportnum\@void\else No.\ \@reportnum\fi\par
    \end{flushleft}
    \begin{flushleft}
        \vskip -0.8em
        \sffamily\LARGE\bfseries\@title\par
        \Large\@subtitle\par
        \vskip -0.7em
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
