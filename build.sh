# Ensures your SSH private key has been added to the ssh-agent, adds it otherwise
ssh-add /home/$USER/.ssh/id_rsa

# Makes sure that submodules have been initialized and are up to date
git submodule update --init --recursive

# Builds docker image
docker build -t rosindex/rosindex .
