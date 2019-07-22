FROM node:8.10.0

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list \
&& apt-get update \
&& apt-get install -y --no-install-recommends libavahi-compat-libdnssd-dev \
&& apt-get install -y --no-install-recommends cron \
&& apt-get install -y --no-install-recommends mongodb \
&& apt-get install -y --no-install-recommends vim \
&& sed -i "s/exit 101/exit 0/" /usr/sbin/policy-rc.d \
&& apt-get clean \
&& mkdir -p /home/Service \
&& useradd --create-home --no-log-init --shell /bin/bash l \
&& adduser l sudo \
&& echo 'l:l' | chpasswd \
&& npm install -g cnpm --registry=https://registry.npm.taobao.org \
&& cnpm install -g pm2-web \
&& npm install -g pm2 \
&& rm -rf /var/lib/apt/lists/*


CMD "/bin/bash"
