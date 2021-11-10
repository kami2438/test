CREATE TABLE t1_shop (
    t1_shop_id VARCHAR(10) PRIMARY KEY CHECK (t1_shop_id ~ '^S%'),
    t1_shop_name_prime  varchar(30) NOT NULL,
    t10_area_id  varchar(6) NOT NULL,
    t1_addres TEXT NOT NULL,
    t8_shop_category_id VARCHAR(4) REFERENCES t8_shop_category,
    t1_holyday VARCHAR(7) CHECK(t1_holyday ~* '^(0|1){7}$' ),
    t1_start_time time NOT NULL,
    t1_end_time time NOT NULL,
    t1_favorite_count integer CHECK (t1_favorite_count <= 9999999),
    t1_tel_number integer CHECK (t1_tel_number < 99999999999),
    t1_shop_discribe TEXT,
    t1_shop_name_sub VARCHAR(30),
    t1_create_at timestamp NOT NULL CURRENT_TIMESTAMP,
    t1_update_at timestamp  CURRENT_TIMESTAMP,
    t1_mail varchar(50),
    t1_password varchar(20) NOT NULL UNIQUE,
    t1_bank_name varchar(8) CHECK (t1_bank_name ~* '^[0-9]{4}$'),
    t1_bank_location varchar(8) CHECK (t1_bank_location ~* '^[0-9]{3}$'),
    t1_bank_number varchar(10)  CHECK (t1_bank_number ~* '^[0-9]{6,7}$'),
    UNIQUE (product_no)
) 
CREATE TABLE t2_order (
    t2_order_id VARCHAR(15) PRIMARY KEY CHECK (t2_order_id ~ '^O%'),
    t1_shop_id varchar(10) REFERENCES t1_shop,
    t5_user_id varchar(10) REFERENCES t5_user,
    t2_comment TEXT,
    t2_create_at timestamp NOT NULL CURRENT_TIMESTAMP,
    t2_update_at timestamp CURRENT_TIMESTAMP,
    t2_week integer NOT NULL CHECK (t2_week >=0 and t2_week<=7),
    t2_order_count integer NOT NULL,
) 
CREATE TABLE t3_order_detail (
    t3_order_detail_id VARCHAR(20) PRIMARY KEY CHECK (t2_order_id ~ '^OD%'),
    t2_order_id varchar(15) REFERENCES t2_order_id,
    t4_food_id varchar(15) REFERENCES t4_food_id,
    t3_amount integer NOT NULL CHECK (t3_amount < 999),
    t3_delivery_date DATE CHECK (TO_CHAR(t3_delivery_date,'YYYY:MM:DD:HH24:MI')),
    t3_comment TEXT,
    t3_payment integer ,
    t2_order_count integer NOT NULL,
   
) 