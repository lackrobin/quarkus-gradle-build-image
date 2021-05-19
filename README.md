# Quarkus-Gradle Build Image

This image can be used on google cloud build as a build image to build a native quarkus image.

## Example usage
```yaml
steps:
  - name: gcr.io/[link to the builder image above]
    args:
      - addExtension
      - '--extensions=container-image-docker'
      - build
      - '-Dquarkus.package.type=native'
      - '-Dquarkus.native.native-image-xmx=4096m'
    entrypoint: ./gradlew
  - name: gcr.io/cloud-builders/docker
    args:
      - build
      - '-t'
      - gcr.io/[project name]/[image name]
      - '-f'
      - src/main/docker/Dockerfile.native
      - .
images:
  - gcr.io/gcr.io/[project name]/[image name]
options:
  machineType: N1_HIGHCPU_8
```