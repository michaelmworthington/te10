FROM host.docker.internal:19443/ubuntu AS build-env
WORKDIR /scanme

COPY scanme /scanme
#RUN ["rm", "/scanme/gosum/go.sum"]
COPY go.sum /scanme/gosum/go.sum


# Build runtime image
FROM scratch
WORKDIR /scanme
COPY --from=build-env /scanme .
CMD echo "Hello world! This is my first Docker image."
