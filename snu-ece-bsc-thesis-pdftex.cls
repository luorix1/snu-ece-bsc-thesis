%%
%% This is file `snu-ece-bsc-thesis-pdftex.cls'.
%%
%% -----------------------------------------------------------------
%% The snu-ece-bsc-thesis class --- A class for SNU ECE BSc theses
%% Maintained by Jay Lee
%% E-mail: jaeho.lee@snu.ac.kr
%% Released under the MIT License.
%% -----------------------------------------------------------------
%%
\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\ProvidesClass{snu-ece-bsc-thesis-pdftex}[2023/09/08 v0.1 A class for SNU ECE BSc theses]

%%%%%%%%%%%%%%%%%%%%%%%%%
% Options for the class %
%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifenglish
\DeclareOption{en}{\englishtrue}
\DeclareOption{ko}{\englishfalse}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PDFTeX required %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Language-specific settings %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\abstractnameko}{초~록}
\newcommand{\contentsnameko}{목~차}
\newcommand{\listtablenameko}{표~목차}
\newcommand{\listfigurenameko}{그림~목차}
\newcommand{\abstractnameen}{Abstract}
\newcommand{\contentsnameen}{Contents}
\newcommand{\listtablenameen}{List~of~Tables}
\newcommand{\listfigurenameen}{List~of~Figures}
\newcommand{\abstractstyleko}{초\hspace{3cm}록}
\newcommand{\abstractstyleen}{ABSTRACT}

\ifenglish
  \LoadClass[11pt, a4paper]{report}
  \RequirePackage[doublespacing]{setspace}
  \RequirePackage{caption}
  % If the setspace is used in conjunction with the caption package,
  % the caption will be typeset with single spacing as default.
  \captionsetup[table]{font=onehalfspacing}
  \captionsetup[figure]{font=onehalfspacing}

  \renewcommand{\abstractname}{\abstractstyleen}
  \renewcommand{\contentsname}{\contentsnameen}
  \renewcommand{\listtablename}{\listtablenameen}
  \renewcommand{\listfigurename}{\listfigurenameen}

  % Title and ToC Formatting
  \RequirePackage{titlesec}
  \titlespacing*{\chapter}{0pt}{-10mm}{10mm}
  \titleformat{\chapter}[block]{\centering \huge \bfseries}{Chapter \thechapter}{22pt}{}
\else
  \LoadClass[10pt, a4paper]{report}
  \RequirePackage{kotex}
  \RequirePackage[doublespacing]{setspace}
  \RequirePackage[list=off, bi-separator=smallskip, font=onehalfspacing]{bicaption}
  \bicaptionsetup[table]{name=표}{name=Table}
  \bicaptionsetup[figure]{name=그림}{name=Figure}

  \renewcommand{\abstractname}{\abstractstyleko}
  \renewcommand{\contentsname}{\contentsnameko}
  \renewcommand{\listtablename}{\listtablenameko}
  \renewcommand{\listfigurename}{\listfigurenameko}

  % Title and ToC Formatting
  \RequirePackage{titlesec}
  \titlespacing*{\chapter}{0pt}{-10mm}{10mm}
  \titleformat{\chapter}[block]{\centering \huge \bfseries}{제 \thechapter 장}{20pt}{}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%
% Package dependencies %
%%%%%%%%%%%%%%%%%%%%%%%%
% Subfigures
\RequirePackage{subcaption}
% Images
\RequirePackage{graphicx}
% Tables
\RequirePackage{tabularray}
\UseTblrLibrary{booktabs}
% Math
\RequirePackage{amssymb,amsmath,mathtools}
\RequirePackage{xcolor}
% Bibliography
\RequirePackage[style=ieee]{biblatex}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page layout configuration %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\addtolength{\hoffset}{-1in}
\addtolength{\voffset}{-1in}
\setlength{\topmargin}{30mm}
\setlength{\headheight}{0mm}
\setlength{\headsep}{0mm}
\setlength{\marginparwidth}{0mm}
\setlength{\marginparsep}{0mm}
\setlength{\oddsidemargin}{25mm}
\setlength{\textwidth}{160mm}
\setlength{\textheight}{227mm}
\setlength{\footskip}{20mm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Document metadata fields %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\authorspaced}{\@author}
\newcommand{\advisor}[1]{\newcommand*\@advisor{#1}}
\newcommand{\approvaldate}[1]{\newcommand*\@approvaldate{#1}}
\newcommand{\koreankeywords}[1]{\newcommand{\@koreankeywords}{#1}}
\newcommand{\englishkeywords}[1]{\newcommand{\@englishkeywords}{#1}}

\AtBeginDocument{
  \hypersetup{
    colorlinks,
    linkcolor={black},
    citecolor={red!73!black},
    urlcolor={blue!60!black},
    pdflang={\ifenglish en\else ko\fi},
    pdfsubject={공학 학사 학위논문},
    pdfkeywords={\ifenglish\@englishkeywords\else\@koreankeywords\fi}
  }
}

% Redefine \maketitle
\AtBeginDocument{
  % hyperref package redefines \@maketitle
  \def\maketitle{
    \newpage
    \null
    % 외표지
    \thispagestyle{empty}
    \begin{center}
      \fontsize{16pt}{19pt}\selectfont
      공학 학사 학위논문 \\
      \vspace{2cm}
      \fontsize{21pt}{25pt}\selectfont
      \@title \\
      \vfill
      \fontsize{16pt}{19pt}\selectfont
      \@date \\
      \vspace{4cm}
      서울대학교 공과대학 \\
      \vspace{1cm}
      전기·정보공학부 \\
      \vspace{1cm}
      \authorspaced
    \end{center}
    \newpage
    % 인준지
    \thispagestyle{empty}
    \begin{center}
      \fontsize{21pt}{25pt}\selectfont
      \@title \\
      \vspace{1cm}
      \fontsize{16pt}{19pt}\selectfont
      지도교수 \@advisor \\
      \vspace{1cm}
      이 논문을 공학 학사학위 논문으로 제출함. \\
      \vfill
      서울대학교 공과대학 \\
      \vspace{1cm}
      전기·정보공학부 \\
      \authorspaced \\
      \vspace{1cm}
      \@approvaldate \\
      \vspace{1cm}
      지도교수 \hspace{1.5cm} \@advisor \hspace{1.5cm} (인)
    \end{center}
    \newpage
  }
}

% Redefine \baselinestretch for ToCs
\let\@starttoc@orig\@starttoc
\def\@starttoc#1{
  \begin{onehalfspace}
    \@starttoc@orig{#1}
  \end{onehalfspace}
}
