FROM fluent/fluentd:v1.3.1

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev git \
 && apk add libstdc++ \
 && sudo gem install \
        specific_install \
        fluent-plugin-elasticsearch \
        fluent-plugin-nats \
#        fluent-plugin-amqp \
 && sudo gem specific_install -l https://github.com/Heilihq/fluent-plugin-heili.git \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.5.0/cache/*.gem
