# Elixir + Phoenix

FROM elixir:1.7.2

# Install debian packages
RUN apt-get update
RUN apt-get install --yes build-essential inotify-tools postgresql-client

# Install Phoenix packages
RUN mix local.hex --force
RUN mix local.rebar --force
# RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new-1.4.4.ez

# Install node
RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install nodejs

WORKDIR /app
EXPOSE 4000
