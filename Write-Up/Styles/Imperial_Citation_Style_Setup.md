# Setting up the Imperial Harvard citation style in LaTeX
Here's a quick little primer for setting up the Imperial citation style in LaTeX.

I assume here that you have LaTeX set up as usual, and are using something like **TexStudio** to write your work. If you are using overleaf I am afraid at present I cannot help you, but please do let me know if you do find a way and I can update this.

## 1. Download the Imperial citation style repo
First of all we must download the prebuilt files for this citation style. These have been graciously provided by Hugh Williams in a github repository.

Firstly navigate to a temporary folder and make a Styles folder. I'd advise keeping this somewhere safe for future reference, but for now let's just use `~/Downloads`

```bash
cd ~/Downloads
mkdir Styles && cd Styles
```

Now clone the github repository into this folder and move into the newly cloned repo

``` bash
git clone https://github.com/hughwilliams94/Imperial-Harvard-Biblatex.git
cd Imperial-Harvard-Biblatex
```

The structure of the repo should be as follows:
```
Imperial-Harvard-Biblatex
├── Biblatex.cfg
├── biblatex-imperial
│   ├── imperialharvard.bbx
│   └── imperialharvard.cbx
├── Example.png
├── imperialharvard.bbx
├── imperialharvard.cbx
├── Imperial Harvard.cls
├── jobname.bib
├── LICENSE
├── README.md
└── Test.tex
```

## 2. Copy and install the style
Next copy the style into your texlive folder. This is often located in either `/usr/local` or `/usr/share`, but I will be using the path from my computer in this tutorial.

```bash
sudo cp -r biblatex-imperial/ /usr/share/texlive/texmf-dist/tex/latex/
```

Now you need to rebuild the hashes so LaTeX can find the new citation style.
```bash
texhash
```

The style is all installed now, however we still need to actually use it in our document.

## 3. Using the style in LaTeX
This Imperial style requires the use of `biblatex` instead of the older `natbib`.

The backend of this is called `biber`, rather than the older equivalent `bibtex`, and it is not necessarily installed as part of your LaTeX install, so for safety it's probably worth quickly installing it:
``` bash
sudo apt install biber
```

Now to the LaTeX side of things.

A basic document using this style would be as follows:
``` TeX
\documentclass{article}

\usepackage[backend=biber, style=imperialharvard]{biblatex}
\addbibresource{sample.bib} %Imports bibliography file

\begin{document}
\section{First section}

This document is an example, two items are cited: \textit{The \LaTeX\ Companion} book is \cite{latexcompanion}, and Einstein's journal paper is \autocite{einstein}.

\section{Bibliography}

\printbibliography
\end{document}
```

Like with `natbib`, we call the citation package using `\usepackage[backend=biber, style=imperialharvard]{biblatex}`.

We must then add a resource bib file inside which the citations are stored using `\addbibresource`.

To cite inline, as usual you can simply use `\cite{key}`, however biblatex also has a `\autocite{key}` command, which smart-formats the citation. In this case it puts it in brackets, as is often what is required.

Finally to print the bibliography, the command `printbibliography` is used. Nice and intuitive.

## 4. Issues you may encounter
Depending on what software you are using and how you are compiling your document, you may run into some issues with `biber` or `biblatex`. These are pretty old programs, so there are some idiosyncratic behaviours which require a bit of fiddling to get working. This is the same throughout LaTeX however, so it should be no different to solving a usual LaTeX problem.

Usually any problems you encounter will have been asked about before on somewhere like [Stack Exchange](https://tex.stackexchange.com), so it may be worth checking there first of all.

A typical compile sequence will go as follows:
```bash
pdftex main.tex
biber main
pdftex main.tex
pdftex main.tex
```

I personally encountered errors when using citations with strange characters (of particular annoyance is when there is a degree symbol in the abstract). This can often be changed in your reference manager to something equivalent.
