FROM ubuntu:latest
WORKDIR git
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y micro bat git git-flow curl
RUN git clone https://github.com/JGuilhermeSN/easywallet/
RUN curl -fsSL https://code-server.dev/install.sh | sh
COPY config.yaml /root/.config/code-server/config.yaml
RUN code-server --install-extension eamodio.gitlens
RUN code-server --install-extension PKief.material-icon-theme
RUN code-server --install-extension naumovs.color-highlight
RUN code-server --install-extension humao.rest-client
RUN code-server --install-extension ms-azuretools.vscode-docker
EXPOSE 8080
CMD ["code-server", "."]
