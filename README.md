# stable-diffusion-rocm

The original tutorial and files were created by [catzy007](https://github.com/catzy007). Please check out his work!

[LINK OF THE ORIGINAL GUIDE](https://github.com/AUTOMATIC1111/stable-diffusion-webui/discussions/5049)

### Install dependencies

#### aur

Install the package.
```
paru -S opencl-amd
```

#### community-testing

Enable the community-testing repo in `/etc/pacman.conf`.
```conf
[community-testing]
Include = /etc/pacman.d/mirrorlist
```

Update the system.
```
pacman -Syu
```

Install the dependencies.
```
pacman -S rocm-opencl-runtime rocminfo
```

### Setup

```
git clone https://gitea.heartnerds.org/Mageas/stable-diffusion-rocm.git
```

### Building docker image

This will download and install the required packages.

```
docker compose build
```

### Setting up launch parameter

Edit `stablediff.env` to add launch parameter such as `--lowvram`, `--medvram`.

### Initial run

This will create two directory called `stablediff-web` and `stablediff-models`.
After initial run, you will get message about missing Stable Diffusion ckpt model.
Grab one and copy it to `stablediff-models`. in linux, you might need `sudo` to
do this.

```
docker compose up
```

### Subsequent run

Use the command below every time you want to run Stable Diffusion.

```
docker start -a stablediff-runner
```

### Stopping Stable Diffusion

To stop Stable Diffusion press Ctrl + C and use the command below.

```
docker stop stablediff-runner
```
