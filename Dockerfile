FROM container-registry.oracle.com/os/oraclelinux:8-slim
#FROM gcr.io/graalvm/jdk:ol8-java17
#FROM scratch
VOLUME /tmp
EXPOSE 8080
COPY build/native/nativeCompile/nativeimage .
ENTRYPOINT ["/nativeimage"]