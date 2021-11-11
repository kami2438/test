CREATE TABLE t1_shop (
    t1_shop_id VARCHAR(10) PRIMARY KEY UNIQUE CHECK (t1_shop_id ~ '^S%'),
    t1_shop_name_prime  varchar(30) NOT NULL,
    t10_area_id  varchar(6) NOT NULL,
    t1_addres TEXT(150) NOT NULL,
    t8_shop_category_id VARCHAR(4) REFERENCES t8_shop_category,
    t1_holyday VARCHAR(7)  CHECK(t1_holyday ~*'^[0-1]{7}$'),
    t1_start_time time NOT NULL,
    t1_end_time time NOT NULL,
    t1_favorite_count Integer CHECK (t1_favorite_count <= 9999999 AND t1_favorite_count >=0),
    t1_tel_number VARCHAR(11),
    t1_shop_discribe TEXT(150),
    t1_shop_name_sub VARCHAR(30),
    t1_create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    t1_update_at timestamp  CURRENT_TIMESTAMP,
    t1_mail varchar(50),
    t1_password varchar(20) NOT NULL UNIQUE,
    t1_bank_name varchar(8) CHECK (t1_bank_name ~* '^[0-9]{4}$'),
    t1_bank_location varchar(8) CHECK (t1_bank_location ~* '^[0-9]{3}$'),
    t1_bank_number varchar(10)  CHECK (t1_bank_number ~* '^[0-9]{6,7}$'),
    UNIQUE (product_no)
) 
CREATE TABLE t2_order (
    t2_order_id VARCHAR(15) PRIMARY KEY UNIQUE CHECK (t2_order_id ~ '^O%'),
    t1_shop_id varchar(10) REFERENCES t1_shop,
    t5_user_id varchar(10) REFERENCES t5_user,
    t2_comment TEXT(150),
    t2_create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    t2_update_at timestamp CURRENT_TIMESTAMP,
    t2_week VARCHAR(7) CHECK(t2_week ~*'^[0-1]{7}$'),
    t2_order_count Integer NOT NULL CHECK( t2_order_count <= 9999 AND t2_order_count>=0),
) 
CREATE TABLE t3_order_detail (
    t3_order_detail_id VARCHAR(20) PRIMARY KEY UNIQUE CHECK (t3_order_detail_id ~ '^OD%'),
    t2_order_id varchar(15) REFERENCES t2_order_id,
    t4_food_id varchar(15) REFERENCES t4_food_id,
    t3_amount Integer NOT NULL CHECK (t3_amount < 999),
    t3_delivery_date DATE CHECK (TO_CHAR(t3_delivery_date,'YYYY:MM:DD:HH24:MI')),
    t3_comment TEXT(150),
    t3_payment Integer CHECK(t3_payment < 99999999 AND t3_payment>=0 ) ,
    t3_create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    t3_update_at timestamp CURRENT_TIMESTAMP,
    t7_delivery_man_id varchar(10) REFERENCES t7_delivery_man,
    t3_order_deliver_status Integer CHECK (t3_order_deliver_status BETWEEN 0 AND 2)
)
CREATE TABLE t4_food (
    t4_food_id VARCHAR(15) PRIMARY KEY UNIQUE CHECK (t4_food_id ~ '^F%'),
    t1_shop_id varchar(10) REFERENCES t1_shop,
    t9_food_category_id varchar(5) REFERENCES t9_food_category,
    t4_ingredients TEXT(150),
    t4_price Integer CHECK(t4_price <= 9999999 and t4_price >= 0) ,
    t4_food_name varchar(40),
    t4_food_discribe TEXT(150) ,
    t4_create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    t4_update_at timestamp CURRENT_TIMESTAMP,
    t4_order_count Integer CHECK(t4_order_count <= 2100000000 and t4_order_count >=0) 
) 

CREATE TABLE t5_user (
    t5_user_id VARCHAR(15) PRIMARY KEY UNIQUE CHECK (t5_user_id ~ '^U%'),
    t5_user_firstname varchar(20) NOT NULL,
    t5_user_lastname varchar(20) NOT NULL,
    t10_area_prefecture varchar(6),
    t5_address VARCHAR(70) NOT NULL ,
    t5_post VARCHAR(7) CHECK(t5_post ~* '^[0-9]{7}$'),
    t5_tel_number VARCHAR(11) CHECK(t5_tel_number ~* '^[0-9]{10,}$'),
    t5_landmark TEXT(250),
    t5_allergy TEXT(300),
    t5_charge_tool Integer check ( t5_charge_tool IN (0,1)),
    t5_charge_remain Integer DEFAULT 0,
    t5_credit_number VARCHAR(19) CHECK (t5+t5_credit_number ~* '^[0-9]{16,}'),
    t5_credit_limit varchar(4) CHECK(t5_credit_limit ~* '^[0-9]{4,}$'),
    t5_credit_security VARCHAR(3)(t5_credit_security ~'^[0-9]{3,}$'),
    t5_withdrawal integer,
    t5_password varchar(20) NOT NULL UNIQUE,
    t5_bank_name varchar(8) CHECK (t5_bank_name ~* '^[0-9]{4,}$'),
    t5_bank_location varchar(8) CHECK (t5_bank_location ~* '^[0-9]{3,}$'),
    t5_bank_number varchar(10)  CHECK (t5_bank_number ~* '^[0-9]{6,}$'),
    t5_bank_password VARCHAR(4) CHECK(t5_bank_password ~ '^[0-9]{1,}$'),
    FOREIGN KEY( t10_area_prefecture ) REFERENCES t10_area(t10_area_prefecture)
) 

CREATE TABLE t6_review (
    t6_review_id VARCHAR(15) PRIMARY KEY UNIQUE CHECK (t6_review_id ~ '^R%'),
    t1_shop_id varchar(10) REFERENCES t1_shop,
    t6_star smallint NOT NULL DEFAULT 0 CHECK (t6_star >=0 AND t6_star < 6),
    t6_title varchar(40),
    t6_sentence TEXT(400) ,
    t6_create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    t6_update_at timestamp CURRENT_TIMESTAMP,
   
) 

CREATE TABLE t7_delivery_man (
    t7_delivery_man_id VARCHAR(10) PRIMARY KEY UNIQUE CHECK (t1_shop_id ~ '^D%'),
    t7_delivery_man_firstname  varchar(20) NOT NULL,
    t7_delivery_man_lastname  varchar(20) NOT NULL,
    t7_delivery_man_tel VARCHAR(11) NOT NULL CHECK(t7_delivery_man_tel ~* '^[0-9]{10,}$'),
    t7_delivery_man_mail VARCHAR(50) NOT NULL,
    t10_area_id VARCHAR(20) REFERENCES t10_area,
    t7_delivery_man_password varchar(20) NOT NULL UNIQUE,
    t7_create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    t7_update_at timestamp  CURRENT_TIMESTAMP,
    t7_bank_name varchar(8) CHECK (t1_bank_name ~* '^[0-9]{4}$'),
    t7_bank_location varchar(8) CHECK (t1_bank_location ~* '^[0-9]{3}$'),
    t7_bank_number varchar(10)  CHECK (t1_bank_number ~* '^[0-9]{6,7}$'),
    
) 


CREATE TABLE t8_shop_category (
    t8_shop_category_id VARCHAR(4) PRIMARY KEY UNIQUE CHECK (t8_shop_category_id ~ '^SC%'),
    t8_shop_category_name varchar(20) NOT NULL,
    t8_create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    t8_update_at timestamp CURRENT_TIMESTAMP,
   
) 
CREATE TABLE t9_food_category (
    t9_shop_category_id VARCHAR(4) PRIMARY KEY UNIQUE UNIQUE CHECK (t8_shop_category_id ~ '^FC%'),
    t9_shop_category_name varchar(20) NOT NULL,
    t9_create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    t9_update_at timestamp CURRENT_TIMESTAMP,
   
) 
CREATE TABLE t10_area (
    t10_area_id  VARCHAR(10) PRIMARY KEY UNIQUE CHECK (t10_area_id  ~ '^A%'),
    t10_area_prefecture varchar(10) NOT NULL,
    t10_area_name(10) NOT NULL,
    t10_create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    t10_update_at timestamp CURRENT_TIMESTAMP,
) 
CREATE TABLE t11_love (
    t11_love_id  VARCHAR(20) PRIMARY KEY UNIQUE CHECK (t11_love_id ~ '^L%'),
    t1_shop_id REFERENCES t1_shop,
    t5_user_id REFERENCES t5_user,
    t11_create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    t11_update_at timestamp CURRENT_TIMESTAMP,
) 
CREATE TABLE t12_charge (
    t12_charge_id  VARCHAR(20) PRIMARY KEY UNIQUE CHECK (t12_charge_id  ~ '^C%'),
    t12_charge_amount BIGInt CHECK (t12_charge_amount >=0 and t12_charge_amount < 999999999999999),
    t5_user_id REFERENCES t5_user,
    t12_charge_remain_ex BIGInt NOT NULL CHECK (t12_charge_remain_ex>=0 and t12_charge_remain_ex < 999999999999999),
    t12_create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    t12_update_at timestamp CURRENT_TIMESTAMP,
) 
CREATE TABLE t13_inquiry (
    t13_inquiry_id  VARCHAR(13) PRIMARY KEY UNIQUE CHECK (t12_charge_id  ~ '^I%'),
    t13_title VARCHAR(40) NOT NULL ,
    t13_sentence TEXT(400) NOT NULL,
    t13_create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    t13_update_at timestamp CURRENT_TIMESTAMP,
) 
