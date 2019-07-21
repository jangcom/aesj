\newcommand{\aesjName}{aesj}
\newcommand{\aesjTitl}{A LaTeX2e class for the AESJ Meetings}
\newcommand{\aesjVers}{1.09}
\newcommand{\aesjDateLast}{2019/07/12}
\newcommand{\aesjDateFirst}{2018/01/11}
\newcommand{\aesjAuth}{Jaewoong Jang}
\newcommand{\aesjPosi}{PhD student}
\newcommand{\aesjAffi}{University of Tokyo}
\newcommand{\aesjMail}{jangj@korea.ac.kr}
\newcommand{\aesjLicOne}{Copyright (c) 2018-2019 \aesjAuth\space<\aesjMail>}
\newcommand{\aesjLicTwo}{This class is available under the MIT license;}
\newcommand{\aesjLicThree}{the license information is found in '\aesjName-LICENSE'.}
\typeout{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}
\typeout{\aesjName\space\aesjVers:\space\aesjTitl}
\typeout{\aesjLicOne}
\typeout{\aesjLicTwo}
\typeout{\aesjLicThree}
\typeout{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}

%
% Class definition
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{\aesjName}[\aesjDateLast{\space}v\aesjVers]
\DeclareOption{twocolumn}{\OptionNotUsed}% <= AESJ templ
\newcommand{\captionFontSize}{normalsize}
\DeclareOption{captionsmall}{\renewcommand{\captionFontSize}{small}}
\DeclareOption{captionfootnotesize}{\renewcommand{\captionFontSize}{footnotesize}}
\DeclareOption{captionlarge}{\renewcommand{\captionFontSize}{large}}
\DeclareOption{captionLarge}{\renewcommand{\captionFontSize}{Large}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,10pt,onecolumn]{article}% <= AESJ templ

%
% Packages used throughout this class
%
\RequirePackage{anyfontsize}

%
% Font sizes
%
% 1pt == 1/72.00 inch in desktop publishing typesets
% 1pt == 1/72.27 inch in TeX
%
% Leading, in its modern term, refers to the distance between
% the baselines of successive lines of type.
%
\newcommand{\titlFontSize}{%
    15pt% v1.09
%    13pt% AESJ templ
}
\newcommand{\titlFontLeading}{%
    18pt% v1.09
%    16pt% v1.08
}
\newcommand{\authFontSize}{%
    13pt% v1.09
%    11pt% AESJ templ
}
\newcommand{\authFontLeading}{%
    14pt
}
\newcommand{\mainFontSize}{%
    12pt%
%    10pt% AESJ templ
}
\newcommand{\mainFontLeading}{%
    18pt% v1.09
%    14pt% v1.08
}
\newcommand{\wraptableFontSize}{%
    10pt% v1.09
}
\newcommand{\wraptableLeading}{%
    14pt% v1.09
}

%
% Redefine the maketitle command.
%
\renewcommand{\maketitle}{%
  \begin{center}
    {\fontsize{\titlFontSize}{\titlFontLeading}\selectfont
     \@title\par}
    {\fontsize{\authFontSize}{\authFontLeading}\selectfont
     \vspace{% Reduce the gap between title and auth
       -0.25em% v1.0.9
%       -0.5em% v1.0.8
     }
     \begin{tabular}[t]{c}
       \@author%
     \end{tabular}\par}
  \end{center}\par
}

%
% Redefine the abstract environment.
%
\renewenvironment{abstract}{%
  {\noindent\bfseries\abstractname}\par
  \noindent\ignorespaces
}{\vspace{0.5em}}

%
% Define keywords environment.
%
\newenvironment{keywords}
  {\noindent\textbf{Keywords:}\noindent}
  {}

%
% Page margins
%
\RequirePackage[
  margin=20mm,
]{geometry}

%
% Suppress the page numbers. <= AESJ templ
%
\pagenumbering{gobble}

%
% Make author names with different affiliations appear on the same line
% (default: A newline is fed after each affiliation)
%
\RequirePackage{authblk}
\renewcommand{\AB@affilsepx}{, \protect\Affilfont}
\setlength\affilsep{3pt} % Distance btw a title and the affil
\newcommand{\thespeaker}[1]{\textsuperscript{*}#1} % * <= AESJ templ

%
% Section and subsection format settigns using
% the titlesec package ($ texdoc titlesec, p. 4)
%
\RequirePackage{titlesec}
%
% \titleformat
%   {<command>}
%   [<shape>]
%   {<format>}
%   {<label>}{<sep>}
%   {<before-code>}[<after-code>]
%
% {<command>}
% Sectioning command to be redefined
% e.g. \part, \chapter, \section
%
% [<shape>] Optional
% [block], [display], [frame], etc
%
% {<format>}
% Format to be applied to the whole title: label and text.
%
% {<label>}
% Although possible, inputing an empty value to this arg
% does not suppress the number in the table of contents
% and running heads.
%
% {<sep>}
% Horizontal sep between a label and the title body.
% The arg must be a length, not even empty.
% The sep is vertical space in display shape, and
% the distance from text to frame in frame.
% -> e.g. {1em}
% -> Use {0cm} if {<label>} is empty in section
% -> Use {0.25cm} if {<label>} is empty subsection
%
% {<before-code>}
% Words followed by the title body
%
% [<after-code>] Optional
% Words following the title body
%
\newcommand{\horiSep}{0.5em}
\titleformat
  {\section}
  {\bfseries
   \fontsize{\mainFontSize}{\mainFontLeading}\selectfont}
  {\thesection.}{\horiSep} % A dot (.) follows the section label
  {}[]
\titleformat
  {\subsection}
  {\bfseries
   \fontsize{\mainFontSize}{\mainFontLeading}\selectfont}
  {\thesubsection.}{\horiSep} % A dot (.) follows the subsection label
  {}[]
%
% \titlespacing
%   {<command>}{<left>}
%   {<before-sep>}{<after-sep>}
%   [<right-sep>]
% The starred version (\titlespacing*) kills the indentation
% of the paragraph following the title ($ texdoc titlesec, p. 4).
%
% {<command>}
% Sectioning command to be redefined
% e.g. \part, \chapter, \section
%
% {<left>}
% Increases the left margin.
%
% {<before-sep>}
% Vertical space before the title
%
% {<after-sep>}
% Separation between title and text
%
% [<right-sep>] Optional
% The hang, block and display shapes have the possibility
% of increasing the hright-sepi margin with this optional
% argument.
%
\newcommand{\leftMargin}{0pt}
\newcommand{\spaceBefSecTitle}{1.0em}
\newcommand{\spaceAftSecTitle}{0.2em}
\titlespacing*
  {\section}{\leftMargin}
  {\spaceBefSecTitle}{\spaceAftSecTitle}
\titlespacing*
  {\subsection}{\leftMargin}
  {\spaceBefSecTitle}{\spaceAftSecTitle}

%
% Inline floats
%
\RequirePackage{wrapfig}
\setlength\intextsep{0cm} % Top and bottom margins of a float

%
% Captions
%
\RequirePackage{caption}
\captionsetup[wrapfigure]{
  name=Fig.,             % man pp15-16; the float label
  labelsep=period,       % man p6; what follows the count of a float label
  textformat=simple,     % man p7; what follows the last char of the caption
  font=\captionFontSize, % man p9
  skip=5pt,              % man p13; vspace between a float and its caption
}
\captionsetup[wraptable]{
  name=Table,
  labelsep=period,
  textformat=simple,
  font=\captionFontSize,
  skip=5pt,
}
%eof