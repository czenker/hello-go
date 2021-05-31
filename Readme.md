Build the image in minikube, so it is already in the registry.

````bash
minikube image build . -f Containerfile -t localhost/hello-go:latest
````

Connect to Hello World

````bash
kubectl port-forward service/hello-go 8080
curl http://localhost:8080
````