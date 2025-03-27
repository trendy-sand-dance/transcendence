

# Idea

Have a config file, which will contain the local path to the service's repo, and the remote image address.


## extends
We can manually readout the volumes from the included docker-compose.yml file using our script.
Then we insert those volumes (and possibly network info) to our generated docker-compose file, which we will feed to docker using the `-f /dev/stdin` flag

## Config file fields

- REMOTE_IMAGE_PATH
- LOCAL_IMAGE_PATH


## Replacing extends keyword

The script will readout this config and generate some mandatory fields in for the compose yaml it will generate.
The following fields should be generated, 



Read the path for the docker-compose file from a 
