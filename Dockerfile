FROM golang:alpine as build-env

ADD . /app
WORKDIR /app
RUN go build -o hello

FROM alpine
COPY --from=build-env /app/hello /app/hello


ENTRYPOINT ["/app/hello"]