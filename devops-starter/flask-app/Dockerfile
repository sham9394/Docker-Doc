# Flask multi-stage Dockerfile - build small final image
FROM python:3.11-slim as build
WORKDIR /app
COPY requirements.txt .
RUN python -m pip install --upgrade pip && pip wheel -r requirements.txt -w /wheels

FROM python:3.11-slim AS runtime
WORKDIR /app
COPY --from=build /wheels /wheels
COPY . .
RUN pip install --no-index --find-links=/wheels -r requirements.txt
ENV PYTHONUNBUFFERED=1
EXPOSE 5000
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
