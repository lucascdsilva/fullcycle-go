FROM golang:alpine as builder

WORKDIR /share

COPY . .
RUN CGO_ENABLED=0 go build app.go
RUN chmod +x app

FROM scratch AS app_go

WORKDIR /share
COPY --from=builder /share/app app

CMD ["/share/app"]
