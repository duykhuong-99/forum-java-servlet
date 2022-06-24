/*
db name : forum
 */
CREATE TABLE account (
  userName VARCHAR(100) PRIMARY KEY,
  userPassword VARCHAR(50) NOT NULL,
  fullName VARCHAR(200) NOT NULL,
  email VARCHAR(100) NOT NULL,
  joinDate DATE NOT NULL,
  isAdmin INT DEFAULT 1, --0: admin | 1: user
  status INT DEFAULT 1 -- 1- normal | 2- mute | 3-banned
);
CREATE TABLE category (
  cateId INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  cateName VARCHAR(255) NOT NULL,
  note VARCHAR(255) DEFAULT NULL
);
CREATE TABLE post (
  postId BIGINT PRIMARY KEY  GENERATED ALWAYS AS  IDENTITY,
  category INT NOT NULL,
  author VARCHAR(100) NOT NULL,
  title VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  createDate DATE NOT NULL,
  likes INT DEFAULT 0,

  FOREIGN KEY (author) REFERENCES account (userName) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (category) REFERENCES category (cateId));
CREATE TABLE comment (
  commentId BIGINT PRIMARY KEY  GENERATED ALWAYS AS  IDENTITY,
  post BIGINT NOT NULL,
  content VARCHAR(255) NOT NULL,
  cmtDate date DEFAULT NULL,
  likes INT NOT NULL,
  userComment VARCHAR(100) NOT NULL,

  FOREIGN KEY (post) REFERENCES post (postId) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (userComment) REFERENCES account(userName));
INSERT INTO account (userName, userPassword, fullName, email, joinDate, isAdmin, status) VALUES
('admin', '123456', 'My name is Admin', 'admin@gmail.com', '2022-06-10', 0, 1),
('user', '123456', 'My name is User', 'user@gmail.com', '2022-06-10', 1, 1),
('user1', '123456', 'muted', 'usermute@gmail.com', '2022-06-10', 1, 2),
('user2', '123456', 'blocked', 'userblocked@gmail.com', '2022-06-10', 1, 3);
INSERT INTO category (cateName, note) VALUES
('Tin tức', NULL),
('Thảo luận', NULL);
INSERT INTO post (category, author, title, content, createDate, likes) VALUES
(1, 'admin', 'TP.HCM có mưa đá trong cơn mưa trắng trời, ngập nước khắp nơi', 
'Lý giải về nguyên nhân gây mưa vào chiều nay, ông Lê Đình Quyết - phó trưởng phòng dự báo Đài khí tượng thủy văn khu vực Nam Bộ - cho biết do gió mùa Tây Nam hoạt động mạnh lên.
Về hiện tượng mưa đá, ông Quyết phân tích do có những nhiễu động quy mô nhỏ trong gió Tây Nam tạo nên hội tụ ẩm hình thành mây đối lưu. Ngoài ra, những ngày qua mưa nhiều, độ ẩm cao và buổi sáng thì trời nắng, nền nhiệt bề mặt đất bị đốt nóng làm cho khí quyển có xáo trộn mạnh.
Từ đó mây bị đưa rất cao, càng lên cao nhiệt độ càng giảm, nên những hạt mây ngưng kết thành hạt đá, tạo ra mưa đá.
Cũng theo ông Quyết, chỉ trong 30 phút lượng mưa đo được tại trạm Mạc Đĩnh Chi - quận 1 là 23,2mm, Thủ Đức 46,4mm, Lê Minh Xuân - Bình Chánh 31,6mm.
Ứng dụng UDI của Công ty TNHH MTV Thoát nước đô thị cũng cảnh báo nhiều điểm như đường Ung Văn Khiêm, quận Bình Thạnh, Quốc Hương, Tô Ngọc Vân, Lê Thị Hoa, TP Thủ Đức bắt đầu bị ngập.
Về thời tiết trong những ngày tới, ông Quyết cho biết phổ biến mây thay đổi đến nhiều mây, ngày nắng gián đoạn. Thời tiết tiếp tục có mưa rào nhiều nơi và rải rác có dông, có nơi mưa vừa, mưa to. Đề phòng ngập úng khu vực trũng, thấp đô thị do mưa lớn.
Riêng từ ngày 26 đến 28-6, mưa có khả năng giảm nhẹ, chiều và tối có mưa rào. Trong cơn dông cần đề phòng sét, gió giật mạnh và lốc xoáy.',
 CURRENT_TIMESTAMP, 11),
(2, 'admin', 'Phát hiện bọc nilông có bé gái sơ sinh bị bỏ trước cổng trang trại', 
'Trưa 22-6, ông Đỗ Văn Cấp - chủ tịch UBND huyện Tây Hòa - cho biết huyện đang thực hiện các thủ tục để chuyển bé gái sơ sinh bị bỏ trước một trang trại ở địa phương vào Trung tâm Nuôi dưỡng và chăm sóc người có công tỉnh Phú Yên để chăm sóc, nuôi dưỡng theo quy định.
Theo báo cáo của UBND xã Hòa Phú, trưa 20-6, ông Nguyễn Văn Hoàng (51 tuổi, chủ trang trại ở thôn Lạc Mỹ (xã Hòa Phú) phát hiện trước cửa trang trại của mình có một bọc nilông màu đen. Ông Hoàng và vợ mở bọc nilông thì phát hiện một bé gái sơ sinh được bọc trong 2 chiếc áo. Bé gái được vợ chồng ông Hoàng đưa đến Trạm y tế xã Hòa Phú để chăm sóc. Hiện tình trạng sức khỏe của bé bình thường.
Ông Trần Ngọc Trường - chủ tịch UBND xã Hòa Phú - cho biết đã thông báo trường hợp bé gái sơ sinh bị bỏ trước cửa trang trại của ông Hoàng trên đài truyền thanh xã, nhưng đến nay không có ai đến nhận là người thân, nên xã báo cáo để huyện lập thủ tục đưa bé về trung tâm có chức năng chăm sóc theo quy định.', 
CURRENT_TIMESTAMP, 10),
(1, 'admin', 'Liên Hiệp Quốc lần đầu tiên ra mắt ứng dụng đo chỉ số tia cực tím', 
'Hôm 21-6, Liên Hiệp Quốc đã giới thiệu ứng dụng SunSmart Global UV App (tạm dịch: Ứng dụng thông minh theo dõi tia cực tím từ Mặt trời) do Hội đồng Ung thư bang Victoria (Úc) và Cơ quan Phòng chống bức xạ và an toàn hạt nhân Úc phát triển.
Đây là ứng dụng duy nhất trên thế giới sử dụng dữ liệu thu thập từ các trạm đo tia cực tím và khí tượng ở mỗi nước nhằm cung cấp các chỉ số bức xạ của tia cực tím chính xác và cụ thể ở từng địa điểm xác định.
Ứng dụng SunSmart Global UV được cung cấp miễn phí trên các nền tảng Apple AppStore dành cho hệ điều hành iOS và Google PlayStore dành cho Android.
Theo đó, ứng dụng cung cấp chỉ số bức xạ tia UV theo thang điểm từ 1 (mức thấp) đến 11 (mức cao) và mức cực cao vượt thang điểm 11. Giá trị chỉ số càng cao thì mức độ gây hại cho da và mắt càng lớn.
"Ứng dụng là sự kết hợp của các thông tin về thời tiết, môi trường và sức khỏe giúp bảo vệ người dân tránh khỏi ánh nắng mặt trời cả khi làm việc và giải trí", giáo sư Petteri Tallas - tổng thư ký Tổ chức Khí tượng thế giới (WMO) - cho biết.
Theo WMO, có những yếu tố khác nhau ảnh hưởng đến mức độ bức xạ tia cực tím, ví dụ lượng mây che phủ trên bầu trời, nồng độ ozone trong bầu khí quyển, độ cao của mặt trời hay mức độ phản xạ từ bề mặt đất khi tia cực tím chiếu xuống.
Do đó, tất cả yếu tố này sẽ được tổng hợp trong ứng dụng để đưa ra các cảnh báo cho mọi người.
Theo thống kê của Tổ chức Y tế thế giới, ước tính có hơn 1,5 triệu trường hợp ung thư da được chẩn đoán trên toàn cầu vào năm 2020.
"Đây là khoảng thời gian trong năm mà bức xạ tia cực tím đạt cực đại ở châu Âu và ở Bắc bán cầu", người phát ngôn của WMO, bà Clare Nullis, cảnh báo.
Ứng dụng SunSmart Global UV App được đồng bảo trợ bởi Tổ chức Y tế thế giới (WHO), Tổ chức Lao động quốc tế (ILO), Tổ chức Khí tượng thế giới (WMO) và Chương trình Môi trường Liên Hiệp Quốc (UNEP).',
 CURRENT_TIMESTAMP, 10),
(2, 'user', 'iOS 16 cho phép người dùng bỏ qua CAPTCHA', 
'Apple đang giới thiệu một hệ thống mới cho iPhone và máy Mac sẽ giúp người dùng vượt qua thử thách nhập CAPTCHA mà nhiều trang web dựa vào để đảm bảo khách truy cập là người chứ không phải bot.
Ý tưởng ở đây là nếu người dùng đang cố gắng đăng nhập trên một trang web thông qua thiết bị như iPhone, iPad hoặc Mac, có nghĩa họ đã trải qua một giao thức bảo mật nghiêm ngặt hơn như Face ID hoặc Touch ID. Ngoài ra, Apple ID đã được đăng nhập trên thiết bị cho phép Safari truy cập trang web được đề cập.
Mục tiêu kỹ thuật đằng sau Private Access Tokens là để máy chủ tránh CAPTCHA mà không cho phép máy chủ theo dõi danh tính khách hàng. Toàn bộ hệ thống mã thông báo để vượt qua quy trình xác minh CAPTCHA dựa vào lớp xác thực HTTP mới và RSA để tăng cường bảo mật. Đối với những người phụ thuộc vào trình duyệt Chrome thay vì Safari, Private Access Tokens nhằm mục đích thực hiện những gì Chrome Trust Tokens đang cố gắng đạt được.
Một khía cạnh quan trọng khác ở đây là hệ thống sẽ gửi mã thông báo xác thực khi một ứng dụng đang chạy ở nền trước. Trong toàn bộ quá trình, Apple ID đã đăng nhập trên một thiết bị không được chia sẻ bởi bất kỳ bên liên quan nào.
Được biết, CAPTCHA là mã thông báo mật mã hoạt động cho các trình duyệt cũng như API được trình duyệt và ứng dụng yêu cầu. Vì vậy, cách làm mới sẽ giúp người dùng thuận tiện hơn trong việc nhập các mã xác minh, đặc biệt là những người bị khuyết tật.', CURRENT_TIMESTAMP, 10),
(1, 'user', 'Vấn đề cấp bách để văn hóa không bị "xâm lăng"', 
'Xu hướng hội nhập và mở cửa, giao lưu văn hóa xuyên quốc gia làm cho các sản phẩm văn hóa giải trí tiếp cận nhanh và đa dạng về nội dung. Song cũng đặt ra những thách thức lớn trong việc tiếp nhận các sản phẩm văn hóa giải trí, nhất là những trào lưu văn hóa “lệch chuẩn” ảnh hưởng không nhỏ tới giới trẻ.
Đó chính là xu hướng xem nhẹ các giá trị truyền thống của một bộ phận giới trẻ Việt Nam. Bên cạnh những thanh niên, sinh viên luôn có ý thức phấn đấu xây dựng và bảo vệ quê hương, đất nước, bảo vệ những giá trị truyền thống của dân tộc cũng có một bộ phận thanh niên đã hấp thụ lối sống phương Tây một cách thái quá. Họ quay lưng lại với âm nhạc dân tộc, với sân khấu truyền thống, với điện ảnh trong nước hay trang phục dân tộc. Một thực tế không thể phủ nhận, nhiều giá trị văn hóa truyền thống bị coi thường, thậm chí bị chế giễu, thuần phong mỹ tục đứng trước nguy cơ bị chà đạp, đạo đức có nguy cơ băng hoại, tệ nạn xã hội gia tăng.
Trong lĩnh vực giải trí, giới trẻ đang bị cuốn hút và mải mê chạy theo những trào lưu du nhập từ nước ngoài, thậm chí vấn đề đã lên đến mức báo động. Sức trẻ cộng với tâm lý thích khám phá những điều mới lạ, bắt kịp các trào lưu đang thịnh hành trên thế giới, như: manga (truyện tranh Nhật Bản), anime (phim hoạt hình Nhật Bản), thời trang Kawaii (Nhật Bản), thời trang Hàn Quốc... Nhiều bạn trẻ không ngại ngần chạy theo cả những trào lưu độc dị khiến chúng ta không khỏi giật mình, như hát cùng dao kéo, chụp ảnh quái đản, “hot boy” giả gái, nuôi thú độc...', CURRENT_TIMESTAMP, 11),
(2, 'user', 'Lừa đảo trực tuyến nhắm vào các hệ thống thanh toán', 
'Theo số liệu mới nhất từ hãng bảo mật Kaspersky, có đến 26,36% các nỗ lực lừa đảo tại Việt Nam vào tháng 4 vừa qua liên quan đến lĩnh vực tài chính, nhắm vào ngân hàng, các hệ thống thanh toán và cửa hàng trực tuyến.
Trong đó, lừa đảo thông qua các hệ thống thanh toán là trường hợp phổ biến nhất được Kaspersky phát hiện, chiếm 11,77% tổng số lừa đảo và hơn 44% trong số các loại lừa đảo tài chính.
Sự gia tăng các giao dịch trực tuyến tại Việt Nam trong thời kỳ đại dịch đã tạo điều kiện cho các trang mạo danh những hệ thống thanh toán phổ biến như Visa, Mastercard, PayPal… phát triển.
Khi ngày càng có nhiều người dùng mua sắm trực tuyến, những nỗ lực lừa đảo nhắm vào các cửa hàng trực tuyến cũng ngày một tăng theo, chiếm khoảng 30% trong số những trường hợp lừa đảo tài chính
Đáng chú ý, lừa đảo tài chính được ghi nhận là một hình thức lừa đảo phổ biến tại Đông Nam Á, chiếm tỷ lệ hơn 40% ở hầu hết các quốc gia trong khu vực này. Philippines là quốc gia có tỷ lệ tấn công tài chính cao nhất với 64,03%, tiếp theo là Thái Lan với 56,35%.
Trong khi đó, với 26,36%, Việt Nam có tỷ lệ bị tấn công tài chính thấp nhất so với các nước trong khu vực và thấp hơn nhiều so với tỷ lệ trung bình của Đông Nam Á (43,06%). Tỷ lệ ấn tượng này có thể là nhờ nỗ lực của Việt Nam trong việc nâng cao nhận thức về an ninh tài chính và dữ liệu trong bối cảnh gia tăng của ngân hàng di động và ví điện tử trong khu vực.', CURRENT_TIMESTAMP, 12);
INSERT INTO comment (post, content, cmtDate, likes, userComment) VALUES
(1, 'Bài viết hay', CURRENT_TIMESTAMP, 1, 'user'),
(1, 'Thông tin hữu ích', CURRENT_TIMESTAMP, 1, 'user'),
(2, 'Bài viết hay', CURRENT_TIMESTAMP, 1, 'user'),
(2, 'Thông tin hữu ích', CURRENT_TIMESTAMP, 1, 'user'),
(3, 'Bài viết hay', CURRENT_TIMESTAMP, 1, 'user'),
(3, 'Thông tin hữu ích', CURRENT_TIMESTAMP, 1, 'user'),
(4, 'Bài viết hay', CURRENT_TIMESTAMP, 1, 'user'),
(4, 'Thông tin hữu ích', CURRENT_TIMESTAMP, 1, 'user'),
(5, 'Bài viết hay', CURRENT_TIMESTAMP, 1, 'user'),
(5, 'Thông tin hữu ích', CURRENT_TIMESTAMP, 1, 'user'),
(5, 'Bài viết hay', CURRENT_TIMESTAMP, 1, 'user');