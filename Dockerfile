FROM golang:1.18-alpine as dev

WORKDIR /work

FROM golang:1.18-alpine as build

WORKDIR /opt/app
COPY ./src/* /opt/app/
RUN go mod init cbe
RUN go build -o exe

FROM alpine:latest as runtime

COPY --from=build /opt/app/exe /opt/
CMD ./opt/exe

