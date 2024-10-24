FROM registry.access.redhat.com/ubi9/go-toolset:latest as builder

USER root

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN CGO_ENABLED=0 go build -o App ./cmd/api

RUN chmod +x /app/App

# build image
FROM registry.access.redhat.com/ubi9/ubi:latest

RUN mkdir /app

COPY --from=builder /app/App /app

CMD ["/app/App"]
