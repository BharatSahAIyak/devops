# Maintenance and Debugging

### Maintaining Servies

1. Grafana can be used to view logs
2. Environments variables can be updated through Vault
3. A github action can be used to redeploy services directly through Github

### Observability

1. Alerts related to node and containers can be sent to discord channel by providing DISCORD_WEBHOOK_URL in .env
2. Uptime can be used to configure alerts externally on any URL (multiple channels can be configured depending upon preference)


### Upgrading Services 

Every custom services (built by BHASAI Team) in docker-compose.yaml has variables defined to update image tag/ memory limit, cpus etc.

Example. If you want to upgrade a specific service x_y to  a newer image tag, you can update the variable X_Y_IMAGE_TAG in vault and redeploy it using github actions 

### Useful Commands 

1. Deploy a newly added service or pull and redeploy a service

    `make deploy [services=<service_name>]`

3. Stop a service 

    `make stop [services=<service_name>]`

4. Restart a service 

    `make restart [services=<service_name>]`

5. Delete a service 

    `make down [services=<service_name>]`
    
    Note: Volumes are preserved
    
6. Pull images
    `make pull [services=<service_name>]`

7. Build images
    `make build [services=<service_name>]`

### Useful Utilities

1. Migrate Volume from localhost to localhost/remote 

    `make migrate-volume` 

> [!NOTE]
>  Optional environment variable to tweak behaviour of Makefile:
> 1. `ENABLE_FORCE_RECREATE` (set this to 1 to enable force recreations of containers every time a service is deployed)
> 2. `DISABLE_ANSI` (set this to 1 to prevent ANSI output from Docker CLI)
> 3. `DISABLE_REMOVE_ORPHANS` (orphan containers are removed by default when your run `make deploy` without <service_name>, set this to 1 to disable this behaviour)
> 4. `DISABLE_PULL` (images are pulled/rebuilt by default (if you provide `<service_name>`, image for only that service is pulled/rebuilt) when you run `make deploy [services=<service_name>]`,  set this to 1 to disable this behaviour)
> 5. `<service_name>` accepts either one or multiple values separated by space
> 6. `ENABLE_GIT_PULL` (set this to 1 to automatically pull the latest code from the checked out branch before deploying services)
