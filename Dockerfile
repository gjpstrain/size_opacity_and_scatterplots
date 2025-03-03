# Add the rocker/verse Docker image for R 4.3.2

FROM rocker/verse:4.3.2

# Add our files to container

ADD data/ /home/rstudio/data/
ADD size_and_opacity.qmd /home/rstudio/
ADD item_preparation/ /home/rstudio/item_preparation/
ADD size_and_opacity_cache/ /home/rstudio/size_and_opacity_cache/
ADD _extensions/ /home/rstudio/_extensions/
ADD ACM-Reference-Format.bst /home/rstudio/
ADD size-opacity.bib /home/rstudio/
ADD acmart.cls /home/rstudio/

# Add appropriate versions of required R packages to container

RUN R -e "install.packages('devtools')"

RUN R -e "install.packages('remotes')"

RUN R -e "require(devtools)"

# tidyverse is included in rockerverse image

RUN R -e "devtools::install_version('MASS', version = '7.3-60.0.1', dependencies = T)"
RUN R -e "devtools::install_version('buildmer', version = '2.11', dependencies = T)"
RUN R -e "devtools::install_version('emmeans', version = '1.10.0', dependencies = T)"
RUN R -e "devtools::install_version('scales', version = '1.3.0', dependencies = T)"
RUN R -e "devtools::install_version('qwraps2', version = '0.6.0', dependencies = T)"
RUN R -e "devtools::install_version('kableExtra', version = '1.4.0', dependencies = T)"
RUN R -e "devtools::install_version('lmerTest', version = '3.1-3', dependencies = T)"
RUN R -e "devtools::install_version('ggdist', version = '3.3.1', dependencies = T)"
RUN R -e "devtools::install_version('ggpubr', version = '0.6.0', dependencies = T)"
RUN R -e "devtools::install_version('conflicted', version = '1.2.0', dependencies = T)"
RUN R -e "devtools::install_version('ggtext', version = '0.1.2', dependencies = T)"
RUN R -e "devtools::install_version('r2glmm', version = '0.1.2', dependencies = T)"
RUN R -e "devtools::install_version('DescTools', version = '0.99.54', dependencies = T)"
RUN R -e "devtools::install_version('lme4', version = '1.1-35.0', dependencies = T)"
RUN R -e "devtools::install_version('sjmisc', version = '2.8.9', dependencies = T)"
RUN R -e "install.packages('papaja', version = '0.1.3', dependencies = T)"

# note lme4 version was not latest to fix incompatibility with Matrix package
