FROM adoptopenjdk/openjdk8-openj9
COPY eureka-server.jar /app.jar
ENV JAVA_TOOL_OPTIONS -Dfile.encoding=UTF8 -Duser.language=zh -Duser.region=zh_CN -Duser.country=zh_CN
ENTRYPOINT exec java  -Xmx2000m -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -Dfile.encoding=UTF-8 -Djava.security.egd=file:/dev/./urandom -XX:MaxRAMPercentage=80.0 $JAVA_OPTS $SKYWALKING_OPTS $CATALINA_OPTS -jar /app.jar
