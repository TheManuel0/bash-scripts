FROM python:2.7
COPY . /pyweb
WORKDIR /pyweb
RUN pip install flask requests
ENV FLASK_APP=app.py
CMD ["flask", "run", "--host", "0.0.0.0"]
