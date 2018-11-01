%
% This script is available under the MIT license;
% the license information is found in 'LICENSE'.
%


%
% "aesj.cls": LaTeX2e custom class built on top of the LaTeX2e article class
%
% This class emulates the MS-Word template for the Meetings abstract
% of the Atomic Energy Society of Japan (AESJ), referred to as 予稿.
%
% Jaewoong Jang
% PhD student
% University of Tokyo
% jang.comsci@gmail.com
%


%
% Class identification
%
\newcommand\aesjName{aesj}
\newcommand\aesjTitl{A LaTeX2e class for the AESJ Meetings}
\newcommand\aesjVers{v1.0.8}
\newcommand\aesjDateLast{2018/07/03} % Must be in the form 'yyyy/mm/dd'
\newcommand\aesjDateFirst{2018/01/11}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{\aesjName}[\aesjDateLast\space\aesjVers]

\typeout{++++++++++++++++++++++++++++++++++++++++}
\typeout{\aesjName\space\aesjVers:\space\aesjTitl}
\typeout{++++++++++++++++++++++++++++++++++++++++}


%
% Class options
%
\LoadClass[a4paper,10pt,onecolumn]{article} % <= AESJ templ
\newcommand\captionFontSize{normalsize}
\DeclareOption{twocolumn}{\OptionNotUsed} % <= AESJ templ
\DeclareOption{captionsmall}{\renewcommand\captionFontSize{small}}
\DeclareOption{captionfootnotesize}{\renewcommand\captionFontSize{footnotesize}}
% Options unknown to this class will be passed to the article class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax


%
% Font sizes
%
% 1pt == 1/72.00 inch in desktop publishing typesets
% 1pt == 1/72.27 inch in TeX
%
% Leading, in its modern term, refers to the distance between
% the baselines of successive lines of type.
%
\RequirePackage{anyfontsize} % Font size scaler for Computer Modern
\newcommand\titlFontSize{13pt} % <= AESJ templ
\newcommand\titlFontLeading{16pt}
\newcommand\authFontSize{11pt} % <= AESJ templ
\newcommand\authFontLeading{14pt}
\newcommand\mainFontSize{10pt} % <= AESJ templ
\newcommand\mainFontLeading{14pt}


%
% Redefine the maketitle command
%
\renewcommand\maketitle{%
  \begin{center}
    {
      \fontsize{\titlFontSize}{\titlFontLeading}\selectfont
      \@title\par
    }
    {
      \fontsize{\authFontSize}{\authFontLeading}\selectfont
      \vspace{-0.5em} % Reduce the gap between title and auth
      \begin{tabular}[t]{c}
        \@author%
      \end{tabular}\par
    }
  \end{center}\par
}


%
% Redefine the abstract environment
%
\renewenvironment{abstract}{%
  {\noindent\bfseries\abstractname}\par
  \noindent\ignorespaces
}{\vspace{0.5em}}


%
% Define a new environment for keywords
%
\newenvironment{keywords}{%
  {\noindent\bfseries{Keywords:}}
  \noindent\ignorespaces
}{\vspace{-0.5em}}


%
% Page margins
%
\RequirePackage[
%  showframe,
  margin=20mm,
]{geometry}


%
% Suppress the page numbers <= AESJ templ
%
\pagenumbering{gobble}


%
% Make author names with different affiliations appear on the same line
% (default: A newline is fed after each affiliation)
%
\RequirePackage{authblk}
\renewcommand\AB@affilsepx{, \protect\Affilfont}
\setlength\affilsep{3pt} % Distance btw a title and the affil
\newcommand\thespeaker[1]{\textsuperscript{*}#1} % * <= AESJ templ


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
\newcommand\horiSep{0.5em}
\titleformat
  {\section}
%  [display]
  {%
    \bfseries%
    \fontsize{\mainFontSize}{\mainFontLeading}\selectfont%
  }
  {\thesection.}{\horiSep} % A dot (.) follows the section label
  {}[]
\titleformat
  {\subsection}
%  [display]
  {%
    \bfseries%
    \fontsize{\mainFontSize}{\mainFontLeading}\selectfont%
  }%
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
\newcommand\leftMargin{0pt}
\newcommand\spaceBefSecTitle{1.0em}
\newcommand\spaceAftSecTitle{0.2em}
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
\RequirePackage{caption}   % $ texdoc caption
\captionsetup[wrapfigure]{ % p. 4
  name=Fig.,               % pp. 15-16; the float label
  labelsep=period,         % p. 6; what follows the count of a float label
  textformat=simple,       % p. 7; what follows the last char of the caption
  font=\captionFontSize,   % p. 9
  skip=5pt,                % p. 13; vspace between a float and its caption
}
\captionsetup[wraptable]{
  name=Table,
  labelsep=period,
  textformat=simple,
  font=\captionFontSize,
  skip=5pt,
}
%eof