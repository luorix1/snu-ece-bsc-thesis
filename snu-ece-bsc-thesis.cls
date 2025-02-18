%%
%% This is file `snu-ece-bsc-thesis.cls'.
%%
%% -----------------------------------------------------------------
%% The snu-ece-bsc-thesis class --- A class for SNU ECE BSc theses
%% Maintained by Jay Lee
%% E-mail: jaeho.lee@snu.ac.kr
%% Released under the MIT License.
%% -----------------------------------------------------------------
%%
\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\RequirePackage{expl3}
\ProvidesExplClass
  {snu-ece-bsc-thesis}
  {2023/09/08}
  {0.1}
  {A class for SNU ECE BSc theses}


%%%%%%%%%%%%%%%%%%%%%%%%%
% Options for the class %
%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareKeys {
  en .code = { \bool_set_true:N \l_snu_ece_bsc_thesis_en_bool },
  ko .code = { \bool_set_false:N \l_snu_ece_bsc_thesis_en_bool },
}
\SetKeys { ko }
\ProcessKeyOptions


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% XeLaTeX or LuaLaTeX required %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{iftex}
\ifXeTeX\else\ifLuaTeX\else
  \ClassError {snu-ece-bsc-thesis}
    { This~class~only~supports~XeLaTeX~and~LuaLaTeX. }
    { Please~use~either~XeLaTeX~or~LuaLaTeX. }
\fi\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Language-specific settings %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\tl_const:Nn \l_snu_ece_bsc_thesis_abstractname_ko { 초~록 }
\tl_const:Nn \l_snu_ece_bsc_thesis_contentsname_ko { 목~차 }
\tl_const:Nn \l_snu_ece_bsc_thesis_listtablename_ko { 표~목차 }
\tl_const:Nn \l_snu_ece_bsc_thesis_listfigurename_ko { 그림~목차 }
\tl_const:Nn \l_snu_ece_bsc_thesis_abstractname_en { Abstract }
\tl_const:Nn \l_snu_ece_bsc_thesis_contentsname_en { Contents }
\tl_const:Nn \l_snu_ece_bsc_thesis_listtablename_en { List~of~Tables }
\tl_const:Nn \l_snu_ece_bsc_thesis_listfigurename_en { List~of~Figures }

\tl_const:Nn \l_snu_ece_bsc_thesis_abstractstyle_ko { 초\hspace{3cm}록 }
\tl_const:Nn \l_snu_ece_bsc_thesis_abstractstyle_en { ABSTRACT }

\bool_if:NTF \l_snu_ece_bsc_thesis_en_bool
  { % English main
    \LoadClass[11pt, a4paper]{report}
    \RequirePackage{kotex}


    \RequirePackage[doublespacing]{setspace}
    \RequirePackage{caption}
    % If the setspace is used in conjuction with the caption package,
    % the caption will be typeset with single spacing as default.
    \captionsetup[table]{font=onehalfspacing}
    \captionsetup[figure]{font=onehalfspacing}

    \let\abstractname\l_snu_ece_bsc_thesis_abstractstyle_en
    \let\contentsname\l_snu_ece_bsc_thesis_contentsname_en
    \let\listtablename\l_snu_ece_bsc_thesis_listtablename_en
    \let\listfigurename\l_snu_ece_bsc_thesis_listfigurename_en

    % Title and ToC Formatting
    \RequirePackage{titlesec}

    \titlespacing*{\chapter}{0pt}{-10mm}{10mm}
    \titleformat{\chapter}[block]{\centering \huge \bfseries}
                {Chapter\ \thechapter}{22pt}{}
  }
  { % Korean main
    \LoadClass[10pt, a4paper]{report}
    \RequirePackage[hangul]{kotex}

    \RequirePackage[doublespacing]{setspace}
    \RequirePackage[
      list=off,
      bi-separator=smallskip,
      font=onehalfspacing
    ]{bicaption}
    \bicaptionsetup[table]{name=표}{name=Table}
    \bicaptionsetup[figure]{name=그림}{name=Figure}

    \let\abstractname\l_snu_ece_bsc_thesis_abstractstyle_ko
    \let\contentsname\l_snu_ece_bsc_thesis_contentsname_ko
    \let\listtablename\l_snu_ece_bsc_thesis_listtablename_ko
    \let\listfigurename\l_snu_ece_bsc_thesis_listfigurename_ko

    % Title and ToC Formatting
    \RequirePackage{titlesec}

    \titlespacing*{\chapter}{0pt}{-10mm}{10mm}
    \titleformat{\chapter}[block]{\centering \huge \bfseries}
                {제\ \thechapter\ 장}{20pt}{}
  }


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
\RequirePackage{amssymb,amsmath,mathtools} % Before unicode-math
% \RequirePackage[math-style=TeX,bold-style=TeX]{unicode-math}

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
\clist_new:N \l_snu_ece_bsc_thesis_keywords_ko_clist
\clist_new:N \l_snu_ece_bsc_thesis_keywords_en_clist

\newcommand\authorspaced{
  \tl_map_inline:Nn { \@author } { ##1~ }
}

\NewDocumentCommand \advisor { m }
  { \newcommand*\@advisor{#1} }
\NewDocumentCommand \approvaldate { m }
  { \newcommand*\@approvaldate{#1} }
\NewDocumentCommand \koreankeywords { m }
  {
    \clist_set:Nn \l_snu_ece_bsc_thesis_keywords_ko_clist { #1 }
  }
\NewDocumentCommand \englishkeywords { m }
  {
    \clist_set:Nn \l_snu_ece_bsc_thesis_keywords_en_clist { #1 }
  }

% https://github.com/latex3/hyperref/issues/242#issuecomment-1149845979
\AddToHook {begindocument/before} {
  \hypersetup{
    colorlinks,
    linkcolor={black},
    citecolor={red!73!black},
    urlcolor={blue!60!black},

    pdflang = { \bool_if:NTF \l_snu_ece_bsc_thesis_en_bool { en } { ko } },
    pdfsubject = {공학~학사~학위논문},
    pdfkeywords = {
      \clist_use:Nnnn \l_snu_ece_bsc_thesis_keywords_en_clist { , } { , } { , },
      \clist_use:Nnnn \l_snu_ece_bsc_thesis_keywords_ko_clist { , } { , } { , }
    },
  }
}

% Redefine \maketitle
\AtBeginDocument {
  % hyperref package redefines \@maketitle
  \def\HyOrg@maketitle{
    \newpage
    \null

    % 외표지
    \thispagestyle{empty}
    \begin{center}
      \fontsize{16pt}{19pt}\selectfont
      공학~학사~학위논문 \\
      \vspace{2cm}
      \fontsize{21pt}{25pt}\selectfont
      \@title \\
      \vfill
      \fontsize{16pt}{19pt}\selectfont
      \@date \\
      \vspace{4cm}
      서울대학교~공과대학 \\
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
      지도교수~\@advisor \\
      \vspace{1cm}
      이~논문을~공학~학사학위~논문으로~제출함. \\
      \vfill
      서울대학교~공과대학 \\
      \vspace{1cm}
      전기·정보공학부 \\
      \authorspaced \\
      \vspace{1cm}
      \@author 의~학사~학위~논문을~인준함. \\
      \vspace{1cm}
      \@approvaldate \\
      \vspace{1cm}
      지도교수 \hspace{1.5cm} \tl_map_inline:Nn { \@advisor } { ##1~ }
\hspace{1.5cm} (인)
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

\cs_generate_variant:Nn \text_purify:n {V}
\cs_generate_variant:Nn \text_purify:n {e}

\RenewDocumentEnvironment { abstract } { o }
  {
    \IfValueTF { #1 }
      {
        \tl_if_eq:nnTF { #1 } { ko }
          { % Korean abstract
            \chapter*{\l_snu_ece_bsc_thesis_abstractstyle_ko}
            \addcontentsline{toc}{chapter}
              {\text_purify:V\l_snu_ece_bsc_thesis_abstractname_ko}
          }
          {
            \tl_if_eq:nnTF { #1 } { en }
              { % English abstract
                \chapter*{\l_snu_ece_bsc_thesis_abstractstyle_en}
                \addcontentsline{toc}{chapter}
                  {\text_purify:V\l_snu_ece_bsc_thesis_abstractname_en}
              }
              { % Unrecognized language
                \ClassError { snu-ece-bsc-thesis }
                  { Unrecognized~language:~`#1' }
                  { Please~use~either~`ko'~or~`en' }

                \chapter*{\abstractname}
                \addcontentsline{toc}{chapter}{\abstractname}
              }
          }
      }
      { % No language specified
        \tl_if_eq:NNTF \abstractname \l_snu_ece_bsc_thesis_abstractstyle_ko
          { % Abstract name is unchanged in Korean environment
            \chapter*{\abstractname}
            \addcontentsline{toc}{chapter}
              {\text_purify:V\l_snu_ece_bsc_thesis_abstractname_ko}
          }
          {
            \tl_if_eq:NNTF \abstractname \l_snu_ece_bsc_thesis_abstractstyle_en
              { % Abstract name is unchanged in English environment
                \chapter*{\abstractname}
                \addcontentsline{toc}{chapter}
                  {\text_purify:V\l_snu_ece_bsc_thesis_abstractname_en}
              }
              {
                \chapter*{\abstractname}
                \addcontentsline{toc}{chapter}{\abstractname}
              }
          }
      }
  }
  {
    \vfill
    \IfValueTF { #1 }
      {
        \tl_if_eq:nnTF { #1 } { ko }
          { % Korean abstract
            \noindent 주요어: \clist_use:Nnnn \l_snu_ece_bsc_thesis_keywords_ko_clist { ,~ } { ,~ } { ,~ }
          }
          {
            \tl_if_eq:nnTF { #1 } { en }
              { % English abstract
              \noindent Keywords:~\clist_use:Nnnn \l_snu_ece_bsc_thesis_keywords_en_clist { ,~ } { ,~ } { ,~ }
              }
              { % Unrecognized language
                \noindent 주요어:~\clist_use:Nnnn \l_snu_ece_bsc_thesis_keywords_ko_clist { ,~ } { ,~ } { ,~ }
              }
          }
      }
      { % No language specified
        \bool_if:NTF \l_snu_ece_bsc_thesis_en_bool
          { % English main
            \noindent Keywords:~\clist_use:Nnnn
              \l_snu_ece_bsc_thesis_keywords_en_clist { ,~ } { ,~ } { ,~ }
          }
          { % Korean main
            \noindent 주요어:~\clist_use:Nnnn
              \l_snu_ece_bsc_thesis_keywords_ko_clist { ,~ } { ,~ } { ,~ }
          }
      }
  }
