# Learning different types of functions in terraform

# -----------------------------------------------------------------------------
# 1. Numeric functions
# -----------------------------------------------------------------------------

output "numeric_abs" {
  value = abs(-15) # Returns the absolute value: 15
}

output "numeric_ceil" {
  value = ceil(5.1) # Returns the closest whole number greater than or equal: 6
}

output "numeric_floor" {
  value = floor(5.9) # Returns the closest whole number less than or equal: 5
}

output "numeric_max" {
  value = max(10, 50, 20) # Returns the highest number: 50
}

output "numeric_min" {
  value = min(10, 50, 20) # Returns the lowest number: 10
}

output "numeric_parseint" {
  value = parseint("100", 10) # Parses string to integer with base: 100
}

# -----------------------------------------------------------------------------
# 2. String functions
# -----------------------------------------------------------------------------

output "string_lower" {
  value = lower("HELLO") # lowercase: hello
}

output "string_upper" {
  value = upper("hello") # UPPERCASE: HELLO
}

output "string_title" {
  value = title("hello world") # Title Case: Hello World
}

output "string_trim" {
  value = trim("?!hello!?", "?!") # Trims specified characters: hello
}

output "string_substr" {
  value = substr("terraform", 0, 4) # Extract substring: terr
}

output "string_join" {
  value = join("-", ["a", "b", "c"]) # Joins list with separator: a-b-c
}

output "string_split" {
  value = split(",", "foo,bar,baz") # Splits string into list: ["foo", "bar", "baz"]
}

output "string_replace" {
  value = replace("hello world", "world", "terraform") # Replaces substring: hello terraform
}

# -----------------------------------------------------------------------------
# 3. Collection functions
# -----------------------------------------------------------------------------

output "coll_merge" {
  value = merge({ a = 1, b = 2 }, { c = 3 }) # Merges maps: {a=1, b=2, c=3}
}

output "coll_keys" {
  value = keys({ name = "Hemanth", role = "Devops" }) # Returns keys: ["name", "role"]
}

output "coll_values" {
  value = values({ name = "Hemanth", role = "Devops" }) # Returns values: ["Hemanth", "Devops"]
}

output "coll_lookup" {
  value = lookup({ env = "prod" }, "env", "dev") # Lookup with default: prod
}

output "coll_element" {
  value = element(["l", "v", "i"], 1) # Get element at index: v
}

output "coll_flatten" {
  value = flatten([["a", "b"], ["c"]]) # Flatten nested lists: ["a", "b", "c"]
}

output "coll_contains" {
  value = contains(["red", "blue"], "red") # Check if value exists: true
}

# -----------------------------------------------------------------------------
# 4. Encoding functions
# -----------------------------------------------------------------------------

output "encode_json" {
  value = jsonencode({ "hello" = "world" }) # Encode to JSON: "{\"hello\":\"world\"}"
}

output "decode_json" {
  value = jsondecode("{\"foo\": \"bar\"}") # Decode JSON: {foo = "bar"}
}

output "encode_base64" {
  value = base64encode("terraform") # Encode Base64: dGVycmFmb3Jt
}

output "decode_base64" {
  value = base64decode("dGVycmFmb3Jt") # Decode Base64: terraform
}

output "encode_yaml" {
  value = yamlencode({ "a" = 1, "b" = ["x", "y"] }) # Encode to YAML
}

# -----------------------------------------------------------------------------
# 5. Filesystem functions
# -----------------------------------------------------------------------------

output "fs_file" {
  # Reads the contents of a file at the given path
  # value = file("${path.module}/variable.tf")
  value = "Uncomment above line to test if file exists"
}

output "fs_fileexists" {
  value = fileexists("${path.module}/variable.tf") # Check if file exists: true/false
}

output "fs_abspath" {
  value = abspath(path.module) # Returns absolute path
}

# -----------------------------------------------------------------------------
# 6. Date and Time functions
# -----------------------------------------------------------------------------

output "time_timestamp" {
  value = timestamp() # Returns current timestamp
}

output "time_format" {
  value = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp()) # Format timestamp
}

output "time_add" {
  value = timeadd(timestamp(), "24h") # Add duration to timestamp
}

# -----------------------------------------------------------------------------
# 7. Hash and Crypto functions
# -----------------------------------------------------------------------------

output "crypto_md5" {
  value = md5("hello world") # MD5 hash
}

output "crypto_sha256" {
  value = sha256("hello world") # SHA256 hash
}

output "crypto_uuid" {
  value = uuid() # Generate UUID
}

# -----------------------------------------------------------------------------
# 8. IP Network functions
# -----------------------------------------------------------------------------

output "ip_cidrsubnet" {
  value = cidrsubnet("10.0.0.0/16", 8, 2) # Calculate subnet: 10.0.2.0/24
}

output "ip_cidrhost" {
  value = cidrhost("10.0.0.0/16", 4) # Calculate host IP: 10.0.0.4
}

# -----------------------------------------------------------------------------
# 9. Type Conversion functions
# -----------------------------------------------------------------------------

output "type_tobool" {
  value = tobool("true") # Convert to boolean: true
}

output "type_tolist" {
  value = tolist(["a", "b"]) # Convert to list
}

output "type_tomap" {
  value = tomap({ a = 1 }) # Convert to map
}

output "type_toset" {
  value = toset(["a", "b", "a"]) # Convert to set (removes duplicates): ["a", "b"]
}

output "type_try" {
  value = try(tobool("not-a-bool"), false) # Try evaluation, default on failure: false
}

output "type_can" {
  value = can(tobool("not-a-bool")) # Check if expression is valid: false
}

