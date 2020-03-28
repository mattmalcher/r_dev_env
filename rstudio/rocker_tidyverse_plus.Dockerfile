# this is r + rstudio + tidyverse
FROM rocker/tidyverse:latest

# updates the package index, showing nothing except errors (-qq)
# then installs (without any additional recommended packages) a list of packages and their dependencies, saying (-y) yes to any prompts

# (\) is a dockerfile line continuation
# (&&) means that the install2.r script is run in the same step/layer as the apt-get

# install2.r is from a set of tools to use R from the command line
# it installs R packages. See:
# http://dirk.eddelbuettel.com/code/littler.examples.html

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
   libgdal-dev \
  && install2.r --error \
     --deps TRUE \
     styler \
     tidytext \
     plotly \
     tidyxl \
     unpivotr \
     janitor \
     rgdal \
     rgeos \
     sf \
     sp
