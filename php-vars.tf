variable "document_root" {
    type = string
    description = "Specify the child directory of your project that is treated as the public-facing web root."
}

variable "memory_limit" {
    type = string
    description = "Amount of memory allocated to the PHP environment."
    default = "256M"
}

variable "zlib_php_compression" {
    type = string
    description = "Specifies whether or not PHP should use compression for output."
    default = "Off"
}

variable "allow_url_fopen" {
    type = string
    description = "Specifies if PHP's file functions are allowed to retrieve data from remote locations, such as websites or FTP servers."
    default = "On"
}

variable "display_errors" {
    type = string
    description = "Specifies if error messages should be part of the output."
    default = "Off"
}

variable "max_execution_time" {
    type = string
     description = "Sets the maximum time, in seconds, a script is allowed to run before it is terminated by the environment."
    default = "30"
}

variable "composer_options" {
    type = string
    description = "Sets custom options to use when installing dependencies using Composer through composer.phar install."
    default = ""
}