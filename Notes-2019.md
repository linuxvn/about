## 2019-03

Lượm lặt những công cụ và tin tức đáng chú ý từ `Hacker News` hay từ
công việc hàng ngày. Nếu bạn thấy có gì hay hãy gửi `PR` nhé.
Nội dung sẽ được tự động đăng trên kênh https://t.me/linuxvn_notes.

### [`send.firefox.com`](https://send.firefox.com/)

tags: #browser #cli #file #tools

Dịch vụ gửi / nhận file có đầy, có quá nhiều. Nếu chỉ quan tâm gửi nhận
và quên luôn thì chắc bạn không cần đọc tiếp.

Khi file gửi lên server, trước khi tới người nhận, chuyện gì xảy ra?
Sau khi người nhận file chọn xóa trên server, file đó đi đâu?
Và các công ty đứng sau dịch vụ gửi / nhận file kiếm tiền bằng cách nào?
Ôi có rất nhiều câu hỏi. Nếu bạn chỉ có thắc mắc chút xíu thôi và đọc
đến đây rồi, thì https://send.firefox.com/ có ích cho bạn đấy.

Khi không có tài khoản riêng, bạn có thể gửi file tối đa `1GB`,
có thể đặt kèm `password`, và giới hạn số lần tải xuống.
Sau đó, file sẽ bị xóa khỏi server của `Mozilla` -- vâng,
`Mozilla` hứa như vậy.

Dùng trình duyệt theo địa chỉ đã ghi ở trên, thậm chí có thể dùng
`Chrome` nhé. Giao diện đơn giản mẹ của bạn cũng có thể
sử dụng, hay cài `cli`: https://github.com/timvisee/ffsend#install

```
$ wget https://github.com/timvisee/ffsend/releases/download/v0.2.29/ffsend-v0.2.29-linux-x64 -O ffsend
$ chmod 755 ffsend

$ ./ffsend upload ./Notes-2019.md
Upload complete                                                                                                                                                          Share link:
 https://send.firefox.com/download/fd9ad60bd4/#OpGSkeYY21geHgRgGPF08A

$ ./ffsend download "https://send.firefox.com/download/fd9ad60bd4/#OpGSkeYY21geHgRgGPF08A"
error: failed to download the requested file
caused by: the file has expired or did never exist
```

Nếu bạn muốn làm cái trang tương tự như send.firefox.com,
xem mã nguồn ở đây: https://github.com/mozilla/send.
Các metrics liên quan
https://github.com/mozilla/send/blob/master/docs/metrics.md
(tức cách `Mozilla` kiếm tiền.)

Nếu muốn làm tới bến luôn, bạn có thể thử ví dụ
https://github.com/micahflee/onionshare

### [`elasticsearch-opendistro`](https://opendistro.github.io/for-elasticsearch/faq.html)

tags: #license #opensource #aws #elasticsearch

Xài `elasticsearch` bực nhất là nhiều thứ rất cơ bản chỉ được bật lên sau
khi trả mớ tiền. Ví dụ, phân quyền không cho ai xóa nhầm.
Gần đây, `x-pack` mới được mở ra tí xíu, cho bà con xài ké vài thứ
`miễn phí`. Chẳng nhẽ các công ty to có tiền thì có quyền an toàn,
những chú start-up cỏn con thì có quyền bị xóa nhầm sao :@@

[Toshi](https://github.com/toshi-search/Toshi) nghe đâu viết bằng `Rust`
để cạnh tranh với `elasticsearch`, nhưng chắc còn lâu lắm mới được tiếp
nhận phổ biến. Trong khi chờ đợi thì `aws` coi như  phá lệ, khởi động
bản phân phối theo giấy phép `apache 2.0` cho `elasticsearch` cùng nhiều
đồ chơi gói sẵn (và tất nhiên, dựa trên `elasticsearch`, bản `6.5.4`).
Động cơ của việc này như sau

1. `elasticsearch` được dùng phổ biến (và do đó trở nên quan trọng)
  trong việc xử lý dữ liệu phát sinh;

2. Nhiều `plugin` cho `elasticsearch` được phát triển mới nhưng với
  giấy phép đóng, ngăn cản sự tiếp cận của đại chúng (à, chính xác
  là của những người thích xài đồ chùa ;)

Việc này tất nhiên sẽ có lợi cho cộng đồng, và làm công ty đứng sau
`elasticsearch` chột dạ. Về kỹ thuật, tính năng thì ban đầu sẽ chưa có
gì khác biệt mới, nhưng bạn sẽ tiết kiệm được rất nhiều thời gian bằng
cách dùng một bộ cài đặt có sẵn nhiều thứ. Ví dụ, công cụ phân tích
`performance` của bộ cài đặt

https://opendistro.github.io/for-elasticsearch/features/analyzer.html

_(Ở trên, nói `aws` phá lệ vì `aws` nổi tiếng đóng cửa bảo nhau, ít khi cởi mở
về các dự án của họ, như cách làm của `microsoft`, `google`, `linkedin`, ...;)_

### [`jsonnet`](https://jsonnet.org/learning/tutorial.html)

tags: #tools #devops #json #yaml

Là ngôn ngữ mẫu phát sinh (`template language`), kiểu như `Ruby erb`
(dùng với `Puppet` chẳng hạn), `jinja2` (dùng với `Saltstack`, `Ansible`),
hay là `k8s yaml sh****`,... Ý tuởng cơ bản là ngôn ngữ mẫu phát sinh
hợp nhất vai trò của các ngôn ngữ mẫu trước đây, theo quy trình

```
jsonnet -- [phát sinh] --> .json, .ini, .yaml, .sh
```

và như thế có thể thống nhất được cách làm việc bất kể ứng dụng cuối
cùng là gì. Rất hữu ích cho `devops`,
bạn có thể bắt đầu xem ở đây https://jsonnet.org/learning/tutorial.html .
Là ngôn ngữ nên `jsonnet` cũng có các `implementation` khác nhau,
một của [Google](https://github.com/google/jsonnet) viết bằng `C++`,
một của [databricks](https://github.com/databricks/sjsonnet) viết với `Java/Scala`
chạy nhanh hơn nhưng cài đặt mệt hơn ;)

### [`gitlabform`](https://github.com/egnyte/gitlabform)

tags: #cicd #gitlab #configmanagement

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


```
Biến môi trường TOKEN      |
                           +-- [envsubst] --> config.yml
Tập tin mẫu config.yml.in  |
```

### [`tsocks`](https://aur.archlinux.org/packages/?K=tsocks)

tags: #proxy #ssh #tools #devops

Mỗi ngày đều có thêm công cụ mới viết ... bằng `Go`, nhưng vẫn còn đó
những thứ cổ xưa, tạo ra cách đây mười mấy năm, vẫn chạy tốt:)
`tsocks` là thư viện được nạp đè bằng `LD_PRELOAD`, ép các kết nối
từ ứng dụng của bạn đi qua một `SOCKS` proxy đã có. Ví dụ,

```
# echo "server 1.2.3.4"    >  /etc/tsocks.conf
# echo "server_port 20000" >> /etc/tsocks.conf
$ ssh secret_server -D 20000 -fN
$ tsocks firefox
```

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
