% Declare that this document class file requires at least LaTeX version 2e.
\NeedsTeXFormat{LaTeX2e}

% Provide the name of your document class, the date it was last updated, and a comment about what it's used for
\ProvidesClass{ldbeamer}[2019/08/05 Dan's custom LaTeX document style]

% We'll pass any document class options along to the underlying class
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{beamer}% or book or whatever
}

% Now we'll execute any options passed in
\ProcessOptions\relax

% Instead of defining each and every little detail required to create a new document class,
% you can base your class on an existing document class.
\LoadClass{beamer}% or book or whatever you class is closest to

% Now paste your code from the preamble here.
% Replace \usepackage with \RequirePackage. (The syntax for both commands is the same.)
\RequirePackage{ctex}
\RequirePackage{calc}
\RequirePackage{mdwlist}
\RequirePackage{multirow}
\RequirePackage{cancel}
\RequirePackage{adjustbox}
\RequirePackage{hyperref}
\RequirePackage{pgf,tikz}
\RequirePackage[beamer,customcolors]{hf-tikz}
\RequirePackage{amsmath}
\RequirePackage{caption}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{fontspec}

\setmainfont[Ligatures=TeX]{Times New Roman}
\setCJKsansfont[ItalicFont={AR PL UKai CN},BoldFont={Source Han Serif CN}]{Source Han Sans CN}

\usetikzlibrary{patterns,calc,arrows,shapes,positioning}
\tikzstyle{every picture}+=[remember picture]

\usetheme{CambridgeUS}
\usecolortheme{dolphin}

\setbeamercolor{uppercol}{fg=white,bg=blue!50!black}
\setbeamercolor{lowercol}{fg=black,bg=green!10!white}
\setbeamertemplate{blocks}[rounded][shadow=true]
\newenvironment{tightcenter}{%
  \setlength\topsep{0pt}
  \setlength\parskip{0pt}
  \begin{center}
}{%
  \end{center}
}

\newcommand{\vect}[1]{\boldsymbol{#1}}

\AtBeginDocument{
\author{ 李~丹 }
\institute{武汉大学水利水电学院}
\date{\today}

\AtBeginSection[]{
\begin{frame}[allowframebreaks]%
\frametitle{目录}
\tableofcontents[currentsection, hideallsubsections]
\end{frame}
}
}

% Finally, we'll use \endinput to indicate that LaTeX can stop reading this file. LaTeX will ignore anything after this line.
\endinput
