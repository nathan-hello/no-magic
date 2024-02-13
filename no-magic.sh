#!/bin/bash
set -e # immediately exit if any command has a non-zero exit status
set -u # immediately crash if accessing undefined variable
set -o noclobber  # Avoid overlay files (echo "hi" > foo)
set -o errexit    # Used to exit upon error, avoiding cascading errors
set -o pipefail   # Unveils hidden failures
set -o nounset    # Exposes unset variables

WORKING_DIR=""

# ARGS: $1 = Working directory
#       $2 = Go Project Name
write_boilerplate() {
    mkdir -p $1
    cd $1
    go mod init $2
    
    printf "
    package main

    import \"$2/src\"

    func main() {
        src.Router()
    }
    " > main.go
    

}

run() {
    write_boilerplate "./reqw" "qwer"
}

run
