from ubuntu:xenial

RUN apt-get update -y && apt-get install -y sudo curl git-all git-svn mercurial nodejs pandoc ruby rubygems-integration rake-compiler bundler cmake build-essential pkg-config libgit2-dev libssh2-1 libssh2-1-dev libz-dev libssl-dev openssl libssh-dev libsslcommon2-dev libpthread-stubs0-dev

RUN gem install 'jekyll' 'colorator' 'rake' 'typhoeus' 'mercurial-ruby' 'pandoc-ruby' 'redcarpet' 'nokogiri' 'liquid' 'github-markup' 'awesome_print' 'pygments.rb' 'rugged' 

#RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import -
#RUN curl -L https://get.rvm.io | bash -s stable

#RUN . /usr/local/rvm/src/rvm/scripts/rvm
#RUN echo "source /usr/local/rvm/src/rvm/scripts/rvm" >> ~/.bashrc

#RUN /usr/local/rvm/src/rvm/bin/rvm requirements
#RUN /usr/local/rvm/src/rvm/bin/rvm install ruby
#RUN /usr/local/rvm/src/rvm/bin/rvm rubygems current

#RUN apt-get install -y python-software-properties
#RUN apt-add-repository -y ppa:chris-lea/node.js
#RUN apt-get update
#RUN apt-get install nodejs

# Create builder user
#RUN adduser --disabled-password -gecos '' indie
RUN adduser indie sudo
USER indie

VOLUME /home/indie/checkout
VOLUME /home/indie/rosindex

WORKDIR /home/indie/rosindex

RUN mkdir /home/indie/.ssh
RUN touch /home/indie/.ssh/known_hosts
RUN ssh-keyscan github.com >> /home/indie/.ssh/known_hosts
RUN ssh-keyscan bitbucket.org >> /home/indie/.ssh/known_hosts
