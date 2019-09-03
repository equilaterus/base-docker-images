docker ps
$container = Read-Host "Please enter container name:"
docker exec -it $container sh
