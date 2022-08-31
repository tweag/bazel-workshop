# Bazel Workshop

## Usage

Follow these steps to build and start the workshop image.
It is assumed that the repository is checked out into `$REPO`.

1. Build the Docker image containing bazel and other deps:

    ```
    $ docker build . -t workshop
    ```

1. Start the docker image, mounting the workspace dir:

    ```
    $ docker run \
        -v$REPO/workspace:/home/user/workspace \
        -it workshop:latest \
        bash
    ```

Since the `workspace` directory is mounted, you can use whatever you like locally to edit the definitions within.

### Credits

Based on https://github.com/tweag/symbiont-bazel-seminar
