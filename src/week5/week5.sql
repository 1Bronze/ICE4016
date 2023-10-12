-- -----------------------------------------------------
-- Schema `inha`
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `inha` DEFAULT CHARACTER SET utf8 ;
USE `inha`;

-- -----------------------------------------------------
-- Table `inha`.`building`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inha`.`building` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`)
);


-- -----------------------------------------------------
-- Table `inha`.`major`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inha`.`major` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`)
);


-- -----------------------------------------------------
-- Table `inha`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inha`.`department` (
  `id` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(20) NOT NULL,
  `major_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`major_id`) REFERENCES `inha`.`major` (`id`)
);


-- -----------------------------------------------------
-- Table `inha`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inha`.`room` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `capacity` INT NOT NULL,
  `building_id` INT NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`building_id`) REFERENCES `inha`.`building` (`id`),
  FOREIGN KEY (`department_id`) REFERENCES `inha`.`department` (`id`)
);


-- -----------------------------------------------------
-- Table `inha`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inha`.`student` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`)
);


-- -----------------------------------------------------
-- Table `inha`.`class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inha`.`class` (
  `id` VARCHAR(20) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `professor` VARCHAR(20) NOT NULL,
  `number_of_participants` INT NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`department_id`) REFERENCES `inha`.`department` (`id`)
);


-- -----------------------------------------------------
-- Table `inha`.`club`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inha`.`club` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `room_id` INT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`room_id`) REFERENCES `inha`.`room` (`id`)
);


-- -----------------------------------------------------
-- Table `inha`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inha`.`employee` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `position` VARCHAR(45) NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`department_id`) REFERENCES `inha`.`department` (`id`)
);


-- -----------------------------------------------------
-- Table `inha`.`student_has_club`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inha`.`student_has_club` (
  `id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `club_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`student_id`) REFERENCES `inha`.`student` (`id`),
  FOREIGN KEY (`club_id`) REFERENCES `inha`.`club` (`id`)
);


-- -----------------------------------------------------
-- Table `inha`.`room_has_class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inha`.`room_has_class` (
  `id` INT NOT NULL,
  `room_id` INT NOT NULL,
  `class_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`room_id`) REFERENCES `inha`.`room` (`id`),
  FOREIGN KEY (`class_id`) REFERENCES `inha`.`class` (`id`)
);


-- -----------------------------------------------------
-- Table `inha`.`student_has_major`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inha`.`student_has_major` (
  `id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `major_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`student_id`) REFERENCES `inha`.`student` (`id`),
  FOREIGN KEY (`major_id`) REFERENCES `inha`.`major` (`id`)
);

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


INSERT INTO `inha`.`building` (`id`, `name`) VALUES ('1', '본관');
INSERT INTO `inha`.`building` (`id`, `name`) VALUES ('2', '2호관');
INSERT INTO `inha`.`building` (`id`, `name`) VALUES ('3', '60주년 기념관');
INSERT INTO `inha`.`building` (`id`, `name`) VALUES ('4', '4호관');
INSERT INTO `inha`.`building` (`id`, `name`) VALUES ('5', '5호관');
INSERT INTO `inha`.`building` (`id`, `name`) VALUES ('6', '6호관');
INSERT INTO `inha`.`building` (`id`, `name`) VALUES ('7', '학생회관');
INSERT INTO `inha`.`building` (`id`, `name`) VALUES ('8', '정석학술정보관');
INSERT INTO `inha`.`building` (`id`, `name`) VALUES ('9', '9호관');
INSERT INTO `inha`.`building` (`id`, `name`) VALUES ('10', '서호관');
INSERT INTO `inha`.`building` (`id`, `name`) VALUES ('11', '나빌레관');
INSERT INTO `inha`.`building` (`id`, `name`) VALUES ('12', '하이테크센터');

INSERT INTO `inha`.`major` (`id`, `name`) VALUES ('1', '기계공학과');
INSERT INTO `inha`.`major` (`id`, `name`) VALUES ('2', '항공우주공학과');
INSERT INTO `inha`.`major` (`id`, `name`) VALUES ('3', '조선해양공학과');
INSERT INTO `inha`.`major` (`id`, `name`) VALUES ('4', '산업경영공학과');
INSERT INTO `inha`.`major` (`id`, `name`) VALUES ('5', '화학공학과 ');
INSERT INTO `inha`.`major` (`id`, `name`) VALUES ('6', '생명공학과');
INSERT INTO `inha`.`major` (`id`, `name`) VALUES ('7', '고분자공학과');
INSERT INTO `inha`.`major` (`id`, `name`) VALUES ('8', '신소재공학과');
INSERT INTO `inha`.`major` (`id`, `name`) VALUES ('9', '사회인프라공학과');
INSERT INTO `inha`.`major` (`id`, `name`) VALUES ('10', '환경공학과');
INSERT INTO `inha`.`major` (`id`, `name`) VALUES ('11', '공간정보공학과');
INSERT INTO `inha`.`major` (`id`, `name`) VALUES ('12', '에너지자원공학과');
INSERT INTO `inha`.`major` (`id`, `name`) VALUES ('13', '전기공학과');
INSERT INTO `inha`.`major` (`id`, `name`) VALUES ('14', '전자공학과');
INSERT INTO `inha`.`major` (`id`, `name`) VALUES ('15', '정보통신공학과');

INSERT INTO `inha`.`department` (`id`, `email`, `phone_number`, `major_id`) VALUES ('1', 'mech@inha.ac.kr', '032-860-7300', '1');
INSERT INTO `inha`.`department` (`id`, `email`, `phone_number`, `major_id`) VALUES ('2', 'aerospace@inha.ac.kr', '032-720-9010', '2');
INSERT INTO `inha`.`department` (`id`, `email`, `phone_number`, `major_id`) VALUES ('3', 'naoe@inha.ac.kr', '032-860-7330', '3');
INSERT INTO `inha`.`department` (`id`, `email`, `phone_number`, `major_id`) VALUES ('4', 'ie@inha.ac.kr', '032-860-7360', '4');
INSERT INTO `inha`.`department` (`id`, `email`, `phone_number`, `major_id`) VALUES ('5', 'chemeng@inha.ac.kr', '032-860-7460', '5');
INSERT INTO `inha`.`department` (`id`, `email`, `phone_number`, `major_id`) VALUES ('6', 'bio@inha.ac.kr', '032-860-7295', '6');
INSERT INTO `inha`.`department` (`id`, `email`, `phone_number`, `major_id`) VALUES ('7', 'inhapoly@inha.ac.kr', '032-860-7480', '7');
INSERT INTO `inha`.`department` (`id`, `email`, `phone_number`, `major_id`) VALUES ('8', 'dmse@inha.ac.kr', '032-862-5546', '8');
INSERT INTO `inha`.`department` (`id`, `email`, `phone_number`, `major_id`) VALUES ('9', 'civil@inha.ac.kr', '032-860-7560', '9');
INSERT INTO `inha`.`department` (`id`, `email`, `phone_number`, `major_id`) VALUES ('10', 'environment@inha.ac.kr', '032-860-7500', '10');
INSERT INTO `inha`.`department` (`id`, `email`, `phone_number`, `major_id`) VALUES ('11', 'geoinfo@inha.ac.kr', '032-860-7600', '11');
INSERT INTO `inha`.`department` (`id`, `email`, `phone_number`, `major_id`) VALUES ('12', 'eneres@inha.ac.kr', '032-860-7550', '12');
INSERT INTO `inha`.`department` (`id`, `email`, `phone_number`, `major_id`) VALUES ('13', 'electrical@inha.ac.kr', '032-860-7390', '13');
INSERT INTO `inha`.`department` (`id`, `email`, `phone_number`, `major_id`) VALUES ('14', 'ee@inha.ac.kr', '032-860-7410', '14');
INSERT INTO `inha`.`department` (`id`, `email`, `phone_number`, `major_id`) VALUES ('15', 'ice@inha.ac.kr', '032-860-7431', '15');


INSERT INTO `inha`.`room` (`id`, `name`, `capacity`, `building_id`, `department_id`) VALUES ('1', '230', '50', '12', '15');
INSERT INTO `inha`.`room` (`id`, `name`, `capacity`, `building_id`, `department_id`) VALUES ('2', '232', '50', '12', '15');
INSERT INTO `inha`.`room` (`id`, `name`, `capacity`, `building_id`, `department_id`) VALUES ('3', '002', '40', '12', '15');
INSERT INTO `inha`.`room` (`id`, `name`, `capacity`, `building_id`, `department_id`) VALUES ('4', '424', '40', '12', '15');
INSERT INTO `inha`.`room` (`id`, `name`, `capacity`, `building_id`, `department_id`) VALUES ('5', '426', '40', '12', '15');


INSERT INTO `inha`.`student` (`id`, `name`, `email`, `phone_number`) VALUES ('12211762', '김한동', '12211762@inha.edu', '010-1111-1111');
INSERT INTO `inha`.`student` (`id`, `name`, `email`, `phone_number`) VALUES ('12211763', '박한동', '12211763@inha.edu', '010-2222-2222');
INSERT INTO `inha`.`student` (`id`, `name`, `email`, `phone_number`) VALUES ('12211764', '이한동', '12211764@inha.edu', '010-3333-3333');
INSERT INTO `inha`.`student` (`id`, `name`, `email`, `phone_number`) VALUES ('12211765', '서한동', '12211765@inha.edu', '010-4444-4444');
INSERT INTO `inha`.`student` (`id`, `name`, `email`, `phone_number`) VALUES ('12211766', '조한동', '12211766@inha.edu', '010-5555-5555');
INSERT INTO `inha`.`student` (`id`, `name`, `email`, `phone_number`) VALUES ('12211767', '정한동', '12211767@inha.edu', '010-6666-6666');
INSERT INTO `inha`.`student` (`id`, `name`, `email`, `phone_number`) VALUES ('12211768', '노한동', '12211768@inha.edu', '010-7777-7777');
INSERT INTO `inha`.`student` (`id`, `name`, `email`, `phone_number`) VALUES ('12211769', '유한동', '12211769@inha.edu', '010-8888-8888');
INSERT INTO `inha`.`student` (`id`, `name`, `email`, `phone_number`) VALUES ('12211770', '송한동', '12211770@inha.edu', '010-9999-9999');


INSERT INTO `inha`.`class` (`id`, `name`, `professor`, `number_of_participants`, `department_id`) VALUES ('ICE4016001', '데이터베이스설계', '최원익', '100', '15');
INSERT INTO `inha`.`class` (`id`, `name`, `professor`, `number_of_participants`, `department_id`) VALUES ('ICE3014001', '오퍼레이팅시스템', '김기창', '40', '15');
INSERT INTO `inha`.`class` (`id`, `name`, `professor`, `number_of_participants`, `department_id`) VALUES ('ICE4020001', '정보보호론', '이용우', '40', '15');
INSERT INTO `inha`.`class` (`id`, `name`, `professor`, `number_of_participants`, `department_id`) VALUES ('ICE4008001', '컴퓨터네트워크', '유상조', '60', '15');
INSERT INTO `inha`.`class` (`id`, `name`, `professor`, `number_of_participants`, `department_id`) VALUES ('ICE4130001', '컴퓨터비전', '박인규', '30', '15');


INSERT INTO `inha`.`club` (`id`, `name`, `room_id`) VALUES ('1', 'A클럽', '1');
INSERT INTO `inha`.`club` (`id`, `name`, `room_id`) VALUES ('2', 'B클럽', '2');
INSERT INTO `inha`.`club` (`id`, `name`, `room_id`) VALUES ('3', 'C클럽', '3');
INSERT INTO `inha`.`club` (`id`, `name`, `room_id`) VALUES ('4', 'D클럽', '4');
INSERT INTO `inha`.`club` (`id`, `name`, `room_id`) VALUES ('5', 'E클럽', '5');

INSERT INTO `inha`.`employee` (`id`, `name`, `position`, `department_id`) VALUES ('1', '김부장', '부장', '15');
INSERT INTO `inha`.`employee` (`id`, `name`, `position`, `department_id`) VALUES ('2', '홍과장', '과장', '15');
INSERT INTO `inha`.`employee` (`id`, `name`, `position`, `department_id`) VALUES ('3', '박팀장', '팀장', '15');
INSERT INTO `inha`.`employee` (`id`, `name`, `position`, `department_id`) VALUES ('4', '이연구원', '연구원', '15');
INSERT INTO `inha`.`employee` (`id`, `name`, `position`, `department_id`) VALUES ('5', '유연구원', '연구원', '15');


INSERT INTO `inha`.`student_has_club` (`id`, `student_id`, `club_id`) VALUES ('1', '12211763', '3');
INSERT INTO `inha`.`student_has_club` (`id`, `student_id`, `club_id`) VALUES ('2', '12211764', '3');
INSERT INTO `inha`.`student_has_club` (`id`, `student_id`, `club_id`) VALUES ('3', '12211765', '3');
INSERT INTO `inha`.`student_has_club` (`id`, `student_id`, `club_id`) VALUES ('4', '12211763', '4');
INSERT INTO `inha`.`student_has_club` (`id`, `student_id`, `club_id`) VALUES ('5', '12211769', '4');


INSERT INTO `inha`.`room_has_class` (`id`, `room_id`, `class_id`) VALUES ('1', '2', 'ICE4130001');
INSERT INTO `inha`.`room_has_class` (`id`, `room_id`, `class_id`) VALUES ('2', '2', 'ICE4008001');
INSERT INTO `inha`.`room_has_class` (`id`, `room_id`, `class_id`) VALUES ('3', '3', 'ICE4020001');
INSERT INTO `inha`.`room_has_class` (`id`, `room_id`, `class_id`) VALUES ('4', '4', 'ICE3014001');
INSERT INTO `inha`.`room_has_class` (`id`, `room_id`, `class_id`) VALUES ('5', '5', 'ICE4016001');


INSERT INTO `inha`.`student_has_major` (`id`, `student_id`, `major_id`) VALUES ('1', '12211765', '15');
INSERT INTO `inha`.`student_has_major` (`id`, `student_id`, `major_id`) VALUES ('2', '12211765', '10');
INSERT INTO `inha`.`student_has_major` (`id`, `student_id`, `major_id`) VALUES ('3', '12211766', '13');
INSERT INTO `inha`.`student_has_major` (`id`, `student_id`, `major_id`) VALUES ('4', '12211767', '14');
INSERT INTO `inha`.`student_has_major` (`id`, `student_id`, `major_id`) VALUES ('5', '12211768', '15');