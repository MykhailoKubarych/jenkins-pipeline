FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
USER root
WORKDIR /app
COPY . .
WORKDIR /app/Sample

RUN dotnet build "Sample.sln" -c Release -o /app/build

FROM build as test
USER root
WORKDIR /app
COPY --from=build /app/build .
WORKDIR /app/Sample
CMD "dotnet test -p:BuildInParallel=false -m:1 Sample.sln"
