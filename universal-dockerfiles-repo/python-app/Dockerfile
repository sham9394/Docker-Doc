# Universal Dockerfile - Python (multi-stage)
ARG BASE=python:3.12-slim
FROM ${BASE} AS builder

ARG APP_HOME=/app
WORKDIR $APP_HOME

# install build deps if needed
RUN apt-get update && apt-get install -y build-essential --no-install-recommends && rm -rf /var/lib/apt/lists/*

COPY pyproject.toml poetry.lock* setup.py requirements.txt ./
# If using requirements.txt:
RUN if [ -f requirements.txt ]; then pip wheel --wheel-dir=/wheels -r requirements.txt; fi

COPY . .

# Build step placeholder (adjust for your toolchain)
RUN echo "Build or byte-compile if needed"

FROM python:3.12-slim AS runtime
ARG APP_HOME=/app
WORKDIR $APP_HOME

# runtime deps
RUN apt-get update && apt-get install -y ca-certificates --no-install-recommends && rm -rf /var/lib/apt/lists/*

# non-root user
RUN useradd -m appuser
USER appuser

ENV PYTHONUNBUFFERED=1 PORT=8000
EXPOSE $PORT

COPY --from=builder $APP_HOME $APP_HOME

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s CMD wget -qO- http://localhost:$PORT/health || exit 1

CMD ["python", "app.py"]
