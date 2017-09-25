# gradle

- notice: You can use this image on ec2 only. We tested by amazon linux.

## usage

volume mount: project source directory for /workspace

example

```
$ docker run --rm \
  --volume $(pwd):/workspace \
  satotka/gradle test
```

