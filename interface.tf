output "service_account_key" {
  value = base64decode(google_service_account_key.dd_integration.private_key)
}
