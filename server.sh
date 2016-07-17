#/bin/bash
NPS_VERSION=1.11.33.2
NGINX_VERSION=1.11.1
UBUNTU_VERSION="$(lsb_release -cs)"

# Обновление, установка необходимого софта
apt-get update
apt-get upgrade -y
apt-get install -y build-essential zlib1g-dev libpcre3 libpcre3-dev unzip git wget

# Получаем mod_pagespeed
cd /usr/src/
wget https://github.com/pagespeed/ngx_pagespeed/archive/release-${NPS_VERSION}-beta.zip -O release-${NPS_VERSION}-beta.zip
unzip release-${NPS_VERSION}-beta.zip
cd ngx_pagespeed-release-${NPS_VERSION}-beta/
wget https://dl.google.com/dl/page-speed/psol/${NPS_VERSION}.tar.gz
tar -xzvf ${NPS_VERSION}.tar.gz
cd ..

# Получаем nginx
echo "deb http://nginx.org/packages/mainline/ubuntu/ ${UBUNTU_VERSION} nginx" >> /etc/apt/sources.list
echo "deb-src http://nginx.org/packages/mainline/ubuntu/ ${UBUNTU_VERSION} nginx" >> /etc/apt/sources.list
wget http://nginx.org/keys/nginx_signing.key && apt-key add nginx_signing.key
apt-get update
apt-get install -y dpkg-dev
apt-get build-dep -y nginx
apt-get source nginx

# Конфигурируем и компилим
cd nginx-${NGINX_VERSION}
sed -i "s/--with-ld-opt=\"\$(LDFLAGS)\"/--with-ld-opt=\"\$(LDFLAGS)\" \\\\\n        --add-module=\/usr\/src\/ngx_pagespeed-release-${NPS_VERSION}-beta/" debian/rules
dpkg-buildpackage -rfakeroot -uc -b
cd ..

# Устанавливаем
dpkg -i nginx_${NGINX_VERSION}-1~${UBUNTU_VERSION}_amd64.deb
nginx -V

# Настраиваем
sed -i "s/http {/http {\n    pagespeed On;\n    pagespeed FileCachePath \"\/var\/cache\/ngx_pagespeed\/\";\n/" /etc/nginx/nginx.conf
nginx -t && service nginx reload



