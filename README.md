<div align="center">
<h1>DN42 RPKI / RTR Server.</h1>
</div>
<div align="center">

[![XaviaMa]][xaviama_url]
[![Codeberg]][codeberg_url]
[![Build]][build_url]
[![TransRights]][transrights_url]
[![Enbyware]][enbyware_url]
[![License]][license_url]
[![Version]][tag_url]
[![Size]][tag_url]
[![Pulls]][hub_url]

</div></h1>

This is an RTR Server stack for [DN42 network](https://dn42.eu/), which directly utilizes [dn42 git registry](https://git.dn42.dev/dn42/registry).
The main component utilized is `registry_wizard` software, available at [Kioubit/dn42_registry_wizard](https://github.com/Kioubit/dn42_registry_wizard).

GitHub Actions and Woodpecker servers are updating the image reguarly.

## Setup

1. Run `docker compose pull` and `docker compose up -d` to boot up runtime.
2. In `./cache` you have the registry repository, you can bind it to tmpfs or in the compose file flag /var/lib/registry as tmpfs.

# License

Under [Apache 2.0 License](./LICENSE.md) unless stated otherwise.

## Stars 🌟
[![Stars](https://starchart.cc/GamePlayer-8/dn42-rpki.svg?variant=adaptive)](https://starchart.cc/GamePlayer-8/dn42-rpki)

[xaviama_url]: https://ci.chimmie.k.vu/repos/23
[codeberg_url]: https://ci.codeberg.org/repos/14987
[build_url]: https://github.com/GamePlayer-8/dn42-rpki/
[transrights_url]: https://en.wikipedia.org/wiki/Transgender_rights_movement
[enbyware_url]: https://en.wikipedia.org/wiki/Non-binary
[license_url]: LICENSE.md
[hub_url]: https://hub.docker.com/r/gameplayer8/dn42-rpki
[tag_url]: https://hub.docker.com/r/gameplayer8/dn42-rpki/tags

[XaviaMa]: https://ci.chimmie.k.vu/api/badges/23/status.svg
[Codeberg]: https://ci.codeberg.org/api/badges/14987/status.svg
[Build]: https://github.com/GamePlayer-8/dn42-rpki/actions/workflows/build.yml/badge.svg
[TransRights]: https://pride-badges.pony.workers.dev/static/v1?label=trans%20rights&stripeWidth=6&stripeColors=5BCEFA,F5A9B8,FFFFFF,F5A9B8,5BCEFA
[Enbyware]: https://pride-badges.pony.workers.dev/static/v1?label=enbyware&labelColor=%23555&stripeWidth=8&stripeColors=FCF434%2CFFFFFF%2C9C59D1%2C2C2C2C
[License]: https://img.shields.io/github/license/GamePlayer-8/dn42-rpki
[Size]: https://img.shields.io/docker/image-size/gameplayer8/dn42-rpki/latest?color=066da5&label=size
[Pulls]: https://img.shields.io/docker/pulls/gameplayer8/dn42-rpki.svg?style=flat&label=pulls&logo=docker
[Version]: https://img.shields.io/docker/v/gameplayer8/dn42-rpki/latest?arch=amd64&sort=semver&color=066da5
