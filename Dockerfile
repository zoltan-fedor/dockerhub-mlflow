FROM python:3.8.13-slim

# required by mysqclient
RUN apt-get update -y && \
    apt-get install -y python3-dev default-libmysqlclient-dev build-essential

RUN pip install PyMySQL==0.10.1 mysqlclient==2.0.3 && \   
    pip install psycopg2-binary==2.8.6 && \
    pip install mlflow[extras]==1.30.0

ENV BACKEND_STORE_URI=
ENV DEFAULT_ARTIFACT_ROOT=/opt/artifact

EXPOSE 80

CMD ["sh", "-c", "mlflow server --host 0.0.0.0 --port 80 --gunicorn-opts \"$GUNICORN_OPTS\" --backend-store-uri $BACKEND_STORE_URI --artifacts-destination $ARTIFACTS_DESTINATION --serve-artifacts"]
