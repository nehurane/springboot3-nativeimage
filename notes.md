A new Gradle task is not necessary, you just need Cloud Native Buildpacks that are native image aware. The Paketo project (the default CNB implementation used by Spring Boot) has a native-image buildpack now.

Add the GraalVM Native Build Tools plugin to your build, add the following snippet to your build.gradle file, and bootBuildImage should generate an OCI image containing a native executable.


tasks.named('bootBuildImage') {
builder = 'paketobuildpacks/builder:tiny'
environment = ['BP_NATIVE_IMAGE': 'true']
}

-----


FROM container-registry.oracle.com/graalvm/native-image-ee:latest AS build
WORKDIR /build/native/nativeCompile
RUN mkdir -p /app
COPY /build/libs/nativeimage-0.0.1-SNAPSHOT-plain.jar app.jar
#RUN $GRAALVM_HOME/bin/gu install native-image
RUN native-image \
--static \
--enable-http \
--no-fallback \
--initialize-at-build-time=org.eclipse.jetty,org.slf4j,javax.servlet,org.sparkjava \
-cp app.jar \
-H:Name=app \
-H:Class=com.example.graalVM.nativeimage.NativeimageApplication \
-H:+ReportUnsupportedElementsAtRuntime \
-H:+ReportExceptionStackTraces

FROM scratch
EXPOSE 8080
COPY build/native/nativeCompile/nativeimage app
CMD ["/app"]