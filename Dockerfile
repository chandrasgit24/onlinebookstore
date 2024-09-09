FROM tomcat:9-jre11

WORKDIR /opt/apache-tomcat-9.0.93/webapps/

COPY /home/ec2-user/slaveworkspace/workspace/books/target/onlinebookstore.war ./

EXPOSE 8080

CMD ["catalina.sh", "run"]
