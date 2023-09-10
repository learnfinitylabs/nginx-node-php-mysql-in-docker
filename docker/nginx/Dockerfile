FROM nginx:1.25

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

RUN addgroup --system --gid ${GID} learnfinitylabs
RUN adduser --system --home /bin/sh --no-create-home --uid ${UID} --ingroup learnfinitylabs --disabled-login --disabled-password learnfinitylabs
RUN sed -i 's/user  nginx/user learnfinitylabs/g' /etc/nginx/nginx.conf

WORKDIR ${NGINX_HOST_ROOT_DIRECTORY}

COPY ./default.conf /etc/nginx/conf.d/default.conf
