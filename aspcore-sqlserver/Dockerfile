#  build image
FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build
WORKDIR /app

# Just in case that you didn't define it on the docker-compose
ENV DOTNET_USE_POLLING_FILE_WATCHER 1

# Copy sln
COPY *.sln ./

# Copy the main source project files
COPY src/*/*.csproj ./
RUN for file in $(ls *.csproj); do mkdir -p src/${file%.*}/ && mv $file src/${file%.*}/; done

# Copy the test project files
COPY test/*/*.csproj ./
RUN for file in $(ls *.csproj); do mkdir -p test/${file%.*}/ && mv $file test/${file%.*}/; done

# Copy docker files (usually referenced in the .sln)
COPY docker* ./

# If you need to restore your solution (Usually you can skip this)
# Use RUN dotnet restore if you don't have *.dcproj files on your root folder
# RUN dotnet restore "ProjectSolution.sln"

# TODO: Replace "ProjectFolder" with your main project 
WORKDIR /app/src/ProjectFolder
RUN dotnet restore

# This will build and launch the server with hot reloading
ENTRYPOINT dotnet watch run --no-restore --urls "http://+:5000" --verbose
