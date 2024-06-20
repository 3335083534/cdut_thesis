\ProvidesClass{cdut_thesis}[2024/06/20 v1.1 Standard LaTeX Template for CDUT Thesis]

\LoadClass[a4paper,cs4size]{ctexart} % cs4size：小四号字
\RequirePackage{xcolor}
\RequirePackage{enumerate}
\RequirePackage{amssymb}   % 数学
\RequirePackage{unicode-math} % Cambria Math 数学字体
\RequirePackage{graphicx}  % 插图
\RequirePackage{float} % 用于强制图像位置。[H]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%开始：设置超链接%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{hyperref}  % 超链接
\hypersetup{hidelinks}     % 隐藏超链接的边框
\hypersetup{
	colorlinks=false,
	linkcolor=black,
	citecolor=black,
	urlcolor=black
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%开始：设置超链接%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%开始：设置文献引用格式%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\upcite}[1]{\textsuperscript{\textsuperscript{\cite{#1}}}}% 顺序编码制：上标引用格式
\RequirePackage{gbt7714}
\bibliographystyle{gbt7714-author-year} % 著者-出版年制
%著者-出版年制两种格式
%\cite{}：作者 等(2020)
%\citep{}:(作者 等, 2022)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%结束：设置文献引用格式%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%开始：设置字体%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 数字和字母的字体
\setmainfont{Times New Roman}
% 设置公式字体
\setmathfont{Cambria Math}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%结束：设置字体%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%开始：设置论文信息%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%论文题目{中文题目}{英文题目}
\newcommand{\TitleCDUT}[2]{
	\newcommand{\zh@cdutthetitle}{#1}
	\newcommand{\en@cdutthetitle}{#2}
}
%作者
\newcommand{\AuthorCDUT}[1]{
	\newcommand{\@cduttheauthor}{#1}
}

%专业
\newcommand{\MajorCDUT}[1]{
	\newcommand{\@cdutthemajor}{#1}
}


\newcommand{\AdvisorCDUT}[2]{
	\newcommand{\@cduttheadvisor}{#1}
	\newcommand{\@cdutadvisorposition}{#2}
}
%学号
\newcommand{\StudentnumberCDUT}[1]{
	\newcommand{\@cdutthestudentnumber}{#1}
}
%关键词{中文}{英文}
\newcommand{\KeywordCDUT}[2]{
	\newcommand{\@cdutzhkeyword}{#1}
	\newcommand{\@cdutenkeyword}{#2}
}

%20xx届
\newcommand{\GradeCDUT}[1]{
	\newcommand{\@cdutgrade}{#1}
}

% 设置个人信息
\newcommand{\makezhcover}{
	\begin{center}
		{\heiti \zihao{2}  \zh@cdutthetitle}
	\end{center}
	\makebox[\linewidth][c]{\songti \zihao{3}  作者姓名：\@cduttheauthor \@cdutthestudentnumber 专业班级：\@cdutthemajor}
	\makebox[\linewidth][c]{\songti \zihao{3}  指导教师：\@cduttheadvisor \quad \@cdutadvisorposition}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%结束：设置论文信息%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%开始：设置页面%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{geometry}
\geometry{twoside,
	% 上下左右2.54cm
	left=2.54cm,%与word一致
	right=2.54cm,%与word一致
	top=2.54cm,%与word一致
	bottom=2.54cm,%与word一致
	%页眉顶端距离 = top-headheight-headsep
	%页脚底端距离 = bottom-footskip
	headsep=0.15cm,%设置页眉页脚，与word不一致
	headheight=0.35cm,
	footskip=0.7cm}
\setlength{\topskip}{5ex}
%\setlength{\footskip}{8ex}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%结束：设置页面%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%开始：页眉页脚样式%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%使用fancyhdr库
\RequirePackage{fancyhdr}
%设置页眉样式
\newcommand{\headstyle}{
	\renewcommand{\headrulewidth}{0.6pt}
	\fancyhead[C]{\songti \zihao{-5} 成都理工大学\@cdutgrade 届学士学位论文（设计）}
}

%设置页脚样式
\newcommand{\footstyle}{\fancyfoot[C]{\zihao{-5} \thepage}}
\pagestyle{fancy}
\fancyhf{} %清空原有样式
\headstyle
\footstyle

% 设置摘要目录页的页眉页脚
\newcommand{\fronthead}{
\pagenumbering{Roman}
\pagestyle{fancy}
\fancyhf{}
\fancyhead{} % get rid of headers
\renewcommand{\headrulewidth}{0pt} % and the line
\fancyfoot[C]{\small \thepage}
}

\newcommand{\texthead}{
	\pagenumbering{arabic}
	\pagestyle{fancy}
	\fancyhf{}
	\headstyle
	\footstyle
}

% 解决section与页眉间距过短问题
\RequirePackage{titlesec}
\titlespacing{\section}{0pt}{0.5ex}{*1.5}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%结束：页眉页脚样式%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%开始：	定义标题和段落样式%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%定义1.5倍行距
\renewcommand{\baselinestretch}{1.62}

\setlength{\textheight}{23cm}% 文本高度

% 摘要
\newenvironment{chineseabstract}{
	%\phantomsection %实现目录的正确跳转
	%\addcontentsline{toc}{section}{摘 \quad 要}
	\section*{\heiti{摘 \quad 要}} % 将摘要作为不带编号的section，解决缩进问题。
	\vspace{1em}
}{
	\vspace{1em}
	\\
	\noindent {\heiti \zihao{-4} 关键词：\@cdutzhkeyword}
}

% 英文摘要
\newenvironment{englishabstract}{
	\newpage
	\section*{\zihao{-2} \en@cdutthetitle}
	\vspace{1em}
	\noindent Abstract：
}{
	\vspace{1em}
	\\
	\noindent {\zihao{-4} Keywords：\@cdutenkeyword}
}

% 各章
\ctexset{section={
		name={第,章},
		number=\arabic{section},
		format=\heiti\zihao{-2}\centering,
		beforeskip={10cm},
	},
	subsection={
		format=\heiti\zihao{-3},
		beforeskip={1ex},
	},
	subsubsection={
		format=\heiti\zihao{-4},
	},
	appendix={
		name={附录},
	},
}

% 结论
\newenvironment{conclusion}{
	\phantomsection %20240608_实现目录的正确跳转
	\addcontentsline{toc}{section}{结 \quad 论}%手动将标题插入到toc(目录文件)
	\section*{\heiti\zihao{-2}{结 \quad 论}} %插入无编号的标题
	
}{}
% 致谢
\renewenvironment{thanks}{
	\phantomsection %20240608_实现目录的正确跳转
	\addcontentsline{toc}{section}{致 \quad 谢}
	\section*{\heiti\zihao{-2}{致 \quad 谢}}
	
}{}

% 重新定义\bibname命令为“参考文献”
\renewcommand{\bibname}{参考文献}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%结束：	定义标题和段落样式%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%开始：	定义表格、图片、公式的caption%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{caption}
%设置caption字体及大小
\DeclareCaptionFont{cdutfloatfont}{\heiti\zihao{5}}
\captionsetup{
	font=cdutfloatfont,
	skip=0pt, 
	labelsep = space %20240608_图表caption不使用冒号，而是空格
}
%设置caption样式，例如：图2-3,表2-1,...
\RequirePackage{amsmath}
\numberwithin{table}{section}
\renewcommand{\thetable}{\arabic{section}-\arabic{table}}
\numberwithin{figure}{section}
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}
\numberwithin{equation}{section}
\renewcommand{\theequation}{\arabic{section}-\arabic{equation}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%结束：	定义表格、图片、公式的caption%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%开始：	定制目录格式%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 在目录中加入目录项本身、参考文献、索引等项目
%\RequirePackage{tocbibind}  %% 将目录页码加到目录中
\RequirePackage[nottoc]{tocbibind}  % 不将目录页码加到目录中
\RequirePackage{tocloft}
% 设置目录title的样式(黑体小二居中)
\renewcommand{\cfttoctitlefont}{\hfill\heiti\zihao{-2}}
\renewcommand{\cftaftertoctitle}{\hfill}
% 让“目录”两个字中间分开
\renewcommand{\contentsname}{目 \quad 录}
% 控制section条目的间距
\renewcommand\cftbeforesecskip{-5pt}
% section的字体字号
\renewcommand\cftsecfont{\heiti\zihao{-4}}
% 页码编号的字号大小
\renewcommand\cftsecpagefont{\zihao{-4}}
\renewcommand\cftsubsecpagefont{\zihao{-4}}
\renewcommand\cftsubsubsecpagefont{\zihao{-4}}
% 设置2，3级条目的缩进
\cftsetindents{subsection}{1em}{1.5em}
\cftsetindents{subsubsection}{2em}{1.5em}
%20240608_修改目录引导点
\renewcommand{\cftdotsep}{0.1}% 设置目录的引导点的间距
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}% 使得section条目后面带上....
\cftsetpnumwidth{1em}%20240608_修改......................到page number的距离，两位数不起冲突。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





