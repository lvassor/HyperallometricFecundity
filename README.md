# Explicitly accounting for the superlinear scaling of reproductive allocation in Ontogenetic Growth Models (OGMs)
*Author: Luke Joseph Vassor*

This repository contains the source code, data and notes for Luke Vassor's M.Sc. thesis at **Imperial College London**.
A complete walk through of the project from OGM context to our problem and methodology is available in the form of a Jupyter Notebook in `Code`. <br/>
**NB:** While git *does* render jupyter notebooks, including the code and markdown contained within, the *flavour* of markdown git uses is different to that native to jupyter notebooks. As such the ```MathJax``` engine embedded in the markdown cells of the notebook does not render the ```LaTeX``` math as originally written. To solve this, please download the notebook and open a jupyter server using the locally-stored file. Instructions on installing jupyter can be found [here](https://jupyter.readthedocs.io/en/latest/install.html).

<!-- ![cover image](./Other/code.jpg) -->

All code in this repository was written in and tested with `R` 3.xx and `Python` 3.5.2

## Directory structure & contents
All directories are formatted with the same subdirectory structure in a clean workflow, as follows:<br/>
`Code` Contains all notebooks and scripts.<br/>
`Data` Houses the data which are read into the scripts in `Code`. <br/>
`Results` Any form of script output, including, but not limited to, comma-separated files and pdf plots. This directory is under `.gitignore` so as not to void git convention of maintaining repository sizes of less than `100 MB`.<br/>
`Other` Any files not directly related to running the project.<br/>

## License

This work is produced for submission in partial fulfilment of the M.Sc. Computational Methods in Ecology & Evolution at Imperial College London. 

---
## For Contributors/Co-authors:

<!-- * Note that the old materials, written in LaTeX, are now in the `archived` directory. -->

* The `Results` directory will be populated only when scripts are run, but these are not version controlled (all files in this directory under `.gitignore`).
