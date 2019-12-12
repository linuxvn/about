## 2019

Lượm lặt những công cụ và tin tức đáng chú ý từ `Hacker News` hay từ
công việc hàng ngày. Nếu bạn thấy có gì hay hãy gửi `PR` nhé.
Nội dung sẽ được tự động đăng trên kênh https://t.me/linuxvn_notes.

### TOC

* k8s
  * Ác mộng với Helm:
      [Phần 1](#helm-nightmare-p1)
      [Phần 2](#helm-nightmare-p2)
      [Phần 3](#helm-nightmare-p3)
  * [Bắt đầu với k8s như thế nào](#k8s-the-hard-way-p1)
* Lucense, Elasticsearch
  * [Phần 1: Về Lucene](#lucene-war-part-1)
  * Phần 2: Về giấy phép Apache: TODO
* Công cụ linh tinh
  * [Rsync với Sparse](#rsync-with-sparse-file)
  * [jsonnet](#jsonnet)
  * [gitlabform](#gitlabform)
  * [tsocks](#tsocks)
  * [gawk](#gawk)
  * [Use Nmap to scan Prometheus targets](#nmap-for-prometheus)
  * [Git: Quay lại commit cũ sau khi merge nhầm](#git-revert-to-a-good-commit)
* Dịch vụ có ích
  * [theslinux.com dynamic dns](#theslinuxcom-dynamic-dns)
  * [send.firefox.com](#sendfirefoxcom)
  * [Telegram](#telegram)
  * [Ecosia searching service](#wwwecosiaorg)
* Nghề nghiệp
  * [Pair debugging](#pair-debugging)
  * [Luật Murphy](#murphy-s-law)
  * [Phỏng vấn Boss](#boss-interview)
  * [Berlin chào mừng bạn](#welcome-to-berlin)
  * [Berlin chào mừng bạn (2)](#welcome-to-berlin-2)
* Backup
  * [PostgreSQL file system level backup](#postgresql-file-system-level-backup)
  * [Hadoop Hdfs Metadata backup](#hdfs-metadata-backup)
* Linh tinh
  * [Elasticsearch workshop: Observability](#elasticsearch-workshop-observability)
  * [Welcome back, An Stk and Huy](#welcome-back-stk-and-huy)
  * [Linh tinh 2](#random-notes-2)
  * [Linh tinh 1](#random-notes-1)
  * [Root is rut](#root-is-rut)
  * [Giới thiệu về trang này](#about)

### `helm-nightmare-p3`

tags: #k8s #helm #panic

Mình bắt đầu gõ những dòng này thì cô gái tóc vàng với khuôn mặt thanh tú
ngồi đối diện đứng lên xuống ga. Ngồi suốt một buổi mà cả hai không nói với
nhau điều gì, rồi ra đi không từ biệt. Có lẽ cả hai cùng ngại nói đến helm,
chăng? Phiên bản mới 3.0 mới ra có gì hay? Thôi, đành viết lại vài dòng
để nhớ cô gái không quen và sẽ chẳng bao giờ quen.

Cô nhớ cho! Tới tháng 5 này thì các helm `stable` trước đây sẽ không
còn được liệt kê trên kho Helm, và cuối năm 2020 nhân dịp bảo hiểm xã hội
thay đổi cách tính theo hướng có hại nhiều hơn lợi cho người lao động,
dự án quy tụ các bản chart cứng (stable) sẽ dẹp luôn.

Nhưng khoan nói về helm3. Nhiều người vẫn hạnh phúc với helm2. Cũng khoan
nói về helm2. Hãy nói tại sao có helm, và lý giải một phần tại sao
`kustomize` ra đời.

Về cơ bản, các tài nguyên trên k8s có các thuộc tính cơ bản: phiên bản api,
thể loại (`.kind`), tên riêng (`.metadata.name`), đặc tả (`.spec`). Phần
đặc tả  phức tạp nhất, và người dùng phổ thông xài `yaml` để viết.
Khâu cuối cùng ngay trước khi deploy là file `yaml`, nhưng trước đó,
chín người mười ý, đặc biệt là 9 người từ 10 công ty khác nhau, họ cãi
nhau và bắt đầu thêm mắm muối vào file `yaml` đó. Để dễ hiểu, hãy tưởng
tượng đây là file `yaml` ban đầu:

```
apiversion: lauxanh/v1stable
kind: PornVideos
metadata:
  name: demo
  labels:
    say: "hello, world!"
spec:
  filename: demo.mp3
  vip_account: true
```

sau đó 9 ông devops vào sửa lại như sau:

```
apiversion: lauxanh/v1stable
kind: {{ .Values.PornKind }}
metadata:
  name: {{ .Values.PortName }}
  labels:
    {{ .Values.Action }}: {{ .Values.Message }}
spec:
  filename: {{ .Values.PornFileName }}
  vip_account: {{ .Vallues.VipIsRequired }}

  {{- if .Values.OhMyLauxanh }}
  {{ toYaml .Values.OhMyLauxanh | indent 2 }}
  {{- end }}

  {{- if .Values.Zalando.Users }}
  zalando_group: {{ .Values.Zalando.group_name }}
  {{- end }}

  {{- if .Values.HelloFresh.Users }}
  spec: {{ .Values.HelloFresh.Is.Not.Zalando }}
  {{- end }}

  # company X
  # company Y
  # company Z
```

Mỗi dạng thông tin trong file yalm mà k8s có thể hỗ trợ
người ta bỏ luôn, thay bởi một biến của helm. Bao nhiêu kiểu đặc tả,
bao nhiêu tham số thì cũng xem xem chừng đấy biến số trong tập tin
giá trị của helm.
Bạn xem thử tui nói đúng hông:
https://github.com/helm/charts/blob/master/stable/grafana/templates/deployment.yaml
Ý tuởng cơ bản là hay, từ file ban đầu, hỗ trợ
nhiều công ty, nhiều môi trường, nhiều biến thể khác nhau. Mục đích tốt,
nhưng sau một thời gian thì nhiều thứ quá, nhìn loạn cả óc. Đó là lý do
ra đời cái gọi làm helm cứng, stable: nó stable bởi muốn thay đổi nó
là chuyện chẳng dễ dàng gì, ít ai dám đụng vào.

Câu hỏi là, tại sao không xem ngay một đặc tả trong file `yaml` là một
biến số luôn. Nghĩa là, trong ví dụ ở trên, ta tự động có các biến số sau

```
$awesome.$metadata.$name = "demo"
$awesome.$metadata.$labels.$say = "Hello, world!"
$awesome.$spec.$filename = "demo.mp3"
$awesome.$spec.$vip_account = "true"
```

<!-- skip below -->

Oh yeah, quá dễ, nhưng thật ngây thơ vì yaml parser không chịu thế đâu.
Nên từ đó, nảy sinh ra `kustomize`, với ý tuởng cơ bản như vừa nói, nhưng
triển khai theo dạng patch: patch kiểu yaml đơn giản, hoặc khó hơn như
`patchesJson6902`. Thay dùng biến số, ta thêm vào file patch như sau:

```
apiversion: lauxanh/v1stable
kind: PornVideos
metadata:
  name: demo
  labels:
    say: "I love Maria."
spec:
  filename: "Maria-Ozawa.mp3"
```

vào khi trộn vào tập tin gốc sẽ ra kết quả theo ý của ông devops ở Sài gòn:

```
apiversion: lauxanh/v1stable
kind: PornVideos
metadata:
  name: demo
  labels:
    say: "I love Maria."
spec:
  filename: "Maria-Ozawa.mp3"
  vip_account: true
```

Ví dụ không phản ánh thực tế là tập tin gốc có thể có rất nhiều dòng,
còn tập tin để patch chỉ có vài dòng, đưa ra đúng những thứ cần mô tả.
Giống như khi xài `git diff | patch -Np1` vậy thôi:

```
k8s-stuff/
  42-ingres-zalado/
    - base/
        file1.yaml
        file2.yaml
        file3.yaml
    - deployment_in_use
        patch.yaml
    - deployment_in_euw
        patch.yaml
    - deployment_in_saigon
        patch.yaml
```

Về cơ bản thì không khác cách deploy với Helm? Có chứ, xem đây:

```
  your vars --> { helm vars + helm templates } --> helm --> final yaml file
  { your patches + base.yaml } --> kustomize --> file yaml file
```

Cách đầy bạn phải làm việc với nhiều thứ hơn (biến, cấu trúc, template),
cách sau từ đầu tới cuối chỉ một cấu trúc Yaml. Chính sự rắc rối của Helm
mà nhiều người nghĩ ra các kiểu template khác nhau, jsonnet, draft rồi
tá lả thứ khác nhau: Nhưng chúng đều có chung rắc rối như helm thôi.

Tạm dừng ở đây, cô gái tóc vàng đã đi xa lắm rồi. Bạn xem thêm:

1. https://github.com/helm/charts#deprecation-timeline
2. https://github.com/kubernetes-sigs/kustomize/blob/master/docs/eschewedFeatures.md
3. https://blog.hasura.io/draft-vs-gitkube-vs-helm-vs-ksonnet-vs-metaparticle-vs-skaffold-f5aa9561f948/

### `elasticsearch-workshop-observability`

tags: #elasticsearch #observability #berlin

Hôm đầu tháng 10 mình có dịp tham gia workshop do công ty Elasticsearch
tổ chức. Từ khóa của sự kiện là `observability`. Workshop này hoàn toàn
miễn phí, tổ chức ở một khách sạn lớn, có đồ ăn uống sáng, trưa ngon lành,
nhưng có lẽ... xa nên phòng hơi vắng. Mình gặp nói chuyện với một
anh chàng gốc Bắc Âu ở Berlin, nói rằng đi xem thế nào, tại lên chức lâu
rồi nên không còn nhanh tay lẹ mắt cài đặt gì nữa :)

Có thể, vì nhiều người lên chức quá, nên mới có Elasticsearch bản cloud,
cài đặt tích hợp sẵn mọi thứ từ APM, Log, Metrics, rồi Machine Learning,
nhìn cái menu mà choáng ngợp, nghĩ ngay mình còn phải học thêm 10 năm nữa
chưa xong cái nghề ops này :) Bản cloud đúng khỏe, cài đặt cấu hình gì
cũng có sẵn rồi, rẹt rẹt. Làm mình bồi hồi nhớ lại thuở ngồi kỳ cọ mấy cái
cấu hình sao cho mấy node ES nối nhau. Khổ gì đâu.

`observability` là gì? Nghe thấy lạ, khó đọc (dù sao, cũng dễ đọc hơn
`high availability`), giải thích thì loằng ngoằng như ở đây
  https://www.elastic.co/blog/observability-with-the-elastic-stack
. Tóm tùm lum lại, là một chỗ chung để theo dõi toàn bộ hệ thống, ở góc độ
lớn hơn của người làm ops, của developer hay quản lý.... Nói chung,
ý tưởng thì hay, còn thực hiện thì đấy, có ES lo rồi. Mới đây N26 công
ty start-up về tài chính ngân hàng cũng có workshop về `observability`,
nhưng hỏng biết có gì ở trong đấy. Từ khóa này cũng khá là hot trong
sự kiện mà O'Reilly tổ chức
(tóm tắt của mình: https://gist.github.com/icy/d32c504eb1d41adea11cff4ba0865808.)

Có mấy cái lặt vặt như `filebeat`, `kibana`,... mình nghĩ nhiều bạn biết
rồi. Trong khi thực hiện bài `lab`, thì có điều hài hước là nhiều người
gõ ngay `vi/vim` rồi đứng hình, lý do trình duyệt không hỗ trợ, trong khi
về cơ bản `nano` vẫn chạy ổn.
Thật chớt quớt, nhưng lượm lặt lớn nhất của buổi workshop này chính là,
mình tin rằng lựa chọn dùng `nano` là hợp lý, đúng đắn. Mình bồi hồi nhớ
lại cách đây mấy năm khi mới vào _ai đá tao_, mấy bạn trong team hỏi thế
chú xài gì, vim hay Emacs, xong có vẻ vô cùng thất vọng vì có một thằng
trời đánh nó trả lời là ... `nano` :))

À, ngoài ra còn `filebeat`, tuy được quảng bá rầm rộ nhưng trong buổi
workshop bà con cài lên xuống muốn xỉu lơ luôn. Và mình cũng mất đâu gần
gần hai buổi cho nó, đơn giản là muốn nó hỗ trợ k8s thì xài bản mới,
mà xài bản mới thì nó không thèm nói chuyện với logstash hay es cũ.
Ơ hay, rảnh quá ha. Chưa kể xài mem/cpu gì nhiều. Thôi, goodbye!

Còn mấy cái cao siêu như `observability` thì để dành lại cho các bạn
tự tìm hiểu thôi; mình có biết gì đâu. Nếu cần thì mình chỉ đơn giản bỏ
`devops` mà chuyển qua `opssex` thôi, đổi job title, đổi lương, công
việc vẫn như cũ.^^

PS: Nhờ workshop mà mình còn gặp bạn T. cũng ở Sài gòn qua Bá linh tìm
ngoại tệ . Rồi từ đó phát hiện nguyên băng Lazada bên này luôn. Điều
này làm mình có chút cảm hứng để viết tiếp một chút về Bá linh, mà bạn
sẽ được đọc thêm sau.

### `pair-debugging`

tags: #pair #debugging #problem #solving #hdfs

Chắc các bạn đã nghe về `pair programming`, phương pháp phổ biến từ lâu;
chậm nhất đâu khoảng 2007, vì lúc đó mình được biết một job yêu cầu
`PP` với `RoR`.

Hôm nay mình giới thiệu với các bạn về `PD`, hay `pair debugging`. Có thể
bạn đã đọc đâu đó trong sách vở và/hay từ các blogger lập trình viên nổi
tiếng. Còn mình kể lại chuyện thực tế thôi ha, có gì cứ coi như mình là
kẻ thất học vậy.

Hệ thống `big data` chỗ mình bị đầy đĩa. Trong đó nào là kafka, nào là
hdfs, nào là yarn manager tá lả thứ. Sau khi đĩa mới được thêm vào, đảm
bảo cấu hình được chỉnh rồi các tiến trình được khởi động lại theo đúng
bài vở, thì hệ thống vẫn báo là một trong 5 node của cluster rớt ra ngoài.

Thế là mình ngồi mò tìm mãi chẳng hiểu sao. Thực ra mình cũng không phát
hiện ra lỗi như vậy, công việc của mình đã xong như vừa nói.
Một bạn data engineer tò mò ngồi xem trên Grafana rồi báo lại.
Mình cực chẳng đã phải kiểm tra, thấy `hdfs` báo ngon lành hết, xanh lè.
Mà sao bạn data engineer cứ thắc mắc. Một hồi chát có vẻ không hiểu nhau
nên thôi cả hai quyết định dọn về gần nhau cho tiện. Hai cái ghế, một
màn hình, một bàn phím, một console, tình anh em đồng nghiệp nào mình
cùng thực hiện `PD` hay là `pair debugging`.

Do mình còn lơ tơ mơ về `PD` và cả `big data` platform, nên mình quyết
định theo phương án là bạn `engineer` có ý tưởng gì là hai bên cùng thử
hết. Nào là khởi động lại `prometheus` exporter phòng khi có lỗi,
khởi động lại các tiến trình `hdfs` trên tất cả các node. Rồi khởi động
lại các ứng dụng, .... với hy vọng rằng sẽ giải quyết được vấn đề.
Cũng có vẻ hiệu quả. Khi vừa mới restart thì hệ thống xanh, nhưng sau đó
vài phút thì hệ thống lại báo có một node rớt ra ngoài. Điều này khiến
cả hai bạn nghĩ rằng do app tịt chỗ nào đó. Nên cứ tha hồ restart.
Mỗi lần vậy cũng không dễ dàng gì, vì phải restart xong là ngồi đợi
cho đến khi log sạch sẽ mới chuyển qua restart node khác.

Ừ, về log thì biết rồi, các ứng dụng java nó quăng ra qua nhiều thứ
nhưng điều quan trọng thì tìm không thấy đâu.

Rồi đi xem trang wiki, xem các tài liệu chỉ dẫn để lại. À, tại vì bạn
engineer ngồi setup xong bộ big data cluster này phải đi nghỉ phép vài
tháng rồi, không ai biết thực sự chuyện gì đang xảy ra.

Mò, hai bạn ngồi trên đống lửa production, từ 9h sáng cho tới gần 1h chiều.
Có ý kiến gì thì cứ thử. Mệt quá, hai bạn cùng nghỉ.

Khi bạn kia đi rồi thì mình ngồi coi lại log, và cấu hình, và trong 3 phút
đã phát hiện ra vấn đề tại đâu: Còn thiếu một file cấu hình nữa, quên
update. Chỉ việc thêm đĩa mới vào đó, khởi động lại. Khỏe re.

Bài học là gì? `PD` nó tai hại nếu hai ông thần cứ giả bộ như không biết
gì cứ ngồi thử / sai. Khi vấn đề xảy ra, chỉ cần hít một hơi thật sâu,
coi chính xác lỗi gì, đọc log kỹ rồi fix thôi. Khi giải quyết vấn đề
thì cần tập trung, chứ nhiều ý kiến linh tinh không có cơ sở thử cho
khỏi mất tình đồng nghiệp chẳng ăn nhằm gì đâu.

Hehe.

### `git-revert-to-a-good-commit`

tags: #git #devops #trick #diff

Hôm nay trên `@linuxvn` (https://t.me/linuxvn/55674) có bạn hỏi làm thế nào
để quay lại một commit cũ/tốt trên master, sau khi lỡ nhầm merge nhánh `dev`
vào nhánh `master`. Sau câu hỏi này là một màn tranh luận sôi nổi, dài lê
thê mà mình chưa kịp coi. Người hỏi muốn `reset`, bỏ đi các commit lỗi
để quay lại cái cũ, một kiểu `Undo` giống khi soạn thảo văn bản.

Vấn đề này hay gặp, bạn có thể xem trao đổi trên `SO`:
https://stackoverflow.com/questions/4114095/how-do-i-revert-a-git-repository-to-a-previous-commit
tất nhiên là trên đó cũng miên man đủ thứ giải pháp, mà thật ra mình coi
nhiều lần vẫn không hiểu thế nào là tốt, hoặc là cũng chả cần hiểu nhắm
mắt làm theo.

Sau đây, mình giới thiệu cho bạn cách truyền thống, cực kỳ chính xác.

Thứ nhất, sau khi commit, đã merge, thì bạn không nên `Undo`, xóa bỏ
commit bằng `git reset`, một khi thay đổi đã được `push` lên kho hay chỗ
nào đó. Lời nói gió bay, chỉ có thể sửa chữa chứ không rút lại được.
Trong DevOps cũng có vài nguyên tắc sống hay vậy.

Tiếp theo, về cơ bản, giữa hai `commit` bất kỳ trong kho git của bạn
là một _khoảng cách_ khác biệt, mà bạn luôn thấy được bằng lệnh `git diff`.
Phục hồi `commit` cũ, tức là xóa đi các khác biệt này, hay là áp dụng khác
biệt đó theo chiều ngược (bạn sẽ rõ hơn ở phần sau).

Giả sử, bạn đang ở `master` và cần quay lại commit `3323e5b` tốt. Hãy chuẩn
bị bước đầu tiên là `clone/checkout` nhánh `master` ra một thư mục sạch sẽ,
là thư mục mà khi bạn gõ `git status -u` thì không thấy gì ở đó.

```
$ git status -u           # đảm bảo không thấy gì
$ git checkout master     # chắc chắn bạn đang ở master
$ git diff HEAD..3323e5b  > patch.diff
```

Trong lệnh cuối cùng, thứ tự rất quan trọng. `Commit` tốt của bạn phải
nằm sau cùng (đi ngược về quá khứ). Sau đó, bạn áp dụng bản diff này

```
$ patch -p1 < patch.diff
$ git status -u
```

Kiểm tra lại xem các file nào mới chưa được commit trong kết quả
của lệnh `git status -u` ở trên. Nếu có, bạn thêm vào: đó là các tập tin
có trong commit cũ (`3323e5b`):

```
$ git add some/new/files.txt
$ git commit -a "Revert to 3323e5b, thanks to @linuxvn"
```

Để chắc chắn, bạn kiểm tra lại kết quả

```
$ git diff 3323e5b..
```

lần này cần phải hiện ra ... không gì cả, tức là bạn đã hoàn toàn phục
hồi lại `commit` cũ của bạn.

Cách này lúc nào cũng thành công, đơn giản, thậm chí bạn có thể tranh thủ
điều chỉnh vài thứ. Và hơn hết, thay vì phải đi hiểu một đống lệnh như
là `git revert`, `git reset`, ...bạn chỉ việc tập trung hiểu bản chất
của vấn đề là, `diff`, `diff`, và `diff` ;)

### `theslinux.com-dynamic-dns`

tags: #dns #bot #theslinux

Ngắn gọn: Bạn có thể có tên miền con ở theslinux.com với hỗ trợ dynamic dns.
Ví dụ, foobar.theslinux.com với địa chỉ IP internet nhà bạn.

Để bắt đầu, bạn trò chuyện với bot [foor3_bot](https://t.me/foor3_bot).
Tài khoản Telegram của bạn phải có nickname, và bạn là thành viên của @linuxvn.
Bắt đầu với lệnh sau

1. `/dns help` : luôn có kết quả;
2. `/dns help full` : chỉ có kết quả chi tiết hơn.

Nếu ở lệnh `/dns help full` bạn thấy ngắn, tức là nick của bạn chưa được
xác nhận, hãy nhờ bạn Đức hoặc Anh trên @linuxvn.

Sau đó, bạn tạo một gist bí mật (hay công cộng tùy bạn), như ví dụ sau
https://gist.github.com/icy/b3c600d2bec2994c429f2bbe09a4267d.
Rồi gõ lệnh push:

```
/dns push https://gist.github.com/icy/b3c600d2bec2994c429f2bbe09a4267d
```

và ngồi chờ vài phút. Dùng `/dns get` hay `/dns log` để xem thông tin
mà hệ thống xử lý thông tin của bạn.

Để dùng `dynamic dns`, bạn chỉ việc dùng `git clone`, cập nhật và
push liên tục lên Github thôi:

```
$ git clone https://gist.github.com/icy/b3c600d2bec2994c429f2bbe09a4267d mydns
$ cd mydns # edit...
$ git push
```

Mã nguồn sẽ được tải về tự động. Tất cả các tập tin trong mã nguồn của bạn
được duyệt qua, nên bạn có thể đặt tên sao cho dễ nhớ.

Nào cùng nghịch thôi.

### `random-notes-2`

tags: #notes #random #retrospective #linuxvn

Hôm nay là ngày đen tối, buồn quá nên ngồi kể linh tinh chuyện.
Chuyện như thế này https://t.me/linuxvn/51920, không phải là chuyện buồn,
đó là chuyện ... cay đắng. Buồn bực là một cách bộ não đang tự cải tiến,
nên thật ra đó cũng là điều may mắn. Đành tự an ủi, lâu lắm rồi ngày xưa
là do lỗi mình, nhưng lần này cũng lỗi cho mình nốt.

Nhóm Telegram @linuxvn đâu có 400 nick tụ tập rồi. Admin có Kỳ Anh, Đức,
Quang, Nhâm, Vũ Nhân, (và DuyDo) cũng không phải làm gì phức tạp,
trừ Đức dành nhiều thời gian cho mirror.
Hy vọng sang năm số Admin lên được 300.
Một số thành viên siêu nhân mới xuất hiện gần đây, là điều rất đáng yêu.
Còn vài điều hấp dẫn nữa, kể dịp khác. Cảm ơn tất cả các bạn đã tham gia
vào nhóm.

Có kênh đăng tin công việc https://t.me/devopsjobs nhưng do mình không
còn liên lạc với thị trường trong nước, mình nghĩ bạn nào đó có thể phụ
trách giúp. Xin hãy liên lạc trên nhóm @linuxvn.

Thang-Man có hỏi https://t.me/linuxvn/50223
và các bạn chú ý https://t.me/linuxvn/50228.
Gần tuần nay đội BI+ops chỗ mình đi cài Sqoop mãi không xong,
mới thấy giá trị của AWS EMR thế nào :)

Trước đó thì cả tuần mình ướt mồ hôi trán với uwsgi+python nằm sau Apache.
Các worker sau khi reload sẽ khiến phát sinh lỗi 500 trên Apache.
Sau khi phát hiện ra phải bật thread lên (https://t.me/linuxvn/51063),
thì vẫn còn lỗi 500, mà mình đoán là do Apache bị mất kết nối tới socket của
uwsgi. Thôi mệt, mình đi nuôi con chó giữ nhà (watchdog), đọc apache log
(dùng `tail -F`, với F viết hoa, không phải thường nhé), phát hiện thấy
lỗi 500 là lập tức restart apache worker (`apache2ctl -k graceful`);
thế là ngủ ngon, lỗi 500 vẫn đầy nhưng hầu như không ai phát hiện ra, trừ mình.

Sau khi được chào mừng thì Huy-Ngo và An-stk lặn mất tăm. Điều đáng tiếc
là Huy-Ngo bận rộn nên không chăm sóc cho mirror được nữa. Có bạn nào
có thể giúp audit mirror xin giơ một tay.

Bạn nào dùng proxy trước k8s để ý tới haproxy+SNI và chủ đề này
https://t.me/linuxvn/50112 (https://t.me/linuxvn/50117). haproxy quả
thật thú vị và đơn giản hơn nginx ;)

Sau 8 năm mua máy ảnh (và chụp ảnh, tất nhiên :D) mình mới phát hiện ra
mình thích chụp cái gì. Sau cũng hơn chừng đó năm làm admin+devops,
tóm lại là mình vẫn không hiểu mình thích được cái gì. Thiệt là điên, nhỉ ;)

### `welcome-to-berlin-2`

tags: #berlin #relocation #devops #bluecard

Mình chính thức thông báo, mình đã chuyển qua làm việc lâu dài tại Berlin.
Mình chuẩn bị khá lâu nhưng lúc đi thì cái vù, chỉ vài người biết. Một phần
vì các thủ tục giấy tờ ở đây phức tạp, có thể tuyển thẳng mình về Saigon
bất kỳ lúc nào nên mình không dám hó hé, sợ quê.

Berlin năng động, không như kiểu Sài gòn hay Singapore. Nhiều bạn cũng
sắp qua đây, hỏi tùm lum thứ. Nên mình viết sơ vài ý quan trọng để
bạn lên kế hoạch. Người Đức thích và giỏi lập kế hoạch, nên đầu tiên bạn
cần luyện kỹ năng đó. Việc gì tới sẽ phải tới, vậy thôi.

1. `Xin việc`: Bạn apply qua LinkedIn, nên đăng ký một tài khoản Premium
  miễn phí tháng đầu, 30 Mỹ kim mỗi tháng kế tiếp (nếu vẫn xài) Trên đó,
  có khóa học `Get things done` cực hay, bạn nên xem qua nhé. Khi xin việc,
  cần hết sức chú ý hỏi về môi trường và phong cách làm việc. Càng cởi mở
  càng tốt; vì người Đức nổi tiếng kỷ luật mà. Ví dụ, bạn nên hỏi tao muốn
  làm ở nhà được không;)

2. `Mức lương`: Khó mà giàu ở đây. Muốn giàu, bạn đi Singapore hay Mỹ nhé.
  Còn để cân bằng sống và làm việc chả theo giương ai hết, Berlin là nơi
  khá tốt cho bạn đấy. Mức lương của mình thì bạn có thể hỏi riêng, nhưng
  bạn nên biết điểm khởi đầu của mình để khỏi tự bắn vào chân nhé.

3. `Bằng cấp`: Bạn nên có một bằng đại học được Đức công nhận. Mình may
  mắn có bằng mát-tơ ở Việt nam, trường đại học mình được công nhận, nhưng
  bằng của mình thuộc dạng dỏm, phải gửi qua Đức cho họ kiểm tra, ký giấy
  công nhận. Mất ít phí. Nhưng kết quả là tờ giấy còn đẹp hơn cả cái bằng
  gốc của mình hehe.

4. `Thủ tục visa`: Hơi khó, bạn xin visa làm việc (bluecard), nhưng lãnh sự
  quán Đức ở Sài gòn cấp visa ngắn hạn 3 tháng để bạn qua Đức xin tiếp visa
  dài hạn. Việc khó đầu tiên là đặt lịch hẹn làm thủ tục visa, thường
  việc này phải tiến hành trước vài tháng, trước cả khi bạn có offer từ
  các công ty đấy. Bạn sẽ phải gửi email để hỏi (xem trên
  https://vietnam.diplo.de/), còn trước đây mình canh mãi mới được,
  và lịch hẹn của mình có sau thời gian bắt đầu hợp đồng đến mấy tháng.
  Công ty có thể có visa agent hỗ trợ, nhưng bạn nên chủ động tìm hiểu hoàn
  chỉnh giấy tờ, thủ tục, đặt lịch hẹn,... nhé.
  Và quan trọng là thông báo đầy đủ tình trạng cho công ty để họ biết
  mà hỗ trợ hoặc ... chờ bạn onboard.

5. `Qua tới Đức`: Do bạn ở lâu hơn 2 tuần, bạn sẽ phải làm thủ tục đăng ký
    `hộ khẩu` (Anmeldung).
    Việc này `dễ`, làm trong 10 phút là xong, nhưng oái ăm là bạn phải
    có một địa chỉ ổn định để bạn có thể nhận giấy tờ (rất nhiều)
    và làm các thủ tục tiếp theo (mở tài khoản ngân hàng, bảo hiểm,
    thuê nhà, ...) Bạn có thể ở tạm Airbnb và nhờ ai quen cho/thuê mượn
    địa chỉ đăng ký.

    Không phải chỗ ở Airbnb nào cũng cho bạn giấy Wohnungsgeberbestätigung,
    mà có cho thì cũng phập phù khi bạn chuyển đi nơi khác (nhưng hay cái
    là bạn có thể đăng ký dịch vụ bưu điện tự động chuyển thư của bạn qua
    địa chỉ mới; cái này còn xịn hơn routing bằng iptables nhé.)

    Thuê nhà ở Berlin khó hơn mua nhà ở quận 7 sài gòn, một phần vì quá đông
    người thuê, và phần chủ yếu là bạn mới qua đây, chưa ai biết bạn là ai,
    thu nhập thế nào: Một khi đã thuê nhà ở, chủ nhà rất khó có
    lý do để đuổi bạn đi, nên nhiều chủ nhà hỏi bảng lương của bạn trong
    vòng mấy tháng cuối thì mới cho thuê nhà đấy (nên nhớ, chính công ty bạn
    sắp xin vào cũng không dám hỏi bảng lương của bạn nhé.)
    Nhưng có nhà rồi, coi như khỏe re rè re luôn.
    Mình thuê nhà 65 mét vuông, hai phòng, hết khoảng 760e mỗi tháng.

Chúc bạn may mắn.

<!-- skip below -->

Các câu hỏi thường gặp, cho người đến Berlin:

1. `Có vấn đề gì không, nếu lịch hẹn ở lãnh sự quán sau thời gian bắt đầu hợp đồng?`:
   Bạn chỉ việc báo lại công ty để làm lại
   hợp đồng sau này thôi. Công ty sẽ chờ bạn, việc này thường nằm trong
   kế hoạch dự tính rồi

2. `Không có bằng đại học được không?`: Tiêu chuẩn chung của châu Âu, chứ
    không chỉ riêng Đức, là bạn có bằng đại học, hoặc một bằng tương đương
    (được công nhận) ở châu Âu. Bạn cần ghi rõ và trao đổi thẳng thắn với
    công ty (hoặc visa agent của họ) để họ hỗ trợ, đỡ mất thời gian đôi bên.

3. `Bao lâu thì có visa?`: Cái này lãnh sự quán Đức trả lời cho bạn mới phải.
    Việc cần làm là bạn chuẩn bị kỹ càng giấy tờ thủ tục, khi nào nộp lên
    đầy đủ thì họ làm lẹ cho bạn thôi. Mình có visa trong khoảng dưới 2 tuần.

4. `Mua bảo hiểm gì trước khi qua Đức?`: Bạn phải có bảo hiểm y tế khi đặt
    chân vào Đức. Bạn có thể hỏi mua các gói bảo hiểm Du lịch ứng với thời gian
    của visa (ví dụ 3 tháng).
    Mình thì liên hệ công ty bảo hiểm TK (tk.de) ở Đức để họ làm bảo hiểm
    cho mình luôn, nên không phải tốn đồng nào,
    y chang như là mình đã đi làm tại công ty đóng bảo hiểm xã hội ở Việt Nam ấy.

5. `Chọn hãng bảo hiểm nào`: Mình chọn TK, khá phổ biến ở Đức. Đó là bảo hiểm
    công. Nếu chọn bảo hiểm tư ngay từ đầu thì bạn không có cơ hội chuyển
    ngược lại bảo hiểm công, nên bạn cần lưu ý chọn _đúng loại_. Bảo hiểm
    của bạn có thể mua thêm cho vợ, con mà không tốn quá nhiều.

6. `Mua simcard ở Đức dễ không?`: Mua đúng luật thì dễ rồi, mua trái luật
    cũng không khó lắm. Các tiệm bán sim khá phổ biến, việc kích hoạt sim
    đôi khi... không cần cả passport của bạn, do đã có người kích hoạt
    sẵn (giống ở Việt Nam). Mình cũng mua loại sim này, sau đó viết email
    gửi cho nhà mạng bảo họ đổi lại cho đúng tên mình -- việc này chỉ thực
    hiện được nếu bạn có Anmeldung ở Đức. Chi phí khá rẻ, khoảng 20 - 25e
    có đủ xài đỡ rồi. Mình dùng mạng `ortelmobile` họ có trang tiếng Anh
    và hỗ trợ rất tốt :)

7. `Đăng ký tài khoản ngân hàng thế nào?`: Trước đây, mình đăng ký ở N26,
    nhưng hiện nay họ không hỗ trợ visa ngắn hạn (3-tháng) từ Việt Nam.
    Mình đi hỏi vài ngân hàng khác (Commerzbank, Postbank) họ đều yêu cầu
    visa 6 tháng trở lên. Đây đúng là trở ngại: Không có tài khoản ngân
    hàng thì một số thủ tục sẽ bị tắt nghẽn, và bạn sẽ không thể nhận lương
    trong vài tháng đầu. Quả thật là, trong vòng 3 tháng đầu mình không
    nhận được tiền từ công ty, nên toàn phải ăn không khí thôi à.

9. `Bao lâu thì có PR?`: Đã nói trong phần 1. Nếu có bằng B1 tiếng Đức thì
    tối thiểu 21 tháng. Không thì chờ 3 năm. Sau 8 năm bạn có quyền xin
    quốc tịch Đức (nhưng đồng thời bạn phải bỏ quốc tịch Việt Nam.)

10. `Thử việc bao lâu, nếu mất job thì sao?`: Thời gian thử việc có thể
      đến 6 tháng, như trường hợp của mình. Trong thời gian đó, hai bên có
      quyền kết thúc hợp đồng sau khi báo trước 2 tuần. Sau thời gian thử
      việc, thời gian đó (notice period) lâu hơn, đến 3 tháng.

      Nếu mất job, bạn phải báo với cơ quan quản lý, và bạn có thể ở lại
      Đức 3 tháng sau đó tìm việc mới. Tìm không ra thì ... xin mời về.

11. `Bluecard có thời hạn bao lâu?`: Tối đa 4 năm, và không lâu hơn hợp
    đồng của bạn (cộng thêm 3 tháng như vừa nói ở trên). Các công ty ổn
    định về tài chính có thể cấp cho bạn hợp đồng vô thời hạn, khi đó thì
    bạn có ngay `bluecard` 4 năm.

12. `Mua vé tàu điện thế nào?`: Bạn chưa có tài khoản ngân hàng thì không
    mua được vé năm (trung bình trả 64 euro mỗi tháng). Mua vé tháng mất
    khoảng 81 euro. Nếu không phải đi lại thường xuyên, bạn có thể mua
    từng set 4 vé một chiều (mỗi vé chỉ được đi một chiều, không được
    quay ngược lại) giá 9 euro. Nếu có con nít đi kèm bạn tìm hiểu thêm
    vé ngày ;)

14. `Thuê nhà ở Berlin khó thế nào?`: Đã nói sơ sơ ở vài chỗ rồi, luật của
      Đức khiến chủ nhà không dễ đuổi bạn một khi bạn đã dọn vào ở; nên
      việc đầu tiên là ... tiền đâu, bạn phải chứng minh khả năng tài chính
      bằng bảng lương của các tháng trước. Có rất nhiều người có nhu cầu thuê,
      trong khi không có nhiều chỗ, nên giá thuê tăng chóng mặt, các chủ
      nhà càng được cớ làm chảnh.

      Việc thuê nhà thành công sẽ giúp bạn có tờ giấy Wohnungsgeberbestätigung,
      là xác nhận của chủ nhà cho bạn vào ở (và khi bạn rời đi, bạn lại
      phải xin cái giấy tương tự để rời nhà, phức tạp ghê.) Giấy này làm
      cơ sở cho rất nhiều thủ tục khác nhau, từ đăng ký tài khoản ngân hàng,
      sim điện thoại, ... và cũng là điều kiện tiên quyết để có thể đăng ký
      Anmeldung. Muốn Anmeldung phải có Wohnungsgeberbestätigung, muốn có
      Wohnungsgeberbestätigung phải có tiền thuê nhà, muốn có tiền thuê nhà
      phải chứng minh bằng tài khoản ngân hàng, muốn mở tài khoản ngân hàng
        ở Đức phải có ... Anmeldung. Nó lòng vòng giống Việt Nam vậy.

      Các công ty có thể giúp bạn thuê nhà tạm trong thời gian ban đầu.
      Vì địa chỉ thuê nhà sẽ nhận rất nhiều thư từ (một cách để xác thực)
      nên bạn cần cân nhắc thời gian thuê để ổn định trong vài tháng đầu,
      nếu không sẽ bị lạc thư. Như mình đây trong 6 tháng đầu tiên ở Berlin,
      rất thường xuyên nhận thư của vài ba người khác từng ở,
      trong đó có cả thư trát bắt người =))

      Việc thuê được nhà ổn định là việc rất khó, bạn nên để thứ tự ưu tiên
      cao nhất. Thuê nhà rồi chuyển đi càng điên hơn. Tiền cọc trung bình
      ba tháng, và sau khi rời nhà thì có khi đến một năm sau bạn mới có
      thể nhận lại tiền cọc, theo luật mới nhất.

### `welcome-back-stk-and-huy`

tags: #linux #vn #saigonlug

`ArchLinuxVn` chào mừng sự trở lại của các bạn An stk và Huy-Ngo trên
nhóm telegram @linuxvn. Sau thế chiến thứ ba, các bạn đã lưu lạc quá lâu,
đi làm kinh tế ở đâu không biết nhưng lúc trở lại đã tăng gấp đôi băng
thông cho hệ thống mirror (f.archlinuxvn.org) là điều thật đáng trân trọng.

`ArchLinuxVn` chỉ còn là cái tên từ hồi xưa. Nhiều bạn giờ nâng cấp lên
phiên bản MacOS của `ArchLinux`. Giờ ngồi với nhau người ta không hỏi
Linux là gì, mà hỏi Docker là gì, rồi k8s là gì.... Kể ra, không phải vì
ai cũng đã hiểu Linux, chẳng qua Linux không còn phải là cách dễ kiếm
cơn như ngày xưa nữa.

Sự trở lại của An stk và Huy Ngo còn được đánh dấu bởi việc phiên bản kế
tiếp của MacOS chuyển qua shell mặc định trên hệ thống là `zsh`, thay vì
`Bash-3`. Mình đã gặp rất nhiều trục trặc khi hỗ trợ cho người dùng Bash
trên máy MacOS, giờ chắc đau đầu hơn. Nhưng thật sự GPL có vấn đề với
`bọn` nhà giàu. Biết sao, buồn một phút.

Cảm ơn các bạn An stk và Huy Ngô.

### `murphy-s-law`

tags: #devops #strategy #murphy #essential

Trang wiki tóm tắt luật Murphy: _"Anything that can go wrong will go wrong"_.
Câu tiếng Anh này ngắn gọn đến nỗi không cần phải dịch, ai cũng hiểu.

Mình không nhớ biết đến luật này tự bao giờ. Nhưng rõ ràng nhiều bạn vẫn
chưa biết luật này. Mình không rõ có tài liệu tiếng Việt nào viết về nó.
Điều đáng ngạc nhiên là, rất khó để chứng minh cho bạn thông luật này.
Dù nó được xác nhận nhiều bởi thực nghiệm, nó là một luật thống kê.
99 phảy với một trăm số chín xếp hàng ngay ngắn theo sau, vẫn không phải
100 (phần trăm).

Mình muốn viết bài về luật này rất lâu. Trong bài trước đây chẳng hạn
`root-is-rut`, đã có nhiều ví dụ. Có thể hù bạn,
mức độ kinh nghiệm của bạn trong nghề `devops` đo được bằng mức độ bạn
hiểu và áp dụng luật Murphy tới đâu trong hệ thống của bạn =))

Trong ví dụ mà bạn đã biết về sao lưu `postgresql`:
Tất cả các khách hàng không sao, chỉ trừ một chú bị trục trặc với kịch bản
mà đội ops giải gần hai tháng chưa xong triệt để triệt để (k8s/stolon.)
Từ khi ngay lúc định hướng viết hỗ trợ sao lưu, vấn đề này đã được nêu ra.
Nhưng với tất cả các lý do, thiết kế hướng tập trung để né tránh xung đột
với ứng dụng bị bỏ qua. Một cách vi phạm luật Murphy rõ ràng :P

Một chuyện hài khác. Ai đi tàu không có vé, coi như đi lậu, sẽ bị phạt
60e một lần. Anh bạn cùng chỗ làm kể, anh ta đi 4 năm trời không sao hết.
Đúng bữa anh ấy hết vé, lại quên đi nạp tiền, thì bị ngay đội tuần bắt.
Mất ngay 60e tiền ngu chứ sao =)) Luật Murphy đây áp dụng chính xác quá luôn haha.

Luật Murphy áp dụng cho hệ thống nfs là nản lòng nhất. Các hệ thống nfs
phụ thuộc vào hạ tầng mạng, thường nằm tách biệt với các tầng ứng dụng
phía trên. Năm 2013, mình nhớ cty cũ bị lỗi liên quan nfs, cả đội ngoác mõm
ra chờ mấy tiếng đồng hồ. Còn mới đây thôi, hôm sáng thứ hai đầu tuần, đội
Noc ngồi nâng cấp core switch, dù có đầy đủ backup, failover, nhưng một chú
switch nào đó hỏng đơ phải reboot lại, thế là tạch luôn cả bọn, tạch luôn
hệ thống nfs. Cả một hệ thống đâu mấy chục máy và dịch vụ phải khởi động lại,
mất hai ngày mới xong hết các lỗi, nhưng các hệ quả vẫn còn lại
-- xem `random-notes-1`.

Luật này cũng liên quan tới phép quy nạp không hoàn toàn, xem đây:
https://icy.theslinux.org/m/kyanh.net/2016/03/22/sau-1-2-3-4-5-6-se-la-gi/index.html
Trong ngành ngân hàng hay ở mức quản lý cao cấp, có chuyện `risk management`.
Trong cuộc sống có ngành bảo hiểm. Áp dụng cực đoan luật Murphy, bạn sẽ
thấy chỉ còn hai thứ có thể cứu vãn, niềm tin và sự may mắn của bạn :)

Nếu để ý tới luật Murphy, rất nhiều bài toán Ops sẽ được sáng tỏ :)

### `welcome-to-berlin`

tags: #berlin #relocation #devops #bluecard

Mình viết bài này lâu rồi, nhưng để xó vì dự tính khác; hôm qua thôi, biết
có bạn đang chuẩn bị hành lý qua Berlin, nên mình thấy nên viết lại, nhưng
theo kiểu khác.

Bạn biết là, mình đi công tác ở đây vài tháng rồi. Xa bạn bè gia đình,
xa những ngày nắng nóng hay những lúc mưa buồn của sài gòn. Hay nhớ
những quán nhậu, cà phê vỉa hè. Ôi, nhớ nhất là những quán cà phê, chắc
không nơi đâu trên thế giới có kiểu như sài gòn vậy =^^

Berlin không đẹp như Paris. Sau thế chiến hai, thành phố bị san phẳng,
các tòa nhà ở đây tuổi đời đâu 70 trở lại thôi. Nhưng berlin nhiều cây cối
công viên tàu điện và xe đạp (số xe vẫn thua Hà Lan?) Một bạn chỗ
mình làm mỗi ngày hai cuốc xe đạp đi về, mỗi chiều 32 km. Tốc độ xoàng
xoàng 41km/h. Quá khiếp. Mình từng đi làm với xe đạp ở Sài gòn, 7km hết
chừng 1 tiếng, tốc độ rùa khỏi chê.

Ôi lan man thế, cho biết bạn mình cũng có khiếu văng nghệ không thua
ai. Còn về kỹ thuật: Berlin khá cởi mở trong việc tuyển người các ngành
công nghệ. Nếu có công ty ở đây nhận làm, hầu như bạn sẽ có thể bay qua
đây trong hai tháng. Tìm việc khá dễ, bạn vào LinkedIn tìm thôi, nếu bạn
chịu bỏ ra 30 đồng ông tơn (usd) thì bạn có nhiều job ngon nữa cơ;
mà cũng chả cần mất số đó, tháng đầu LinkedIn cho miễn phí. Bạn cũng sẽ
biết mức lương của `senior devops engineer` ở đây vào khoảng chính (phân
phối chuẩn) từ 65k đến 70k euro mỗi năm trước thuế. Chế độ lao động thì
tuyệt vời. Mỗi năm có ít nhất 24 ngày phép, chưa kể ngày nghỉ lễ công cộng,
chỗ mình làm cho hẳn 29 ngày luôn, tha hồ  đi chơi. Sau giờ làm việc
thì khỏi ai dám gọi bạn nếu không muốn phạm luật hay trả tiền. Bia Đức
tuyệt ngon. Ở Berlin, mại dâm cũng được luật cho phép. Thiên đường thế
còn gì =))

Nếu nhận lương chừng 65k/năm, thì bạn còn lại nhiêu? Tiền thuế độc thân
đâu khoảng 38 - 40%. Mỗi tháng bạn tiêu cơ bản đâu 300e (mỗi ngày 10e),
nếu bạn chịu khó nấu ăn uống. Đắt nhất tiền nhà, tùy bạn muốn ở bao nhiêu,
mình phải trả 760e mỗi tháng chưa kể điện nước internet. Nhưng nói chung,
con số dư ra chả nhiêu, không thể giàu như mấy ku ở Việt Nam được.

Ở 21 tháng bạn thi bằng B1 tiếng Đức (giống ielts 6), thì được quyền định
cư vĩnh viễn (nhưng bạn không được liên tục rời khỏi Đức quá 6 tháng).
Nếu lười, bạn cứ việc chờ 3 năm, quyền đó tự động có cho bạn.
Sau 8 năm, bạn có quyền đổi màu quốc tịch (ôi, chắc mình không ham, nhỉ)
Nhưng chưa vội xa vời; chỉ cần có quyền làm việc với Bluecard bạn đã có thể
đi khắp châu Âu không bị xách mé rồi. Nhưng nếu bạn ăn thịt heo, thịt chó,
thì nhớ nói nhỏ tí, vì niềm tin của người khác sẽ khác bạn nhiều lắm lắm.

Gần đây Úc mới mở ra visa 482 thay cho visa 587 xưa kia dường như chỉ
ưu tiên cho du học sinh. Với 482 bạn có thể xin việc dễ dàng hơn
ở Úc, chỉ với trình độ ietls tối thiểu 5.5. Mình ghét Úc là vậy, tao đây
qua châu Âu sống khỏe re, việc gì phải bỏ tiền ra thi cái bằng chỉ có
giá trị hai năm để chỉ chứng minh ta có thể nói tiếng Anh ở Úc?

Còn nhiều thứ lắm; nhưng lời khuyên là trước khi bước chân qua đây,
nên nghĩ đến các vấn đề chiến lược lâu dài. Berlin và châu Âu dân số già đi.
Người trẻ nuôi người già, nên hàng năm, mức chi trả cho bảo hiểm xã hội
giảm dần, hiện nay là 48% và sẽ còn giảm tiếp. Dù luật có cơ chế để hạn chế
`rủi ro` này, bạn cũng nên tính tới. Con gái nhỏ ở đây học ở trường công
tiếng Đức, được duy nhất nước Đức nói thôi:) Từ 1/8, con nít được miễn
vé tàu điện, ngoài khoản trợ cấp 200e mỗi tháng.

Người Sài gòn ít nhất là dân kỹ thuật giỏi, có thể đi khắp thế giới nhỉ.
Chứ bọn tây, ít người qua Việt Nam làm Devops đó. Deal lương hơi khó.
Có một số bạn chia sẻ trên kênh https://t.me/g7expat, có khi giúp ích
cho bạn khỏi thiệt, không phải để bạn đứng núi này trông núi nọ. Chỗ mình,
có các kỹ sư 50 60 tuổi vẫn lập trình PHP hay Java. Quan trọng là hạnh phúc,
không phải tiền lương bạn nhé.

### `random-notes-1`

tags: #notes #random #retrospective #puppet #salt #ansible

Bữa có mẹo dùng `nmap`, giờ mình ghi lại kết quả để so sánh. Kịch bản cũ dò
hơn 450 host, mỗi máy dò 33 cổng, thời gian mất từ 1h đến 2h mới xong.
Kịch bản `nmap` mất dưới 1 phút, tìm ra khoảng 730 target cho Prometheus.

Trong ghi chú trước về sao lưu `postgresql`, cách dùng disk snapshot
vẫn ổn chưa gặp sai sót gì; việc sao lưu vào lúc khoảng 5h chiều (gmt+2).
Có thể giải thích là do database hoạt động ít quá, mỗi ngày tăng
trung bình 1gb - 5gb theo mình nhớ. Còn team vẫn loay hoay đủ cách để
chạy `pg_basebackup`; dùng `stolon` lại thêm `k8s` thiệt khổ đời.

Cách hai của việc sao lưu `postgresql`, là dùng `rsync`. Cách này yêu cầu
phải tắt dịch vụ `postgresql` như đề cập trong tài liệu của chính thức,
với các ghi chú về hạn chế, điều kiện và biến thể. Tuy nhiên, nếu từng
triển khai `barman`, sẽ thấy `barman` dùng `rsync` thôi, không cần tắt
dịch vụ gì trước đó. Như thế tốt quá. Nhưng phải đọc mã nguồn của `barman`
(viết bằng Python) mới hiểu được cặn kỹ. Ai rảnh không?

Hôm qua mình chạy `dry-run` cho một thay đổi nhờ `salt` xong, rồi chạy
thiệt. Hệ thống `production` tạch luôn, báo động ầm ầm: Lúc thử thì bình
thường, lúc `apply` thiệt thì có thêm thay đổi do một bạn khác, làm việc
khác, broadcast các thay đổi về `nfs`. Bị cho lên trụ điện nhưng may mình
có log làm bằng chứng, nên leo xuống được ngay. Hú hồn. Chuyện gì cũng
có thể xảy ra, anh em cứ thi nhau đẩy hàng vào `master`, test một chỗ apply
chỗ khác, im im làm không thông báo ai, thì có ngày bắn vào chân mình thôi.

`puppet`, `salt`, `ansible`... bạn chọn cái nào? Ví dụ vừa rồi giúp bạn
hiểu, hãy chọn cách mà bạn có thể làm đúng đắn nhất. Một số tình huống
có tính chiến lược thì mình không bàn tới. Trong hệ thống của mình có
hơn 450 host, một nửa quản lý bằng `salt`, nửa còn lại bằng `puppet`:)
Nên để cho tiện, mình bí mật dùng `ansible` trị cả hai :))

### `postgresql-file-system-level-backup`

tags: #database #pgsql #backup #snapshot #googlecloud

Hệ thống mình phục vụ khá nhiều khách hàng; mỗi triển khai (deployment)
gồm nhiều loại database khác nhau, chạy trên `k8s`. Các kịch bản sao lưu
chạy tốt cho tất cả triển khai, ngoại trừ một khách hàng A có dữ liệu khá
lớn và tăng liên tục, trên `postgresql`. Do một quyết định thiết kế cũ
mà triển khai dựa trên Stolon (https://github.com/sorintlab/stolon),
nhưng hỡi ôi, nhiều thứ Stolon còn chưa sẵn sàng, ví dụ không hỗ trợ
`rsync` https://github.com/sorintlab/stolon/issues/389.

Trong hệ thống của A, khi kịch bản sao lưu chạy thì ứng dụng ngất ngư.
Về bản chất, kịch bản sao lưu dùng `pg_basebackup`, dựa trên streaming
protocol của `pgsql`; không có nhiều tùy chọn khi dùng công cụ đó,
kể cả việc nén khi gửi dữ liệu giữa các máy. Các kiểu sao lưu khác,
xem thêm tại https://www.postgresql.org/docs/9.1/backup-file.html:

1. Dump dump dumb...

2. Dùng `rsync` để gửi bin/WAL log ra chỗ khác (đây là một trong hai
   cách mà công cụ như `barman` hỗ trợ)

3. Dùng `file-system` backup (sao lưu nguyên cục `/var/lib/psql/data/`)

Dùng `pgsql` trong k8s nghe phát mệt; quá tuyệt vọng với sự phức tạp của
các phương án khác, mình đã thử phương án đơn giản nhất, là lấy `snapshot`
của đĩa `slave` trong Stolon cluster. Trong lòng đầy nghi hoặc, bởi đảm bảo
cho snapshot này tốt, dữ liệu có thể phục hồi được nghe nó xa vời quá.
Xưa giờ, chưa bao giờ mình tin vào việc lấy snapshot của đĩa chạy database;
thế nên, mình đã thiết kế kịch bản rất kỹ như sau:

1. Xác định chính xác pod `slave` trong Stolon cluster. (Tóm tắt cho bạn
  chưa biết, Stolon nó bật một node `master`, vài node `slave`, và
  nó có cơ chế hoán đổi tự động;)

2. Lấy đúng đĩa ứng với `pvc (persistent volume claim)` đang dùng bởi pod đó.

3. Tạo snapshot từ đĩa trên, tạo một đĩa mới cùng kích thước,

4. Sau đó, kết nối đĩa mới tạo ra vào một máy tạm thời trên GCE,
   dùng một docker image được chỉnh riêng để kiểm tra đĩa này.
   Docker container được tạo ra gồm một tiến trình cho để chạy
   `postgres`, một tiến trình khác theo dõi log sinh ra từ `postgres`.

5. Sau khi xác định điểm lỗi hay điểm dừng, toàn bộ đĩa và máy tạm thời
   được xóa đi, và gửi thông báo tới các kênh theo dõi.

Kết quả rất bất ngờ như sau:

1. Việc tạo snapshot rất nhanh. Nếu tạo mới hoàn toàn (base), mất khoảng
   10 phút. Các snapshot sau đó còn nhanh hơn nữa, do nó chỉ phải gồm
   các thay đổi so với bản snapshot trước đó. Tất cả các snapshot đều
   được `nén`, nên kích thước nhỏ đáng kinh ngạc (mặc dù cũng xem xem
   kết quả nén khi dùng `pg_basebackup`)

2. Khi chạy `postgres` kiểm tra, do dữ liệu gốc ở pod `slave`, nên xuất hiện
   tập tin `recover.conf` trong thư mục `/var/lib/pgsql/data/`, cần phải
   xóa đi. Sau đó, `postgres` tự phục hồi lại dựa theo thông tin binary
   cuối cùng đang có, có thể bỏ qua WAL log cuối cùng. (Thực ra, bộ snapshot
   hầu như không có thêm WAL log nào ghi kèm, do mình chưa bật.)

3. Việc chạy phục hồi (restore) thử chưa gặp trường hợp nào lỗi;
   và cũng khá nhanh, mất khoảng dưới 20 phút, trong đó, thời gian chủ
   yếu ở chỗ tạo snapshot mới, và tạo đĩa mới từ snapshot đang có.

So với việc tốn hơn 6 tiếng đồng hồ khi dùng `pg_basebackup`, thì việc
dùng snapshot của google cloud quá đơn giản, ổn định, nhanh nữa, và
muốn `PITR` thì chỉ việc tạo snapshot thường xuyên hơn.

Tất nhiên, điều mình trông đợi nhất, là phương án này bị lỗi, bị sai
một lúc nào đó. Bởi khi đó mới có chuyện để viết tiếp à.

### `hdfs-metadata-backup`

tags: #hadoop #metadata #backup

Hệ thống `tập tin` của `Hadoop`, gồm hai phần cơ bản là `datanode`
và `namenode`. Như con trỏ trong lập trình C, `namenode` là về địa chỉ (metadata),
còn `datanode` là về nội dung con trỏ lưu trữ.

Hệ thống có hai `namenode` chẳng hạn, thì chỉ có một `active` thôi,
còn lại ở chế độ chờ `standby`; chuyện gì xảy ra nếu cả hai cùng sập?
Không địa chỉ đồng nghĩa với lạc đường, bạn chỉ còn nước format và nạp lại
hệ thống `hdfs` hoàn toàn mới.

Sao lưu sao lưu sao lưu. Các hướng dẫn trên mạng đầy ra, bạn cứ thử gõ
`hdfs metadata backup` rồi làm theo, đại ý:

```
$ hdfs dfsadmin -fetchImage backup_dir
```

Đọc theo làm theo, y chang vậy, thì rắc rối bắt đầu. Thật sự chỗ `backup_dir`,
phải thỏa mãn điều kiện tiên quyết: Đó là một thư mục đã tồn tại. Nghĩa
là, lệnh chính xác phải như sau

```
$ mkdir -pv backup_dir/
$ hdfs dfsadmin -fetchImage backup_dir/
```

Kết quả là các tập tin `fsimage_*` được tạo ra trong `backup_dir/`.
Nội dung giống như trong thư mục, ví dụ, `/home/hdfs/data/nn/current/*`,
tùy vào cấu hình của bạn, là nơi lưu trữ metadata của `hdfs` đang chạy.
Một số tài liệu chỉ nói đơn giản là bạn chép nguyên cục đó ra

```
$ tar cfvz my_nn_backup.tgz /home/hdfs/data/nn/current/
```

Tại sao có hai cách, kết quả khác nhau thế nào? Có vẻ như việc dùng lệnh
`hdfs dfsadmin` trông sang chảnh và hợp lý hơn. Đúng thế, cho tới khi
bạn phải phục hồi hệ thống thật sự. Trời đất, các tài liệu mình tìm được
đều nói tới việc chép lại các tập tin ảnh đó ra thôi. Thế nên mình thử

```
$# giả sử không có namenode nào đang chạy
$# giả lập nhờ systemctl stop hadoop-* trên tất cả các namenode
$# nn chính là viết tắt của namenode

$ rm -rf /home/hdfs/data/{nn,snn}/current/
$ mkdir -pv /home/hdfs/data/{nn,snn}/current/
$ cp /backup/fsimage_* /home/hdfs/data/nn/current/
$ systemctl start hadoop-namdenode

$# tạch toàn tập, không lên nổi. Viagra bó tay.
```

Tới đây bạn sẽ gần như tuyệt vọng. Hệ thống báo là `namenode` chưa
được format. Nếu chọn format mới `hdfs namenode -format` đồng nghĩa
với việc xóa sạch cài lại cluster mới (FIXME), đó không phải là phục hồi
từ bộ sao lưu.

Nào google tìm, thật may bạn thấy bài viết này, bởi vì có thể tất
cả các bài trước đây đều thiếu hai điều rất quan trọng như sau:

1. Bạn phải backup `/home/hdfs/data/nn/current/VERSION`

2. Bạn phải tạo checksum cho từng tập tin `fsimage_*`

Hai việc này không hề có khi dùng `hdfs dfsadmin -fetchImage ...`

```
$ cd /home/hdfs/data/nn/current/
$ cp /backup/fsimage_* ./
$ cp /backup/VERSION   ./
$ for _file in fsimage_*; do md5sum $_file > $_file.md5; done
```

Rốt cuộc, mình chả hiểu lệnh với `-fetchImage` để làm gì nữa luôn:
nó tạo ra ảo tưởng rằng mọi thứ đã sẵn sàng cho trường hợp tệ nhất,
nhưng thực ra, cách đơn giản phải làm chính là cách thứ hai
`tar cfvz my_nn_backup.tgz /home/hdfs/data/nn/current/`.

Tập tin `VERSION` là gì, tại sao nó quan trọng? Từ từ, việc cần làm
trước là thử phục hồi từ bộ backup bạn đang có. You will never know
if you don't go -- một câu trong bài hát phim hoạt hình Shrek.

Sau đó, đọc thêm:
https://hortonworks.com/blog/hdfs-metadata-directories-explained/

### `nmap-for-prometheus`

tags: #prometheus #nmap #network #scanning #lua

Mình có vài trăm hosts cần quét nhanh để  lấy danh sách `target` cho
Prometheus. Script hiện có chạy tuần tự, dùng `curl` để kiểm tra, ví dụ
http://foo:9100/metrics, có trả về mã 200 hay không; toàn bộ script chạy
gần 2h mới xong.

Dùng nmap chắc chắn nhanh hơn:

```
$ _ports="9100,9168,9200,9400,"
$ nmap \
  >/dev/null \
  -iL "hosts" \
  -p "$_ports" \
  -oN "_discovery.tmp" \
  --script +"http-headers.nse" \
  --script-args \
    "http-headers.path='/metrics', http-headers.useget='true'"
```

trong đó, `hosts` là file liệt kê tất cả các hosts cần quét,
và `_ports` lưu danh sách tất cả các port (dư ra dấu phảy ở cuối không
quan trọng lắm; khi bạn tạo danh sách các port bằng `bash` thì dễ dư ra
như vậy đó.)

Chỗ `+http-headers.nse` có dấu cộng đằng trước. Cái này mình mất chút
thời gian để hiểu tại sao. Kịch bản `http-headers` đi kèm với bộ cài
đặt của `nmap`, không phải lo lắng tải ở chỗ khác. Kết quả dò lưu vào
tập tin `_discovery.tmp` như sau

```
$ Nmap 7.70 scan initiated ...
Nmap scan report for k8s-001.lauxanh.net (10.0.0.2)
Host is up (0.0069s latency).
Not shown: 31 closed ports
PORT     STATE SERVICE
9100/tcp open  jetdirect
| http-headers:
|   Content-Length: 143114
|   Content-Type: text/plain; version=0.0.4
|   Date: Tue, 30 Apr 2019 14:44:54 GMT
|   Connection: close
|
|_  (Request type: GET)

```

Việc còn lại là làm sao đọc ra danh sách cách target từ  `_discovery.tmp`?
Việc này không hề đơn giản, chưa kể kết quả của `nmap` chỉ cho biết
cổng mở mà không biết thực sự `exporter` có trả về 200 hay không.
Làm sao đây? Điều chỉnh trực tiếp kịch bản `http-headers.nse`
(/usr/share/nmap/scripts/http-headers.nse), ví dụ
  https://gist.github.com/icy/191de6e6a30e7ac8f8068d288264d51a/revisions#diff-8a0ced239ddcc2ee44a526a3e5fd8163
sau đó chạy

```
$ sudo nmap --script-updatedb
$ nmap ...
$ grep service/200 _discovery.tmp
|_  service/200: k8s-001.lauxanh.net:9100/metrics
|_  service/200: k8s-002.lauxanh.net:9100/metrics
$# ...
```

Tuyệt vời ông mặt trời. Điều đáng buồn là mình viết vầy cho bạn xài,
còn mình vì một lý do thiên địa trời đánh, không xài được những gì
viết trên đây cho hệ thống thật sự. Khi nào uống cà phê kể sau ha.

Cuối cùng, `curl` đọc là `si du a eo` (`see-url`) nhe các bạn. Nếu bạn
biết tác giả của `curl` nói điều này ở đâu thì cho mình xin cái link.
Cảm ơn bạn nhiều.

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
`Apache Solr` là `Debian linux` còn `Elasticsearch` là `Ubuntu`,
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
Như vậy dù bạn viết bằng `Python`, `Golang` hay gì thì vẫn xài được
thư viện cuối là `Lucene`:

```
Ứng dụng Ruby -- [Người thông dịch Solr] --> [Lucene/Java]
```

Đại khái `Apache Solr` như anh chàng `Debian Linux` với nhân `Linux`.
Ngạo nghễ, oai phong cho tới khi trai đẹp `Elasticsearch` xuất hiện
thì gái làng cả xóm nhao nhao. `Elasticsearch` giới thiệu giao diện
`tìm kiếm` (`Search`), `Kibana`, `Logstash`, giống như là anh ta có sẵn nhà,
sẵn xe hơi, sẵn mọi thứ đều cho đám cưới; cô nào chả mê nhỉ.
Chính nhờ sự tiện lợi này mà nhiều người tiếp cận với `Elasticsearch`
nhanh chóng, hiệu quả.

Và thế là nhiều người quên luôn `Apache Solr`:) `Elasticsearch`
gần như đồng nghĩa với `ELK`, nhưng từ sâu thẳm thì `Solr` và `Elasticsearch`
cũng không khác lắm nhau đâu nhỉ ^.^ Không có `Lucene` thì lấy đâu ra
cả hai chứ.

Điều thú vị là `Elastic` mua lại [`Kibana`](https://github.com/rashidkpc/kibana2)
và [`Logstash`](https://www.elastic.co/blog/welcome-jordan-logstash) để phát triển nên bộ `ELK`.

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
$ mount /dev/new_device /mnt/new_disk_B/

$ rsync -avx                \
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
$# echo "server 1.2.3.4"    >  /etc/tsocks.conf
$# echo "server_port 20000" >> /etc/tsocks.conf
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
