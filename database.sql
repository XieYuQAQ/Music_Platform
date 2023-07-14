/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306_1
 Source Server Type    : MySQL
 Source Server Version : 80024 (8.0.24)
 Source Host           : localhost:3306
 Source Schema         : testssm

 Target Server Type    : MySQL
 Target Server Version : 80024 (8.0.24)
 File Encoding         : 65001

 Date: 30/04/2023 22:28:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for album
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album`  (
  `alid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '专辑id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '专辑名称',
  `created` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '专辑发行时间',
  `aid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '专辑艺术家',
  `rc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '专辑唱片公司',
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '专辑描述',
  `lid` int UNSIGNED NOT NULL COMMENT '专辑标签',
  PRIMARY KEY (`alid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of album
-- ----------------------------
INSERT INTO `album` VALUES (1, '我不曾忘记 (游戏《原神》2023新春会同人曲)', '2023年', '1,19,25', 'StreetVoice 街聲', '这首歌给远去旅行的你那些金色的故事我们不会忘记', 1);
INSERT INTO `album` VALUES (13, '约定', '2019年3月26日', '2', 'Akie秋绘', '是Akie秋绘最为知名的曲目之一，众多绘星的入坑曲', 8);
INSERT INTO `album` VALUES (14, 'ストロボメモリー - EP', '2021年', '26', 'PONY CANYON INC.', 'ストロボメモリー（SSSS.DYNAZENON 电光机王 ED）', 9);
INSERT INTO `album` VALUES (15, '観測 (2019)', '2019年', '27', 'KAMITSUBAKI RECORD', '1st Album「観測」為花譜第一個大型音樂專輯，也是花譜第三張專輯。總共推出3個版本，分別爲：観測α，観測β，観測γ。', 10);
INSERT INTO `album` VALUES (18, 'ストロボメモリー', '2021年', '26', 'PONY CANYON INC.', 'ストロボメモリー（SSSS.DYNAZENON 电光机王 ED）', 8);
INSERT INTO `album` VALUES (19, 'color capsule TV动画《来自多彩世界的明天》13话 插曲', '2019年11月13日', '28', 'NBCUniversal Entertainment', 'やなぎなぎ、カップリング曲を集めたアルバム「memorandum」発売! TVアニメ『色づく世界の明日から』挿入歌「color capsule」も収録。', 9);
INSERT INTO `album` VALUES (21, '天ノ弱 -うぃんぐPiano Ver.-', '2016年11月21日', '2', 'PONY CANYON INC.', '原唱：Gumi 作词：164 作曲：164 翻唱：秋绘 混音：Riraru 曲绘：A君 PV：栗远杉', 8);
INSERT INTO `album` VALUES (22, 'memorandum', '2019年11月13日', '28', 'NBCUniversal Entertainment', 'やなぎなぎ、カップリング曲を集めたアルバム「memorandum」発売! TVアニメ『色づく世界の明日から』挿入歌「color capsule」も収録。', 9);
INSERT INTO `album` VALUES (27, 'Crab Rave - Single', '2018年', '31', 'Monstercat', 'A huge shout out to Noisestorm whose artistry made this song and video possible - he produced it all! 🦀', 10);
INSERT INTO `album` VALUES (28, '少年歌行 风花雪月篇 OST', '2021年7月28日', '32', 'Sony Classical', '《少年歌行 风花雪月篇》改编自周木楠原作的同名轻小说，是网络动画《少年歌行》的第二季，由中影年年（北京）文化传媒有限公司出品制作，优酷&bilibili联合独播。 《少年歌行》系列是最受欢迎的国创动画作品之一。第二季的故事将更加扣人心弦，角色形象、画面质感的刻画也更加细腻。 第二季在音乐制作上也做了一次全新的尝试，HIFIVE（嗨翻屋）特别企划，由灵气音乐和AND Music 安得音乐创作制作，集结了阿云嘎、潘辰、万玲琳、余昭源、房东的猫、陈鸿宇、JandZ、双笙、卫一名9组实力唱将，为国创动画发声助力。 天南天北路悠悠，少年仗剑尽兴游。一曲笙歌陪伴，纵使江湖路远，也不觉孤单。少年歌行国风音乐企划，用少年雅韵唤醒新国风。', 9);
INSERT INTO `album` VALUES (29, 'あんたにあっかんべ - Single', '2023年3月21日', '33', '一二三', '雨雲ごとどっか行っちゃえ。', 8);
INSERT INTO `album` VALUES (30, 'さよなら - Single', '2022年5月', '34', 'SINSEKAI RECORD', '作詞・作曲・編曲: 水野あつ', 8);
INSERT INTO `album` VALUES (31, 'Dive to Blue - Single', '2016年', '35', 'Nippon Columbia Co., Ltd./NIPPONOPHONE', 'アイマリンプロジェクト 「Dive to Blue」ANIMATION MUSIC VIDEO  歌唱：アイマリン（CV：内田 彩） 作詞・作曲・編曲：玉屋2060% アニメーション監督：kubotabee プロデューサー：福井 章浩(SANYO)  「アイマリンプロジェクト」とは？ What is \"iMarine Project\"？  「アイマリンプロジェクト」はクリエイター達が海物語のメインキャラクターで­あるマ­リンちゃんの新しい可能性に挑み、 新キャラクター「アイマリンちゃん」およびオリジナル楽曲、ミュージックビデオをユー­ザーと共に創り­あげていくプロジェクトです。 「アイマリンプロジェクト」の「アイ（i）」には、infinity, icon, internet, imagination, innovation, ideal, i（私）といったたくさんの可能性を示す意味が込められています。', 9);
INSERT INTO `album` VALUES (32, '岁月成碑 - Single', '2015年8月', '36', 'StreetVoice 街聲', '世界属于三体！', 2);
INSERT INTO `album` VALUES (33, '蒼い蝶 - Single', '2019年2月', '37', 'No-Name Records', '歌声里包含了我很多思念。还请静静聆听。', 8);
INSERT INTO `album` VALUES (34, '花に亡霊 - Single', '2020年', '38', 'UNIVERSAL MUSIC LLC', '作词作曲、编曲： n-buna演唱：suis', 9);
INSERT INTO `album` VALUES (35, 'だから僕は音楽を辞めた', '2019年', '38', 'U&R records', '作詞作曲、編曲(Words and Music,Arranged)：n-buna Vocal：suis', 8);
INSERT INTO `album` VALUES (36, '夏草が邪魔をする', '2017年6月', '38', 'U&R records', '2017年组合成立，于4月21日发布歌曲《靴の花火》宣布出道，在同年6月28日正式发售首张迷你专《夏草が邪魔をする》。', 8);
INSERT INTO `album` VALUES (37, 'Marine Bloomin\' - Single', '2016年3月28日', '39,40', 'TOY\'S FACTORY', 'アイマリンプロジェクト 「Dive to Blue」ANIMATION MUSIC VIDEO  歌唱：アイマリン（CV：内田 彩） 作詞・作曲・編曲：玉屋2060% アニメーション監督：kubotabee プロデューサー：福井 章浩(SANYO)  「アイマリンプロジェクト」とは？ What is \"iMarine Project\"？  「アイマリンプロジェクト」はクリエイター達が海物語のメインキャラクターで­あるマ­リンちゃんの新しい可能性に挑み、 新キャラクター「アイマリンちゃん」およびオリジナル楽曲、ミュージックビデオをユー­ザーと共に創り­あげていくプロジェクトです。 「アイマリンプロジェクト」の「アイ（i）」には、infinity, icon, internet, imagination, innovation, ideal, i（私）といったたくさんの可能性を示す意味が込められています。', 8);
INSERT INTO `album` VALUES (38, '笨小孩', '2000年', '41,42,43', 'East Asia Music (Holdings) Limited', '《笨小孩》是刘德华作词，高枫作曲，江建民编曲的一首歌曲', 2);

-- ----------------------------
-- Table structure for artist
-- ----------------------------
DROP TABLE IF EXISTS `artist`;
CREATE TABLE `artist`  (
  `aid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '艺术家id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '艺术家名称',
  `dob` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '艺术家出生',
  `about` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '艺术家介绍',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of artist
-- ----------------------------
INSERT INTO `artist` VALUES (1, '花玲', '1月21日', '中日双语配音演员、歌手，擅长少女角色及儿童角色，代表作品有：《崩坏3》《崩坏学园2》德丽莎，《原神》可莉，《英雄联盟》佐伊，《战双帕弥什》卡列尼娜等。');
INSERT INTO `artist` VALUES (2, 'Akie秋绘', '1月26日', 'Akie秋绘是2016年至今活跃于bilibili和YouTube的知名唱见和虚拟主播，投稿以汉语、日语翻唱和原创音乐作品为主。');
INSERT INTO `artist` VALUES (19, '张安琪', '1983年12月', '张安琪是中国内地的女性配音演员。代表作有动画《秦时明月之诸子百家》公孙玲珑、《拳皇命运》麻宫雅典娜，游戏《英雄联盟》蔚、《王者荣耀》王昭君等。');
INSERT INTO `artist` VALUES (25, '沐霏', '1995年3月15日', '沐霏是中国内地的女性配音演员。国内新生代配音演员。V17声优少女一期成员。擅长塑造成熟女性，角色性格或温婉、或风情、或刚毅、或狠毒，总能抓住观众的耳朵。代表角色为《枪娘》里面的巴雷特，也是沐霏的第一个主要角色，是第一次在工作中笑中带泪，一度对自己的能力产生怀疑，又重拾信心继续坚持下去的角色。');
INSERT INTO `artist` VALUES (26, '内田真礼', '1989年12月27日', '內田真禮是日本的女性聲優，東京都出身，所属事务所为I\'m Enterprise。');
INSERT INTO `artist` VALUES (27, '花谱', '12月', '花谱是一名2018年10月开始以3D虚拟模型形象出道的虚拟歌手（バーチャルシンガー）。');
INSERT INTO `artist` VALUES (28, '柳凪', '1987年5月31日', '大阪出身。所属事务所为INCS toenter，所属唱片公司为NBCUniversal Entertainment Japan。2006年开始以音乐投稿网站「プレイヤーズ王国」为中心进行音乐活动，并与Annabel结成了音乐团体「binaria」。');
INSERT INTO `artist` VALUES (31, 'Noisestorm', '2017年12月17日', 'For songs that capture the connection between contemporary experience and shared journeys, exploring music in a vibrant and melodic way, Monstercat: Instinct opens a new path for listeners.  Monstercat is a new-age Record Label. It is the convergence of an independent label, tech startup and media company. We empower creative people, musicians, artists, developers, entrepreneurs, and influencers young and old. We looked at the problems within the music industry, asked “why not” and have created the “how to”.  For songs that capture the deeper connection between contemporary experience and shared journeys, Monstercat Instinct explores vibrant and melodic music rooted in house, pop, indie dance, and more.  If you would like to use Monstercat\'s music in your own videos or Twitch streams: https://license.monstercat.com');
INSERT INTO `artist` VALUES (32, '万玲琳', '8月1日', '2015年YAMAHA吉他女声全国十二强 ，2016年超级女声全国二十强  简介：万玲琳, 绰号万岁爺，90后音乐人，流行歌手, 代表作品：《睡不着》，《蜜蜂demo》等。');
INSERT INTO `artist` VALUES (33, 'hifumi', '未公开', '曲を作る人です。ボカロP。清楚ロック。');
INSERT INTO `artist` VALUES (34, '存流 -ᴀʀᴜ-', '6月', '神椿とは異なるもうひとつの世界「深脊界」に、突如現れた次世代型バーチャルシンガー「存流」。 ピアノのように繊細で、透明感のある歌声。 複雑な感情を音楽で言語化するために、ふわふわと日々思考している女の子。');
INSERT INTO `artist` VALUES (35, '内田彩', '未公开', '内田彩( @aya_uchida )の音楽情報をお知らせします！アニメ #転生貴族の異世界冒険録 OPテーマ「Preview」先行配信中👉https://ayauchida.lnk.to/Preview');
INSERT INTO `artist` VALUES (36, '不才', '未公开', '独立音乐人 、歌手，代表作《化身孤岛的鲸》、《寻常歌》、《夜航星》 2020年担任制作人发布第一张个人专辑《山止川行》');
INSERT INTO `artist` VALUES (37, '蒼月エリ', '未公开', '已经隐退的虚拟歌手。');
INSERT INTO `artist` VALUES (38, 'ヨルシカ', '未公开', 'ヨルシカのオフィシャル アカウントです。');
INSERT INTO `artist` VALUES (39, '八王子P', '未公开', '八王子P，也就是8#prince 是niconico动画里的最受关注的ボカロ 界的贵公子。');
INSERT INTO `artist` VALUES (40, '鹿乃ちゃん', '12月24日', '歌う人。音楽ユニット  @MKLNtic  でも活動中。');
INSERT INTO `artist` VALUES (41, '刘德华', '1961年9月27日', '刘德华 (Andy Lau)，1961年9月27日出生于中国香港新界大埔镇泰亨村，毕业于第十期无线艺员训练班，中国香港男演员、歌手、中国残疾人福利基金会副理事长、制片人、作词人。');
INSERT INTO `artist` VALUES (42, '吴宗宪', '1962年9月26日', '吴宗宪（Jacky Wu），1962年9月26日生于中国台湾省台南市，中国台湾综艺节目男主持人、流行乐歌手、演员、导演。');
INSERT INTO `artist` VALUES (43, '柯受良', '1953年2月22日', '柯受良（1953年2月22日－2003年12月9日），Blackie Ko，出生于浙江省宁波市象山县，中国台湾男演员、歌手、导演、武术指导、特技演员、动作指导。');

-- ----------------------------
-- Table structure for commend
-- ----------------------------
DROP TABLE IF EXISTS `commend`;
CREATE TABLE `commend`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `subtitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alid` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of commend
-- ----------------------------
INSERT INTO `commend` VALUES (1, '新增专辑', '游戏《原神》2023新春会同人曲', '我不曾忘记', 1);
INSERT INTO `commend` VALUES (3, '热门动画专辑', 'TV动画「SSSS.DYNAZENON」ED', 'ストロボメモリー | 内田真礼', 14);
INSERT INTO `commend` VALUES (4, '热门专辑推荐', '秋绘知名曲之一、众多绘星的入坑曲', '約束 | Akie秋绘', 13);

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label`  (
  `lid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名称',
  PRIMARY KEY (`lid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES (1, '游戏');
INSERT INTO `label` VALUES (2, '华语');
INSERT INTO `label` VALUES (8, '日语');
INSERT INTO `label` VALUES (9, '动画');
INSERT INTO `label` VALUES (10, '摇滚');

-- ----------------------------
-- Table structure for library
-- ----------------------------
DROP TABLE IF EXISTS `library`;
CREATE TABLE `library`  (
  `uid` int UNSIGNED NOT NULL,
  `alid` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of library
-- ----------------------------
INSERT INTO `library` VALUES (1, '');
INSERT INTO `library` VALUES (66, '27,15,18,29,1,32,38');
INSERT INTO `library` VALUES (67, '');
INSERT INTO `library` VALUES (68, '38');

-- ----------------------------
-- Table structure for music
-- ----------------------------
DROP TABLE IF EXISTS `music`;
CREATE TABLE `music`  (
  `mid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '歌曲id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '歌曲名称',
  `alid` int UNSIGNED NOT NULL COMMENT '专辑id',
  `min` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '时长',
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of music
-- ----------------------------
INSERT INTO `music` VALUES (1, '我不曾忘记', 1, '3:50');
INSERT INTO `music` VALUES (4, '約束（翻自 リリィ、さよなら。）', 13, '4:52');
INSERT INTO `music` VALUES (5, 'ストロボメモリー', 18, '4:43');
INSERT INTO `music` VALUES (6, 'カナリア', 18, '4:35');
INSERT INTO `music` VALUES (7, 'youthful beautiful -y0c1e Remix', 18, '5:18');
INSERT INTO `music` VALUES (8, 'ストロボメモリー -Instrumental', 18, '4:43');
INSERT INTO `music` VALUES (9, 'カナリア -Instrumental', 18, '4:33');
INSERT INTO `music` VALUES (10, 'ストロボメモリー', 14, '4:43');
INSERT INTO `music` VALUES (11, 'ストロボメモリー -Instrumental', 14, '4:43');
INSERT INTO `music` VALUES (12, ' 確信 -Instrumental-', 15, '3:11');
INSERT INTO `music` VALUES (13, '糸', 15, '3:42');
INSERT INTO `music` VALUES (14, '忘れてしまえ', 15, '3:56');
INSERT INTO `music` VALUES (15, ' 心臓と絡繰', 15, '4:13');
INSERT INTO `music` VALUES (16, 'quiz', 15, '4:09');
INSERT INTO `music` VALUES (17, 'Re_HEROINES', 15, '3:28');
INSERT INTO `music` VALUES (18, ' 夜行バスにて', 15, '4:10');
INSERT INTO `music` VALUES (19, '未確認少女進行形', 15, '3:51');
INSERT INTO `music` VALUES (20, ' 過去を喰らう', 15, '4:02');
INSERT INTO `music` VALUES (21, 'エリカ', 15, '3:33');
INSERT INTO `music` VALUES (22, '雛鳥', 15, '4:22');
INSERT INTO `music` VALUES (23, ' 夜が降り止む前に', 15, '3:33');
INSERT INTO `music` VALUES (24, '不可解', 15, '4:40');
INSERT INTO `music` VALUES (25, 'そして花になる', 15, '4:24');
INSERT INTO `music` VALUES (26, 'The end of prologue -Instrumental-', 15, '2:29');
INSERT INTO `music` VALUES (27, 'color capsule', 19, '3:32');
INSERT INTO `music` VALUES (28, '天ノ弱 -うぃんぐPiano Ver.-', 21, '3:32');
INSERT INTO `music` VALUES (29, 'キミミクリ', 22, '3:52');
INSERT INTO `music` VALUES (32, 'Crab Rave', 27, '2:41');
INSERT INTO `music` VALUES (33, '雪月 《少年歌行 风花雪月篇》动画角色曲', 28, '4:54');
INSERT INTO `music` VALUES (34, 'インテンション・プロペラント', 22, '3:30');
INSERT INTO `music` VALUES (35, 'color capsule', 22, '3:32');
INSERT INTO `music` VALUES (36, 'あんたにあっかんべ', 29, '3:36');
INSERT INTO `music` VALUES (37, 'さよなら', 30, '2:37');
INSERT INTO `music` VALUES (38, 'Dive to Blue', 31, '4:41');
INSERT INTO `music` VALUES (39, '岁月成碑', 32, '4:07');
INSERT INTO `music` VALUES (40, '蒼い蝶', 33, '3:35');
INSERT INTO `music` VALUES (41, '花に亡霊', 34, '4:00');
INSERT INTO `music` VALUES (42, '藍二乗', 35, '4:09');
INSERT INTO `music` VALUES (43, 'パレード', 35, '5:01');
INSERT INTO `music` VALUES (44, 'だから僕は音楽を辞めた', 35, '4:03');
INSERT INTO `music` VALUES (45, '言って。', 36, '4:03');
INSERT INTO `music` VALUES (46, '靴の花火', 36, '5:06');
INSERT INTO `music` VALUES (47, '雲と幽霊', 36, '5:18');
INSERT INTO `music` VALUES (52, 'Marine Bloomin\'', 37, '3:36');
INSERT INTO `music` VALUES (53, '笨小孩', 38, '4:01');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `uid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户邮箱',
  `screenName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `group` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户组',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin@admin.cn', '管理员', 'admin');
INSERT INTO `users` VALUES (66, 'XieYuQAQ', '93c93c8ecd117d78b7abb901095e8bb5328ce1ec', 'xieyu@zerokami.cn', '王聪', 'admin');
INSERT INTO `users` VALUES (67, 'test', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'test@test.cn', 'test', 'visitor');
INSERT INTO `users` VALUES (68, 'testUser', 'ca48ba1c0f493aee2b10f0c5301b36d6e3c0e9db', 'test@edu.cn', '测试用户', 'visitor');

SET FOREIGN_KEY_CHECKS = 1;
