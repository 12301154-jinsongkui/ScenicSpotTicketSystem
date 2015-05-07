create database master;
use master;

create table user(
       user_id      int          NOT NULL PRIMARY KEY,      
       user_name    varchar(30)  NOT NULL,
       user_pwd     varchar(15)  NOT NULL,
       user_source  varchar(30),   
       user_sign    varchar(100),   
       user_image   int                    default 0,
       user_state   int                    default 0,
       user_login   int,
       user_last_time time,
);


create table contract(
       contract_id      int          NOT NULL PRIMARY KEY auto_increment,
       contract_title   varchar(50)         NOT NULL,
       contract_content Text         NOT NULL,
       contract_payment int          NOT NULL, 
       contract_time    time         NOT NULL,
       contract_state   int                      default 0,
       user_id          int,
       user_name        varchar(30)  NOT NULL, 
       hunter_eval      int                    default 0,
       hunter_evalution  varchar(50),
       FOREIGN KEY(user_id) REFERENCES user(user_id)
);

create table hirer(   
       hirer_id     int   NOT NULL PRIMARY KEY auto_increment,

       contract_id  int,
       user_id      int,
       hirer_eval   int                    default 0,  
       hirer_evalution   varchar(50),       
       FOREIGN KEY(user_id) REFERENCES user(user_id),
       FOREIGN KEY(contract_id) REFERENCES contract(contract_id)
);

create table sign(
       sign_id       int   NOT NULL PRIMARY KEY auto_increment,
       user_id       int,
       contract_id   int,
       FOREIGN KEY(user_id) REFERENCES user(user_id),
       FOREIGN KEY(contract_id) REFERENCES contract(contract_id)

);

create table level(
      level_id         int   NOT NULL PRIMARY KEY auto_increment,
      user_id          int,
      user_score       int,
      user_level       varchar(10),
      user_experience  int,   
      FOREIGN KEY(user_id) REFERENCES user(user_id)
);

create table evalution(
      eval_id        int   NOT NULL PRIMARY KEY auto_increment,
      contract_id     int,
      user_id         int,
      eval_detail     Text,
      user_name       varchar(30),
      user_image      int, 

      FOREIGN KEY(user_id) REFERENCES user(user_id),
      FOREIGN KEY(contract_id) REFERENCES contract(contract_id) 
);
