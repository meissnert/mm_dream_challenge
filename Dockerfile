FROM ubuntu
RUN apt-get update
RUN apt-get -y install r-base

## Install dependencies
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("plyr")'
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("VariantAnnotation")'
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("deconstructSigs")'
RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile

## Copy files over to Docker image
COPY run-mm-sc1.R /run-mm-sc1.R
COPY func.R /func.R
COPY score_sc1.sh /score_sc1.sh
