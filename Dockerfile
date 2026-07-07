ARG WODBY_BASE_IMAGE
FROM ${WODBY_BASE_IMAGE}

ARG COPY_FROM
COPY --chown=wodby:wodby ${COPY_FROM} /usr/src/app

RUN if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
