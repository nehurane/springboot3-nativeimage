FROM container-registry.oracle.com/graalvm/native-image-ee:latest as graalvm

RUN microdnf -y install wget unzip zip findutils tar

COPY . /home/app
WORKDIR /home/app

RUN \
    # Install SDKMAN
    curl -s "https://get.sdkman.io" | bash; \
    source "$HOME/.sdkman/bin/sdkman-init.sh"; \
    ## Install Gradle
    sdk install gradle; \
    ./gradlew nativeCompile

FROM container-registry.oracle.com/os/oraclelinux:8-slim

EXPOSE 8080

# # For Gradle build
COPY --from=graalvm /home/app/build/native/nativeCompile/nativeimage native-app

ENTRYPOINT ["/native-app"]