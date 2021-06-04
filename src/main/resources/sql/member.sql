CREATE TABLE member_info
(
    id_num          VARCHAR2(50)     ,
    name            VARCHAR2(20)     , 
    pw              VARCHAR2(20)     , 
    resident_num    VARCHAR(20)      , 
    Phone_num       VARCHAR(20)      , 
    tel_num         VARCHAR(20)       NULL, 
    addr            VARCHAR2(100)    NULL, 
    detail_addr     VARCHAR2(100)    NULL, 
    email           VARCHAR2(100)    , 
    major           VARCHAR2(20)     , 
    grade           NUMBER(20)       NULL, 
    class           VARCHAR2(20)     NULL, 
    country         VARCHAR2(20)     , 
    mentor          VARCHAR2(20)     NULL, 
    zipcode_send    VARCHAR2(20)     DEFAULT 'n' , 
    sms_send        VARCHAR2(20)     DEFAULT 'n' , 
    position        VARCHAR2(20)     , 
    image_File      VARCHAR2(150)    DEFAULT 'nan' NULL, 
    office_addr     VARCHAR2(50)     NULL, 
    bank            VARCHAR2(20)     ,
    account_num     VARCHAR2(20)     ,
    PRIMARY KEY (id_num)
);