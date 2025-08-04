FROM alpine:3.22 AS py-builder

RUN apk add --no-cache \
	py3-pip \
	py3-virtualenv \
	alpine-sdk \
	git git-lfs

WORKDIR /opt
RUN python3 -m venv supervisor
WORKDIR /root
RUN git clone --depth 1 https://git.chimmie.k.vu/mirri/supervisor
WORKDIR /root/supervisor
RUN . /opt/supervisor/bin/activate; \
	pip install --upgrade pip setuptools wheel; \
	pip install .

FROM alpine:3.22 AS rs-builder

RUN mkdir /workdir
WORKDIR /workdir

RUN apk add --no-cache \
	alpine-sdk git rustup cargo curl coreutils

RUN git clone \
	--depth 1 --recursive \
	https://git.chimmie.k.vu/IP/dn42_registry_wizard source

WORKDIR /workdir/source
RUN rustup-init -y

RUN . "/root/.cargo/env"; cargo build -p registry_wizard --release; \
	cp target/x86_64-unknown-linux-musl/release/registry_wizard /usr/local/bin/

FROM alpine:3.22 AS runtime

RUN apk add --no-cache \
	git python3

COPY --chmod=755 wait.sh /usr/local/bin/wait
COPY --chmod=755 updater.sh /usr/local/bin/updater
COPY --chmod=644 supervisord.conf /etc/supervisord.conf
COPY --from=py-builder /opt/supervisor /opt/supervisor
COPY --from=rs-builder --chmod=755 /usr/local/bin/registry_wizard /usr/local/bin/registry_wizard

VOLUME ["/var/lib/registry"]

EXPOSE 9323

CMD ["/bin/sh", "-c", ". /opt/supervisor/bin/activate; supervisord -c /etc/supervisord.conf"]
