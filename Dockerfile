from xpika/nodejs_dockerfile

ENV LANG en_US.UTF-8
RUN locale-gen "en_US.UTF-8"
RUN dpkg-reconfigure locales 
RUN apt-get -y install language-pack-en
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN curl https://install.meteor.com/ | sh
RUN apt-get update
RUN apt-get -y install git                           
RUN git clone  https://github.com/meteor/todos      
RUN cd todos                                       
RUN npm install --save postcss-cli autoprefixer   
RUN cd /todos && meteor npm install --save faker
RUN cd /todos && meteor update

WORKDIR /todos
ENTRYPOINT ["sh","-c","cd /todos && meteor run --port  0.0.0.0:80"]
#ENTRYPOINT ["bash"]
