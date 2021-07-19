# Fork of https://github.com/fhivemind/concourse-dind

See original docs at https://github.com/fhivemind/concourse-dind for how to use this container image in Concourse jobs.

This fork makes entrypoint.sh executable, removes docker-squash and docker-compose, and uses a newer version of Docker.

## Runs docker inside a container

This container image can be used to run Docker commands inside a container, which is handy for Concourse CI jobs
to allow them to use Docker CLI commands.

## Example of building and testing this container image locally

```bash
docker build . -t concourse-dind
docker run --privileged concourse-dind docker run hello-world
```
