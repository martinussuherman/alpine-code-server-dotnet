# buildkit bug workaround - https://github.com/moby/buildkit/issues/1368
FROM martinussuherman/alpine-code-server:3.10.2-alpine3.12-amd64

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
   dotnet_sdk_version=5.0.403 \
   && wget -O dotnet.tar.gz https://dotnetcli.azureedge.net/dotnet/Sdk/$dotnet_sdk_version/dotnet-sdk-$dotnet_sdk_version-linux-musl-x64.tar.gz \
   && dotnet_sha512='464eccae0e296cff3728bcf7e0dad98058d15c4972a5be71906355174918ed49e78ef28e7b24af3227b09a3fae05e86022499fd126131be6a008a86b1dbf16f3' \
   && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c - \
   && mkdir -p /usr/share/dotnet \
   && tar -oxzf dotnet.tar.gz -C /usr/share/dotnet \
   && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
   && rm dotnet.tar.gz \
   # Trigger first run experience by running arbitrary cmd
   && dotnet help
