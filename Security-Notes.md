### 2019-03-15

### Timeline

1. `Ngày 17`:
  - 12:46: Thông báo trên group `@linuxvn`
  - 6:10: Server chạy trở lại
1. `Ngày 16`:
  - Lập group để audit. Khẳng định từ `.bash_history` là không có xóa nhầm.
  - 5:35: Tắt server và thông báo trên group `@linuxvn`
  - Cài lại server, chuyển qua địa điểm khác (`relocation`)
1. `Ngày 15`:
  - Phát hiện mất log của nginx lưu trữ từ `26 / 11 / 2018` đến `11 / 03 / 2019`
  - Viết email thông báo cho nhóm quản lý mirror và Florian ở `ArchLinux`
1. `Ngày 11`: Login vào server để kiểm tra bot gửi tin lên `@linuxvn_notes`
1. `Ngày 09`: Cài kiểm tra xem nginx có bản mới không (1.14.2-1). Nginx reload.

Các đặc điểm kỹ thuật của server làm mirror

1. Chỉ chạy hai dịch vụ công cộng là `ssh` và `nginx`, trong đó `ssh` trực
  tiếp không thông qua `bastion`, nginx dùng phiên bản `1.14.2-1` từ
  gói của `ArchLinux`. Xem thêm [`pacman.log`](#pacmanlog).
  `nginx` không có lỗi nào liên quan tới các module đang dùng
  (http://nginx.org/en/CHANGES-1.14)
1. Nhiều log lưu trong `journald` (`ssh login`, `sudo`) bị xóa tự động
  do cấu hình của hệ thống chỉ lưu log tạm trên `memory`. **FIXED**
1. Bộ backup chỉ gồm `/home/www/` (toàn bộ cấu hình chính của mirror),
  không gồm backup của hệ thống và backup trong `/var/`. Khi server
  chuyển về từ Đà Nẵng (lúc đó nginx log trong `/home/ww/`) đã được cấu hình
  lại để lưu log vào `/var/log/nginx` tuy nhiên `backup script` không
  được điều chỉnh tương ứng. **FIXED**

#### `pacman.log`

```
[2017-09-23 15:39] [PACMAN] Running 'pacman -S certbot certbot-nginx nginx'
[2017-09-23 15:42] [PACMAN] Running 'pacman -S certbot certbot-nginx nginx'
[2017-09-23 15:43] [ALPM] installed certbot-nginx (0.18.2-1)
[2017-09-23 15:43] [ALPM] installed nginx (1.12.1-1)
[2017-09-23 15:47] [PACMAN] Running 'pacman -Rs certbot certbot-nginx'
[2017-09-23 15:47] [ALPM] removed certbot-nginx (0.18.2-1)
[2017-09-23 15:50] [PACMAN] Running 'pacman -Rs nginx'
[2017-09-23 15:50] [ALPM] warning: /etc/nginx/nginx.conf saved as /etc/nginx/nginx.conf.pacsave
[2017-09-23 15:50] [ALPM] removed nginx (1.12.1-1)
[2017-10-25 11:13] [PACMAN] Running 'pacman -S nginx'
[2017-10-25 11:13] [ALPM] installed nginx (1.12.2-1)
[2017-10-25 11:49] [PACMAN] Running 'pacman -S nginx'
[2017-10-25 11:49] [ALPM] reinstalled nginx (1.12.2-1)
[2017-10-25 11:52] [PACMAN] Running 'pacman -S nginx'
[2017-10-25 11:52] [ALPM] reinstalled nginx (1.12.2-1)
[2017-10-25 12:04] [PACMAN] Running 'pacman -S nginx-mod-echo nginx-mod-headers-more'
[2017-10-25 12:04] [ALPM] installed nginx-mod-echo (0.61-2)
[2017-10-25 12:04] [ALPM] installed nginx-mod-headers-more (0.32-3)
[2017-10-25 12:07] [PACMAN] Running 'pacman -S nginx'
[2017-10-25 12:07] [ALPM] reinstalled nginx (1.12.2-1)
[2017-10-25 17:09] [ALPM] upgraded libssh2 (1.8.0-1 -> 1.8.0-2)
[2017-10-25 17:10] [ALPM] warning: /etc/ssh/sshd_config installed as /etc/ssh/sshd_config.pacnew
[2017-10-25 17:10] [ALPM] upgraded openssh (7.4p1-2 -> 7.6p1-1)
[2017-10-25 22:15] [PACMAN] Running 'pacman -S nginx-mod-geoip2'
[2017-10-25 22:15] [ALPM] installed nginx-mod-geoip2 (2.0-3)
[2017-10-25 22:16] [PACMAN] Running 'pacman -R nginx-mod-geoip2'
[2017-10-25 22:16] [ALPM] removed nginx-mod-geoip2 (2.0-3)
[2018-05-10 20:13] [PACMAN] Running 'pacman -S nginx'
[2018-05-10 20:13] [PACMAN] Running 'pacman -S nginx nginx-mod-echo nginx-mod-headers-more'
[2018-05-10 20:13] [ALPM] warning: /etc/nginx/mime.types installed as /etc/nginx/mime.types.pacnew
[2018-05-10 20:13] [ALPM] upgraded nginx (1.12.2-1 -> 1.14.0-1)
[2018-05-10 20:13] [ALPM] upgraded nginx-mod-echo (0.61-2 -> 0.61-3)
[2018-05-10 20:13] [ALPM] upgraded nginx-mod-headers-more (0.32-3 -> 0.33-2)
[2018-05-10 20:25] [ALPM] warning: /etc/ssh/sshd_config installed as /etc/ssh/sshd_config.pacnew
[2018-05-10 20:25] [ALPM] upgraded openssh (7.6p1-1 -> 7.7p1-1)
[2018-08-26 21:48] [ALPM] upgraded openssh (7.7p1-1 -> 7.7p1-2)
[2018-09-03 04:49] [PACMAN] Running 'pacman -S openssh sudo'
[2018-09-03 04:49] [ALPM] warning: /etc/ssh/sshd_config installed as /etc/ssh/sshd_config.pacnew
[2018-09-03 04:49] [ALPM] upgraded openssh (7.7p1-2 -> 7.8p1-1)
[2018-12-08 06:28] [PACMAN] Running 'pacman -S nginx'
[2018-12-08 06:28] [PACMAN] Running 'pacman -S nginx nginx-mod-echo nginx-mod-headers-more'
[2018-12-08 06:28] [ALPM] upgraded nginx (1.14.0-1 -> 1.14.2-1)
[2018-12-08 06:28] [ALPM] upgraded nginx-mod-echo (0.61-3 -> 0.61-5)
[2018-12-08 06:28] [ALPM] upgraded nginx-mod-headers-more (0.33-2 -> 0.33-4)
[2019-02-08 18:14] [ALPM] upgraded libssh2 (1.8.0-2 -> 1.8.0-3)
[2019-02-08 18:15] [ALPM] upgraded openssh (7.8p1-1 -> 7.9p1-1)
[2019-03-09 21:03] [PACMAN] Running 'pacman -S nginx'
[2019-03-09 21:03] [ALPM] reinstalled nginx (1.14.2-1)
[2019-03-09 21:03] [PACMAN] Running 'pacman -S ssh'
[2019-03-09 21:03] [PACMAN] Running 'pacman -S sshd'
[2019-03-09 21:03] [PACMAN] Running 'pacman -S openssh'
[2019-03-15 20:05] [PACMAN] Running 'pacman -S nginx'
[2019-03-15 20:06] [ALPM] reinstalled nginx (1.14.2-1)
```

### Credits

- @NgoHuy (security audit)
- @sokomo (audit, server relocation, misc)
- @redlotus (server relocation, misc)
- florian@archlinuxvn.org (misc)
- @icy (server configuration)

### Resource and links

- Package files checksum: [paccheck](https://www.archlinux.org/packages/community/x86_64/pacutils/)
- How pacman verifies package: https://www.reddit.com/r/archlinux/comments/69n2ty/eli5_does_pacman_s_automatically_verify_package/
