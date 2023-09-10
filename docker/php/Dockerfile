FROM php:8.2.10-fpm

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

RUN apt-get update && apt-get install -y \
    unzip git

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions @composer pdo pdo_mysql

RUN addgroup --system --gid ${GID} learnfinitylabs
RUN adduser --system --home /bin/sh --no-create-home --uid ${UID} --ingroup learnfinitylabs --disabled-login --disabled-password learnfinitylabs

RUN sed -i 's/user = www-data/user = learnfinitylabs/g' /usr/local/etc/php-fpm.d/www.conf
RUN sed -i 's/group = www-data/group = learnfinitylabs/g' /usr/local/etc/php-fpm.d/www.conf
RUN echo "php_admin_flag[log_errors] = on" >> /usr/local/etc/php-fpm.d/www.conf

WORKDIR ${PHP_HOST_ROOT_DIRECTORY}

COPY ./php.ini /usr/local/etc/php/php.ini

USER learnfinitylabs

