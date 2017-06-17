# 
#
# Based on :
#    https://github.com/jagregory/pandoc-docker/blob/master/Dockerfile
#    https://github.com/geometalab/docker-pandoc/blob/develop/Dockerfile
#    https://github.com/vpetersson/docker-pandoc/blob/master/Dockerfile

FROM ruby:2.3
MAINTAINER damien clochard <damien.clochard@dalibo.com>

RUN apt-get -qq update && \
    apt-get -qq -y install locales rsync openssh-client && \
    # clean up
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the locale
ENV LANG fr_FR.UTF-8
ENV LANGUAGE fr_FR:fr
ENV LC_ALL fr_FR.UTF-8
RUN echo "${LANG}" > /etc/locale.gen
RUN locale-gen ${LANG}

# Install jekyll with bundler 
ADD Gemfile .
RUN bundle install

