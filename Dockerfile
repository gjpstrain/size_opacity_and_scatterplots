# Add the rocker/verse Docker image for R 4.3.0

FROM rocker/verse:4.3.0

# Add our files to container

ADD data/ /home/rstudio/data/
ADD size_contrast_and_effect_severity.Rmd /home/rstudio/
ADD size_contrast_and_effect_severity/ /home/rstudio/size_contrast_and_effect_severity/
ADD vgtc.cls /home/rstudio/
ADD size-contrast-and-effect_severity.bib /home/rstudio/
ADD template.tex /home/rstudio/
ADD bib_styles/ /home/rstudio/bib_styles/

# Add appropriate versions of required R packages to container

RUN R -e "install.packages('devtools')"

RUN R -e "require(devtools)"

RUN R -e "devtools::install_version('rticles', version = '0.24', dependencies = T)"
RUN R -e "devtools::install_version('tinytex', version = '0.45', dependencies = T)"
RUN R -e "devtools::install_version('MASS', version = '7.3-59', dependencies = T)"
RUN R -e "devtools::install_version('buildmer', version = '2.8', dependencies = T)"
RUN R -e "devtools::install_version('emmeans', version = '1.8.5', dependencies = T)"
RUN R -e "devtools::install_version('scales', version = '1.2.1', dependencies = T)"
RUN R -e "devtools::install_version('lme4', version = '1.1-32', dependencies = T)"
RUN R -e "devtools::install_version('insight', version = '0.19.1', dependencies = T)"
RUN R -e "devtools::install_version('afex', version = '1.3-0', dependencies = T)"
RUN R -e "devtools::install_version('bookdown', version = '0.33', dependencies = T)"
RUN R -e "devtools::install_version('qwraps2', version = '0.5.2', dependencies = T)"
RUN R -e "devtools::install_github('crsh/papaja')"
RUN R -e "devtools::install_version('broom.mixed', version = '0.2.9.4', dependencies = T)"
RUN R -e "devtools::install_version('kableExtra', version = '1.3.4', dependencies = T)"
RUN R -e "devtools::install_version('lmerTest', version = '3.1-3', dependencies = T)"
RUN R -e "devtools::install_version('EMAtools', version = '0.1.4', dependencies = T)"
RUN R -e "devtools::install_version('ggdist', version = '3.2.1', dependencies = T)"
RUN R -e "devtools::install_version('ggpubr', version = '0.6.0', dependencies = T)"
RUN R -e "devtools::install_version('pwr', version = '1.3-0', dependencies = T)"
RUN R -e "devtools::install_version('conflicted', version = '1.2.0', dependencies = T)"

# run tinytex to install additional required packages

RUN R -e "tinytex::tlmgr_install("ncctools")