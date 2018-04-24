FROM ekidd/rust-musl-builder as build
COPY . .
RUN cargo build --release

FROM scratch

COPY --from=build /home/rust/src/target/x86_64-unknown-linux-musl/release/basic-http-server /

EXPOSE 4000
CMD ["./basic-http-server", "--addr", "0.0.0.0:4000", "public"]
