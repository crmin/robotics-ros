xhost +local:
docker compose up --build -d
docker compose exec ros /bin/bash