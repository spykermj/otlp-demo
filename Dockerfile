FROM golang:1.23.4-alpine3.21 as build

WORKDIR /build

COPY . .

RUN CGO_ENABLED=0 go build

FROM scratch
COPY --from=build /build/dice /bin/dice
CMD ["/bin/dice"]
