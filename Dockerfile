FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
ADD . /app
WORKDIR /app

COPY *.csproj ./
RUN dotnet restore

COPY . ./
RUN dotnet publish -c Release -o publishdir

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime
EXPOSE 5555
WORKDIR /app
COPY --from=build-env /app/publishdir .
ENTRYPOINT ["dotnet", "FreeSmoke.dll"]