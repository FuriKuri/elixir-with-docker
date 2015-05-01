FROM splattael/elixir

# Bundle app source
COPY mix.exs /app/mix.exs
COPY config /app/config
COPY lib /app/lib

WORKDIR /app

RUN mix local.hex --force; mix local.rebar --force; mix deps.get; mix deps.compile

ENV COWBOY_PORT 8080

EXPOSE 8080

ENTRYPOINT ["mix", "run", "--no-halt"]