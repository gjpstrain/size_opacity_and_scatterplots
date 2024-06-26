# Effects of Size and Opacity Adjustments in Scatterplots

Files, data, and scripts required to fully recreate our study investigating how manipulating point size and opacity in scatterplots can influence viewers' performance in a correlation estimation task.

A video presentation for this paper can be found here: [YouTube link](https://www.youtube.com/watch?v=hZEZFJSlmtU). Warning: while the in-person presentation was lively, the pre-recorded version is a little dry. The ACM Digital Library entry for this paper, is here: [ACM DL](https://dl.acm.org/doi/10.1145/3613904.3642127).

## Data

Raw data (.csv format) is located in the `data` folder. The R script `data_processing_for_payment.R` takes raw data straight from pavlovia.org, and writes a .csv file with a list of passed and failed participants to the `data` folder.

Once participants have been paid or excluded, use the `anonymisation.R` script to remove identifiable prolific IDs.

NB: Aside from anonymisation, data are provided *as-is*. The **wrangle** function *must* be run to make the dataset usable.

### Analysis Within a Fully-Reproducible Computational Environment

Resources are provided for the full reproduction of the computational environment (R, Rstudio, and package versions) that was used for data wrangling, visualization, statistical modelling, and reporting.

To begin, clone this repository to your local machine. With Docker running in the background, use a terminal (or cmd on Windows) to navigate to the cloned repository and type the following Docker command:

```docker build -t size_and_opacity .```

If you're using a machine with an ARM processor, such as Apple Silicon, use the following command to build an image:

```docker buildx build --platform linux/amd64 -t size_and_opacity .```

Then, type:

```docker run --rm -p 8787:8787 -e PASSWORD=password size_and_opacity```

Once the container is running, open a web browser and type `localhost:8787` in the address bar. Enter the username `rstudio` and the password `password`. This will generate a fully functioning Rstudio session running from the docker container.

### Re-creating the manuscript

Opening `size_and_opacity.qmd` and using the 'Render' button will allow you to re-create a .pdf of the manuscript.

IMPORTANT: Models have been cached to increase performance. The cache will not be recognised automatically when using RStudio within the Docker container. eval_models must be set to FALSE in line 11 in order to use the cached models. This will prevent knitr from executing the code for each model, but will 'lazyload' all cached models so they can be used in manuscript generation. Setting eval_models to TRUE in line 11 will result in all models being re-generated.

The manuscript was written using the ACM CHI template. An issue with quarto/pandoc means that the tables are rendered partially outside of the pdf boundaries. I solved this by manually editing the resulting .tex file and re-running it. The source files in `chi24-238.zip` have had these changes implemented.

Files and folders used in generating manuscript:

 - `size_and_opacity.qmd`: Full quarto markdown script including text and all code
 - `size_and_opacity_cache/pdf`: folder containing cached models
 - `data`: folder containing collected, anonymized data
 - `size-opacity.bib` for referencing
 - `acmart.cls`: LaTeX class file required for building manuscript
 - `ACM-Reference-Format.bst`: reference format needed for latex compilation
 - `_extensions`: templates etc required for quarto to correctly render manuscript

Knitting the manuscript may take some time depending on the performance of your computer, especially if models are being re-built.

### Other Files

 - `item_preparation`: folder containing scripts to generate all experimental items, practice items, and visual masks
 - `floor_testing_plots`: contains plots that were used to visualise the opacity floor for experimental items
 - `chi24-238.zip`: the source files submitted - a barebones way to produce the paper

## Experiment Code and Materials

 - Experiment: [https://gitlab.pavlovia.org/Strain/size_and_opacity_additive_exp](https://gitlab.pavlovia.org/Strain/size_and_opacity_additive_exp)
 
## Pre-Registration

Pre-registrations for hypotheses with the OSF can be found here: [https://osf.io/j32sk](https://osf.io/j32sk)
