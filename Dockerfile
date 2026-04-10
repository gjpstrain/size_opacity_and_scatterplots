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
COPY data/ ./data/
COPY size_and_opacity.qmd ./
COPY item_preparation/ ./item_preparation/
COPY size_and_opacity_cache/ ./size_and_opacity_cache/
COPY _extensions/ ./_extensions/
COPY ACM-Reference-Format.bst ./
COPY size-opacity.bib ./
COPY acmart.cls ./
