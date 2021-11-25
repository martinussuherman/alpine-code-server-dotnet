FROM martinussuherman/alpine-code-server:3.11.1-alpine3.13-amd64

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
   dotnet_sdk_version=3.1.415 \
   && wget -O dotnet.tar.gz https://dotnetcli.azureedge.net/dotnet/Sdk/$dotnet_sdk_version/dotnet-sdk-$dotnet_sdk_version-linux-musl-x64.tar.gz \
   && dotnet_sha512='20297eb436db2fe0cb3d8edfe4ad5b7c7871116616843314830533471a344f0ca943fbc5f92685113afc331a64c90f271245a36be1c232c364add936dd06d13d' \
   && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c - \
   && mkdir -p /usr/share/dotnet \
   && tar -oxzf dotnet.tar.gz -C /usr/share/dotnet \
   && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
   && rm dotnet.tar.gz \
   # Trigger first run experience by running arbitrary cmd
   && dotnet help
