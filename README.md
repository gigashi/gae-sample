# Google App Engine sample

Google Cloud Platform: [https://console.cloud.google.com/home/dashboard](https://console.cloud.google.com/home/dashboard)

## Local test

```bash
make run-local-test

curl http://127.0.0.1:8080/hello
```

## Login

```bash
make run-gcloud
> gcloud auth login
```

## Deploy

```bash
gcloud projects list
gcloud app deploy --project <project_id>
```