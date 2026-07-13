## Installation

#### Create Partitions

```bash
cfdisk $DISK_PATH
```

- efi (512 MiB)
- root

#### Format Partitions

```bash
mkfs.fat -F32 $EFI_PARTITION_PATH
mkfs.ext4 $ROOT_PARTITION_PATH
```

#### Mount Partitions

```bash
mount $ROOT_PARTITION_PATH /mnt
mkdir /mnt/boot
mount $EFI_PARTITION_PATH /mnt/boot
```

#### Install Important Packages

```bash
pacstrap /mnt linux linux-firmware $UCODE base base-devel networkmanager vim
```

#### Create Swap File

```bash
mkswap -U clear --size 8G --file /mnt/swapfile
swapon /mnt/swapfile
```

#### Generate Fstab

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

#### DNS

```bash
ln -sf ../run/systemd/resolve/stub-resolv.conf /mnt/etc/resolv.conf
mkdir -p /mnt/etc/systemd/resolved.conf.d
echo -e "[Resolve]\nDNSOverTLS=opportunistic" > /mnt/etc/systemd/resolved.conf.d/99-dns-over-tls.conf
```

#### Change Root

```bash
arch-chroot /mnt
```

#### Setup Systemd Boot

```bash
bootctl install
cat << 'EOF' > /boot/loader/entries/arch.conf
title Arch Linux
linux /vmlinuz-linux
initrd /$UCODE.img
initrd /initramfs-linux.img
options root=$ROOT_PARTITION_PATH rw
EOF
```

#### Setup Locale

```bash
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
```

#### Set Hostname

```bash
echo $HOSTNAME > /etc/hostname
```

#### Set Local Time

```bash
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
```

#### Set Clock

```bash
hwclock --systohc
timedatectl set-ntp true
```

#### Enable Network Manager

```bash
systemctl enable NetworkManager
```

#### Enable Systemd Resolved

```bash
systemctl enable systemd-resolved
```

#### Enable Fstrim Timer

```bash
systemctl enable fstrim.timer
```

#### Set Root Password

```bash
passwd
```

#### Exit

```bash
exit
```

#### Reboot

```bash
reboot
```

## Post Installation

#### Create user

```bash
useradd -m $USERNAME -G wheel
passwd $USERNAME
```

#### Set Sudo Privileges

```bash
VISUAL=vim visudo
```

- %wheel ALL=(ALL:ALL) ALL

#### logout

```bash
logout
```

#### Install Git

```bash
sudo pacman -S git
```

#### Install Paru

```bash
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
```
