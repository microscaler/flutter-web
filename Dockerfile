ARG VERSION="latest"
FROM microscaler/flutter-dart-base:${VERSION}

# Setup flutter tools for web developement
RUN set -eux; flutter config --no-analytics --enable-web \
    && flutter precache --universal --web

# https://security.snyk.io/vuln/SNYK-ALPINE316-EXPAT-3062883
RUN apk upgrade expat

# Add lables
LABEL name="plugfox/flutter:${VERSION}-web" \
    description="Alpine with flutter & dart for web" \
    flutter.channel="${VERSION}" \
    flutter.version="${VERSION}"

# By default
USER root
WORKDIR /build
SHELL [ "/bin/bash", "-c" ]
CMD [ "flutter", "doctor" ]