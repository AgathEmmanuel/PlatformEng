output "id" {
  value       = google_compute_instance.default.id
  description = "an identifier for the resource with formate"
}

output "instance_id" {
  value       = google_compute_instance.default.instance_id
  description = "server-assigned unique identifier of this instance"
}

output "cpu_platform" {
  value       = google_compute_instance.default.cpu_platform
  description = "CPU platform used by this instance"
}

