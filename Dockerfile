#FROM container-registry.oracle.com/graalvm/native-image-ee:latest
#FROM scratch
FROM container-registry.oracle.com/os/oraclelinux:8-slim
EXPOSE 8080
COPY build/native/nativeCompile/nativeimage  /nativeimage
ENTRYPOINT [ "/nativeimage"]