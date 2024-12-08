/*
Navicat MySQL Data Transfer

Source Server         : GTAVN
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : gtasa

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2023-05-29 23:13:18
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `eshopservice`
-- ----------------------------
DROP TABLE IF EXISTS `eshopservice`;
CREATE TABLE `eshopservice` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `x` float(10,2) DEFAULT NULL,
  `y` float(10,2) DEFAULT NULL,
  `z` float(10,2) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `idint` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `zone` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `ido` int(11) DEFAULT NULL,
  `hint` int(11) DEFAULT NULL,
  `hvw` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of eshopservice
-- ----------------------------
INSERT INTO `eshopservice` VALUES ('1', '2069.44', '-1779.76', '13.55', 'Long_DaiCa', '1', '500', 'Nha', 'Idlewood', '1', '8685', '0', '0');
INSERT INTO `eshopservice` VALUES ('2', '488.32', '-83.06', '998.75', 'NXP_Thinh', '4', '500', 'Nha', '', '1', '2393', '0', '0');
INSERT INTO `eshopservice` VALUES ('3', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('4', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('5', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('6', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('7', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('8', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('9', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('10', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('11', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('12', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('13', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('14', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('15', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('16', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('17', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('18', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('19', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('20', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('21', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('22', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('23', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('24', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('25', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('26', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('27', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('28', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('29', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('30', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('31', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('32', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('33', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('34', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('35', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('36', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('37', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('38', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('39', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('40', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('41', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('42', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('43', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('44', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('45', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('46', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('47', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('48', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('49', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('50', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('51', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('52', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('53', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('54', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('55', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('56', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('57', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('58', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('59', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('60', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('61', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('62', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('63', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('64', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('65', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('66', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('67', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('68', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('69', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('70', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('71', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('72', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('73', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('74', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('75', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('76', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('77', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('78', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('79', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('80', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('81', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('82', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('83', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('84', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('85', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('86', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('87', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('88', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('89', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('90', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('91', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('92', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('93', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('94', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('95', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('96', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('97', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('98', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('99', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('100', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('101', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('102', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('103', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('104', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('105', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('106', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('107', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('108', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('109', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('110', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('111', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('112', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('113', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('114', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('115', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('116', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('117', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('118', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('119', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('120', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('121', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('122', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('123', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('124', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('125', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('126', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('127', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('128', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('129', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('130', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('131', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('132', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('133', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('134', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('135', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('136', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('137', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('138', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('139', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('140', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('141', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('142', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('143', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('144', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('145', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('146', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('147', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('148', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('149', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('150', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('151', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('152', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('153', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('154', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('155', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('156', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('157', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('158', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('159', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('160', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('161', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('162', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('163', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('164', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('165', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('166', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('167', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('168', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('169', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('170', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('171', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('172', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('173', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('174', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('175', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('176', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('177', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('178', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('179', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('180', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('181', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('182', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('183', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('184', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('185', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('186', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('187', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('188', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('189', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('190', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('191', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('192', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('193', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('194', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('195', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('196', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('197', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('198', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('199', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
INSERT INTO `eshopservice` VALUES ('200', '0.00', '0.00', '0.00', 'Null', '0', '0', 'Null', 'Null', '0', '0', '0', '0');
