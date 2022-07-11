terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}
provider "kubernetes" {
  config_path = "~/.kube/config"
}
resource "kubernetes_namespace" "alight" {
  metadata {
    name = "alight"
  }
}
resource "kubernetes_deployment" "alight" {
  metadata {
    name      = "alight"
    namespace = kubernetes_namespace.alight.metadata.0.name
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "alight"
      }
    }
    template {
      metadata {
        labels = {
          app = "alight"
        }
      }
      spec {
        container {
          image = "aze012/alight:latest"
          name  = "alight-pod"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}
resource "kubernetes_service" "alight-svc" {
  metadata {
    name      = "nginx"
    namespace = kubernetes_namespace.alight.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.alight.spec.0.template.0.metadata.0.labels.app
    }
    type = "NodePort"
    port {
      node_port   = 30201
      port        = 80
      target_port = 80
    }
  }
}
