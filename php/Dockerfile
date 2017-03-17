FROM php:7.0-fpm
MAINTAINER k12-PHP "szb345@gmail.com"

ADD sources.list    /etc/apt/sources.list
# 安装modules
RUN apt-get update && apt-get install -y \
        libxml2-dev \
        libfreetype6-dev \
        libmemcached-dev \
        libmcrypt-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        unzip \
        && docker-php-ext-install -j$(nproc) iconv mcrypt \
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install -j$(nproc) gd \
        && docker-php-ext-install mysqli \
        && docker-php-ext-install opcache \
        && docker-php-ext-install zip \
        && pecl install redis \
        && docker-php-ext-enable redis \
        && docker-php-ext-install pdo_mysql \
        && docker-php-ext-install xml \
        && docker-php-ext-install opcache \
        && apt-get clean

ADD php.ini    /usr/local/etc/php/php.ini
ADD php-fpm.conf    /usr/local/etc/php-fpm.conf


##phalcon
ADD cphalcon-3.0.1.tar.gz /home/
RUN cd /home/cphalcon-3.0.1/build && ./install
RUN docker-php-ext-enable phalcon

##xdebug
#RUN pecl install xdebug \
#&& echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
#&& echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/conf.d/xdebug.ini \
#&& echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
#&& echo "xdebug.remote_handler=dbgp" >> /usr/local/etc/php/conf.d/xdebug.ini \
#&& echo "xdebug.remote_host=192.168.99.100" >> /usr/local/etc/php/conf.d/xdebug.ini \
#&& echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/xdebug.ini \
#&& echo "xdebug.remote_autostart=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
#&& echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/xdebug.ini

##composer
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer \
#&& composer config -g repo.packagist composer https://packagist.phpcomposer.com

WORKDIR /opt

RUN usermod -u 1000 www-data
RUN  cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
EXPOSE 9000

