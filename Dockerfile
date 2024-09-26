FROM tomcat:9-jre11

WORKDIR /usr/local/tomcat/webapps/

COPY /target/onlinebookstore.war ./

EXPOSE 8080

CMD ["catalina.sh", "run"]
