## Installation

#### Create Partitions

```
cfdisk $(disk_path)
```

- efi (300 MiB)
- root

#### Format Partitions

```
mkfs.fat -F32 $(efi_parition_path)
mkfs.ext4 $(root_parition_path)
```

#### Mount Partitions

```
mount $(root_partition_path) /mnt
mkdir /mnt/boot
mount $(efi_partition_path) /mnt/boot
```

#### Install Important Packages

```
pacstrap /mnt linux linux-firmware $(ucode) base base-devel networkmanager $(editor)
```

#### Create Swap File

```
dd if=/mnt/dev/zero of=/mnt/swapfile bs=1G count=8 status=progress
chmod 0600 /mnt/swapfile
mkswap -U clear /mnt/swapfile
swapon /mnt/swapfile
```

#### Generate Fstab

```
genfstab -U /mnt >> /mnt/etc/fstab
```

#### Change Root

```
arch-chroot /mnt
```

#### Setup Systemd Boot

```
bootctl install
echo 'title Arch Linux
linux /vmlinuz-linux
initrd /$(ucode)-ucode.img
initrd /initramfs-linux.img
options root=$(root_partition_path) rw' > /boot/loader/entries/arch.conf
systemctl enable systemd-boot-update.service
```

#### Setup Locale

```
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
```

#### Set Hostname

```
echo $(hostname) > /etc/hostname
```

#### Set Local Time

```
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
```

#### Set Hardware Clock

```
hwclock --systohc
```

#### Enable Network Manager

```
systemctl enable NetworkManager
```

#### Set Root Password

```
passwd
```

#### Exit

```
exit
```

#### Reboot

```
reboot
```

## Post Installation

#### Create user

```
useradd -m $(username) -G wheel
passwd $(username)
```

#### Set Sudo Privileges

```
EDITOR=$(editor) visudo
```

- %wheel ALL=(ALL:ALL) ALL

#### logout

```
logout
```

#### Install Git

```
sudo pacman -S git
```

#### Install Paru

```
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
```

#### Setup Dotfiles

```
git clone https://github.com/ryan-griffin/dotfiles
cd dotfiles
./pkgs.sh
./gsettings.sh
stow ryang --no-folding
```
