terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("<NAME>.json")

  project = "<PROJECT_ID"
  region  = "us-east-1"
  zone    = "us-east-1"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}