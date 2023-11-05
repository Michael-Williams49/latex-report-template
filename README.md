# The `report` Class

The `report` class is a LaTeX template designed to provide a swift, elegant, and modern way to typeset reports, suitable for a wide range of purposes, from documentations to lab reports.

## Features

- Support and optimization for both English and Chinese languages.
- Compatibility with `article` class options.
- Commands for specifying report metadata like ID, project, report number.
- Preloaded with useful packages `xeCJK`, `fontspec`, `graphicx`, `tabularx`, `booktabs`, `caption`, `pgf/tikz`, `chemfig`, etc.
- Modern formatting for titles, sections, subsections, headers, and footers.
- Option for a plain page style that disables headers and footers (use the `swift` option).
- Option for enabling support for Chinese language (use the `zh-cn` option).
- Automatic generation of PDF bookmarks. 

## Installation

1. Download `report.cls`.
2. Save it in the same directory as your `.tex` file. 

Before you can use the `report` class, you'll need to ensure that you have the necessary LaTeX distribution, fonts, and packages installed on your system.

### LaTeX Distribution

You should have a LaTeX distribution installed. There are several LaTeX distributions available, and you can choose one that fits your platform and requirements. Here are some popular options:

- **TeX Live**: TeX Live is a comprehensive and cross-platform LaTeX distribution. You can download it from [TeX Live's website](https://www.tug.org/texlive/).

- **MiKTeX**: MiKTeX is a popular LaTeX distribution for Windows. You can download it from [MiKTeX's website](https://miktex.org/).

- **MacTeX**: If you're on macOS, MacTeX is a distribution designed for Mac. You can download it from [MacTeX's website](http://www.tug.org/mactex/).

### Required Fonts

To use the fonts mentioned in the `report` class, make sure they are installed on your system:

- `Songti SC`: This font is used for the main Chinese text.
- `Times New Roman`: This font is used for the main English text.
- `Helvetica Neue`: This font is used for sans-serif text.
- `PingFang SC`: This font is used for Chinese sans-serif text.

To install fonts on Linux, download the font files and save them to font directories such as `~/.fonts`. Then execute the following command to refresh the font cache and ensure XeLaTeX can find the font files:
```shell
fc-cache -fv
```

On Mac and Windows, simply download the font files and double-click to install them.

### Required Packages

The report class relies on several LaTeX packages to provide its features. Make sure you have the following packages installed:

- `xeCJK`: Provides support for typesetting Chinese text.
- `caption`: Provides better control over captions.
- `subcaption`: Provides support for subfigures, subtables, and supcaptions. 
- `geometry`: Helps you set the page margins.
- `fancyhdr`: Used for customizing headers and footers.
- `titlesec`: Enables the customization of section titles.
- `hyperref`: Remove the ugly red box around references. 
- `bookmark`: Automatically add bookmarks to PDF file according to sections, subsections, etc.
- `mathptmx`: Use `Times New Roman` font for math expressions for better readability. 

### Optional Packages

While the above packages are required for the basic functionality of the report class, you can also consider using the following optional packages based on your specific needs:

- `multicol`: For creating multi-column layouts in your reports.
- `fontspec`: Allows you to customize fonts.
- `graphicx`: Enables the inclusion of images.
- `tabularx`: Enhances the tables in your reports.
- `booktabs`: Improves the formatting of tables.
- `pgf/tikz`: Allows for the inclusion of high-quality graphics.
- `chemfig`: Useful for chemical structures and reactions.
- `mathtools`: Advanced support for mathematical equations and symbols.
- `apacite`: Adds support for citing in APA style.
- `pgfplots`: Enables creating figures and plotting without external figure source. 

Ensure that your LaTeX environment includes these fonts and packages to fully utilize the features of the `report` class.

## Usage

1. In the preamble of your LaTeX document, specify the document class:

    ```latex
    \documentclass{report}
    ```

2. Set the report metadata using the following commands:

    ```latex
    \title{<title>}
    \subtitle{<subtitle>}
    \author{<author>}
    \id{<id>}
    \project{<project name>}
    \reportnum{<number>}
    \date{<date>}
    ```

3. Use the `swift` option to enable plain page style, which disables all headers and footers except the page number:

    ```latex
    \documentclass[swift]{report}
    ```

4. By default the template only supports latin languages. Use the `zh-cn` option to include support for Chinese in your document. You can also use it in combination with the `swift` option:
   
    ```latex
    \documentclass[swift,zh-cn]{report}
    ```

5. Write your report content in sections, subsections, and so on as you normally would.

6. To compile your LaTeX document using the `report` class, it is recommended to use XeLaTeX. 

    ```shell
    xelatex <your-report>.tex
    ```

## Commands

Only `\title{<title>}` is mandatory in the preamble of the `.tex` file. If it is not defined, you will get an error.

The following are optional commands:

- `\author{<author>}`: Replace `<author>` with your name.
- `\project{<project>}`: Replace `<project>` with the name of the project.
- `\id{<id>}`: Replace `<id>` with your ID.
- `\reportnum{<reportnum>}`: Replace `<reportnum>` with the report number.
- `\date{<date>}`: Replace `<date>` with the date of the report; otherwise, the date of rendering will be used.

## Example

To help you get started with the `report` class, here's a simple example of how to create a basic report document using LaTeX. This example assumes that you have already installed the necessary LaTeX distribution, fonts, and packages, as explained in the [Installation](#installation) section.

```latex
\documentclass{report}
\title{Sample Report}
\subtitle{A Simple Example}
\author{John Doe}
\id{8192}
\project{Sample Project}
\reportnum{012}
\date{\today}

\begin{document}

\maketitle

\section{Introduction}

This is the introduction section of your report.

\section{Methodology}

Here, you can describe the methodology or approach used in your report.

\subsection{Subsection}

You can create subsections for more detailed information.

\section{Results}

Present the results of your work here.

\section{Conclusion}

Conclude your report with a summary of the key findings.

\end{document}
```

In this example, we've created a simple LaTeX document using the report class, with the specified metadata and sections. You can customize this template according to your specific report requirements.

To compile this LaTeX document using XeLaTeX, you can use the following command:

```shell
xelatex sample-report.tex
```
This will generate a PDF output of your report. You can adjust the content, formatting, and sections to suit your report's needs.

## License

The `report` class is released under the CC-BY 4.0 license. You are free to modify and reuse this template. [Read the full license](https://creativecommons.org/licenses/by/4.0/).

## Contributing

Contributions to improve the template are welcome! If you have suggestions or enhancements, please open an issue or submit a pull request on GitHub.
