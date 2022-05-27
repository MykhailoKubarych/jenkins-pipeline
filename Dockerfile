FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /app
COPY . .
WORKDIR /app/Sample

RUN dotnet build "Sample.sln" -c Release -o /app/build

FROM build as test
WORKDIR /app
COPY --from=build /app/build .
WORKDIR /app/Sample
