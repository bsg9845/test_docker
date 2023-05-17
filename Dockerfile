FROM python:3.8-slim

COPY . /my-app

WORKDIR /my-app

RUN pip install -r requirements.txt

RUN python -m spacy download en_core_web_sm


EXPOSE 8010

CMD ["python", "app.py"]
