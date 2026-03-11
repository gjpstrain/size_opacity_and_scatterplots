# Add the rocker/verse Docker image for R 4.3.2
FROM rocker/verse:4.3.2

# Set working directory
WORKDIR /home/rstudio

# Copy renv.lock first (for Docker layer caching)
COPY renv.lock ./renv.lock

# Install renv and restore packages
RUN R -e "install.packages('renv')"
RUN R -e "renv::restore(prompt = FALSE)"

# Add our files to container
ADD data/ ./data/
ADD size_and_opacity.qmd ./
ADD item_preparation/ ./item_preparation/
ADD size_and_opacity_cache/ ./size_and_opacity_cache/
ADD _extensions/ ./_extensions/
ADD ACM-Reference-Format.bst ./
ADD size-opacity.bib ./
ADD acmart.cls ./