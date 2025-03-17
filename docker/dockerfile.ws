FROM oven/bun:1

WORKDIR /usr/src/app

COPY ./package.json ./package.json
COPY ./bun.lockb ./bun.lockb

COPY ./packages ./packages

COPY ./turbo.json ./turbo.json
COPY ./apps/ws-server ./apps/ws-server

RUN bun install
RUN bun run db:generate

EXPOSE 8081

CMD ["bun", "run", "start:ws"]