# ASP Core + SQL Server - Base docker image

* Easy to use.
* Hot Reload.
* Dotnet SDK.
* NodeJS.
* You can use it to create migrations.

This image it's optimized to provide a fast to use **DEVELOPMENT** .net core environment. Your project should follow this structure:

* SolutionFile.sln
* .gitignore
* docker-compose
* Dockerfile
* ...
* **src**
  * **Project**
    * ProjectA.csproj
    * ...
  * **Project2**
    * ProjectB.csproj
    * ...

## Quickstart (Linux / Windows / Other OS)

0. Copy docker from this repo into your project root.

1. On Linux, if you need start Docker service:

  ```
  sudo systemctl start docker
  ```
  
  If you prefer use this command to start the Docker Compose:

  ```
  docker-compose -f docker-compose.yml up -d --build 
  ```
  
2. Wait until the process ends and go to [http://localhost:5001](http://localhost:5001/).

3. To reset the database:

   ```
   docker volume rm essentialstatsweb_sqlserver-data 
   ```

* NOTES: UI hot reload is enabled, but debug C# is not possible.

* **IMPORTANT!**: Adding new PROJECTS to the SOLUTION require updating **docker-compose.yml** to avoid publishing build files from your host OS to the docker volume(s).


## Migrations using Docker

If you have problems with your OS while doing migrations, you can use our Dockerfile:

1. Open **Dockerfile** and comment/uncomment the latest sections according to your needs (DO NOT COMMIT changes).

2. Connect to the container on Rider going to **Services > Add Docker Connection (or open) ** and left click on the container **Create terminal**.
   You can connect using the script [explore.ps1](https://github.com/equilaterus/base-docker-images/blob/master/utils/explore.ps1).

3. Execute:

   ```bash
   export PATH="$PATH:$HOME/.dotnet/tools/"
   
   # Use dotnet ef!
   dotnet ef migrations add NAME
   ```

   You'll see changes locally reflected on your project!
   

## Links

* Visual Studio 2019 default docker images.
* https://docs.microsoft.com/en-us/aspnet/core/host-and-deploy/docker/building-net-docker-images?view=aspnetcore-2.2
* https://docs.docker.com/engine/examples/dotnetcore/
* https://natemcmaster.com/blog/2017/11/13/dotnet-watch-and-docker/
* https://andrewlock.net/optimising-asp-net-core-apps-in-docker-avoiding-manually-copying-csproj-files-part-2/
* https://stackoverflow.com/questions/29181032/add-a-volume-to-docker-but-exclude-a-sub-folder