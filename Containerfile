FROM docker.io/library/golang:1.16 AS build
WORKDIR /go/src/hello-go
COPY . /go/src/hello-go
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM docker.io/library/alpine:latest
WORKDIR /root/
COPY --from=build /go/src/hello-go/main .
ENV PORT=8080
EXPOSE 8080/tcp
CMD ["./main"]