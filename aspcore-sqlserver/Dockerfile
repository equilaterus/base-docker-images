# TODO: Image for ASP Core 3.1. Change image to compile other versions
# Recommended to use a -focal version to use the same OS
# More versions: https://hub.docker.com/_/microsoft-dotnet-sdk
FROM mcr.microsoft.com/dotnet/sdk:3.1.421-focal AS build
WORKDIR /app

# Just in case that you didn't define it on the docker-compose
ENV DOTNET_USE_POLLING_FILE_WATCHER 1

# Installing Node
# We directly answer the questions asked using the printf statement
# Prevent 'Warning: apt-key output should not be parsed (stdout is not a terminal)'
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

# Install NodeJS {VER}.x
# see https://github.com/nodesource/distributions/blob/master/README.md#deb
RUN apt-get update -yq 
RUN apt-get install curl gnupg -yq 
# TODO: Replace {VER}. Example: setup_14.x or setup_16.x
RUN curl -sL https://deb.nodesource.com/setup_{VER}.x | bash -
RUN apt-get install -y nodejs

# Copy sln
COPY *.sln ./

# Copy the main source project files
COPY src/*/*.csproj ./
RUN for file in $(ls *.csproj); do mkdir -p src/${file%.*}/ && mv $file src/${file%.*}/; done

# This will build and launch the server with hot reloading
# TODO: Replace {MAIN_WEB_PROJECT} with the startup project
WORKDIR /app/src/{MAIN_WEB_PROJECT}
RUN dotnet restore

# Comment to create migration, uncomment to RUN dev
ENTRYPOINT dotnet watch run --no-restore --urls "http://+:5000" --verbose

# Create Migrations using the container:
# Uncomment following lines
# TODO: Replace version for your ASP Core version: https://www.nuget.org/packages/dotnet-ef/
#RUN dotnet tool update --global dotnet-ef --version 3.1.27
#ENTRYPOINT ["sh", "-c", "sleep 2073600"]
