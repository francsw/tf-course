terraform {
  backend "remote" {
    organization = "OSS-FS-Lab"

    workspaces {
      name = "lab-day2"
    }
  }
}
