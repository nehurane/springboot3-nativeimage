A new Gradle task is not necessary, you just need Cloud Native Buildpacks that are native image aware. The Paketo project (the default CNB implementation used by Spring Boot) has a native-image buildpack now.

Add the GraalVM Native Build Tools plugin to your build, add the following snippet to your build.gradle file, and bootBuildImage should generate an OCI image containing a native executable.


tasks.named('bootBuildImage') {
builder = 'paketobuildpacks/builder:tiny'
environment = ['BP_NATIVE_IMAGE': 'true']
}