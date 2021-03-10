FROM martinussuherman/alpine-code-server:3.9.0-alpine3.12

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
   dotnet_sdk_version=5.0.103 \
   && wget -O dotnet.tar.gz https://dotnetcli.azureedge.net/dotnet/Sdk/$dotnet_sdk_version/dotnet-sdk-$dotnet_sdk_version-linux-musl-x64.tar.gz \
   && dotnet_sha512='0bb6fc1aa4b8486b437f28baeda3b810f7c38ef195761a5eb4c5236975efc505dbff7abbdf7549a34278d110c8a7cf283e52f033a404b300e0f96a8ae0fca4a8' \
   && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c - \
   && mkdir -p /usr/share/dotnet \
   && tar -oxzf dotnet.tar.gz -C /usr/share/dotnet \
   && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
   && rm dotnet.tar.gz \
   # Trigger first run experience by running arbitrary cmd
   && dotnet help
