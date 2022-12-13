FROM golang:alpine AS builder
WORKDIR /app
COPY . .
RUN go build -ldflags "-w" .

FROM scratch
WORKDIR /app
COPY --from=builder /app/golang .
ENTRYPOINT ["./golang"]