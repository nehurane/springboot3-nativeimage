# springboot3-nativeimage
Experimenting springboot native image

To run the project to ./gradlew nativeCompile

native eecutable can be found at /build/native/nativeCompile/


to build OCI image
./gradlew bootBuildImage
run OCI image docker run --rm -p 8080:8080 nativeimage:0.0.1-SNAPSHOT
