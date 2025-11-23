How to run
```aiexclude
$ skaffold delete && skaffold dev --cache-artifacts=false
```

logs
```aiexclude
$ skaffold delete && skaffold dev --cache-artifacts=false

Cleaning up...
Error: uninstall: Release not loaded: my-postgresql: release: not found
Cleaning up resources encountered an error, will continue to clean up other resources.
Generating tags...
 - atlas-migrations -> atlas-migrations:a247fd8-dirty
Starting build...
Found [docker-desktop] context, using local docker daemon.
Building [atlas-migrations]...
Target platforms: [linux/arm64]
#0 building with "desktop-linux" instance using docker driver

#1 [internal] load build definition from Dockerfile
#1 transferring dockerfile: 539B done
#1 DONE 0.0s

#2 [auth] library/ubuntu:pull token for registry-1.docker.io
#2 DONE 0.0s

#3 [internal] load metadata for docker.io/library/ubuntu:latest
#3 DONE 0.3s

#4 [internal] load .dockerignore
#4 transferring context: 2B done
#4 DONE 0.0s

#5 [1/7] FROM docker.io/library/ubuntu:latest@sha256:c35e29c9450151419d9448b0fd75374fec4fff364a27f176fb458d472dfc9e54
#5 DONE 0.0s

#6 [internal] load build context
#6 transferring context: 282B done
#6 DONE 0.0s

#7 [6/7] RUN chmod +x ./migration-script.sh
#7 CACHED

#8 [4/7] COPY atlas.hcl .
#8 CACHED

#9 [5/7] COPY migration-script.sh .
#9 CACHED

#10 [2/7] WORKDIR /app
#10 CACHED

#11 [3/7] COPY migrations migrations
#11 CACHED

#12 [7/7] RUN apt-get update -y     && apt-get upgrade -y      && apt-get install curl -y      && apt-get install postgresql-client -y     && curl -sSf https://atlasgo.sh | sh -s -- -y
#12 CACHED

#13 exporting to image
#13 exporting layers done
#13 writing image sha256:7d7dfef2cb1db6292075463140dd134f087819973bf62e1fbd32aefbaa969d32 done
#13 naming to docker.io/library/atlas-migrations:a247fd8-dirty done
#13 DONE 0.0s

View build details: docker-desktop://dashboard/build/desktop-linux/desktop-linux/mi9t5hzaho904ya1lnplzjen8

What's next:
    View a summary of image vulnerabilities and recommendations → docker scout quickview
Build [atlas-migrations] succeeded
Tags used in deployment:
 - atlas-migrations -> atlas-migrations:7d7dfef2cb1db6292075463140dd134f087819973bf62e1fbd32aefbaa969d32
Starting deploy...
Helm release my-postgresql not installed. Installing...
I1123 17:42:50.639813    3191 warnings.go:110] "Warning: spec.SessionAffinity is ignored for headless services"
NAME: my-postgresql
LAST DEPLOYED: Sun Nov 23 17:42:49 2025
NAMESPACE: atlas-operator-ns
STATUS: deployed
REVISION: 1
DESCRIPTION: Install complete
TEST SUITE: None
NOTES:
CHART NAME: postgresql
CHART VERSION: 18.1.10
APP VERSION: 18.1.0

⚠ WARNING: Since August 28th, 2025, only a limited subset of images/charts are available for free.
    Subscribe to Bitnami Secure Images to receive continued support and security updates.
    More info at https://bitnami.com and https://github.com/bitnami/containers/issues/83267

** Please be patient while the chart is being deployed **

PostgreSQL can be accessed via port 5432 on the following DNS names from within your cluster:

    my-postgresql.atlas-operator-ns.svc.cluster.local - Read/Write connection

To get the password for "postgres" run:

    export POSTGRES_ADMIN_PASSWORD=$(kubectl get secret --namespace atlas-operator-ns my-postgresql -o jsonpath="{.data.postgres-password}" | base64 -d)

To get the password for "myuser" run:

    export POSTGRES_PASSWORD=$(kubectl get secret --namespace atlas-operator-ns my-postgresql -o jsonpath="{.data.password}" | base64 -d)

To connect to your database run the following command:

    kubectl run my-postgresql-client --rm --tty -i --restart='Never' --namespace atlas-operator-ns --image registry-1.docker.io/bitnami/postgresql:latest --env="PGPASSWORD=$POSTGRES_PASSWORD" \
      --command -- psql --host my-postgresql -U myuser -d mydatabase -p 5432

    > NOTE: If you access the container using bash, make sure that you execute "/opt/bitnami/scripts/postgresql/entrypoint.sh /bin/bash" in order to avoid the error "psql: local user with ID 1001} does not exist"

To connect to your database from outside the cluster execute the following commands:

    kubectl port-forward --namespace atlas-operator-ns svc/my-postgresql 5432:5432 &
    PGPASSWORD="$POSTGRES_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5432

WARNING: The configured password will be ignored on new installation in case when previous PostgreSQL release was deleted through the helm command. In that case, old PVC will have an old password, and setting it through helm won't take effect. Deleting persistent volumes (PVs) will solve the issue.
WARNING: Rolling tag detected (bitnami/postgresql:latest), please note that it is strongly recommended to avoid using rolling tags in a production environment.
+info https://techdocs.broadcom.com/us/en/vmware-tanzu/application-catalog/tanzu-application-catalog/services/tac-doc/apps-tutorials-understand-rolling-tags-containers-index.html
WARNING: Rolling tag detected (bitnami/os-shell:latest), please note that it is strongly recommended to avoid using rolling tags in a production environment.
+info https://techdocs.broadcom.com/us/en/vmware-tanzu/application-catalog/tanzu-application-catalog/services/tac-doc/apps-tutorials-understand-rolling-tags-containers-index.html

WARNING: There are "resources" sections in the chart not set. Using "resourcesPreset" is not recommended for production. For production installations, please set the following values according to your workload needs:
  - primary.resources
  - readReplicas.resources
+info https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
WARN[0006] image [atlas-migrations:7d7dfef2cb1db6292075463140dd134f087819973bf62e1fbd32aefbaa969d32] is not used.  subtask=-1 task=DevLoop
WARN[0006] See helm documentation on how to replace image names with their actual tags: https://skaffold.dev/docs/pipeline-stages/deployers/helm/#image-configuration  subtask=-1 task=DevLoop
Waiting for deployments to stabilize...
 - atlas-operator-ns:statefulset/my-postgresql: Waiting for 1 pods to be ready...
 - atlas-operator-ns:statefulset/my-postgresql is ready.
Deployments stabilized in 12.087 seconds
 - Warning: resource namespaces/atlas-operator-ns is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by kubectl apply. kubectl apply should only be used on resources created declaratively by either kubectl create --save-config or kubectl apply. The missing annotation will be patched automatically.
 - namespace/atlas-operator-ns configured
 - secret/postgres-credentials created
 - deployment.apps/atlas-migrations created
Waiting for deployments to stabilize...
 - atlas-operator-ns:deployment/atlas-migrations is ready.
Deployments stabilized in 1.082 second
Starting post-deploy hooks...
[atlas-migrations] Waiting for postgresSql...
[atlas-migrations] my-postgresql.atlas-operator-ns.svc.cluster.local:5432 - accepting connections
[atlas-migrations] PostgresSql is up
[atlas-migrations] Migrating to version 20251123065843 (2 migrations in total):
[atlas-migrations]
[atlas-migrations]   -- migrating version 20251123065832
[atlas-migrations]     -> CREATE TABLE providers (
[atlas-migrations]                                   id SERIAL PRIMARY KEY,
[atlas-migrations]                                   name VARCHAR(255) NOT NULL,
[atlas-migrations]                                   email VARCHAR(255) UNIQUE NOT NULL
[atlas-migrations]        );
[atlas-migrations]   -- ok (85.522833ms)
[atlas-migrations]
[atlas-migrations]   -- migrating version 20251123065843
[atlas-migrations]     -> CREATE TABLE client (
[atlas-migrations]                                id SERIAL PRIMARY KEY,
[atlas-migrations]                                first_name VARCHAR(255) NOT NULL,
[atlas-migrations]                                last_name VARCHAR(255) NOT NULL
[atlas-migrations]        );
[atlas-migrations]   -- ok (2.040666ms)
[atlas-migrations]
[atlas-migrations]   -------------------------
[atlas-migrations]   -- 189.577709ms
[atlas-migrations]   -- 2 migrations
[atlas-migrations]   -- 2 sql statements
[atlas-migrations] PostgresSql migration is completed
Completed post-deploy hooks
Port forwarding service/my-postgresql in namespace atlas-operator-ns, remote port 5432 -> http://127.0.0.1:5432
Listing files to watch...
 - atlas-migrations
Press Ctrl+C to exit
Watching for changes...
^CCleaning up...
 - namespace "atlas-operator-ns" deleted
 - secret "postgres-credentials" deleted from atlas-operator-ns namespace
 - deployment.apps "atlas-migrations" deleted from atlas-operator-ns namespace
release "my-postgresql" uninstalled
Pruning images...
WARN[0726] builder cleanup:pruning images: Error response from daemon: conflict: unable to delete 7d7dfef2cb1d (cannot be forced) - image is being used by running container da97431bd6d8  subtask=-1 task=DevLoop

```
