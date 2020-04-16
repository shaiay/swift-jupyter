# Add ssh server to swift-jupyter container

Allows using the container for general swift/tf develoment using cmdline tools and remote IDEs (e.g. VScode). Exposes a SSH server. Uses the host's host keys, for consistency across container runs.
The container is tagged `swift-dev` 

## Building
* Build the swift-jupyter image
* In this folder
    * Generate a SSH keypair
    ```
    ssh-keygen -f swift-jupyter_rsa 
    ```
    * build
    ```
    docker build . -t swift-dev
    ```

## Running
Use `run.sh` for convenience. It will open port 8022 for SSH and 8888 for Jupyter. Jupyter is not run by default, you can run it with the script `/root/run_jupyter`

## Connecting
```
ssh root@localhost -p 8022 -i ~/swift-jupyter_rsa.pub
```
