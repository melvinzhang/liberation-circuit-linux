from debian:stable

run apt-get update \
 && apt-get -y install liballegro5-dev liballegro-image5-dev liballegro-dialog5-dev liballegro-audio5-dev liballegro-acodec5-dev \
               zip unzip python3-pip \
 && pip3 install exodus_bundler

add https://github.com/linleyh/liberation-circuit/archive/v1.3.zip /opt/v1.3.zip

run cd /opt && unzip v1.3.zip \
 && cd /opt/liberation-circuit-1.3 && ./do && /usr/local/bin/exodus -t bin/libcirc -o /opt/libcirc.tgz \
 && cp -r /opt/liberation-circuit-1.3/bin /opt/Libcirc-linux-x86_64-binary-v1.3 \
 && cd /opt/Libcirc-linux-x86_64-binary-v1.3 \
 && rm launcher.sh libcirc.do libcirc \
 && tar xvf ../libcirc.tgz \
 && rm exodus/bundles/*/usr/lib/x86_64-linux-gnu/libGL.so.1 \
       exodus/bundles/*/usr/lib/x86_64-linux-gnu/libglapi.so.0 \
       exodus/bundles/*/usr/lib/x86_64-linux-gnu/libdrm.so.2 \
 && ln -s exodus/bin/libcirc \
 && cd .. && zip -m Libcirc-linux-x86_64-binary-v1.3.zip --symlinks -r Libcirc-linux-x86_64-binary-v1.3
