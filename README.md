# dockerhub-mlflow
Docker image of MLFlow for DockerHub and Helm chart use.

You can find this image on DockerHub under https://hub.docker.com/r/evk02/mlflow


## Helm chart

This Docker image is recommended to be used with Helm chart https://github.com/zoltan-fedor/helm-mlflow,
which is implementing "Scenario 5" (MLflow Tracking Server enabled with proxied artifact storage access
) from https://www.mlflow.org/docs/latest/tracking.html.

## Upgrade

When after a version upgrade the MLFlow container errors out, then check out the logs.
Frequently new versions require a database schema upgrade, so you need to call the new version with
the `db upgrade` SQLAlchemy command while pointing to the MySQL instance:
```
$ kubectl run  -i --tty --rm mlflow-upgrade --image=evk02/mlflow:1.13.1 --restart=Never \
-- sh -c 'mlflow db upgrade [db uri]'
```
