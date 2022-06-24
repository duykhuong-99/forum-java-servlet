-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2022 at 01:45 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forum`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `userName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `userPassword` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fullName` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `joinDate` date NOT NULL,
  `isAdmin` int(1) NOT NULL DEFAULT 1 COMMENT '0: admin | 1: user',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '1- normal | 2- mute | 3-banned'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`userName`, `userPassword`, `fullName`, `email`, `joinDate`, `isAdmin`, `status`) VALUES
('admin', '123456', 'My name is Admin', 'admin@gmail.com', '2022-06-10', 0, 1),
('user', '123456', 'My name is User', 'user@gmail.com', '2022-06-10', 1, 1),
('user muted', '123456', 'muted', 'usermute@gmail.com', '2022-06-10', 1, 2),
('userblocked', '123456', 'blocked', 'userblocked@gmail.com', '2022-06-10', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cateId` int(11) NOT NULL,
  `cateName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cateId`, `cateName`, `note`) VALUES
(1, 'Tin tức', NULL),
(2, 'Thảo luận', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `commentId` bigint(20) NOT NULL,
  `post` bigint(20) NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cmtDate` date DEFAULT NULL,
  `likes` int(11) NOT NULL,
  `userComment` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`commentId`, `post`, `content`, `cmtDate`, `likes`, `userComment`) VALUES
(1, 1, 'Bài viết hay', '2022-06-10', 1, 'user'),
(2, 2, 'Đã xem', '2022-06-11', 1, 'user'),
(3, 3, 'Bài viết hay', '2022-06-12', 1, 'user'),
(4, 4, 'Đã xem', '2022-06-13', 1, 'user'),
(5, 5, 'Thông tin hữu ích', '2022-06-14', 1, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `postId` bigint(20) NOT NULL,
  `category` int(11) NOT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `createDate` date NOT NULL,
  `likes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`postId`, `category`, `author`, `title`, `content`, `createDate`, `likes`) VALUES
(1, 1, 'admin', 'TP.HCM có mưa đá trong cơn mưa trắng trời, ngập nước khắp nơi', 'Lý giải về nguyên nhân gây mưa vào chiều nay, ông Lê Đình Quyết - phó trưởng phòng dự báo Đài khí tượng thủy văn khu vực Nam Bộ - cho biết do gió mùa Tây Nam hoạt động mạnh lên.\r\nVề hiện tượng mưa đá, ông Quyết phân tích do có những nhiễu động quy mô nhỏ trong gió Tây Nam tạo nên hội tụ ẩm hình thành mây đối lưu. Ngoài ra, những ngày qua mưa nhiều, độ ẩm cao và buổi sáng thì trời nắng, nền nhiệt bề mặt đất bị đốt nóng làm cho khí quyển có xáo trộn mạnh.\r\nTừ đó mây bị đưa rất cao, càng lên cao nhiệt độ càng giảm, nên những hạt mây ngưng kết thành hạt đá, tạo ra mưa đá.\r\nCũng theo ông Quyết, chỉ trong 30 phút lượng mưa đo được tại trạm Mạc Đĩnh Chi - quận 1 là 23,2mm, Thủ Đức 46,4mm, Lê Minh Xuân - Bình Chánh 31,6mm.\r\nỨng dụng UDI của Công ty TNHH MTV Thoát nước đô thị cũng cảnh báo nhiều điểm như đường Ung Văn Khiêm, quận Bình Thạnh, Quốc Hương, Tô Ngọc Vân, Lê Thị Hoa, TP Thủ Đức bắt đầu bị ngập.\r\nVề thời tiết trong những ngày tới, ông Quyết cho biết phổ biến mây thay đổi đến nhiều mây, ngày nắng gián đoạn. Thời tiết tiếp tục có mưa rào nhiều nơi và rải rác có dông, có nơi mưa vừa, mưa to. Đề phòng ngập úng khu vực trũng, thấp đô thị do mưa lớn.\r\nRiêng từ ngày 26 đến 28-6, mưa có khả năng giảm nhẹ, chiều và tối có mưa rào. Trong cơn dông cần đề phòng sét, gió giật mạnh và lốc xoáy', '2022-06-01', 11),
(2, 2, 'admin', 'Phát hiện bọc nilông có bé gái sơ sinh bị bỏ trước cổng trang trại', 'Trưa 22-6, ông Đỗ Văn Cấp - chủ tịch UBND huyện Tây Hòa - cho biết huyện đang thực hiện các thủ tục để chuyển bé gái sơ sinh bị bỏ trước một trang trại ở địa phương vào Trung tâm Nuôi dưỡng và chăm sóc người có công tỉnh Phú Yên để chăm sóc, nuôi dưỡng theo quy định.\r\nTheo báo cáo của UBND xã Hòa Phú, trưa 20-6, ông Nguyễn Văn Hoàng (51 tuổi, chủ trang trại ở thôn Lạc Mỹ (xã Hòa Phú) phát hiện trước cửa trang trại của mình có một bọc nilông màu đen. Ông Hoàng và vợ mở bọc nilông thì phát hiện một bé gái sơ sinh được bọc trong 2 chiếc áo. Bé gái được vợ chồng ông Hoàng đưa đến Trạm y tế xã Hòa Phú để chăm sóc. Hiện tình trạng sức khỏe của bé bình thường.\r\nÔng Trần Ngọc Trường - chủ tịch UBND xã Hòa Phú - cho biết đã thông báo trường hợp bé gái sơ sinh bị bỏ trước cửa trang trại của ông Hoàng trên đài truyền thanh xã, nhưng đến nay không có ai đến nhận là người thân, nên xã báo cáo để huyện lập thủ tục đưa bé về trung tâm có chức năng chăm sóc theo quy định.', '2022-06-02', 10),
(3, 1, 'admin', 'Liên Hiệp Quốc lần đầu tiên ra mắt ứng dụng đo chỉ số tia cực tím', 'Hôm 21-6, Liên Hiệp Quốc đã giới thiệu ứng dụng SunSmart Global UV App (tạm dịch: Ứng dụng thông minh theo dõi tia cực tím từ Mặt trời) do Hội đồng Ung thư bang Victoria (Úc) và Cơ quan Phòng chống bức xạ và an toàn hạt nhân Úc phát triển.\r\nĐây là ứng dụng duy nhất trên thế giới sử dụng dữ liệu thu thập từ các trạm đo tia cực tím và khí tượng ở mỗi nước nhằm cung cấp các chỉ số bức xạ của tia cực tím chính xác và cụ thể ở từng địa điểm xác định.\r\nỨng dụng SunSmart Global UV được cung cấp miễn phí trên các nền tảng Apple AppStore dành cho hệ điều hành iOS và Google PlayStore dành cho Android.\r\nTheo đó, ứng dụng cung cấp chỉ số bức xạ tia UV theo thang điểm từ 1 (mức thấp) đến 11 (mức cao) và mức cực cao vượt thang điểm 11. Giá trị chỉ số càng cao thì mức độ gây hại cho da và mắt càng lớn.\r\n\"Ứng dụng là sự kết hợp của các thông tin về thời tiết, môi trường và sức khỏe giúp bảo vệ người dân tránh khỏi ánh nắng mặt trời cả khi làm việc và giải trí\", giáo sư Petteri Tallas - tổng thư ký Tổ chức Khí tượng thế giới (WMO) - cho biết.\r\nTheo WMO, có những yếu tố khác nhau ảnh hưởng đến mức độ bức xạ tia cực tím, ví dụ lượng mây che phủ trên bầu trời, nồng độ ozone trong bầu khí quyển, độ cao của mặt trời hay mức độ phản xạ từ bề mặt đất khi tia cực tím chiếu xuống.\r\nDo đó, tất cả yếu tố này sẽ được tổng hợp trong ứng dụng để đưa ra các cảnh báo cho mọi người.\r\nTheo thống kê của Tổ chức Y tế thế giới, ước tính có hơn 1,5 triệu trường hợp ung thư da được chẩn đoán trên toàn cầu vào năm 2020.\r\n\"Đây là khoảng thời gian trong năm mà bức xạ tia cực tím đạt cực đại ở châu Âu và ở Bắc bán cầu\", người phát ngôn của WMO, bà Clare Nullis, cảnh báo.\r\nỨng dụng SunSmart Global UV App được đồng bảo trợ bởi Tổ chức Y tế thế giới (WHO), Tổ chức Lao động quốc tế (ILO), Tổ chức Khí tượng thế giới (WMO) và Chương trình Môi trường Liên Hiệp Quốc (UNEP).', '2022-06-03', 10),
(4, 2, 'user', 'iOS 16 cho phép người dùng bỏ qua CAPTCHA', 'Apple đang giới thiệu một hệ thống mới cho iPhone và máy Mac sẽ giúp người dùng vượt qua thử thách nhập CAPTCHA mà nhiều trang web dựa vào để đảm bảo khách truy cập là người chứ không phải bot.\r\nÝ tưởng ở đây là nếu người dùng đang cố gắng đăng nhập trên một trang web thông qua thiết bị như iPhone, iPad hoặc Mac, có nghĩa họ đã trải qua một giao thức bảo mật nghiêm ngặt hơn như Face ID hoặc Touch ID. Ngoài ra, Apple ID đã được đăng nhập trên thiết bị cho phép Safari truy cập trang web được đề cập.\r\nMục tiêu kỹ thuật đằng sau Private Access Tokens là để máy chủ tránh CAPTCHA mà không cho phép máy chủ theo dõi danh tính khách hàng. Toàn bộ hệ thống mã thông báo để vượt qua quy trình xác minh CAPTCHA dựa vào lớp xác thực HTTP mới và RSA để tăng cường bảo mật. Đối với những người phụ thuộc vào trình duyệt Chrome thay vì Safari, Private Access Tokens nhằm mục đích thực hiện những gì Chrome Trust Tokens đang cố gắng đạt được.\r\nMột khía cạnh quan trọng khác ở đây là hệ thống sẽ gửi mã thông báo xác thực khi một ứng dụng đang chạy ở nền trước. Trong toàn bộ quá trình, Apple ID đã đăng nhập trên một thiết bị không được chia sẻ bởi bất kỳ bên liên quan nào.\r\nĐược biết, CAPTCHA là mã thông báo mật mã hoạt động cho các trình duyệt cũng như API được trình duyệt và ứng dụng yêu cầu. Vì vậy, cách làm mới sẽ giúp người dùng thuận tiện hơn trong việc nhập các mã xác minh, đặc biệt là những người bị khuyết tật.', '2022-06-04', 10),
(5, 1, 'user', 'Vấn đề cấp bách để văn hóa không bị \"xâm lăng\"', 'Xu hướng hội nhập và mở cửa, giao lưu văn hóa xuyên quốc gia làm cho các sản phẩm văn hóa giải trí tiếp cận nhanh và đa dạng về nội dung. Song cũng đặt ra những thách thức lớn trong việc tiếp nhận các sản phẩm văn hóa giải trí, nhất là những trào lưu văn hóa “lệch chuẩn” ảnh hưởng không nhỏ tới giới trẻ.\r\nĐó chính là xu hướng xem nhẹ các giá trị truyền thống của một bộ phận giới trẻ Việt Nam. Bên cạnh những thanh niên, sinh viên luôn có ý thức phấn đấu xây dựng và bảo vệ quê hương, đất nước, bảo vệ những giá trị truyền thống của dân tộc cũng có một bộ phận thanh niên đã hấp thụ lối sống phương Tây một cách thái quá. Họ quay lưng lại với âm nhạc dân tộc, với sân khấu truyền thống, với điện ảnh trong nước hay trang phục dân tộc. Một thực tế không thể phủ nhận, nhiều giá trị văn hóa truyền thống bị coi thường, thậm chí bị chế giễu, thuần phong mỹ tục đứng trước nguy cơ bị chà đạp, đạo đức có nguy cơ băng hoại, tệ nạn xã hội gia tăng.\r\nTrong lĩnh vực giải trí, giới trẻ đang bị cuốn hút và mải mê chạy theo những trào lưu du nhập từ nước ngoài, thậm chí vấn đề đã lên đến mức báo động. Sức trẻ cộng với tâm lý thích khám phá những điều mới lạ, bắt kịp các trào lưu đang thịnh hành trên thế giới, như: manga (truyện tranh Nhật Bản), anime (phim hoạt hình Nhật Bản), thời trang Kawaii (Nhật Bản), thời trang Hàn Quốc... Nhiều bạn trẻ không ngại ngần chạy theo cả những trào lưu độc dị khiến chúng ta không khỏi giật mình, như hát cùng dao kéo, chụp ảnh quái đản, “hot boy” giả gái, nuôi thú độc...', '2022-06-05', 11),
(6, 2, 'user', 'Lừa đảo trực tuyến nhắm vào các hệ thống thanh toán', 'Theo số liệu mới nhất từ hãng bảo mật Kaspersky, có đến 26,36% các nỗ lực lừa đảo tại Việt Nam vào tháng 4 vừa qua liên quan đến lĩnh vực tài chính, nhắm vào ngân hàng, các hệ thống thanh toán và cửa hàng trực tuyến.\r\nTrong đó, lừa đảo thông qua các hệ thống thanh toán là trường hợp phổ biến nhất được Kaspersky phát hiện, chiếm 11,77% tổng số lừa đảo và hơn 44% trong số các loại lừa đảo tài chính.\r\nSự gia tăng các giao dịch trực tuyến tại Việt Nam trong thời kỳ đại dịch đã tạo điều kiện cho các trang mạo danh những hệ thống thanh toán phổ biến như Visa, Mastercard, PayPal… phát triển.\r\nKhi ngày càng có nhiều người dùng mua sắm trực tuyến, những nỗ lực lừa đảo nhắm vào các cửa hàng trực tuyến cũng ngày một tăng theo, chiếm khoảng 30% trong số những trường hợp lừa đảo tài chính\r\nĐáng chú ý, lừa đảo tài chính được ghi nhận là một hình thức lừa đảo phổ biến tại Đông Nam Á, chiếm tỷ lệ hơn 40% ở hầu hết các quốc gia trong khu vực này. Philippines là quốc gia có tỷ lệ tấn công tài chính cao nhất với 64,03%, tiếp theo là Thái Lan với 56,35%.\r\nTrong khi đó, với 26,36%, Việt Nam có tỷ lệ bị tấn công tài chính thấp nhất so với các nước trong khu vực và thấp hơn nhiều so với tỷ lệ trung bình của Đông Nam Á (43,06%). Tỷ lệ ấn tượng này có thể là nhờ nỗ lực của Việt Nam trong việc nâng cao nhận thức về an ninh tài chính và dữ liệu trong bối cảnh gia tăng của ngân hàng di động và ví điện tử trong khu vực.', '2022-06-06', 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`userName`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cateId`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`commentId`),
  ADD KEY `userComment` (`userComment`),
  ADD KEY `post` (`post`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`postId`),
  ADD KEY `author` (`author`),
  ADD KEY `category` (`category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cateId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `commentId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `postId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userComment`) REFERENCES `account` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`post`) REFERENCES `post` (`postId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`author`) REFERENCES `account` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`category`) REFERENCES `category` (`cateId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
