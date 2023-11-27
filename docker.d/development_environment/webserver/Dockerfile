FROM php:5.6-apache

# @see: https://hub.docker.com/r/tommylau/apache/~/dockerfile/
# @see: https://hub.docker.com/r/tommylau/apache/

# benefits if you use multiple RUN's, docker can cache states and only have to rebuild the new things

RUN docker-php-ext-install pdo pdo_mysql
# @see: https://gist.github.com/chadrien/c90927ec2d160ffea9c4
RUN pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/20-xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/20-xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/20-xdebug.ini \
    && echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/20-xdebug.ini

RUN curl -L https://pecl.php.net/get/redis-2.2.7.tgz >> /usr/src/php/ext/redis.tgz \
    && tar -xf /usr/src/php/ext/redis.tgz -C /usr/src/php/ext/ \
    && rm /usr/src/php/ext/redis.tgz \
    && docker-php-ext-install redis-2.2.7
RUN curl -L https://pecl.php.net/get/xdebug-2.3.3.tgz >> /usr/src/php/ext/xdebug.tgz \
    && tar -xf /usr/src/php/ext/xdebug.tgz -C /usr/src/php/ext/ \
    && rm /usr/src/php/ext/xdebug.tgz \
    && docker-php-ext-install xdebug-2.3.3 \

RUN cat /usr/src/php/php.ini-development | sed 's/^;\(date.timezone.*\)/\1 \"Europe\/Berlin\"/' > /usr/local/etc/php/php.ini

