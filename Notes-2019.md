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
  * Phần 2: Về giấy phép Apache: TODO
* Công cụ linh tinh
  * [Rsync với Sparse](#rsync-with-sparse-file)
  * [jsonnet](#jsonnet)
  * [gitlabform](#gitlabform)
  * [tsocks](#tsocks)
  * [gawk](#gawk)
  * [Use Nmap to scan Prometheus targets](#nmap-for-prometheus)
* Dịch vụ có ích
  * [send.firefox.com](#sendfirefoxcom)
  * [Telegram](#telegram)
  * [Ecosia searching service](#wwwecosiaorg)
* Nghề nghiệp
  * [Luật Murphy](#murphy-s-law)
  * [Phỏng vấn Boss](#boss-interview)
  * [Berlin chào mừng bạn](#welcome-to-berlin)
  * [Berlin chào mừng bạn (2)](#welcome-to-berlin-2)
* Backup
  * [PostgreSQL file system level backup](#postgresql-file-system-level-backup)
  * [Hadoop Hdfs Metadata backup](#hdfs-metadata-backup)
* Linh tinh
  * [Welcome back, An Stk and Huy](#welcome-back-stk-and-huy)
  * [Linh tinh 1](#random-notes-1)
  * [Root is rut](#root-is-rut)
  * [Giới thiệu về trang này](#about)

### `welcome-to-berlin-2`

tags: #berlin #relocation #devops #random

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
  các công ty đấy. Bạn sẽ phải gửi email để hỏi (xem trên trang web
  https://vietnam.diplo.de/), còn trước đây mình canh mãi mới được,
  và lịch hẹn của mình có sau thời gian bắt đầu hợp đồng đến mấy tháng.
  Công ty có thể có visa agent hỗ trợ, nhưng bạn phải tự tìm hiểu hoàn
  chỉnh giấy tờ, thủ tục, đặt lịch hẹn,... nhé. Chủ động vẫn hơn, và quan
  trọng là thông báo đầy đủ tình trạng cho công ty để họ biết mà hỗ trợ
  hoặc ... chờ bạn onboard.

5. `Qua tới Đức`: Do bạn ở lâu hơn 2 tuần, bạn sẽ phải làm thủ tục đăng ký
  chỗ ở (Anmeldung).
  Việc này `dễ`, làm trong 10 phút là xong, nhưng oái ăm là bạn phải
  có một địa chỉ ổn định để bạn có thể nhận giấy tờ (ở Saigon
  chục năm số thư mình nhận chỉ đâu 10 cái, ít hơn số thư  nhận ở Berlin trong
  vài tuần đầu tiên) và làm các thủ tục tiếp theo
  (mở tài khoản ngân hàng, bảo hiểm, thuê nhà, ...) Bạn có thể ở
  tạm Airbnb và nhờ ai quen cho/thuê mượn địa chỉ đăng ký.

  Không phải chỗ ở Airbnb nào cũng cho bạn giấy Wohnungsgeberbestätigung,
  mà có cho thì cũng phập phù khi bạn chuyển đi nơi khác (nhưng hay cái
  là bạn có thể đăng ký dịch vụ bưu điện tự động chuyển thư của bạn qua
  địa chỉ mới; cái này còn xịn hơn routing bằng iptables nhé.)

  Thuê nhà ở Berlin khó hơn mua nhà ở quận 7 sài gòn, một phần vì quá đông
  người thuê, nhưng phần chủ yếu là bạn mới qua đây, chưa ai biết bạn là ai,
  thu nhập thế nào: Ở đây, một khi đã thuê nhà ở, chủ nhà rất khó có
  lý do để đuổi bạn đi: Nhiều chủ nhà hỏi bảng lương của bạn trong vòng
  mấy tháng cuối thì mới cho thuê nhà đấy (nên nhớ, chính công ty bạn
  sắp xin vào cũng không dám hỏi bảng lương của bạn nhé.)

  Nhưng có nhà rồi, coi nhưng khỏe re rè re luôn.
  Mình thuê nhà 65 mét vuông, hai phòng, hết khoảng 760e mỗi tháng.

Còn nhiều nữa, mình sẽ không tiếp tục viết bài mới mà sẽ chỉ cập nhật
trong bài này. Chúc bạn may mắn.

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

tags: #berlin #relocation #devops #random

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
# giả sử không có namenode nào đang chạy
# giả lập nhờ systemctl stop hadoop-* trên tất cả các namenode
# nn chính là viết tắt của namenode

$ rm -rf /home/hdfs/data/{nn,snn}/current/
$ mkdir -pv /home/hdfs/data/{nn,snn}/current/
$ cp /backup/fsimage_* /home/hdfs/data/nn/current/
$ systemctl start hadoop-namdenode

# tạch toàn tập, không lên nổi. Viagra bó tay.
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
# Nmap 7.70 scan initiated ...
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
# ...
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
