FROM eclipse-temurin:17
COPY ./target/demo-0.0.1-SNAPSHOT.jar /usr/local/lib/demo.jar
COPY ./opentelemetry-javaagent.jar /usr/local/lib/opentelemetry-javaagent.jar

ENV JAVA_TOOL_OPTIONS=-javaagent:/usr/local/lib/opentelemetry-javaagent.jar
ENV OTEL_TRACES_EXPORTER=otlp

#ENV OTEL_METRICS_EXPORTER=otlp
#ENV OTEL_EXPORTER_OTLP_METRICS_ENDPOINT=http://otel-collector:4317

# Default port 9464
ENV OTEL_METRICS_EXPORTER=prometheus
ENV OTEL_EXPORTER_PROMETHEUS_PORT=9464

ENV OTEL_EXPORTER_OTLP_TRACES_ENDPOINT=http://tempo:4318/v1/traces
ENV OTEL_EXPORTER_OTLP_TRACES_PROTOCOL=http/protobuf
ENV OTEL_SERVICE_NAME=example-service-agented
ENV OTEL_RESOURCE_ATTRIBUTES=application=Example_app

EXPOSE 8080
EXPOSE 9464

ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]