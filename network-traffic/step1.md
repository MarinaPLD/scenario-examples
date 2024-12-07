
# Step 1: Run the BunkerWeb stack

In this step, you will launch the BunkerWeb stack with the web UI using Docker.

## Run BunkerWeb stack

Firstly, let's verify the docker-compose file that we will use to run the BunkerWeb container.

```bash
cat docker-compose.yml
```{{exec}}

You may ask yourself, **what is a `docker-compose.yml` file?** It is a YAML file that defines services, networks, and volumes for a Docker application. The `docker-compose.yml` file is used to configure the services that make up the BunkerWeb stack.

<br>
<details><summary><b>Want to use another version of BunkerWeb ?</b></summary>
<br>

If we want to use another version of BunkerWeb, we can change the `tag` in the `docker-compose.yml` file. For example, if we want to use the `dev` version, we can change the `tag` to `dev`, here's how you can do it:

We export the new tag that we want to use in the environment variable `NEW_TAG`:

```bash
export NEW_TAG=dev # or any other version
```{{copy}}

And then we replace the tag in the `docker-compose.yml` file with the new tag:

```bash
export BUNKERWEB_TAG=$(grep -m 1 image docker-compose.yml | cut -d ':' -f3)
sed -i "s|:${BUNKERWEB_TAG}$|:${NEW_TAG}|g" docker-compose.yml
```{{exec}}

</details>
<br>

And now we can start the stack:

```bash
docker-compose up -d
```{{exec}}

## Verify the Containers are running

Check if the containers are running by using the following command:

```bash
docker-compose ps
```{{exec}}

The output should display the running containers and their status.
