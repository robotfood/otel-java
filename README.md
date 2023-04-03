# Introdocution
An example project that uses an OpenTelemetry Agent to inject metrics and traces into a non-instrumented Java application. 

# Build example app
docker build --tag example-app:latest .

# Deploy example app
kubectl deploy -f ./kubernetes

# Cleanup and build example app
kubectl delete svc example-service && kubectl delete deployment example-deployment && docker build --tag example-app:latest . && kubectl apply -f ./kubernetes/example-app/ 

# Access service (w/Docker Desktop for Mac)
http://localhost:30080/

# Pull kube-prometheus-stack Helm chart
https://github.com/prometheus-community/helm-charts/pkgs/container/charts%2Fkube-prometheus-stack
helm pull prometheus-community/kube-prometheus-stack

# Install monitoring stack
helm upgrade --install kube-prometheus-stack prometheus-community/kube-prometheus-stack --set nodeExporter.enabled=false --set prometheus.service.type=NodePort --set grafana.service.type=NodePort --set grafana.service.nodePort=30091

# Instal OTEL Collector
kubectl apply -f https://raw.githubusercontent.com/open-telemetry/opentelemetry-collector/main/examples/k8s/otel-config.yaml

    receivers are the components that are responsible for gathering or receiving telemetry data
    processors are able to look into the telemetry data and take decisions based on them, such as perform data cleanup, apply sampling decisions, include or remove attributes, enrich data based on where it’s running, among others
    exporters will then send the data out of the process, likely to one or more telemetry backends or another layer of collectors
    extensions are not part of the data pipeline but can help other components like the authentication extensions, or the collector as a whole, like the debugging interfaces

    Install OpenTelemetry libraries: You should install the appropriate OpenTelemetry libraries for your programming language and framework. The OpenTelemetry documentation provides instructions on how to install and configure the libraries.

    Configure the OpenTelemetry Exporter: The OpenTelemetry libraries allow you to configure an exporter that sends your application's telemetry data to the OpenTelemetry Collector. Depending on the type of data you want to send, you can configure exporters for metrics, tracing, or logs data. The OpenTelemetry documentation provides instructions on how to configure the exporters for different data types.

    Configure the OpenTelemetry Collector Receiver: The OpenTelemetry Collector has receivers that are responsible for receiving telemetry data from different sources, such as an application or an agent. Depending on the type of data you want to receive, you can configure receivers for metrics, tracing, or logs data. The OpenTelemetry documentation provides instructions on how to configure the receivers for different data types.

    Configure the OpenTelemetry Collector Processor: The OpenTelemetry Collector has processors that can perform various operations on the telemetry data received by the collectors, such as aggregation, filtering, or transformation. Depending on your use case, you can configure processors to modify the data before sending it to the backends. The OpenTelemetry documentation provides instructions on how to configure the processors for different use cases.

    Start your application: Once you have configured the OpenTelemetry libraries, exporters, receivers, and processors, you can start your application. Your application will start sending telemetry data to the OpenTelemetry Collector, which will receive, process, and send the data to the configured backend(s).



# Install Tempo
helm upgrade --install tempo grafana/tempo



# Install Istio
https://istio.io/latest/docs/setup/getting-started/