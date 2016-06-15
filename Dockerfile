from xpika/nodejs_dockerfile

ENV LANG en_US.UTF-8                                                                                                                                                           
RUN locale-gen "en_US.UTF-8"                                                                                                                                                   
RUN dpkg-reconfigure locales                                                                                                                                                   
RUN curl https://install.meteor.com/ | sh                                                                                                                                      
RUN apt-get -y install git                                                                                                                                                     
RUN git clone  https://github.com/meteor/todos                                                                                                                                 
RUN cd todos                                                                                                                                                                   
RUN npm install --save postcss-cli autoprefixer                                                                                                                                
RUN meteor npm install --save faker 
RUN meteor update

ENTRYPOINT ["meteor","run","--port"," 0.0.0.0:80"]
