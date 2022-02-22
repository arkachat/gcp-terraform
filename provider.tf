provider "google" {

 # credentials = file("service_account_key.json")

  project = "var.project_id"

  region = "var.region"

  zone = "var.zone"

}

