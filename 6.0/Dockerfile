FROM martinussuherman/alpine-code-server:3.9.2-alpine3.12-amd64

ENV \
   # Enable correct mode for dotnet watch (only mode supported in a container)
   DOTNET_USE_POLLING_FILE_WATCHER=true \
   DOTNET_ROOT=/usr/share/dotnet

RUN \
   apk --no-cache --update add \
   ca-certificates \
   \
   # .NET Core dependencies
   icu-libs \
   krb5-libs \
   libgcc \
   libintl \
   libssl1.1 \
   libstdc++ \
   lttng-ust \
   numactl \
   zlib

RUN \
   dotnet_sdk_version=6.0.100-preview.2.21155.3 \
   && wget -O dotnet.tar.gz https://dotnetcli.azureedge.net/dotnet/Sdk/$dotnet_sdk_version/dotnet-sdk-$dotnet_sdk_version-linux-musl-x64.tar.gz \
   && dotnet_sha512='116ca2b5d7aede990bfe9d15918909857d15c9a64fa39faa20374fced4c82110a03484ca8c49ae17fefe4540b3c6c9dee6c13127400c1c93636800b07fa1d9f6' \
   && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c - \
   && mkdir -p /usr/share/dotnet \
   && tar -oxzf dotnet.tar.gz -C /usr/share/dotnet \
   && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
   && rm dotnet.tar.gz \
   # Trigger first run experience by running arbitrary cmd
   && dotnet help
