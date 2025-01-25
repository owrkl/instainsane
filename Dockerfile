# Use a base image with bash
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    tor \
    openssl \
    python3 \
    python3-pip \
    git

EXPOSE 10000

# Clone the repository
RUN git clone https://github.com/aladdin-pvt/instainsane.git /instainsane

# Set working directory
WORKDIR /instainsane

# Make scripts executable
RUN chmod +x instainsane.sh install.sh

# Run the install script
RUN ./install.sh

# Set the entry point
ENTRYPOINT ["./instainsane.sh"]
