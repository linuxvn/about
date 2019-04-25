## 2019

Lượm lặt những công cụ và tin tức đáng chú ý từ `Hacker News` hay từ
công việc hàng ngày. Nếu bạn thấy có gì hay hãy gửi `PR` nhé.
Nội dung sẽ được tự động đăng trên kênh https://t.me/linuxvn_notes.

### TOC

* k8s
  * Ác mộng với Helm:
      [Phần 1](#helm-nightmare-p1),
      [Phần 2](#helm-nightmare-p2)
  * [Bắt đầu với k8s như thế nào](#k8s-the-hard-way-p1)
* Lucense, ElasticSearch
  * [Phần 1: Về Lucene](#lucene-war-part-1)
* Công cụ linh tinh
  * [Rsync với Sparse](#rsync-with-sparse-file)
  * [jsonnet](#jsonnet)
  * [gitlabform](#gitlabform)
  * [tsocks](#tsocks)
  * [gawk](#gawk)
* Dịch vụ có ích
  * [send.firefox.com](#sendfirefoxcom)
  * [Telegram](#telegram)
  * [Ecosia searching service](#wwwecosiaorg)
* Linh tinh
  * [Root is rut](#root-is-rut)
  * [Giới thiệu về trang này](#about)
  * [Phỏng vấn Boss](#boss-interview)

### `root-is-rut`

tags: #root #shell #linux #rut

Nhiều chỗ phải xài `root` shell, không né được. Không phải do công ty
to nhỏ gì, không phải sản phẩm tốt xấu gì. Chẳng qua... xài `root` thì
quá tiện, giống đi xe máy ở Sài Gòn vậy, chỗ nào cũng tới được.
Ông `ops/admin` trước lười thì ông sau lãnh đủ, vậy thôi.

Phần dưới nêu vài chuyện vui khi nghịch với _lửa_ đây.

1. `hostname -f` nhầm thành `hostname f`: Một số bàn phím trời đánh, nhả
  phím không được, nên sau lệnh `hostname f` thì toi, bạn phải đi lục
  tung `history` lên coi hostname cũ thế nào mà phục hồi lại.

2. `copy-&-paste`: thế kỷ `21` rồi nhỉ, nhưng copy một chỗ rồi paste ra
  chỗ khác không phải lúc nào cũng đúng ý đâu nhe :) Cẩn thận nhất, trước
  khi dán vào `terminal/shell`, bạn thử dán ra chỗ nào đó trước. Không thì
  lâu lâu gà gà gật gật là y như rằng một mớ thứ nhảy múa trong `terminal`.
  Bạn thử chép nội dung log sau vào dán vào `terminal` xem:
  https://gist.github.com/icy/d8d2598acc31523317b93547d35bb304 :)

3. `shutdown` nhầm: thôi khỏi cần nói gì thêm nhe, mất công haha

4. Mất `/dev/zero` hay `/dev/null` hay `/dev/log`:
  Nghe buồn cười nhưng chuyện kỳ dị này cũng có thể xảy ra:
  Ví dụ nè
    https://icy.theslinux.org/m/kyanh.net/2015/06/06/the-slig-returns/index.html#slig29.
  Vấn đề là nhiều khi khó nhận biết cho tới khi .. khá trễ.
  Khi mất `/dev/null` thì bạn vẫn xài nó khá bình thường, ví dụ `cat foo > /dev/null`,
  cho tới khi... đĩa đầy chẳng hạn.

5. `Lock down`: hihi, `sudo` có cú pháp trời đánh để nạp cấu hình
  bên ngoài, ví dụ `#includedir /etc/sudoers.d`. Nhiều bạn gà gà gật gật
  cho mình là siêu nhân, chỉnh lại cho đúng `includedir /etc/sudoers.d`,
  xong đi uống cà phê, ăn trưa rồi tắt server mount lên chỗ khác fix lại.

6. `/etc/nginx/sites-enabled/:wq`: Ơ, bạn đoán ra cái gì đây không?
  Là do một chuyên gia `vi/vim` xài `nano`. Thiệt tình là sau khi lưu
  file đó xuống đĩa rồi thì anh em đi fix cả ngày không biết tại sao cấu
  hình mới không ăn =))

Lưu ý nhỏ nhẹ cuối cùng, `nohup` luôn là biên giới trong cuộc chiến
giữa `dev` và `admin`. Lần nào đĩa đầy là `admin` phải lọ mọ vào xài `lsof`
soi lên `nohup` nằm ở đâu (file đó cũng hay bị xóa cho gọn đĩa ấy mà.)

Tạm dừng ở đây, khi nào nhớ ra viết tiếp.

### [`gawk`](https://lists.gnu.org/archive/html/info-gnu/2019-04/msg00002.html)

tags: #awk #text #manipulation #shell

`gawk` ra phiên bản 5 với thay đổi đáng chú ý là, hỗ trợ `namespace` nhờ
đó viết và nạp thêm các module vào chương trình `awk` chính dễ dàng hơn.
Bạn có thể xem vài lời của tác giả của thay đổi này ở địa chỉ
  http://www.skeeve.com/awk-sys-prog.html.

Phần tiếp theo giới thiệu với bạn kỹ thuật đơn giản rất có ích
cho nghề ốp (ops), tất nhiên là dùng `(g)awk` để xử lý. Bài toán thế này,
bạn có chương trình `xyz` nào đó, chạy bằng docker cho có vẻ sang trọng,
ghi liên tục các thông báo ra thiết bị `STDOUT`, `STDERR`. Và bạn
muốn biết khi nào xuất hiện dòng lỗi, ví dụ có chữ `ERROR`. Dễ thôi nhỉ,

```
$ /lauxanh/bin/xyz 2>&1 | grep ERROR
```

Cách này có cái dở là, tất cả các dòng không có `ERROR` đều biến mất tiêu.
`grep` không giúp được gì rồi
_(thực ra cũng có thể, khi bạn dùng `coproc` với `Bash`;_
_nhưng như thế thì quá cao siêu rồi)_.
Đơn giản là dùng `awk`

```
$ /lauxanh/bin/xyz 2>&1 \
  | awk '
    BEGIN {
      found_error = 0
    }
    {
      printf("%s\n", $0);
      if ($0 ~ /ERROR/) {
        printf(":: Cá mập cắn cáp rồi. Lỗi lỗi lỗi.\n");
        found_error = 1;
      }
    }
    END {
      exit(found_error);
    }
    '
$ ret="$?"
$ if [[ $ret -ge 1 ]]; then
    echo >&2 ":: Đụng cá mập thì thôi, bó tay."
  fi
```

Chương trình `gawk` này đơn giản là đọc tất cả tin gửi đi từ chương
trình `xyz`, in ra `STDOUT`, và khi `xyz` ghi ra dòng nào có `ERROR`,
sẽ có thêm thông báo về cá mập, và đồng thời gán kết quả trả về của
dòng lệnh là `found_error`, hay là `1`, để bạn xử lý tiếp.

Đơn giản nhỉ. Bạn có thể làm phức tạp hơn bằng `Ruby` hay `Python` đấy :D

Vài ứng dụng khác từ ý tưởng của đoạn mã `awk` ở trên

1. Poll để biết khi nào container sẵn sàng, ví dụ https://t.me/linuxvn/39876

2. Trả về các kết quả (exit code) khác nhau tùy vào các mẫu khác nhau

3. Đếm lỗi, ví dụ xử lý tập tin `acces.log` theo cách thô sơ.

4. Xử lý kết quả trả về của `curl`, `wget` và trả về mã lỗi tương ứng
   với nội dung thu được.

### [`www.ecosia.org`](https://www.ecosia.org/)

tags: #search #browser #gogreen

Bữa giờ mình không khỏe, nên không viết gì dù có khá nhiều thứ cần coi
và ghi chú lại. Mình định viết về giấy phép `Apache`, về ý tưởng phân tán
trong `(dev)ops`, vài công cụ khác. Ngoài ra, tìm cách dọn dẹp lại cách
gửi bài lên Telegram: Như bạn thấy hiện giờ bài khá dài và khó tìm kiếm.
Bạn luôn có thể đọc lại dễ dàng trên Github, trước khi có bản `Web` hy
vọng khá hơn.

Bài này giới thiệu về dịch vụ tìm kiếm [`ecosia`](https://www.ecosia.org/).
Khá chắc là mình biết nó khi đọc HackerNews. Nó như Google, Yahoo, Bing,
Cốc Cốc / Lauxanh thôi. Bạn cần tìm gì, gõ vào, nhấn Enter thì ra kết
quả.

Khác biệt lớn nhất ở chỗ, `ecosia` là dự án có mục tiêu rất `xanh`:
Mỗi khi bạn tìm kiếm, `ecosia` sẽ phát sinh thông tin để điều hướng dịch
vụ quảng cáo, trên đó `ecosia` thu tiền, và dùng phần lớn số tiền thu
được để trồng cây xanh ở khắp nơi trên thế giới.

Đừng lo, `ecosia` tuyên bố rất rõ ràng về sử dụng thông tin riêng tư của
bạn, xem ở https://info.ecosia.org/privacy . Cách dịch vụ này kiếm tiền
có ở https://info.ecosia.org/what. Công ty phát triển `ecosia` có trụ
sở tại `Berlin` nhé. Đọc kỹ phần `privacy` bạn sẽ thấy `ecosia` là
partner của `Bing`.

Theo con số từ trang chính của dịch vụ lúc mình viết bài này, số cây
đã được trồng là hơn 54 triệu. Không rõ mình đóng góp được bao nhiêu:
Mình dùng dịch vụ này khi làm việc trên công ty mà;)

Sau khi gây lộn với Google, Duckduckgo, mình đã chuyển qua dùng Bing.
Và khi nào tiện mình sẽ chuyển thiết bị cá nhân qua dùng `ecosia`.

### `k8s-the-hard-way-p1`

tags: #k8s #hardway #helm #learning #devops

Nếu bạn đang bắt đầu tìm hiểu về `k8s` thì mình có luôn lời khuyên là
đừng lặp lại sai lầm như mình=) Mình đã bắt đầu với mấy cái khóa
học linh tinh trên `edX`, `coursera` và cả `safaribooksonline`.
Mình coi rất nhiều rồi không hiểu gì hết luôn. Haha. Từ đâu 2016
mình bắt đầu thử với `kops`, rồi mãi tới cuối 2018, vẫn còn loay hoay
với `minikube` tùm lum. Rốt cuộc, có quá nhiều thứ, tốn rất nhiều
thời gian.

Thế bắt đầu từ đâu? Hãy thử luôn với `k8s the hard way`
  https://github.com/kelseyhightower/kubernetes-the-hard-way
do một kỹ sư của `Google` nấu ra. Tài liệu này chỉ có thể thực hành theo
khi bạn có thẻ `credit/debit`, có tài khoản `Google`.
Bạn `nhắm mắt` làm theo là được.

Nếu dùng `aws`, bạn có thể theo dõi
  https://github.com/slawekzachcial/kubernetes-the-hard-way-aws.
Với `Virtualbox` trên máy Linux 64 bạn có thể theo dõi triển khai
do mình viết: https://github.com/icy/k8s-vbox-the-hard-way.

Ối, lại linh tinh lang tang. `Bạn phải theo dõi tài liệu gốc`,
viết ra các kịch bản, rồi thêm thắt vào phần tự động hóa cho phù hợp
hệ thống của bạn (`terraform`, `script`, `ansible`, ...)
Có cần thiết như vậy không? Cần chứ, tại `k8s` có hai phần

1. Phần cốt lõi, `k8s`: Nó giúp trả lời các câu hỏi như,
  `k8s` có liên quan gì tới `Docker (container)`?
  Mà tại sao người ta không dùng `Docker Swarm` cho rồi?
  Rồi `k8s` so sánh với ảo hóa ra sao (sống lâu rồi cũng có
  người hỏi bạn như vậy).

2. Phần tảng băng nổi bên trên, nơi bạn triển khai ứng dụng.
  Phần này khá là dễ, bạn chỉ việc làm theo mấy tài liệu bập bập
  là xong ngay luôn. Yêu cầu cơ bản là biết `copy` và `paste` thôi :)

Tại vì phần 2 dễ, nên trước đây mình đã học nó trước tiên.
Hóa ra là chỉ theo bóng, mất thời gian mà không hiểu bản chất vấn đề.
Nay viết ra hy vọng giúp bạn có thể tiết kiệm được 3 năm kinh nghiệm =))

### `boss-interview`

tags: #devops #jobs

Bài này dành cho `[dev]ops`... tàng tàng :)

Mình đã làm việc với nhiều công ty. Số long đong lận đận. May trong
cái rủi, mình gặp nhiều người, làm việc với họ, hiểu họ một chút :)
Rốt cuộc, đó chẳng phải là điều rất có giá trị sao? Mỗi người
một vẻ, một kiểu, không thể nói ai hơn ai được.

Thế có vẻ trớt quớt, huề vốn nhỉ? Thì đó là chuyện đã qua mà.
Còn trước mắt, nếu bạn đang boăn khoăn không biết chọn công ty nào,
trên tay có hai, ba cái `offer`, thì dưới đây là vài mẹo rất hay
để bạn loại khỏi vòng chiến những `boss / leader` tào lao hehe :)

Cuối buổi phỏng vấn, hay vòng cuối, thường bạn sẽ được đề nghị có
câu hỏi gì cho công ty. Có một số câu hỏi có thể khiến người đi hỏi
bể đầu, ví dụ, `tại sao công ty lại tuyển thêm vị trí này?`,
hay `hệ thống của anh (chị) bị sập bao nhiêu lần rồi?`. Với câu hỏi cuối,
hầu hết các trường hợp là trả lời cho qua chuyện, chẳng ai muốn vạch
áo cho người ta xem lưng, nhỉ  Nhưng câu hỏi này thật sự giúp bạn
biết được bạn đã `101%` vượt qua tất cả các vòng gửi xe chưa đấy.

Một câu hỏi khác nghe đơn giản nhưng phản ánh gần như toàn bộ cách làm
việc của đội `ops`. Đó là,
`anh (chị) có dùng tài khoản **root** để quản lý các máy không`.
Một nơi toàn `root` không phải để chỗ cho lính lơ tơ mơ nghịch,
hoặc có thể là một hệ thống hoàn toàn mất kiểm soát.

Bạn thử hỏi một câu nhẹ nhàng hơn, liên quan tới luật `Murphy`.
Ví dụ, `anh (chị) có cho rằng bộ sao lưu dữ liệu của anh (chị)
đã bị hỏng hết không`? Câu này sẽ cho bạn biết mức độ quan tâm tới chi
tiết trong hệ thống, và một người kỹ tính như bạn sẽ rất phù hợp.

Vài câu hỏi vậy, nhưng đó là chuyện kỹ thuật. Quan trọng là bạn
chọn được `job` để bạn thỏa sức bay cao, bay xa.

_(Viết tự an ủi, tự nhiên nhớ Toàn Miami ^.^)_

### `Telegram`

tags: #telegram

`Telegram` vừa ra phiên bản với các tính năng rất đáng chú ý,
chưa từng có trong các dịch vụ nhắn tin phổ biến hiện nay.
Bài viết này tóm tắt vài ý có thể bạn chưa biết khi xài `Telegram`.
Các tính năng mới yêu cầu bạn phải cài phiên bản `Telegram` mới nhất.

1. Khi người khác chọn `Forward` (chuyển hướng) tin nhắn của bạn
  vào nhóm / người khác, Tên của bạn xuất hiện như là tác
  giả của nội dung đó. Để bên thứ ba không truy ra được _thủ phạm_,
  bạn vào phần `Privacy + Security`, chọn `Forwarded Messages`,
  rồi chọn lại `Nobody` hoặc `My contacts`,...
  thêm các ngoại lệ nếu cần.

2. Các dịch vụ như `Facebook`, `Viber`, `Whatsapp`,... đều yêu cầu
  truy cập vào danh bạ của bạn. Như `whatsapp` sẽ không chạy nếu quyền
  đó bị từ chối (sic). Còn `Viber`, `Skype`, ... ngay cả khi bạn chặn,
  thì hóa ra trên `server` của các dịch vụ này đã có một phần Danh bạ
  của bạn (đố bạn tại sao đấy!) Và bạn không có cách nào xóa được nội
  dung đó, trừ khi bạn xóa hẳn tài khoản của bạn (?!)

  Với `Telegram`, bạn chỉ việc vào `Privacy + Security`, chọn phần
  `Contacts` và chọn `Delete Synced Contacts` để xóa đi phần danh bạ
  bạn đã lỡ tay đồng bộ lên máy của `Telegram` vì bất kỳ lý do gì.

3. Bạn có thể xóa bài bạn đã gửi, bất kể bài đó đã được gửi bao lâu.
  Trước đây, bạn không thể xóa các bài đã viết quá 48 giờ.
  Tính năng mới giúp bạn an toàn hơn, nhưng với các nhóm, có lẽ là một
  điều bất tiện, nhỉ?

Câu hỏi to nhất khi dùng `Telegram`, là mô hình kinh doanh của `Telegram`
là gì, sao lại có một tỉ phú bỏ nhiều tiền ra làm dịch vụ khơi khơi vậy :)
Chịu, bạn có thể tin tưởng, hay không, vào `Telegram`. Dù sao thì các
tính năng mới nhất của `Telegram` khiến cho nhiều ứng dụng luôn hô hào
đảm bảo an ninh người dùng phải chạy theo bốc khói.

### [`helm-nightmare-p1`](https://t.me/linuxvn/38063)

tags: #k8s #helm #panic

Định luật Murphy, tóm tắt `Anything that can go wrong will go wrong`.
Định luật này được chứng minh bởi những công ty lớn, như VNG dạo
tháng 9 / 2018. Một công ty nhỏ xíu vẫn chứng minh được nhé.

Chỗ mình dùng `Helm` để triển khai ứng dụng,
và `Helm` có điều tuyệt vời, là nếu có gì sai sót chỉ việc quay lại
cấu hình cũ, cái vèo :)

Mới thứ ba, tính năng nhỏ xíu của đội `ops` được thêm vào ứng dụng.
Có khoảng chục dự án, cái nào cũng ngon hết, chỉ một cái có tí sai
là dùng `2GB` thay vì `2Gi`. Lỗi này bé quá, `Helm lint`
không thèm bắt cho qua, nên lúc triển khai bản mới
hệ thống bị lỗi. Mình đổi lại, `merge`, xong vào ngồi soi `pod`.
Chạy ngon lành, mọi thứ đúng mong đợi. Về nhà :)

Sáng thứ tư, đội `dev` la ối ối, deploy (triển khai?) mãi không xong,
lỗi tùm lum. Vào xem, trời đất, chỗ `ngon lành` lại
có lỗi: Liên tục ba `build` cuối cùng đều lỗi trên Gitlab (lạ cái là
chẳng ai biết; mình đã nói là mình ngồi soi `pod` rồi đấy nhé:D)

Ôi dào, dễ, vào chạy `helm rollback` là xong:

```
$ helm ugprade foo     # ... failed?
$ helm rollback foo 0  # quay về bản còn tốt cuối cùng
```

Bạn biết không, lệnh `helm history foo` chỉ còn  mỗi ba dòng,
và dòng nào cũng cho biết trạng thái lỗi.

```
$ helm history foo
UPDATED  STATUS ...
...      FAILED
...      FAILED
...      FAILED
```

Nghĩa là trong trường hợp của mình, `helm rollback foo 0` không thể
thực hiện được. Sao lại có chuyện này? Một bạn trong đội trước khi
nghỉ phép đã đặt biến `TILLER_MAX_HISTORY` thành 3, với mục đích giảm
tải trên các máy chạy `etcd`. Và giờ hệ quả là `helm` bó tay toàn tập,
không thể cài mới, cũng không thể `rollback`, không thể `upgrade`.
Mình gần như bị shock:
Ứng dụng đang chạy `live`, có database (stateful, có dùng `pvc`,
hay `persistent volume claim` để lưu dữ liệu), không thể nào
cho bay luôn cài lại từ đầu. Mình bỏ 200 Euro gọi đường dây nóng của
đại lý `k8s` ở Sài Gòn, `@mrtux`, để được hỗ trợ khẩn cấp. Nhưng đại
lý cũng bó tay, bày những chiêu gì siêu quá, không giải quyết được
chuyện `pvc` ngay/rõ ràng. Mất toi 200 Euro;) Mình cho vào TODO list.

### `helm-nightmare-p2`

tags: #k8s #helm #panic

Qua ngày thứ 4, mấy bạn trong đội quá sốt, không biết làm sao nên
chỉ còn mỗi mình bám theo. Ai hỏi gì, cũng bảo tao đang backup;
thật sự là thế, xài `pg/stolon` backup được mà không biết `restore`
lại làm sao cả đâu ^.^ Sau có một bạn bảo là hồi xưa tao làm
thế này thế này. Mình làm theo thấy không khả thi lắm. Một số bạn đề
nghị ép

```
helm upgrade foo --force
```

mình chạy với `--dry-run` không ăn thua. Cuối cùng, 20 phút trước khi
bắt đầu kế hoạch tệ nhất (xóa cài lại), mình quyết định
quay lại mã nguồn `helm chart` cũ trước khi gặp lỗi, bỏ đi cấu hình
cho các `pod` mới,... và `merge` vào, thì phát hiện ra là `build`
thành công. Trời đất, mất hai ngày lên kế hoạch, kể cả cuối cùng
là xóa sạch, chuẩn bị `downtime` 20 phút cài lại và khôi phục
dữ liệu từ bộ sao lưu, rồi nói qua nói lại giữa các đội phát mệt.
Nhưng công toi, vì mọi việc sao quá đơn giản vậy luôn.

Bạn biết tại sao không? Bất kể là lệnh `helm history` thể hiện kết
quả thế nào. Bạn vào `dashboard` của cluster vào không gian của k8s
`kube-system`, chọn phần `ConfigMap`, chọn tới phiên bản cuối cùng
của `foo`, mở lên và chọn Edit, sau đó chỗ nào có chữ `FAILED` bạn
sửa lại thành `DEPLOYED`. Rồi chọn lưu. Rồi `helm upgrade` sẽ chạy
ngon lành.

Haha, xin lỗi đã làm bạn thất vọng. Cách giải quyết đơn giản vậy
đã làm mình shock không kém lúc phát hiện ra `helm history` chỉ
còn 3 dòng lỗi :)

Cảm ơn `@mrtux`, `konrad***` đã hỗ trợ trong lúc dầu sôi lửa bỏng;)
Trong lúc lên kế hoạch khắc phục sự cố, mình còn phải đọc tí mã
nguồn của `helm` có dịp sẽ chia sẻ với bạn.

Nếu đang dùng `helm-2.11`, hãy nâng cấp ngay lên bản `2.12` hoặc
cao hơn: Xem thêm https://github.com/helm/helm/pull/4978.
Hãy dùng ngay `helm rollback` khi gặp lỗi trong hệ thống `CI`.

Bài này được soạn bằng editor [`ne`](https://github.com/vigna/ne).

### `lucene-war-part-1`

tags: #lucene #apache #elasticsearch #apache #solr

Nhân dịp có tranh cãi về `opendistro` vs `elasticsearch`, thử tìm hiểu
về `Lucene` là thư viện cốt lõi dựng lên `elasticsearch` và `apache solr`.
Đây là phần 1, viết sơ lược. Các phần sau cũng sơ lược nốt vì tác giả
cũng không rành lắm đâu nhé:)

Nếu bạn thấy bối rối khi có nhiều tên vậy, thì đây là so sánh
quen thuộc với người dùng Linux: `Lucene` như là phần nhân (`kernel`),
`Apache Solr` là `Debian linux` còn `ElasticSearch` là `Ubuntu`,
trong khi `Opendistro` có thể là phiên bản `Linux Mint`.
Tất nhiên, chẳng có cái nào trong số chúng là `Mac` cả.

Để hiểu bài toán `Lucene` giải quyết, bạn có thể tưởng tượng đang bước
chân vào thư viện của trường đại học, và cùng lúc phân thân ở một nhà
sách to nhất nhì ở quận 1. Muốn tìm cuốn sách ở một trong hai nơi này,
theo bạn nơi nào sẽ ra kết quả nhanh hơn? Nhớ rằng ở thư viện thường
chỉ có một vài thủ thư khá thờ ơ, thậm chí còn không quan tâm bạn là ai nhé.

Trong thư viện có một hệ thống rất hay là chỉ mục, `index`, để phân loại sách
theo các tiêu chí và và cuối cùng là theo tên ABC. Nó cũng giống như
`Mục lục` sách, ở mục đích giúp bạn tìm ra điều cần tìm nhanh nhất
có thể. Các sách khoa học kỹ thuật nước ngoài nếu bạn có dịp mua về thì
nhớ mở ngay những trang cuối cùng, rất hay có một phần `Index` dài lê thê
gồm các từ khóa. Chỉ cần nhớ từ khóa thì có ngay liệt kê vài trang liên quan.

Quay lại `Lucene`: bài toán gốc đơn giản là làm sao tìm kiếm cho nhanh
và chính xác một phần bất kỳ trong kho lưu trữ dữ liệu.
Có rất nhiều cách tiếp cận khác nhau, và `Lucene` là một trong số đó thôi.

```
Tài liệu -- [index]
     --> Lưu vào kho
          --> Tìm lại cho nhanh/chính xác

    <--- Lucene ---->
```

`Lucene` đặt ra các nguyên tắc cho quá trình thu nhận, phân loại (phân rã),
tạo ra phần chỉ mục (`index`), lưu trữ tài liệu, lưu trữ chỉ mục,
và các nguyên tắc để tìm kiếm lại các phần nhỏ bất kỳ trong tài liệu ban đầu
nhanh và chính xác nhất có thể.

`Lucene` là *trái tim*, *phần khó nhất*, của một cỗ máy tìm kiếm (`search engine`).

`Apache Lucene` chỉ cung cấp những `API` ở dạng thô nhất,
và hơn nữa nó cũng chỉ có ích cho các ứng dụng `Java` thôi.
Vẫn có [PyLucene](https://lucene.apache.org/pylucene/index.html)
nhưng phát triển chậm hơn tí, là giao diện Lucene cho Python.

Và bạn biết rồi, để đi một chiếc xe đạp thì hầu hết chúng ta không quan tâm
và cũng không thể bắt đầu bằng việc xây dựng một nhà máy luyện thép.
Cứ việc đến cửa hàng xe và mua xe thôi. `Apache Solr` cung cấp giao diện
đơn giản hơn, dễ dàng hơn cho người viết ứng dụng. Để né tránh chuyện
`Java`, `Solr` chạy dịch vụ cung cấp `REST~` API cho ứng dụng cuối.
Như vậy dùng bạn viết bằng `Python`, `Golang` hay gì thì vẫn xài được
thư viện cuối là `Lucene`:

```
Ứng dụng Ruby -- [Người thông dịch Solr] --> [Lucene/Java]
```

Đại khái `Apache Solr` như anh chàng `Debian Linux` với nhân `Linux`.
Ngạo nghễ, oai phong cho tới khi trai đẹp `ElasticSearch` xuất hiện
thì gái làng cả xóm nhao nhao. `ElasticSearch` giới thiệu giao diện
`tìm kiếm` (`Search`), `Kibana`, `Logstash`, giống như là anh ta có sẵn nhà,
sẵn xe hơi, sẵn mọi thứ đều cho đám cưới; cô nào chả mê nhỉ.
Chính nhờ sự tiện lợi này mà nhiều người tiếp cận với `ElasticSearch`
nhanh chóng, hiệu quả.

Và thế là nhiều người quên luôn `Apache Solr`:) `ElasticSearch`
gần như đồng nghĩa với `ELK`, nhưng từ sâu thẳm thì `Solr` và `ElasticSearch`
cũng không khác lắm nhau đâu nhỉ ^.^ Không có `Lucene` thì lấy đâu ra
cả hai chứ.

Điều thú vị là `Elastic` mua lại [`Kibana`](https://github.com/rashidkpc/kibana2)
và `Logstash` (thiếu nguồn) để phát triển nên bộ `ELK`.

Tạm dừng ở đây, hẹn kỳ sau. Cảm ơn bạn đã đọc một bài rất dài.

### `rsync-with-sparse-file`

tags: #rsync #devops #linux #migration

Có thể dùng `rsync` để chuyển bộ cài đặt Linux qua một đĩa cứng mới
(cùng máy) hoặc qua một máy hoàn toàn khác. Tóm tắt bước cơ bản

1. _(tùy chọn)_ tắt hết các dịch vụ đang ghi vào ổ cứng nguồn (A)

2. Chạy `rsync` với  (`option`) phù hợp để chép qua đĩa đích (B)

3. Fix `/etc/fstab` và `bootloader`

Bước cuối cùng thì dễ, giống như khi bạn cài máy mới. Lưu ý là
phải đảm bảo `/etc/mtab` là một symlink

```
$ ls -ld /etc/mtab
... /etc/mtab -> ../proc/self/mounts
```

Chạy `rsync` trong phần lớn trường hợp có thể dùng như sau,
với quyền **root**:

```
# mount /dev/new_device /mnt/new_disk_B/

# rsync -avx                \
  --progress                \
  /                         \
  /mnt/new_disk_B/          \
  --exclude="/dev/*"        \
  --exclude="/proc/*"       \
  --exclude="/sys/*"
```

Ý nghĩa vài tham số quan trọng: `-a` để chép ở chế độ `archive`, tham số
này là viết tắt cho tổ hợp `-rlptgoD`, trong đó

1. `-r`: chép mọi thư mục, thư mục con và tập tin của chúng

2. `-l`: chép các `symlink`

3. `-p`, `-o`, `-g`, `-t`:
  bảo toàn các quyền cơ bản (cấp bởi `chmod`, `chown`), các mốc thời gian
  liên quan đến tập tin hay thư mục,
  không bao gồm các quyền mở rộng (extended attributes (`-X`) hay
  thông tin phân quyền ACL (`-A`), cũng không bảo toàn các `hardlink` (`-H`)),

4. `-x`: chỉ chép các nội dung được kết nối (`mount`) vào các thư mục con
  của thư mục `/`.

5. Các tham số `--exclude` để bỏ qua mấy thứ không cần thiết (thực ra
  thì nếu không có chúng bạn sẽ phải chờ rụng râu.)

Nếu hệ thống cũ (A) của bạn có nhiều phân vùng, ví dụ `/boot`, `/home`, `/usr/`
thì sau lệnh ở trên nội dung của chúng không được chép qua ổ mới do tham
số `-x` ngăn cản việc này. Bạn có thể lặp lại, ví dụ

```
rsync -avx --progress /boot/ /mnt/new_disk_B/boot/
```

Xong, đơn giản quá nhen. Ồ không, còn tập hai là điều bạn phải lưu ý:

1. Nếu bạn xài docker với `overlayfs`, bạn có thể  bỏ nó ra khỏi lệnh `rsync`
  đầu tiên (`--exlude=/var/lib/docker/*`),
  lý do là các `hardlink` hay `sparse` file bên trong `/var/lib/docker/`
  (hoặc thư mục khác tùy do bạn cấu hình trong `/etc/docker/daemon.json`)
  sẽ khiến bạn chờ rất lâu.

  Sau đó, dùng `rsync` riêng cho thư mục `/var/lib/docker` với tham số
  tương tự trên, bổ sung thêm `-HSX`.
  Ở đây, `-S` (hay `--sparse`) là tùy chọn để chép các tập tin `sparse`.
  Nếu không có gì quan trọng bạn cứ xóa luôn `/var/lib/docker/` cho khỏe.

2. (Tùy chọn)
  Nếu có các tập tia đĩa ảo dùng với `Virtualbox`, `qemu` gì đó, bạn
  cũng gặp các tập tin `sparse` như trên. Khi đó bạn dùng tùy chọn `-S`
  trước, rồi tiếp theo, bỏ đi tùy chọn này, chạy lại cùng lệnh `rsync`
  nhưng với tùy chọn `--inplace`. Tùy chọn `-S` chạy lần đầu tiên sẽ
  tạo ra các `block` cần thiết trên ổ đĩa mới `B`, còn lần sau sẽ chỉ
  chép các `block` có thay đổi nội dung.

Nếu dữ liệu ít bạn có thể ngồi chờ. Nếu nhiều bạn cứ việc dùng máy
thoải mái, sau khi chạy `rsync` lần đầu thì bạn thực hiện bước 1
tắt mạng, tắt tất cả các chương trình đang ghi vào ổ đĩa `A` rồi chạy
lại các lệnh `rsync` cần thiết. Khi đó với các tập tin `sparse`
thì việc dùng `--inplace` rất mau lẹ, nếu không bạn phải chờ
chép 20G hay cả 100G gồm toàn những block không có dữ liệu =))

Về các tập tin Sparse bạn có thể tham khảo
  [ArchLinux wiki](https://wiki.archlinux.org/index.php/Sparse_file)
hay https://gergap.wordpress.com/2013/08/10/rsync-and-sparse-files/

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

### [`about`](https://github.com/linuxvn/about/blob/master/Notes-2019.md#about)

tags: #about #linuxvn #help

Giới thiệu về kênh tin này `@linuxvn_notes`.

Cảm ơn các bạn đã theo dõi kênh tin tức này. Sau khoản một tuần thử
nghiệm mình thấy khá ổn, viết bài trên Github và gửi ngay vào Telegram.
Một cronjob chạy mỗi giờ một lần để đồng bộ. Blog cá nhân mình sẽ dành
cho mấy thứ rất vụn vặt.

Hiện tại mình là người viết chính, tranh thủ thời gian rỗi đọc tin tức,
ngồi soi rồi tóm tắt lại. Vừa khỏi quên tiếng Việt vừa tiết kiệm thời
gian sau này coi lại hoặc thời gian của bạn. Cuối tuần mình dự tính
có một bài review, tổng hợp.

Nếu bạn có ý tưởng gì, hoặc có vấn đề gì cần biết/viết về nó,
hãy tạo ticket https://github.com/linuxvn/about/issues.

Mình cũng mong có bạn nào dành chút thời gian cùng viết với mình cho vui.
Do hạn chế của định dạng `Markdown` mà Telegram hỗ trợ, nên việc viết bài
sẽ hơi phiền chút. Khi bạn gửi `pull request`, mình sẽ giúp `review`
về định dạng nếu cần. Bài viết sẽ được gửi tự động vào một group riêng để
kiểm tra trước _(liên hệ mình để lấy thông tin)_, nhờ `TravisCI`.

Các bài viết được xuất bản với giấy phép
  [`CC BY-ND 4.0`](https://creativecommons.org/licenses/by-nd/4.0/)
trừ khi bạn có yêu cầu riêng.
