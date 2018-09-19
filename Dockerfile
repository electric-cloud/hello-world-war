FROM jetty

ENV JETTY_HOME /usr/local/jetty
ENV JETTY_BASE /var/lib/jetty

WORKDIR /var/lib/jetty

RUN java -version
RUN java -jar "$JETTY_HOME/start.jar" --add-to-startd=jmx,stats

COPY /target/hello-world-war-1.0.0.war $JETTY_BASE/webapps/ROOT.war
EXPOSE 8080
CMD exec ${JETTY_HOME}/bin/jetty.sh run
