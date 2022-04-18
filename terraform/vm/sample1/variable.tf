variable "name" {
  type        = string
  default     = "default"
  description = " (Required) unique name for the resource. Changing this forces a new resource to be created"
}

variable "machine_type" {
  type        = string
  default     = "f1-micro"
  description = "(Required) machine type "
}

variable "zone" {
  type        = string
  default     = "us-central1-c"
  description = "(Optional) zone created in, if it is not provided, the provider zone is used."
}

variable "image" {
  type        = string
  default     = "debian-cloud/debian-9"
  description = "image from which to initialize this disk "
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "list of network tags to attach to the instance."
}
variable interface {
  type        = string
  default     = null
  description = "disk interface to use for attaching this disk, SCSI or NVME."
}
variable scopes {
  type        = string
  default     = null
  description = "description"
}
variable service_account  {
  type        = string
  default     = null
  description = "description"
}


variable attached_disk {
  type        = string
  default     = null
  description = "description"
}
variable scratch_disk {
  type        = string
  default     = null
  description = "description"
}



variable "region" {
  type        = string
  default     = "us-central1"
  description = "Name of Region."
}

variable "description" {
  type        = string
  default     = ""
  description = "(optional) brief description of this resource."
}

variable "project" {
  type        = string
  default     = "< project-id >"
  description = "(Optional) ID of the project in which the resource belongs, if not provided, provider project is used."
}
