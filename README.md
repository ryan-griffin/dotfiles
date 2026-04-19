## Installation

#### Create Partitions

```
cfdisk $DISK_PATH
```

- efi (512 MiB)
- root

#### Format Partitions

```
mkfs.fat -F32 $EFI_PARTITION_PATH
mkfs.ext4 $ROOT_PARTITION_PATH
```

#### Mount Partitions

```
mount $ROOT_PARTITION_PATH /mnt
mkdir /mnt/boot
mount $EFI_PARTITION_PATH /mnt/boot
```

#### Install Important Packages

```
pacstrap /mnt linux linux-firmware $UCODE base base-devel networkmanager vim
```

#### Create Swap File

```
mkswap -U clear --size 8G --file /mnt/swapfile
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
initrd /$UCODE.img
initrd /initramfs-linux.img
options root=$ROOT_PARTITION_PATH rw' > /boot/loader/entries/arch.conf
```

#### Setup Locale

```
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
```

#### Set Hostname

```
echo $HOSTNAME > /etc/hostname
```

#### Set Local Time

```
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
```

#### Set Clock

```
hwclock --systohc
timedatectl set-ntp true
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
useradd -m $USERNAME -G wheel
passwd $USERNAME
```

#### Set Sudo Privileges

```
VISUAL=vim visudo
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
