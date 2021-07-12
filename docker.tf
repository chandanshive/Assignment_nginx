provider "docker" {
}

resource "docker_image" "nginx" {
  name         = "nginx:1.11-alpine"
  keep_locally = "true"
}

resource "docker_container" "nginx-server" {
  name  = "nginx-server"
  image = docker_image.nginx.latest
  ports {
    internal = 80
  }

  volumes {
    container_path = "/usr/share/nginx/html"
    host_path      = "/tmp/"
    read_only      = true

  }
}
