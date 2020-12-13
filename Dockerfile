FROM python:3.8.6-slim

RUN pip install PyMySQL==0.10.1 && \   
    pip install psycopg2-binary==2.8.6 && \
    pip install mlflow[extras]==1.12.1

ENTRYPOINT ["mlflow", "server"]