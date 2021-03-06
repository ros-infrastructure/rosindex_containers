from ubuntu:xenial

RUN echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list
RUN apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116

RUN apt-get update -y && apt-get install -y sudo apt-utils curl git-all git-svn mercurial nodejs pandoc ruby rubygems-integration rake-compiler bundler cmake build-essential pkg-config libgit2-dev libssh2-1 libssh2-1-dev libz-dev libssl-dev openssl libssh-dev libsslcommon2-dev libpthread-stubs0-dev python3-vcstool

RUN gem install 'jekyll' 'colorator' 'rake' 'typhoeus' 'mercurial-ruby' 'pandoc-ruby' 'redcarpet' 'nokogiri' 'liquid' 'github-markup' 'awesome_print' 'pygments.rb' 'rugged' --no-rdoc --no-ri
RUN gem install 'jekyll-sitemap' 'jekyll-optional-front-matter' 'jekyll-titles-from-headings' 'jekyll-readme-index' 'jekyll-relative-links' --no-rdoc --no-ri

RUN ln -s `which nodejs` /usr/local/bin/node

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

VOLUME /workdir

RUN mkdir /root/.ssh
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts
RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts

WORKDIR /workdir/rosindex
