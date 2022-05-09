variable "bucket_name" {
  type = string
  description = "test-bucket-tf"
}
variable "bucket_location" {
  type = string
  default = "us-central1-c"
}
variable "project_id" {
  type = string
  default = "learning-project"
}
variable "storage_class" {
  type = string
}

