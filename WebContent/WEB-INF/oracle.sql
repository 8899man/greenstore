
/* Drop Triggers */

DROP TRIGGER TRI_users_id;
DROP TRIGGER TRI_users_user_id;



/* Drop Tables */

DROP TABLE dingdan CASCADE CONSTRAINTS;
DROP TABLE users CASCADE CONSTRAINTS;
DROP TABLE wine CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_users_id;
DROP SEQUENCE SEQ_users_user_id;




/* Create Sequences */

CREATE SEQUENCE SEQ_users_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_users_user_id INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE dingdan
(
	-- 购物车表，订单号，根据时间生成
	dd_id number NOT NULL,
	user_id number NOT NULL,
	-- 购买样式
	wine_id number NOT NULL,
	-- 购买数量
	num number NOT NULL,
	PRIMARY KEY (dd_id)
);


CREATE TABLE users
(
	-- 用户id
	user_id number NOT NULL,
	-- 用户名
	user_name nvarchar2(20) NOT NULL,
	-- 密码
	password char(20) NOT NULL,
	-- 收货地址
	address nvarchar2(50) NOT NULL,
	phone number(11) NOT NULL,
	PRIMARY KEY (user_id)
);


CREATE TABLE wine
(
	wine_id number NOT NULL,
	-- 商品名
	wine_name nvarchar2(20) NOT NULL,
	-- 种类
	kind nvarchar2(20),
	price float(20) NOT NULL,
	-- 商品介绍
	detail nvarchar2(900),
	PRIMARY KEY (wine_id)
);



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_users_id BEFORE INSERT ON users
FOR EACH ROW
BEGIN
	SELECT SEQ_users_id.nextval
	INTO :new.id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_users_user_id BEFORE INSERT ON users
FOR EACH ROW
BEGIN
	SELECT SEQ_users_user_id.nextval
	INTO :new.user_id
	FROM dual;
END;

/




/* Comments */

COMMENT ON COLUMN dingdan.dd_id IS '购物车表，订单号，根据时间生成';
COMMENT ON COLUMN dingdan.wine_id IS '购买样式';
COMMENT ON COLUMN dingdan.num IS '购买数量';
COMMENT ON COLUMN users.user_id IS '用户id';
COMMENT ON COLUMN users.user_name IS '用户名';
COMMENT ON COLUMN users.password IS '密码';
COMMENT ON COLUMN users.address IS '收货地址';
COMMENT ON COLUMN wine.wine_name IS '商品名';
COMMENT ON COLUMN wine.kind IS '种类';
COMMENT ON COLUMN wine.detail IS '商品介绍';



