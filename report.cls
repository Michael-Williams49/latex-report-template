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
\RequirePackage[a4paper,margin=1in]{geometry} % Set page margins
\RequirePackage{fancyhdr} % Custom headers and footers
\RequirePackage{titlesec} % Title and section styling
\RequirePackage{caption} % Customizing captions
\RequirePackage{subcaption} % Subfigures and subcaptions
\RequirePackage[hidelinks]{hyperref} % Hyperlinks (hidden)
\RequirePackage[numbered]{bookmark} % Numbered bookmarks
\RequirePackage{mathptmx} % Times New Roman font for math
\RequirePackage{float} % Improved interface for floating objects
\RequirePackage{framed} % Support for left bars and frames

% Include optional packages
\RequirePackage{multicol} % Multiple columns
\RequirePackage{fontspec} % Advanced font selection in XeLaTeX and LuaLaTeX
\RequirePackage{tabularx} % Extended tabular environment
\RequirePackage{booktabs} % Publication quality tables
\RequirePackage{chemfig} % Easy drawing of chemical structures
\RequirePackage{pgf/tikz} % Powerful tool for creating graphics
\RequirePackage{graphicx} % Enhanced support for graphics
\RequirePackage{mathtools} % Mathematical tools to use with amsmath
\RequirePackage{apacite} % APA style citations and bibliography
\RequirePackage{pgfplots} % Plotting graphs
\RequirePackage{pgfplotstable} % Plotting regression from data points

% Set fonts for main text and captions
\setmainfont{Times} % Set main font to Times New Roman
\setsansfont{Helvetica Neue} % Set sans-serif font

% Set page geometry using the 'geometry' package
\geometry{
    left = 0.6in, % Set left margin to 0.6 inches
    right = 0.6in, % Set right margin to 0.6 inches
    top = 0.9in, % Set top margin to 0.9 inches
    bottom = 0.9in % Set bottom margin to 0.9 inches
}
\renewcommand{\floatpagefraction}{.8} % Independent floating objects page if floating objects occupies more than 80% of page

% Define a new floating environment 'scheme'
\newfloat{scheme}{htbp}{los}
\floatname{scheme}{Scheme} % Define the caption for scheme

% Customize caption settings for different floats
\captionsetup[scheme]{labelsep=quad, labelfont=bf}
\captionsetup[table]{labelsep=quad, labelfont=bf}
\captionsetup[figure]{labelsep=quad, labelfont=bf}
\captionsetup[subfigure]{labelformat=simple}
\captionsetup[subtable]{labelformat=simple}

% Redefine the subfigure and subtable numbering style
\renewcommand{\thesubfigure}{\Alph{subfigure}}
\renewcommand{\thesubtable}{\Alph{subtable}}

% Customize page headers and footers using 'fancyhdr'
\def\headrulewidth{0pt} % Remove header rule
\def\footrulewidth{0pt} % Remove footer rule

% Define two page styles: 'plain' and 'fancy'
\fancypagestyle{plain}{
    % Plain page style without headers, only page number centered in sans-serif
    \fancyhf{}
    \fancyfoot[C]{\small\textsf\thepage}
}
\fancypagestyle{fancy}{
    % Fancy page style with customized headers and footers
    \fancyhf{}
    \fancyhead[L]{\parbox[b]{0.3\textwidth}{\raggedright\small\textsf{\textbf\@project}}}
    \fancyhead[R]{\parbox[b]{0.7\textwidth}{\raggedleft\small\textsf{\ifx\@reportnum\@void\else\textbf{No.\ \@reportnum}\quad\fi\@title}}}
    \fancyfoot[C]{\small\textsf\thepage}
    \fancyfoot[L]{\parbox[t]{0.45\textwidth}{\raggedright\small\textsf{\textbf{\@author}\ifx\@id\@void\else\ \textbf{|}\ \@id\fi}}}
    \fancyfoot[R]{\parbox[t]{0.45\textwidth}{\raggedleft\small\textsf\@date}}
}

% Set the default page style to 'fancy'
\pagestyle{fancy}

% Configure options using 'kvoptions'
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=rp,
    prefix=RP@,
}
% Define options 'swift' and 'zh-cn'
\DeclareVoidOption{swift}{
    \geometry{
        left = 0.6in, % Set left margin to 0.6 inches
        right = 0.6in, % Set right margin to 0.6 inches
        top = 0.6in, % Set top margin to 0.9 inches
        bottom = 0.9in % Set bottom margin to 0.9 inches
    }
    \pagestyle{plain}
} % Option 'swift' changes page style to plain
\DeclareVoidOption{zh-cn}{
    % Option 'zh-cn' for Chinese document settings
    \RequirePackage{xeCJK} % Chinese typesetting support
    \def\@titlelinespread{1.15} % Adjust title line spread for Chinese text
    \linespread{1.35} % Set line spread for Chinese text
    \setCJKmainfont{Songti SC} % Set main Chinese font
    \setCJKsansfont{PingFang SC} % Set sans-serif Chinese font
}
\ProcessKeyvalOptions* % Process options

% Redefine the '\maketitle' command to customize the title
\renewcommand\maketitle{
    \thispagestyle{plain} % Set title page style to plain
    \linespread{\@titlelinespread} % Set line spread for title
    % Title section formatting
    \begin{flushleft}
        \begin{leftbar}
            \sffamily\large\bfseries\ifx\@project\@void\else\@project\quad\fi\ifx\@reportnum\@void\else No.\ \@reportnum\fi\par
            \vskip 0.1em
            \sffamily\LARGE\bfseries\@title\par
            \vskip 0.1em
            \Large\@subtitle\par
            \vskip -0.7em
            \rule{\linewidth}{1.5pt} % Horizontal line
            \vskip 0.1em
            \sffamily\small\textbf{\@author}\ifx\@id\@void\else\ \textbf{|}\ \@id\fi\par
        \end{leftbar}
    \end{flushleft}
\par
}

% Define 'abstract' environment
\renewenvironment{abstract}{
    \list{}{\leftmargin=1em \rightmargin=1em}
    \item\relax
    \textbf{\small\textsf\abstractname}
    \;\small
}{\endlist}

% Define 'keywords' environment
\newenvironment{keywords}{
    \list{}{\leftmargin=1em \rightmargin=1em}
    \item\relax
    \textbf{\small\textsf{Keywords}}
    \;\small
}{\endlist\smallskip}

% Define quote and quotation environments with a left bar
\renewenvironment{quote}{
    \list{}{\leftmargin=0.5em \rightmargin=1.5em}
    \begin{leftbar}
    \item\relax
}{
    \end{leftbar}
    \endlist
}

\renewenvironment{quotation}{
    \list{}{
        \listparindent 1.5em
        \itemindent \listparindent
        \leftmargin=0.5em \rightmargin=1.5em
        \parsep 1em}
    \begin{leftbar}
    \item\relax
}{
    \end{leftbar}
    \endlist
}

% Customize the appearance of section and subsection titles using 'titlesec'
\titleformat{\section}
    {\sffamily\bfseries\Large}
    {\thesection}
    {1em}
    {}
    [{\titlerule[1pt]}] % Add a rule under the section title

\titleformat{\subsection}
    {\sffamily\bfseries\large}
    {\thesubsection}
    {1em}
    {}
