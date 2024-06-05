FROM debian:12

LABEL maintainer="neilschark https://github.com/neilschark"

# Set the frontend to noninteractive to configure the time zone
ARG DEBIAN_FRONTEND=noninteractive

# Install packages for building the LaTeX template.
RUN apt-get -qq update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    make \
    ghostscript \
    texlive \
    texlive-bibtex-extra \
    texlive-fonts-extra \
    texlive-lang-english \
    texlive-lang-german \
    texlive-latex-extra \
    texlive-publishers \
    texlive-science \
    texlive-pstricks \
    texlive-pictures \
    biber \
    chktex

# Command to actually build the LaTeX code.
CMD ["make", "--directory", "/thesis-template/", "all"]
