% Author: Christophe Debruyne - christophe.debruyne@insight-centre.org

% This class assumes that the authors already has installed the Ubuntu
% fonts on their system. And also assumes that the authors use XeLaTex
% to compile the poster in order to access those fonts.
% Ubuntu fonts can be obtained from http://font.ubuntu.com/


% Warning. If the results look odd after compiling -- e.g., the banners
% are in the wrong place -- try compiling again. That usually works.
\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{insightposter}[2014/09/10 Insight Poster Class]

% Load the base class. The class is based on an article instead of beamer
% as it was easier to treat the poster as a two-column one-page article
\ProcessOptions\relax
\LoadClass[10pt,twocolumn]{article}

% Loading all the required packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{mathptmx}
\RequirePackage{anyfontsize}
\RequirePackage{t1enc}
\RequirePackage{xltxtra,fontspec,xunicode}
\RequirePackage{titlesec}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{enumitem}

% Correct the margins and adopt A3 paper size as per guidelines
\RequirePackage[left=18mm,right=18mm,top=85mm,bottom=30mm,a3paper]{geometry}

% Custom colors as per Insight guidelines
\definecolor{author}{cmyk}{.25,0,.04,.06}
\definecolor{heading}{cmyk}{1,0,0,.48}
\definecolor{subheading}{cmyk}{.25,0,.04,.06}
\definecolor{bullet}{cmyk}{1,0,0,.48}

% Pretty section
\titleformat{\section}{
	\setmainfont{Ubuntu Medium}
	\linespread{1}
	\color{heading} 
	\fontsize{18}{21} 
	\selectfont}
	{\thesection}{0.5ex}{}
\titlespacing{\section}{0pt}{18pt}{0pt}

% Gorgeous subsection
\titleformat{\subsection}{
	\setmainfont{Ubuntu Medium}
	\linespread{1}
	\color{heading} 
	\fontsize{10}{16} 
	\selectfont}
	{\thesubsection}{0.5ex}{}
\titlespacing{\subsection}{0pt}{5pt}{0pt}

% Stuff we need to move textboxes and the banners
\usetikzlibrary{calc}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}

% 13mm space between the two columns
\setlength{\columnsep}{13mm}

% Fixing the paragraphs. Note, the baselinestretch of 1.3 corresponds,
% oddly enough with the 16pt line spacing of the powerpoint template.
\setlength{\parskip}{5pt}
\setlength{\parindent}{0pt}
\renewcommand{\baselinestretch}{1.3}

\setmainfont{Ubuntu Light}

% Remove page number
\pagenumbering{gobble}

\makeatletter        
\def\@maketitle{
	% Format the banners
	\begin{tikzpicture}[remember picture,overlay]
		\node[anchor=north west,inner sep=0pt] at ($(current page.north west)+(0cm,0cm)$) {
			\includegraphics[width=\paperwidth]{images/header}
		};
	\end{tikzpicture}
	\begin{tikzpicture}[remember picture,overlay]
		\node[anchor=south west,inner sep=0pt] at ($(current page.south west)+(0cm,0cm)$) {
			\includegraphics[width=\paperwidth]{images/footer}
		};
	\end{tikzpicture}
	% Format the title
	\begin{textblock}{190}(18,20)
		\linespread{1}
		\color{white} \fontsize{50}{59} \selectfont \@title
	\end{textblock}
	% Format the author names	
	\begin{textblock}{190}(18,64)
		\linespread{1}
		\setmainfont{Ubuntu Medium}
		\color{author} \fontsize{18}{20} \selectfont \@author
	\end{textblock}
	% Format the thanks for the project
	\begin{textblock}{190}(18,39)
		\linespread{1}
		\color{author} \fontsize{7}{7} \selectfont \@thanks
	\end{textblock}
}

% Format bulletpoints according the Insight guidelines
\def\labelitemi{\color{bullet}$\bullet$}
\setlist[itemize,1]{leftmargin=4mm}

\endinput