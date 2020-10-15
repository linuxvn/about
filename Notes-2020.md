## 2020

Lượm lặt những công cụ và tin tức đáng chú ý từ `Hacker News` hay từ
công việc hàng ngày. Nếu bạn thấy có gì hay hãy gửi `PR` nhé.
Nội dung sẽ được tự động đăng trên kênh https://t.me/linuxvn_notes.

Các bài viết của năm trước: [2019](Notes-2019.md)

### TOC

* [October-update](#october-update)
* [Senior-Junior engineer vs Junior-Senior Engineer](#senior-junior-vs-junior-senior-engineer)
* [Adminless](#adminless)
* [Hello 2020](#hello-2020)

### `october-update`

tags: #jobless #misc

Lâu quá rồi chả viết gì. Nên sau đây là vài thông báo nho nhỏ:

1. Mirror của ArchLinuxVn (Arch, ArchArm, TheSexLinux, Viettug.org)
  đã sập mấy tháng nay rồi. Nhà mạng Vịt teo xài nat mấy chục lớp,
  nên cổng 80 đóng cái sầm. Thôi, ta chia tay nhau từ đây.

2. Nhóm `linuxvn` đông quá rồi, hơn 7 ngàn nick (ấy là sau khi nhân lên
  với 100/10). Mong các bạn trao đổi sôi nổi, các chuyện tình cảm nhắng
  nhít thì chắc không phải để trao đổi trên đó rồi. Con bot thích
  thì nó chết, khi nào có điện nó sống lại.

3. https://t.me/dailyops: Kênh nhỏ đăng các mẹo linh tinh,
  được cập nhật mỗi ngày, hoặc buồn thì mỗi tháng hoặc mỗi năm.
  Nếu không bận làm tình thì bạn có thể vào xem nhé.
  Để đăng tin lên đó bạn chỉ cần gửi nhắn cho bạn nào đó trên linuxvn.

Hết, viết gì nữa? Hỏng lẽ nói xấu Helm, hay codebuild tiếp?
Cái bọn điên ấy, xấu quá rồi, xấu còn hơn xxx muôn năm của chúng ta.

Thôi dẹp, xin chào. Chắc là bài cuối cùng của năm 2020 đây nhé.
Cảm ơn bạn đã theo dõi.

### `senior-junior-vs-junior-senior-engineer`

tags: #misc

Một bạn hỏi junior thì làm gì, rồi senior làm gì. Mình có dịp đi phỏng vấn
rải rác vài chỗ nên tóm tắt lại đây cho các bạn coi, hy vọng có ích.
Bạn nào có thực lực sẵn rồi, lương tháng khoảng 3k mỹ kim trở lên
thì không cần đọc tiếp :))

Trước hết, senior/junior là cái tựa công ty đặt ra, còn nói chung không
có tiêu chuẩn cụ thể. Mỗi người kha khá một số món, công ty cần một số món,
nếu khớp nhau nhiều thì bạn trở thành senior của công ty thôi.

Có thể hiểu, sự khác nhau cơ bản giữa senior/junior là ở cách bạn
quyết định vấn đề và lựa chọn giải pháp kỹ thuật.
Nó liên quan nhiều hơn tới câu trả lời của bạn.

Ví dụ: Bạn có biết nhiều về devops không? Một bạn tầm tầm thì trả lời,
có có, biết jenkins, biết github, biết gitlab, bla bla. Một bạn khác
trả lời: Xưa giờ tôi chỉ làm mỗi cái jenkins, tôi viết plugin
cho nó, sau rồi thì tôi chán quá phải xài github, thấy cuộc đời khỏe hẳn.

Hay: Bạn có biết gì về Docker không? Dạ có, tôi xài docker chạy app, thiết
kế tối ưu dung lượng xài Alpine, giờ tôi xài k8s. Tôi không xài Docker Swarm
hàng dỏm lắm. Một bạn khác trả lời: Tôi có xài Docker. Nhưng docker nhiều
vấn đề quá, ví dụ nó làm hỏng cái iptables của tôi. Nói còn yêu cầu cả root,
nên tôi thử chạy Docker ở user thường mấy ngày rồi không được. Tôi vẫn xài
Docker Swarm, nó có nhiều cái rất khó chịu, nhưng lại đơn giản cho đội
phát triển, họ làm gì cũng nhanh gọn. Lâu lâu có bug thì fix cũng lẹ.

Có đi phỏng vấn ở đâu thì câu trả lời của bạn cũng quan trọng. Và có những
thứ bạn không bao giờ bịa ra được nếu bạn không hiểu gì về nó. Muốn trở
thành senior, hãy có câu trả lời senior. Muốn có câu trả lời senior,
hãy dành thời gian đào sâu nghiên cứu cái gì đó.

### `Adminless`

tags: #linuxvn

Thế là giai đoạn độ quá từ Linux lên MacOS đã sắp xong. Từ 1/4/2020,
tất cả bà con ở `linuxvn` đều bình đẳng như nhau, ai cũng được phần,
hỏi theo nhu cầu, trả lời theo năng lực, chát theo tinh thần MacOS
(là gì tính sau!)

Tất nhiên, cũng có một số bạn bình đẳng hơn một số bạn khác. Cụ thể
là bạn Đức vẫn phải còn giữ quyền Admin đề phòng thế lực thù địch
chống phá kênh linuxvn. Nick của mình sẽ để chơi vậy thôi, hỏng xài
thường xuyên; hy vọng mình sẽ tham gia được với nick khác sớm.

Chúc một ngày vui vẻ.

### `Hello-2020`

tags: #misc #k8s

Có vài bản nháp trong `git stash`, không được xuất bản trên kênh tin,
do mình lười không hoàn thiện. Bài này viết nhanh tóm vài ý chính.

Một bạn hỏi bắt đầu học với `k8s` thế nào. Câu trả lời: Nếu có kiến thức
cơ bản về Linux thì thử coi dự án `kubernetes the hard way` để tự cài lại
các thành phần của một `k8s` cluster. Sau đó, bỏ qua `helm` mà tìm các
ví dụ về `kustomization` để học: Bạn cần hiểu cách nói chuyện với `k8s`
cluster chứ không phải nhờ công cụ nào khác làm hộ.

Một bạn khác hỏi học devops thế nào? Câu trả lời: Mình chịu. Tốt nhất
là xin vào chỗ công ty nào đó có người họ hướng dẫn cho. Đừng quên mua
đọc vài cuốn sách xịn: nhớ là mua sách, bản hard-copy hay pdf gì nhé.
Khi nào bạn bỏ tiền ra đầu tư thì bạn mới thu được kết quả tốt nhất;
nói cách khác, đừng đầu tư bằng tiền của người khác.

Một bạn nhắn hỏi sao em gửi CV mấy chục cái rồi không ai gọi em đi phỏng
vấn, hay gọi rồi em rớt. Lúc mình xin việc thì mình cũng phải nộp nhiều
chỗ lắm, rớt nhiều, thậm chí gửi xe xong rồi vẫn phải dắt xe ra gửi lại.
Muốn viết CV tốt thì mình chỉ có một câu ngắn gọn: Mỗi công ty viết một
CV riêng cho công ty đó. Đừng viết điều bạn nghĩ: hãy viết điều công ty cần.

Một bạn nghe đâu bị nợ lương. Chỉ có cách duy nhất để đòi như hướng dẫn sau

https://icy.theslinux.org/m/kyanh.net/2018/01/07/luat-2-kien-cong-ty-no-luong/index.html

Nếu cần hỗ trợ gì thì liên hệ mình nhé. Đừng làm gì khác dại dột mà
mất sạch tiền đấy. Mình sẽ tư vấn miễn phí cho bạn các vấn đề liên quan
tới luật; đơn giản, mình không phải là luật sư.

Chương trình Bluecard của Đức không yêu cầu bạn phải có bằng đại học:
Có công ty ở đây nhận là bạn có thể xách vali tìm đường kíu nước được rồi.
Bạn nhanh chân kẻo vài năm nữa sẽ không nhiều cơ hội, mặc dù nghe đâu,
có khi qua Nga Pháp gì đó sẽ tốt hơn chứ không phải Đức.

Cuối cùng, nick telegram của mình trên `linuxvn` sẽ ít được dùng nữa,
bạn có thể tag/mention khi nào cần: `@Respect_DoNotMakePersonalAttacks`.
Khi nào có ai ăn hiếp bạn thì bạn cứ báo mình tiếng, mình giải quyết
ngay cho. Giờ mình phải lên núi luyện công đây. Hây hây.

PS: Bản nháp của hello-2020 có nói về cả pháo hoa; nhưng do sơ suất mà
nhiều hình ảnh sống động mỗi chỗ một cái, nên thôi bạn ráng chờ qua năm.
Đằng nào thì 2020 cũng không phải năm mở đầu thập kỷ  mới mà.
