create table bmsql_config (
  cfg_name    varchar primary key,
  cfg_value   varchar
) SALT_BUCKETS=16;

create table bmsql_warehouse (
  w_id        integer   not null primary key,
  w_ytd       decimal,
  w_tax       decimal,
  w_name      varchar,
  w_street_1  varchar,
  w_street_2  varchar,
  w_city      varchar,
  w_state     char(2),
  w_zip       char(9)
) SALT_BUCKETS=16;

create table bmsql_district (
  d_w_id       integer       not null,
  d_id         integer       not null,
  d_ytd        decimal,
  d_tax        decimal,
  d_next_o_id  integer,
  d_name       varchar,
  d_street_1   varchar,
  d_street_2   varchar,
  d_city       varchar,
  d_state      char(2),
  d_zip        char(9),
  CONSTRAINT pk PRIMARY KEY (d_w_id, d_id)
)SALT_BUCKETS=16;

create table bmsql_customer (
  c_w_id         integer        not null,
  c_d_id         integer        not null,
  c_id           integer        not null,
  c_discount     decimal,
  c_credit       char(2),
  c_last         varchar,
  c_first        varchar,
  c_credit_lim   decimal,
  c_balance      decimal,
  c_ytd_payment  decimal,
  c_payment_cnt  integer,
  c_delivery_cnt integer,
  c_street_1     varchar,
  c_street_2     varchar,
  c_city         varchar,
  c_state        char(2),
  c_zip          char(9),
  c_phone        char(16),
  c_since        timestamp,
  c_middle       char(2),
  c_data         varchar,
CONSTRAINT pk PRIMARY KEY (c_w_id, c_d_id, c_id)
)SALT_BUCKETS=16;

create sequence bmsql_hist_id_seq start with 900000;

create table bmsql_history (
  hist_id  integer primary key,
  h_c_id   integer,
  h_c_d_id integer,
  h_c_w_id integer,
  h_d_id   integer,
  h_w_id   integer,
  h_date   timestamp,
  h_amount decimal,
  h_data   varchar
)SALT_BUCKETS=16;

create table bmsql_new_order (
  no_w_id  integer   not null,
  no_d_id  integer   not null,
  no_o_id  integer   not null
CONSTRAINT pk PRIMARY KEY (no_w_id, no_d_id, no_o_id)
)SALT_BUCKETS=16;

create table bmsql_oorder (
  o_w_id       integer      not null,
  o_d_id       integer      not null,
  o_id         integer      not null,
  o_c_id       integer,
  o_carrier_id integer,
  o_ol_cnt     integer,
  o_all_local  integer,
  o_entry_d    timestamp
CONSTRAINT pk PRIMARY KEY (o_w_id, o_d_id, o_id)
)SALT_BUCKETS=16;

create table bmsql_order_line (
  ol_w_id         integer   not null,
  ol_d_id         integer   not null,
  ol_o_id         integer   not null,
  ol_number       integer   not null,
  ol_i_id         integer  ,
  ol_delivery_d   timestamp,
  ol_amount       decimal,
  ol_supply_w_id  integer,
  ol_quantity     integer,
  ol_dist_info    char(24),
 CONSTRAINT pk PRIMARY KEY (ol_w_id, ol_d_id, ol_o_id, ol_number)
)SALT_BUCKETS=16;

create table bmsql_item (
  i_id     integer      not null primary key,
  i_name   varchar,
  i_price  decimal,
  i_data   varchar,
  i_im_id  integer
)SALT_BUCKETS=16;

create table bmsql_stock (
  s_w_id       integer       not null,
  s_i_id       integer       not null,
  s_quantity   integer,
  s_ytd        integer,
  s_order_cnt  integer,
  s_remote_cnt integer,
  s_data       varchar,
  s_dist_01    char(24),
  s_dist_02    char(24),
  s_dist_03    char(24),
  s_dist_04    char(24),
  s_dist_05    char(24),
  s_dist_06    char(24),
  s_dist_07    char(24),
  s_dist_08    char(24),
  s_dist_09    char(24),
  s_dist_10    char(24),
CONSTRAINT pk PRIMARY KEY (s_w_id, s_i_id)
)SALT_BUCKETS=16;


