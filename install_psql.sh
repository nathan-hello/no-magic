install_postgresql_ubuntu_debian() {
    echo "Installing Postgres through apt-get."
    echo "Postgresql-15 is not available on normal apt-get at time of writing. Installing as per instructions https://www.postgresql.org/download/linux/ubuntu/"
    # Installation instructions for Debian and Ubuntu are idential.

    # Create the file repository configuration:
    sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

    sudo apt-get update
    sudo apt-get -y install postgresql
}
install_postgresql_ubuntu_debian