## 2019-03

Lượm lặt những công cụ và tin tức đáng chú ý từ `Hacker News` hay từ
công việc hàng ngày. Nếu bạn thấy có gì hay hãy gửi `PR` nhé.

1. [`jsonnet`](https://jsonnet.org/learning/tutorial.html):
  Là ngôn ngữ mẫu phát sinh (`template language`), kiểu như `Ruby erb`
  (dùng với `Puppet` chẳng hạn), `jinja2` (dùng với `Saltstack`, `Ansible`),
  hay là `k8s yaml sh****`,... Ý tuởng cơ bản là ngôn ngữ mẫu phát sinh
  hợp nhất vai trò của các ngôn ngữ mẫu trước đây, theo quy trình

      jsonnet -- [phát sinh] --> .json, .ini, .yaml, .sh

  và như thế có thể thống nhất được cách làm việc bất kể ứng dụng cuối
  cùng là gì. Rất hữu ích cho `devops`,
  bạn có thể bắt đầu xem ở đây https://jsonnet.org/learning/tutorial.html .
  Là ngôn ngữ nên `jsonnet` cũng có các `implementation` khác nhau,
  một của [Google](https://github.com/google/jsonnet) viết bằng `C++`,
  một của [databricks](https://github.com/databricks/sjsonnet) viết với `Java/Scala`
  chạy nhanh hơn nhưng cài đặt mệt hơn ;)

2. [`gitlabform`](https://github.com/egnyte/gitlabform):
  Cài đặt một số `hook` cho các dự án khác nhau trên `Gitlab` không đơn
  giản là click chuột bấm bấm nhấn nhấn. Nếu có cách gì đó quản lý tập
  trung và theo dõi được vẫn tốt hơn. Và còn rất nhiều cài đặt khác nhau
  cho dự án. Bạn có thể dùng `Terraform`, nhưng `gitlabform` vẫn đơn giản
  hơn, nhiều hỗ trợ hơn, dễ `patch` hơn ;) Có thể tham khảo cấu hình

    https://github.com/egnyte/gitlabform/blob/master/config.yml

  dùng `YAML` này, và với một tí khôn khéo bạn có thể dùng `anchor`
  và `reference` để làm gọn tập tin này cho bộ setup `Gitlab` vài trăm
  dự án đấy.

  Hai điểm lưu ý là `gitlabform` viết bằng `Python 3`, và token dùng
  để truy cập vào `Gitlab API` phải khai báo trực tiếp trong file cấu hình.
  Bạn có thể thoát cách này, chẳng hạn khi sử dụng chính `Gitlab` để
  chạy `gitlabform` tự cập nhật cấu hình

      Biến môi trường TOKEN      |
                                 +-- [envsubst] --> config.yml
      Tập tin mẫu config.yml.in  |

3. [`tsocks`](https://aur.archlinux.org/packages/?K=tsocks):
  Mỗi ngày đều có thêm công cụ mới viết ... bằng `Go`, nhưng vẫn còn đó
  những thứ cổ xưa, tạo ra cách đây mười mấy năm, vẫn chạy tốt:)
  `tsocks` là thư viện được nạp đè bằng `LD_PRELOAD`, ép các kết nối
  từ ứng dụng của bạn đi qua một `SOCKS` proxy đã có. Ví dụ,

      # echo "server 1.2.3.4"    >  /etc/tsocks.conf
      # echo "server_port 20000" >> /etc/tsocks.conf
      $ ssh secret_server -D 20000 -fN
      $ tsocks firefox

  Trong ví dụ này, bạn mới tạo một máy bí mật `secret_server` mua ở
  `Digital Ocean` chẳng hạn, rồi dùng `ssh` tạo một `SOCKS` proxy ở
  laptop của bạn, sau đó dùng lệnh `tsocks` mở `firefox`: khi đó, mọi
  kết nối từ `firefox` sẽ chạy qua máy bí mật ở `Digital Ocean`:)
  Cách này nhanh gọn hơn dùng `VPN` nhỉ :)

  Bạn cũng có thể cấu hình `tsocks` để các kết nối cho các ứng dụng
  trên một máy dịch vụ, chẳng hạn, chảy ngược về laptop của bạn.

  Trang web dự án đây http://tsocks.sourceforge.net/faq.php, và ở
  https://aur.archlinux.org/packages/?K=tsocks bạn thấy có nhiều link
  liên quan. Lưu ý quan trọng là `tsocks` không mở được các ứng dụng
  có `setuid`, trừ khi bạn dùng mẹo.
