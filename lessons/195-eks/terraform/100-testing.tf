################################################################################
## Example usage of the random provider to create a 4-character random string
## with lowercase letters only
################################################################################
resource "random_string" "random_4_characters" {
  length  = 4
  special = false
  upper   = false
  lower   = true
}

output "random_4_character_string" {
  value = random_string.random_4_characters.result
}

################################################################################
## Example usage of the random provider to create a random pet name
################################################################################
resource "random_pet" "example" {
  length = 2
}

output "random_pet_id" {
  value = random_pet.example.id
}

output "random_pet_name" {
  value = random_pet.example.id
}

################################################################################
## Example usage of the time provider to get the current time
################################################################################
resource "time_static" "now" {
  triggers = {
    build = timestamp()
  }
}

output "current_time" {
  value = time_static.now.id
}
