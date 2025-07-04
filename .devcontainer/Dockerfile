FROM elixir:1.18

# Set build arguments
ARG INSTALL_ZSH="true"
ARG INSTALL_OH_MYS="true"
ARG UPGRADE_PACKAGES="true"
# Set additional packages not included in the setup script
ARG ADDITIONAL_PACKAGES="inotify-tools postgresql-client npm docker.io iputils-ping dnsutils telnet libwxgtk3.2-dev libgtk-3-0 x11-xserver-utils chromium chromium-driver direnv watchman"

# Install additional packages
RUN apt-get update && apt-get install -y $ADDITIONAL_PACKAGES && apt-get clean && rm -rf /var/lib/apt/lists/*

# Download and run common-debian.sh script
RUN curl -sSL https://raw.githubusercontent.com/microsoft/vscode-dev-containers/main/script-library/common-debian.sh -o /tmp/common-debian.sh && \
  chmod +x /tmp/common-debian.sh && \
  /tmp/common-debian.sh "${INSTALL_ZSH}" "vscode" "1000" "1000" "${UPGRADE_PACKAGES}" "${INSTALL_OH_MYS}" && \
  rm /tmp/common-debian.sh

# Docker socket access - handle both docker group and root group cases
RUN groupadd -g 999 docker || true && \
  usermod -aG docker vscode && \
  usermod -aG root vscode

# Install Node.js 22.x
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
  apt-get install -y nodejs && \
  npm install -g npm@latest

# Install Hex, Rebar, and Phoenix as the vscode user
RUN su vscode -c "mix local.hex --force && \
  mix local.rebar --force && \
  mix archive.install --force hex phx_new 1.7.21"

# Configure Oh My Zsh theme to show git branch
RUN su vscode -c "sed -i 's/ZSH_THEME=\"codespaces\"/ZSH_THEME=\"bira\"/' ~/.zshrc || \
  echo 'ZSH_THEME=\"bira\"' >> ~/.zshrc"

# Configure Git settings for better developer experience
RUN su vscode -c "git config --global push.autoSetupRemote true"

WORKDIR /workspace
