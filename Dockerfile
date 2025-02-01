FROM ubuntu:24.10

RUN apt update && apt install -y curl build-essential git && apt clean && rm -rf /var/lib/apt/lists/*

RUN curl -L https://ziglang.org/download/0.13.0/zig-linux-x86_64-0.13.0.tar.xz | \
    tar -xJ -C /usr/local/bin --strip-components=1

WORKDIR /app

RUN git clone https://github.com/cryptocode/terminal-doom.git

WORKDIR /app/terminal-doom

RUN zig build -Doptimize=ReleaseFast

CMD ["zig-out/bin/terminal-doom"]