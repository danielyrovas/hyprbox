# FROM quay.io/toolbx-images/archlinux-toolbox:latest
FROM quay.io/toolbx-images/opensuse-toolbox:tumbleweed

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="A cloud-native terminal experience" \
      maintainer="Daniel Yrovas"

WORKDIR /build
RUN git clone --recursive https://github.com/hyprwm/Hyprland hypr

COPY packages /
RUN zypper --non-interactive dup && \
    grep -v '^#' /packages | xargs zypper --non-interactive  install

RUN rm /packages

RUN cd hypr && make install
