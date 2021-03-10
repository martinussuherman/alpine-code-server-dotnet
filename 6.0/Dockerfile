FROM martinussuherman/alpine-code-server:3.9.1-alpine3.12

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
   dotnet_sdk_version=6.0.100-preview.1.21103.13 \
   && wget -O dotnet.tar.gz https://dotnetcli.azureedge.net/dotnet/Sdk/$dotnet_sdk_version/dotnet-sdk-$dotnet_sdk_version-linux-musl-x64.tar.gz \
   && dotnet_sha512='4b8002f608e5354651b9d82fa8442bca68be730dfdb54d026763635185457a23e5e071421bb04de8f8254fe36cc2134b430aaacb363911fd93276b7c34ad935c' \
   && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c - \
   && mkdir -p /usr/share/dotnet \
   && tar -oxzf dotnet.tar.gz -C /usr/share/dotnet \
   && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
   && rm dotnet.tar.gz \
   # Trigger first run experience by running arbitrary cmd
   && dotnet help
