FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /app

COPY *.csproj ./
RUN dotnet restore

COPY . ./
RUN ls
RUN dotnet publish -c Release -o publishdir

FROM mcr.microsoft.com/dotnet/core/runtime-deps AS runtime
EXPOSE 5555
WORKDIR /app
COPY --from=build /app/publishdir .
ENTRYPOINT ["dotnet", "FreeSmoke.dll"]