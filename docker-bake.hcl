# IMAGE_TAG=$(git rev-parse --short HEAD) docker buildx bake

variable "IMAGE_TAG" {
  default = "latest"
}
variable "IMAGES" {
  default = [
    # "ghcr.io/ks-yuzu/kube-diagrams:${IMAGE_TAG}",                             # GHCR
    "ghcr.io/ks-yuzu/kube-diagrams",                             # GHCR
  ]
}

group "default" {
  targets = ["default"]
}

target "base" {
  # pull = "always"
  # labels = {}
}

target "default" {
  inherits = ["base"]
  # target = ""

  dockerfile = "Dockerfile"
  tags = IMAGES
}
