SPISNON\\                üR  üR   ÐT     Header                COMMON_DICT      ID   CHAR
   TABLE_NAME   VARCHAR2
   FIELD_NAME   VARCHAR2   FIELD_VALUE   NUMBER   TEXT   VARCHAR2   DESCP   VARCHAR2ê  create table COMMON_DICT
(
  ID          CHAR(32) not null,
  TABLE_NAME  VARCHAR2(50),
  FIELD_NAME  VARCHAR2(50),
  FIELD_VALUE NUMBER(3),
  TEXT        VARCHAR2(50),
  DESCP       VARCHAR2(255)
)
;
comment on table COMMON_DICT
  is 'ç è¡¨,å¼åäººåä½¿ç¨,è®°å½æ°å­ä¸æå­ç å¯¹åºä¿¡æ¯';
comment on column COMMON_DICT.FIELD_VALUE
  is 'æ°å¼';
comment on column COMMON_DICT.DESCP
  is 'å¯¹è¯¥æ å°çæè¿°';
alter table COMMON_DICT
  add primary key (ID);
   SYS_ORIGIN_TYPE      ID   CHAR   NAME   VARCHAR2   DESCP   VARCHAR2  create table SYS_ORIGIN_TYPE
(
  ID    CHAR(32) not null,
  NAME  VARCHAR2(20),
  DESCP VARCHAR2(200)
)
;
comment on table SYS_ORIGIN_TYPE
  is 'æ°æ®æ¥æº,å¦ç½ç»åªä½,ç°åºææ¥';
alter table SYS_ORIGIN_TYPE
  add constraint PK_SYS_ORIGIN_TYPE primary key (ID);
   SYS_EARTHQUAKE
      EVENT_ID   VARCHAR2
   EVENT_TIME   DATE	   LONGITUDE   VARCHAR2   LATITUDE   VARCHAR2   FOCAL_DEPTH   VARCHAR2	   MAGNITUDE   VARCHAR2   LOCATION   VARCHAR2
   START_TIME   DATE   END_TIME   DATE   STATUS   NUMBER~  create table SYS_EARTHQUAKE
(
  EVENT_ID    VARCHAR2(100) not null,
  EVENT_TIME  DATE,
  LONGITUDE   VARCHAR2(10),
  LATITUDE    VARCHAR2(10),
  FOCAL_DEPTH VARCHAR2(20),
  MAGNITUDE   VARCHAR2(3),
  LOCATION    VARCHAR2(100),
  START_TIME  DATE,
  END_TIME    DATE,
  STATUS      NUMBER(3)
)
;
comment on table SYS_EARTHQUAKE
  is 'è®°å½ç³»åå°éå®ç°ï¼ç±ååä¸­å¿å¯å¨åºæ¥ï¼å°ä¼âæ°å¢âä¸ä¸ªå°éäºä»¶ï¼éåçå¾å¤æ°æ®é½å¼ç¨è¿ä¸ªè®°å½ã';
comment on column SYS_EARTHQUAKE.STATUS
  is '0ï¼å¯å¨
1ï¼è¿è¡
2ï¼åæ­¢';
alter table SYS_EARTHQUAKE
  add primary key (EVENT_ID);
   SYS_JOB      ID   CHAR   IS_INTERNAL   CHAR
   BEGIN_TIME   DATE   END_TIME   DATE   EXECUTE_METHOD   CHAR	   FREQUENCY   NUMBER   PRIORITY   NUMBER   BATCH   NUMBER   URL   VARCHAR2   STATUS   NUMBER   SCALE   NUMBER   ORIGIN_TYPE_ID   CHAR   EVENT_ID   VARCHAR2  create table SYS_JOB
(
  ID             CHAR(32) not null,
  IS_INTERNAL    CHAR(1),
  BEGIN_TIME     DATE,
  END_TIME       DATE,
  EXECUTE_METHOD CHAR(1),
  FREQUENCY      NUMBER(8),
  PRIORITY       NUMBER(3),
  BATCH          NUMBER(3),
  URL            VARCHAR2(255),
  STATUS         NUMBER(3),
  SCALE          NUMBER(8),
  ORIGIN_TYPE_ID CHAR(32),
  EVENT_ID       VARCHAR2(100)
)
;
comment on table SYS_JOB
  is 'è®°å½ç³»ç»ä»»å¡ï¼å¯è½æ¯æåæ°æ®çä»»å¡ï¼ä¹å¯ä»¥æ¯ç³»ç»åé¨çä»»å¡ã';
comment on column SYS_JOB.EXECUTE_METHOD
  is 'wsãftpç­';
alter table SYS_JOB
  add primary key (ID);
alter table SYS_JOB
  add constraint FK_SYS_JOB_ORIGTYPE foreign key (ORIGIN_TYPE_ID)
  references SYS_ORIGIN_TYPE (ID);
alter table SYS_JOB
  add constraint FK_SYS_JOB_REFERENCE_SYS_EART foreign key (EVENT_ID)
  references SYS_EARTHQUAKE (EVENT_ID);
   DATA_ORIGINAL      ID   CHAR   FORM   VARCHAR2
   REMOTE_URL   VARCHAR2   NOTICE_TIME   DATE	   COLL_TIME   DATE
   LOCALE_URL   VARCHAR2   LOCALE_FMT_URL   VARCHAR2   FILENAME   VARCHAR2	   FMT_FNAME   CHAR	   FILE_SIZE   NUMBER   STATUS   NUMBER   BATCH   NUMBER   JOB_ID   CHAR   EVENTID   VARCHAR2   ORIGINALNAME   VARCHAR2  create table DATA_ORIGINAL
(
  ID             CHAR(32) not null,
  FORM           VARCHAR2(20),
  REMOTE_URL     VARCHAR2(255),
  NOTICE_TIME    DATE,
  COLL_TIME      DATE,
  LOCALE_URL     VARCHAR2(100),
  LOCALE_FMT_URL VARCHAR2(100),
  FILENAME       VARCHAR2(50),
  FMT_FNAME      CHAR(10),
  FILE_SIZE      NUMBER(20),
  STATUS         NUMBER(3),
  BATCH          NUMBER(3),
  JOB_ID         CHAR(32),
  EVENTID        VARCHAR2(100),
  ORIGINALNAME   VARCHAR2(20)
)
;
comment on table DATA_ORIGINAL
  is 'è®°å½åå§æ°æ®ç¸å³ä¿¡æ¯ï¼è§é¢ãé³é¢ãææ¬ãå¾çä¿¡æ¯é½è®°å½å¨è¿ä¸ªè¡¨ä¸­ã';
comment on column DATA_ORIGINAL.LOCALE_FMT_URL
  is 'æ¬å°æ ¼å¼ååè·¯å¾(å¦ææ ¼å¼ä¸å¯¹,æä»¬è¦è½¬ç )';
comment on column DATA_ORIGINAL.EVENTID
  is 'å°éåºå';
comment on column DATA_ORIGINAL.ORIGINALNAME
  is 'æ¥æºåç§°';
alter table DATA_ORIGINAL
  add primary key (ID);
alter table DATA_ORIGINAL
  add constraint FK_DATA_ORIG_JOB foreign key (JOB_ID)
  references SYS_JOB (ID);
   DATA_IDENTIFY      ID   CHAR   CREATE_TIME   DATE
   EVENT_TIME   DATE   LOCATION   VARCHAR2	   LONGITUDE   VARCHAR2   LATITUDE   VARCHAR2	   TXT_INFO1   VARCHAR2	   TXT_INFO2   VARCHAR2	   SEMANTICS   VARCHAR2	   MAGNITUDE   NUMBER   SEISESTHESIA   NUMBER
   REPORT_MAN   VARCHAR2   REPORT_TIME   DATE   MANUAL   CHAR   ORIGINAL_ID   CHARý  create table DATA_IDENTIFY
(
  ID           CHAR(32) not null,
  CREATE_TIME  DATE,
  EVENT_TIME   DATE,
  LOCATION     VARCHAR2(100),
  LONGITUDE    VARCHAR2(10),
  LATITUDE     VARCHAR2(10),
  TXT_INFO1    VARCHAR2(4000),
  TXT_INFO2    VARCHAR2(2000),
  SEMANTICS    VARCHAR2(2000),
  MAGNITUDE    NUMBER(8,2),
  SEISESTHESIA NUMBER(3),
  REPORT_MAN   VARCHAR2(10),
  REPORT_TIME  DATE,
  MANUAL       CHAR(1),
  ORIGINAL_ID  CHAR(32)
)
;
comment on table DATA_IDENTIFY
  is 'è®°å½è¯å«åçç¾æä¿¡æ¯æ¦è¦åææ¬åå®¹ï¼å¯¹åºå¤æ¡å·ä½çç¾ææç»';
alter table DATA_IDENTIFY
  add primary key (ID);
alter table DATA_IDENTIFY
  add constraint FK_DATA_IDEN_ORIG foreign key (ORIGINAL_ID)
  references DATA_ORIGINAL (ID);
   SYS_DISASTER_CLASSIFY      ID   CHAR   NAME   VARCHAR2   DESCP   VARCHAR2   P_ID   CHARf  create table SYS_DISASTER_CLASSIFY
(
  ID    CHAR(32) not null,
  NAME  VARCHAR2(50),
  DESCP VARCHAR2(255),
  P_ID  CHAR(32)
)
;
comment on table SYS_DISASTER_CLASSIFY
  is 'è®°å½ç¾æåç±»ï¼å¦äººåä¼¤äº¡ãæ¿å±æåµãæ­¤çç¾å®³æåµæ¯ä¸çº§åç±»ï¼å¯æ·»å äºçº§åç±»';
comment on column SYS_DISASTER_CLASSIFY.NAME
  is '--åç±»åç§°,å¦äººåæåµ,å»ºç­æåµ,ä¹å¯ä»¥æ¯äºçº§åç±»';
alter table SYS_DISASTER_CLASSIFY
  add primary key (ID);
alter table SYS_DISASTER_CLASSIFY
  add constraint FK_CLASSIFY_SELF foreign key (P_ID)
  references SYS_DISASTER_CLASSIFY (ID);
   SYS_DISASTER_PREDICATE      ID   CHAR   NAME   VARCHAR2   DESCP   VARCHAR2   CLASSIFY_ID   CHAR  create table SYS_DISASTER_PREDICATE
(
  ID          CHAR(32) not null,
  NAME        VARCHAR2(50),
  DESCP       VARCHAR2(255),
  CLASSIFY_ID CHAR(32)
)
;
comment on table SYS_DISASTER_PREDICATE
  is 'ç¾æè°è¯,å¦æ­»äº¡/åä¼¤/åå/å¤±è¸ª,æå¦åå¡/è½»å¾®åæï¼é½æ¯è°è¯ã
ä¸ä¸ªåç±»ä¸æå¤ä¸ªè°è¯ã';
alter table SYS_DISASTER_PREDICATE
  add primary key (ID);
alter table SYS_DISASTER_PREDICATE
  add constraint FK_PREDICATE_CLASSIFY foreign key (CLASSIFY_ID)
  references SYS_DISASTER_CLASSIFY (ID);
   SYS_DISASTER_MEASUREMENT      ID   CHAR   PREDICATE_ID   CHAR   MEASURE   VARCHAR2   UNIT   VARCHAR2õ  create table SYS_DISASTER_MEASUREMENT
(
  ID           CHAR(32) not null,
  PREDICATE_ID CHAR(32),
  MEASURE      VARCHAR2(50),
  UNIT         VARCHAR2(5)
)
;
comment on table SYS_DISASTER_MEASUREMENT
  is 'è®¡é,ä¸ä¸ªè°è¯ä¸å¤å¤ä¸ªåº¦éçº§å«,å¦100äººä»¥å,100-1000äºº,åå¦æ¿å±(ä¸çº§åç±»)--å­¦æ ¡(äºçº§åç±»)--åå¡(è°è¯)--1000-2000å¹³æ¹(è®¡é)ï¼å¯ä»¥æ¯ä¸ä¸ªèå´ï¼ä¹å¯ä»¥æ¯å·ä½çæ°å¼ã
';
comment on column SYS_DISASTER_MEASUREMENT.MEASURE
  is 'å¯ä»¥æ¯ä¸ä¸ªèå´ï¼ä¹å¯ä»¥æ¯ç²¾ç¡®å¼';
alter table SYS_DISASTER_MEASUREMENT
  add primary key (ID);
alter table SYS_DISASTER_MEASUREMENT
  add constraint FK_MEASURE_PREDICATE foreign key (PREDICATE_ID)
  references SYS_DISASTER_PREDICATE (ID);
   DATA_DISASTER_DETAIL	      ID   CHAR   EXACT_VALUE   NUMBER   DESCP   VARCHAR2   FILED1   VARCHAR2   FILED2   VARCHAR2   FILED3   VARCHAR2   LABELED   CHAR   ITENTITY_ID   CHAR   MEASUREMENT_ID   CHARH  create table DATA_DISASTER_DETAIL
(
  ID             CHAR(32) not null,
  EXACT_VALUE    NUMBER(20,2),
  DESCP          VARCHAR2(1000),
  FILED1         VARCHAR2(255),
  FILED2         VARCHAR2(255),
  FILED3         VARCHAR2(255),
  LABELED        CHAR(1),
  ITENTITY_ID    CHAR(32),
  MEASUREMENT_ID CHAR(32)
)
;
comment on table DATA_DISASTER_DETAIL
  is 'è®°å½ç¾æåç±»ä¸çæç»ä¿¡æ¯ï¼æ¯æ¡è®°å½å¯¹åºä¸åçå­åç±»åä¸åçè°è¯ï¼è®°å½åæç¨åº¦æå·ä½æ°å­ï¼ç¨äºæåææ ã';
comment on column DATA_DISASTER_DETAIL.EXACT_VALUE
  is 'è¯¥å¼å¯è½æ²¡æï¼èæ¯ç¨ä¸ä¸ªéåº¦æ¥è¡¨ç°ä¸ä¸ªç¾æçæç»ä¿¡æ¯';
comment on column DATA_DISASTER_DETAIL.LABELED
  is 'æ¯å¦å·²ç»æ æ³¨';
alter table DATA_DISASTER_DETAIL
  add primary key (ID);
alter table DATA_DISASTER_DETAIL
  add constraint FK_DATA_DIS_REFERENCE_DATA_IDE foreign key (ITENTITY_ID)
  references DATA_IDENTIFY (ID);
alter table DATA_DISASTER_DETAIL
  add constraint FK_DIS_DETAIL_MEASURE foreign key (MEASUREMENT_ID)
  references SYS_DISASTER_MEASUREMENT (ID);
   RIGHTS_ROLE      ID   CHAR   NAME   VARCHAR2   DESCP   VARCHAR2   STATUS   CHAR   REMARK   VARCHAR2   PERM   VARCHAR2¥  create table RIGHTS_ROLE
(
  ID     CHAR(32) not null,
  NAME   VARCHAR2(50),
  DESCP  VARCHAR2(100),
  STATUS CHAR(1),
  REMARK VARCHAR2(255),
  PERM   VARCHAR2(255)
)
;
comment on table RIGHTS_ROLE
  is 'è®°å½ç³»ç»è§è²ä¿¡æ¯';
comment on column RIGHTS_ROLE.STATUS
  is '1å¯ç¨ï¼0å³é­';
comment on column RIGHTS_ROLE.PERM
  is 'æéå­ç¬¦ä¸²';
alter table RIGHTS_ROLE
  add primary key (ID);
   RIGHTS_USER
      ID   CHAR   USERNAME   VARCHAR2   PASSWORD   VARCHAR2   NAME   VARCHAR2   STATUS   NUMBER   DEPT_ID   VARCHAR2   ORG_ID   VARCHAR2   EMP_ID   VARCHAR2   PHONENUMBER   VARCHAR2   ROLE_ID   CHAR  create table RIGHTS_USER
(
  ID          CHAR(32) not null,
  USERNAME    VARCHAR2(50),
  PASSWORD    VARCHAR2(100),
  NAME        VARCHAR2(50),
  STATUS      NUMBER(3),
  DEPT_ID     VARCHAR2(50),
  ORG_ID      VARCHAR2(50),
  EMP_ID      VARCHAR2(50),
  PHONENUMBER VARCHAR2(50),
  ROLE_ID     CHAR(32)
)
;
comment on table RIGHTS_USER
  is 'è®°å½ç³»ç»ç¨æ·ä¿¡æ¯';
comment on column RIGHTS_USER.STATUS
  is 'ç¶æ,1å¯ç¨ï¼2å¨çº¿ï¼3ç¦»çº¿ï¼9æ³¨é';
alter table RIGHTS_USER
  add primary key (ID);
alter table RIGHTS_USER
  add constraint FK_RIGHTS_USER_ROLE foreign key (ROLE_ID)
  references RIGHTS_ROLE (ID);
   SYS_DISASTER_ICON
      ID   CHAR   DISASTER_LEVEL   NUMBER	   ICON_NAME   VARCHAR2   ICON_URL   VARCHAR2   UPDATE_TIME   DATE   CREATE_TIME   DATE   OPUSER   CHAR   UNIT   VARCHAR2   MEASUREMENT_ID   CHAR   RIG_ID   CHARÛ  create table SYS_DISASTER_ICON
(
  ID             CHAR(32) not null,
  DISASTER_LEVEL NUMBER(3),
  ICON_NAME      VARCHAR2(50),
  ICON_URL       VARCHAR2(255),
  UPDATE_TIME    DATE,
  CREATE_TIME    DATE,
  OPUSER         CHAR(32),
  UNIT           VARCHAR2(5),
  MEASUREMENT_ID CHAR(32),
  RIG_ID         CHAR(32)
)
;
comment on table SYS_DISASTER_ICON
  is 'è®°å½æç¾æåç±»ä¸åæç¨åº¦ãå·ä½æ°å¼å¯¹åºçå¾æ ä¿¡æ¯';
comment on column SYS_DISASTER_ICON.DISASTER_LEVEL
  is 'ç¾å®³ç­çº§,ç´æ¥å¯¹åºå¾æ ';
comment on column SYS_DISASTER_ICON.UNIT
  is 'åä½,å¦äºº/åäºº/å¹³æ¹ç±³/å¹³æ¹å¬é/é´ç­è®¡éåä½';
alter table SYS_DISASTER_ICON
  add primary key (ID);
alter table SYS_DISASTER_ICON
  add constraint FK_ICON_MEASURE foreign key (MEASUREMENT_ID)
  references SYS_DISASTER_MEASUREMENT (ID);
alter table SYS_DISASTER_ICON
  add constraint FK_SYS_DISA_REFERENCE_RIGHTS_U foreign key (RIG_ID)
  references RIGHTS_USER (ID);
   DATA_LABEL_RECORD      ID   CHAR   ICON_ID   CHAR   DIS_DETAIL_ID   CHAR   OP_DATE   DATEd  create table DATA_LABEL_RECORD
(
  ID            CHAR(32) not null,
  ICON_ID       CHAR(32),
  DIS_DETAIL_ID CHAR(32),
  OP_DATE       DATE
)
;
comment on table DATA_LABEL_RECORD
  is 'è®°å½è¯å«åç¾æä¿¡æ¯å¨å°å¾ä¸çæ å®ä¿¡æ¯';
alter table DATA_LABEL_RECORD
  add constraint PK_DATA_LABEL_RECORD primary key (ID);
alter table DATA_LABEL_RECORD
  add constraint FK_DATA_LABLE_DIS_DETAIL foreign key (DIS_DETAIL_ID)
  references DATA_DISASTER_DETAIL (ID);
alter table DATA_LABEL_RECORD
  add constraint FK_DATA_LABLE_ICON foreign key (ICON_ID)
  references SYS_DISASTER_ICON (ID);
   GRABAGE_SITECONFIG      ID   VARCHAR2   ADVERT_PATHS   VARCHAR2   AUTHOR   VARCHAR2   CONTENT   VARCHAR2   FORWARD   VARCHAR2   LINK   VARCHAR2	   PAGECOUNT   NUMBER   SOURCE   VARCHAR2	   SPLITPATH   VARCHAR2   SUMMARY   VARCHAR2   TIMELINE   VARCHAR2   TITLE   VARCHAR2   USABLE   VARCHAR2   XLINK   VARCHAR2   KEYWORD   VARCHAR2   NAME   VARCHAR2«  create table GRABAGE_SITECONFIG
(
  ID           VARCHAR2(32 CHAR) not null,
  ADVERT_PATHS VARCHAR2(255 CHAR),
  AUTHOR       VARCHAR2(255 CHAR),
  CONTENT      VARCHAR2(255 CHAR),
  FORWARD      VARCHAR2(255 CHAR),
  LINK         VARCHAR2(255 CHAR),
  PAGECOUNT    NUMBER(10) not null,
  SOURCE       VARCHAR2(255 CHAR),
  SPLITPATH    VARCHAR2(255 CHAR),
  SUMMARY      VARCHAR2(255 CHAR),
  TIMELINE     VARCHAR2(255 CHAR),
  TITLE        VARCHAR2(255 CHAR),
  USABLE       VARCHAR2(255 CHAR),
  XLINK        VARCHAR2(255 CHAR),
  KEYWORD      VARCHAR2(255 CHAR),
  NAME         VARCHAR2(255 CHAR)
)
;
alter table GRABAGE_SITECONFIG
  add primary key (ID);
   LOG_BUSI      ID   CHAR   OP_TYPE   NUMBER   OP_USER   CHAR   OP_TIME   DATE	   SUBMODULE   VARCHAR2   IP   VARCHAR2   EQ_ID   VARCHAR2   CONTENT   VARCHAR2×  create table LOG_BUSI
(
  ID        CHAR(32) not null,
  OP_TYPE   NUMBER(3),
  OP_USER   CHAR(32),
  OP_TIME   DATE,
  SUBMODULE VARCHAR2(50),
  IP        VARCHAR2(20),
  EQ_ID     VARCHAR2(100),
  CONTENT   VARCHAR2(4000)
)
;
comment on table LOG_BUSI
  is 'æä½å¥è';
comment on column LOG_BUSI.OP_TYPE
  is 'æä½ç±»å';
comment on column LOG_BUSI.OP_USER
  is 'æä½äºº';
comment on column LOG_BUSI.OP_TIME
  is 'æä½æ¶é´';
comment on column LOG_BUSI.SUBMODULE
  is 'å­æ¨¡å';
comment on column LOG_BUSI.IP
  is 'IPå°å';
comment on column LOG_BUSI.EQ_ID
  is 'å°éåºå';
comment on column LOG_BUSI.CONTENT
  is 'sqlæåå®¹';
alter table LOG_BUSI
  add primary key (ID);
   LOG_COOPERATE      ID   CHAR   REPORT_TIME   DATE	   LOG_TITLE   VARCHAR2   LOG_MESSAGE   VARCHAR2   STATUS   NUMBER   EQ_ID   VARCHAR2×  create table LOG_COOPERATE
(
  ID          CHAR(32) not null,
  REPORT_TIME DATE,
  LOG_TITLE   VARCHAR2(50),
  LOG_MESSAGE VARCHAR2(1000),
  STATUS      NUMBER(3),
  EQ_ID       VARCHAR2(100)
)
;
comment on table LOG_COOPERATE
  is 'è®°å½ä¸ä¸­å¿åä½æ¥å¿ä¿¡æ¯';
alter table LOG_COOPERATE
  add primary key (ID);
alter table LOG_COOPERATE
  add constraint FK_LOG_COOP_REFERENCE_SYS_EART foreign key (EQ_ID)
  references SYS_EARTHQUAKE (EVENT_ID);
   LOG_EXCEPTION      ID   CHAR
   EVENT_TIME   DATE   OUTLINE   VARCHAR2
   CALL_STACK   VARCHAR2	   SUBMODULE   VARCHAR2   EXCEPTION_LEVEL   NUMBER   STATUS   NUMBER   EQ_ID   VARCHAR2|  create table LOG_EXCEPTION
(
  ID              CHAR(32) not null,
  EVENT_TIME      DATE,
  OUTLINE         VARCHAR2(1000),
  CALL_STACK      VARCHAR2(1000),
  SUBMODULE       VARCHAR2(50),
  EXCEPTION_LEVEL NUMBER(3),
  STATUS          NUMBER(3),
  EQ_ID           VARCHAR2(100)
)
;
comment on table LOG_EXCEPTION
  is 'è®°å½ç³»ç»å¼å¸¸ä¿¡æ¯';
comment on column LOG_EXCEPTION.STATUS
  is '1å·²æ¥å 2æªæ¥å 0æ éæ¥å';
alter table LOG_EXCEPTION
  add primary key (ID);
alter table LOG_EXCEPTION
  add constraint FK_LOG_EXCE_REFERENCE_SYS_EART foreign key (EQ_ID)
  references SYS_EARTHQUAKE (EVENT_ID);
   ORGINFO      ORGUUID   VARCHAR2
   PARENTUUID   VARCHAR2   ORGNAME   VARCHAR2   ORGCODE   VARCHAR2   CONTENT   VARCHAR2   DUTY_OFFICER   VARCHAR2   PNUMBER   VARCHAR2   STATUS   VARCHAR2¾  create table ORGINFO
(
  ORGUUID      VARCHAR2(32) not null,
  PARENTUUID   VARCHAR2(32),
  ORGNAME      VARCHAR2(50),
  ORGCODE      VARCHAR2(50),
  CONTENT      VARCHAR2(500),
  DUTY_OFFICER VARCHAR2(32),
  PNUMBER      VARCHAR2(11),
  STATUS       VARCHAR2(1) default 1
)
;
comment on table ORGINFO
  is 'ç»ç»æºæ';
comment on column ORGINFO.ORGUUID
  is 'id';
comment on column ORGINFO.PARENTUUID
  is 'ç¶çº§ç»ç»';
comment on column ORGINFO.ORGNAME
  is 'åç§°';
comment on column ORGINFO.ORGCODE
  is 'ç¼ç ';
comment on column ORGINFO.CONTENT
  is 'æè¿°';
comment on column ORGINFO.DUTY_OFFICER
  is 'è´£ä»»äºº';
comment on column ORGINFO.PNUMBER
  is 'èç³»çµè¯';
comment on column ORGINFO.STATUS
  is 'ç¶æ';
alter table ORGINFO
  add constraint PK_ORG primary key (ORGUUID);
alter table ORGINFO
  add constraint FK_ORG_ORG foreign key (PARENTUUID)
  references ORGINFO (ORGUUID) on delete cascade;
   PAGEINFO
      ID   VARCHAR2   TITLE   VARCHAR2   LINK   VARCHAR2   TIMELINE   DATE   CONTENT   LONG   AUTHOR   VARCHAR2   SOURCE   VARCHAR2   SUMMARY   VARCHAR2   SITE_ID   VARCHAR2   OPTIME   DATEª  create table PAGEINFO
(
  ID       VARCHAR2(32) not null,
  TITLE    VARCHAR2(255),
  LINK     VARCHAR2(255),
  TIMELINE DATE,
  CONTENT  LONG,
  AUTHOR   VARCHAR2(100),
  SOURCE   VARCHAR2(100),
  SUMMARY  VARCHAR2(500),
  SITE_ID  VARCHAR2(32),
  OPTIME   DATE
)
;
comment on column PAGEINFO.TITLE
  is 'æ é¢';
comment on column PAGEINFO.LINK
  is 'é¾æ¥';
comment on column PAGEINFO.TIMELINE
  is 'æ¶é´';
comment on column PAGEINFO.CONTENT
  is 'åå®¹';
comment on column PAGEINFO.AUTHOR
  is 'ä½è';
comment on column PAGEINFO.SOURCE
  is 'æ¥æº';
comment on column PAGEINFO.SUMMARY
  is 'æ¦è¦';
comment on column PAGEINFO.SITE_ID
  is 'ééç«ç¹';
comment on column PAGEINFO.OPTIME
  is 'ééæ¶é´';
alter table PAGEINFO
  add constraint PK_PAGEINFO primary key (ID);
alter table PAGEINFO
  add constraint FK_PAGE_SITE foreign key (SITE_ID)
  references GRABAGE_SITECONFIG (ID);
   RIGHTS_RESOURCE      ID   NUMBER   NAME   VARCHAR2	   SERIAL_NO   NUMBER   URL   VARCHAR2   DESCP   VARCHAR2	   RSC_LEVEL   NUMBER	   PARENT_ID   NUMBERM  create table RIGHTS_RESOURCE
(
  ID        NUMBER not null,
  NAME      VARCHAR2(50),
  SERIAL_NO NUMBER(3),
  URL       VARCHAR2(255),
  DESCP     VARCHAR2(255),
  RSC_LEVEL NUMBER,
  PARENT_ID NUMBER
)
;
comment on table RIGHTS_RESOURCE
  is 'è®°å½ç³»ç»åèµæºä¿¡æ¯';
comment on column RIGHTS_RESOURCE.SERIAL_NO
  is 'æåº';
comment on column RIGHTS_RESOURCE.PARENT_ID
  is 'ç¶çº§èåID';
alter table RIGHTS_RESOURCE
  add primary key (ID);
alter table RIGHTS_RESOURCE
  add constraint FK_PARENT foreign key (PARENT_ID)
  references RIGHTS_RESOURCE (ID);
   RIGHTS_MAPPING      ID   CHAR   OP_DATE   DATE   OP_USER   CHAR   RESOURCE_ID   NUMBER   ROLE_ID   CHAR  create table RIGHTS_MAPPING
(
  ID          CHAR(32) not null,
  OP_DATE     DATE,
  OP_USER     CHAR(32),
  RESOURCE_ID NUMBER,
  ROLE_ID     CHAR(32)
)
;
comment on table RIGHTS_MAPPING
  is 'è®°å½è§è²ä¸èµæºçæ å°';
alter table RIGHTS_MAPPING
  add primary key (ID);
alter table RIGHTS_MAPPING
  add constraint FK_RIGHTS_M_REFERENCE_RIGHTS_U foreign key (OP_USER)
  references RIGHTS_USER (ID);
alter table RIGHTS_MAPPING
  add constraint FK_RIGHTS_M_RESOURCE foreign key (RESOURCE_ID)
  references RIGHTS_RESOURCE (ID);
alter table RIGHTS_MAPPING
  add constraint FK_RIGHTS_M_ROLE foreign key (ROLE_ID)
  references RIGHTS_ROLE (ID);
   USERINFO      UUID   VARCHAR2   CODE   VARCHAR2   USERNAME   VARCHAR2   PWD   VARCHAR2   FULLNAME   VARCHAR2   PNUMBER   VARCHAR2   UNIT   VARCHAR2   EMAIL   VARCHAR2   ORGUUID   VARCHAR2   ORGCODE   VARCHAR2   STATUS   VARCHAR2	  create table USERINFO
(
  UUID     VARCHAR2(32) not null,
  CODE     VARCHAR2(50),
  USERNAME VARCHAR2(50),
  PWD      VARCHAR2(50),
  FULLNAME VARCHAR2(50),
  PNUMBER  VARCHAR2(11),
  UNIT     VARCHAR2(50),
  EMAIL    VARCHAR2(50),
  ORGUUID  VARCHAR2(32),
  ORGCODE  VARCHAR2(50),
  STATUS   VARCHAR2(1) default 1
)
;
comment on table USERINFO
  is 'ä¸­å¿ç¨æ·';
comment on column USERINFO.UUID
  is 'ID';
comment on column USERINFO.CODE
  is 'ç¼ç ';
comment on column USERINFO.USERNAME
  is 'ç¨æ·å';
comment on column USERINFO.PWD
  is 'å¯ç ';
comment on column USERINFO.FULLNAME
  is 'å§å';
comment on column USERINFO.PNUMBER
  is 'ææºå·ç ';
comment on column USERINFO.UNIT
  is 'æå±åä½';
comment on column USERINFO.EMAIL
  is 'é®ä»¶';
comment on column USERINFO.ORGUUID
  is 'æºæid';
comment on column USERINFO.ORGCODE
  is 'æºæç¼ç ';
comment on column USERINFO.STATUS
  is 'ç¶æ';
alter table USERINFO
  add constraint PK_USERINFO primary key (UUID);
       Ô  Ô   h¦     0.0    402881e7406c98f401406c9a5cb30001   rights_user   status   1   æ­£å¸¸   è§è²æ¯æ­£å¸¸ç¶æ    402881e7406cac9d01406caf0dc20001   rights_user   status   0   å³é­ÿÿÿÿ    402881e7406d513e01406d5590170001   rights_role   status   1   å¼å¯   å¯ç¨çè§è²    402881e7406d513e01406d55da520002   rights_role   status   0   å³é­ÿÿÿÿ    402881e54178cfb7014178d9258f0003   DATA_ORIGINAL   status   1	   å·²è¯å«   è¯å«æå    402881e54178cfb7014178d9877c0004   DATA_ORIGINAL   status   2   è¯å«å¤±è´¥   è¯å«ä¸­å¤±è´¥    402881e54178cfb7014178d8ceb50002   DATA_ORIGINAL   status   0   æ°å»º   ååæ¶éæä¸ä¼     402882e44251cacc014251d8c1530000
   webService
   appMonitor   1   ä¿®æ¹ä¸ºwsdlå°å   åºç¨çæ§ä¿¡æ¯æ¥å£    402881e440fd335d0140fd6886390001   log_busi   op_type   1   æ°å¢   æ°å¢æä½    402881e440fd335d0140fd6925bd0002   log_busi   op_type   2   å é¤   å é¤æä½    402881e440fd335d0140fd69656b0003   log_busi   op_type   3   ä¿®æ¹   ä¿®æ¹æä½    4028808c4116579e014116588c4b0001   USERINFO   status   1   æ­£å¸¸   ä¸­å¿ç¨æ·å¤äºæ­£å¸¸ç¶æ    4028808c4116579e0141165918f40002   USERINFO   status   0   å³é­   ä¸­å¿ç¨æ·å¤äºå³é­ç¶æ    402882e4423fc83c0142403337500000
   webService   controlFeedback   1   ä¿®æ¹ä¸ºwsdlå°å   åååé¦æ¥å¿æ¥å£    402882e4423fc83c014240534bcb0001
   webService   exceptionMonitor   1   ä¿®æ¹ä¸ºwsdlå°å   å¼å¸¸çæ§ä¿¡æ¯æ¥å£    402882e4423fc83c0142406508ed0002
   webService	   appRecord   1   ä¿®æ¹ä¸ºwsdlå°å   åºç¨æ¥å¿ä¿¡æ¯æ¥å£    402882e44240aa5a0142412f74340000   wså°å   ç¨æ·ç»ç»åæ­¥   1   ä¿®æ¹ä¸ºwsdlå°å   è¯¥æå¡ç±b7æä¾    402881e54177a628014177a951070002   SYS_EARTHQUAKE   status   2   åæ­¢ÿÿÿÿ    402881e54177a628014177a8d5b90000   SYS_EARTHQUAKE   status   0   å¯å¨ÿÿÿÿ    402881e54177a628014177a9171d0001   SYS_EARTHQUAKE   status   1   è¿è¡ÿÿÿÿ       &  &   Jq      1.0    402882e442517d5e01425184089c0004   ç°åºææ¥   æ¥èªç°åº    402882e442517d5e01425188aaae0005   ç½ç»åªä½   ç½ç»åªä½    402882e442517d5e01425183bdbc0003   è¯­é³ç­çº¿å¹³å°   è¯­é³ç­çº¿å¹³å°    0                                  äººå·¥ä¸ä¼    éç³»ç»èªå¨æå.            ø)      2.0   1   16-09-2013 12:21:18   123   321   10000   8   where   16-09-2013 12:21:20   16-09-2013 12:32:20   2    0b64ee27a9d94301a3e0f114219bf03d   12-05-2008 00:00:00   1   1   1000   8   æ±¶å·   02-10-2013 00:00:00   09-10-2013 00:00:00   1              Ð      3.0    402881e74042a7a7014042ee9f4f0003   1   31-07-2013 00:00:00   09-08-2013 00:00:00   1   1   1   1   1   1   1ÿÿÿÿÿÿÿÿ       ì  ì   î/     4.0    402882e4424594db014245976d3a0000   txtÿÿÿÿ   11-11-2013 13:17:01   11-11-2013 13:17:012   /0b64ee27a9d94301a3e0f114219bf03d/æ°å­ç¼ç .txtÿÿÿÿ   æ°å­ç¼ç .txtÿÿÿÿ   593   0   1ÿÿÿÿ    0b64ee27a9d94301a3e0f114219bf03d   æå·¥ä¸ä¼     40288095418377b80141839a014e0000   pdfÿÿÿÿ   04-10-2013 21:13:29   04-10-2013 21:13:29*   \0b64ee27a9d94301a3e0f114219bf03d\AJAX.pdfÿÿÿÿ   AJAX.pdfÿÿÿÿ   838476   0   1ÿÿÿÿ    0b64ee27a9d94301a3e0f114219bf03d   æå·¥ä¸ä¼     40288096419252b201419255c7790000   mp3ÿÿÿÿ   07-10-2013 17:53:17   07-10-2013 17:53:172   \0b64ee27a9d94301a3e0f114219bf03d\å³å»åºå.mp3ÿÿÿÿ   å³å»åºå.mp3ÿÿÿÿ   393298   0   1ÿÿÿÿ    0b64ee27a9d94301a3e0f114219bf03d   æå·¥ä¸ä¼     40288096419c24bf01419c28d6ee0000   pngÿÿÿÿ   09-10-2013 15:40:24   09-10-2013 15:40:24<   \0b64ee27a9d94301a3e0f114219bf03d\QQæªå¾20130713193827.pngÿÿÿÿ   QQæªå¾20130713193827.pngÿÿÿÿ   43127   0   1ÿÿÿÿ    0b64ee27a9d94301a3e0f114219bf03d   æå·¥ä¸ä¼        ±   ±    W(      5.0    402881e5419d4da301419d51a2f60000   09-10-2013 21:04:35   01-10-2013 00:00:00   xxx   1   1   xxxx   xx   xx   8   1ÿÿÿÿÿÿÿÿÿÿÿÿ    40288095418377b80141839a014e0000       à  à   £     6.0    402882ef4217dd67014217df27560000	   å»ºç­ç©   ä¸çº§åç±»ÿÿÿÿ    402882ef4217dd67014217df7bc80001   å»é¢ÿÿÿÿ    402882ef4217dd67014217df27560000    402882ef4217dd67014217dfe10f0002   å­¦æ ¡ÿÿÿÿ    402882ef4217dd67014217df27560000    402882ef4217dd67014217e16f240003   äº¤éç³»ç»ç ´ÿÿÿÿÿÿÿÿ    402882ef4217dd67014217ec7e200004   æ¬¡çç¾å®³ÿÿÿÿÿÿÿÿ    402882ef4217dd67014217ed437e0005   ç»ææ°´ç³»ç»ÿÿÿÿÿÿÿÿ    402882ef4217dd67014217ed63530006   ä¾çµç³»ç»ÿÿÿÿÿÿÿÿ    402882ef4217dd67014217ed83680007   ä¾æ°ç³»ç»ÿÿÿÿÿÿÿÿ    402882ef4217dd67014217eda72e0008   éè®¯ç³»ç»ÿÿÿÿÿÿÿÿ    402882ef4217dd67014217edc9c50009   å°é¢åå½¢åç ´åÿÿÿÿÿÿÿÿ    402882ef4217dd67014217f716c5000a   äººåæåµÿÿÿÿÿÿÿÿ       ®  ®   ¼u      7.0    402882ef4218027501421805e7a40000   æ­»äº¡ÿÿÿÿ    402882ef4217dd67014217f716c5000a    402882ef42180275014218063eea0001   åä¼¤ÿÿÿÿ    402882ef4217dd67014217f716c5000a    402882ef42180275014218069a660002   åå°ÿÿÿÿ    402882ef4217dd67014217f716c5000a    402882ef4218027501421806b80e0003   ååÿÿÿÿ    402882ef4217dd67014217f716c5000a    402882ef4218027501421806de6f0004   å¤±è¸ªÿÿÿÿ    402882ef4217dd67014217f716c5000a            àµ      10.0    402881e74068d5d1014068d65b410001   ç³»ç»ç®¡çå   ç³»ç»ç®¡çå   1   å¯ä»¥åä»»ä½äº!!!   *    4028808c41637fc50141638e74f10000   ç³»ç»æä½å   æ¯ç³»ç»ç®¡çåæéç¨ä½   10   ä¸è½æ§è¡æéç®¡çï¼ç è¡¨éç½®ç­ä»»å¡   *    4028808c41637fc50141639054d6000d	   è®¿é®è   æ®éè®¿é®è   1*   åªè½çç¸å³æ°æ®ï¼ä¸è½åå¢å æ¹   *:list,*:show,Earthquake:*       R  R   7N      11.0    402881e74042a06d014042a1550e0002   admin(   7C4A8D09CA3762AF61E59520943DC26494F8941B   zhengwei   1   1   1   1   13038231133    402881e74068d5d1014068d65b410001    4028808c41637fc501416392ac64001a   v(   86E3CA1C45728EA583ACFC4321ACFC2438FDD1A3	   è®¿é®è   1ÿÿÿÿÿÿÿÿÿÿÿÿ   12300000000    4028808c41637fc50141639054d6000d       Ç  Ç   ã      14.0    4028808c412bcd5701412bd1727f0001=   //div[@class='img_wrapper'],//p[@style='text-align: center;']   //div[@class='show_author']   id('artibody')-   http://roll.news.sina.com.cn/news/gnxw/gdxw1/8   http://roll.news.sina.com.cn/news/gnxw/gdxw1/index.shtml   2   id('media_name')   //a[@title='ä¸ä¸é¡µ']   //meta[@name='description']   id('pub_date')   id('artibodyTitle')   1%   //ul[@class='list_009']//li//a[@href]ÿÿÿÿ   æ°æµªå½åæ°é»       Ð  Ð   Í     15.0    38b44b16a780443790dfdb07d8693b72   3    402881e74042a06d014042a1550e0002   11-11-2013 21:21:48+   RightsRoleAction$$EnhancerByCGLIB$$2af6330e   0:0:0:0:0:0:0:1   nullð   update RIGHTS_ROLE set DESCP="æ®éè®¿é®è", NAME="è®¿é®è", PERM="*:list,*:show,EarthquakeAction:*", 
REMARK="åªè½çç¸å³æ°æ®ï¼ä¸è½åå¢å æ¹", STATUS="1" where ID="4028808c41637fc50141639054d6000d" 
 {executed in 370 msec}    5d13d56a1f354049b2721701f77b735d   2    402881e74042a06d014042a1550e0002   11-11-2013 12:35:42   DataOriginalAction   0:0:0:0:0:0:0:1   null]   delete from DATA_ORIGINAL where ID="402880954182b62c014182b792cc0000" 
 {executed in 79 msec}    0afd58bd1eb74e9b879deb174fd53bd2   2    402881e74042a06d014042a1550e0002   11-11-2013 12:35:42   DataOriginalAction   0:0:0:0:0:0:0:1   null\   delete from DATA_ORIGINAL where ID="4028809541832fae0141833517400000" 
 {executed in 0 msec}    cd5f45fa696547ca80ccd7e6af86276e   1    402881e74042a06d014042a1550e0002   11-11-2013 13:17:01   DataOriginalAction   0:0:0:0:0:0:0:1   nullØ  insert into DATA_ORIGINAL (BATCH, COLL_TIME, eventId, FILE_SIZE, FILENAME, FMT_FNAME, FORM, 
JOB_ID, LOCALE_FMT_URL, LOCALE_URL, NOTICE_TIME, originalName, REMOTE_URL, STATUS, ID) values 
(1, "11/11/2013 13:17:01.099", "0b64ee27a9d94301a3e0f114219bf03d", 593, "æ°å­ç¼ç .txt", NULL, "txt", 
NULL, NULL, "/0b64ee27a9d94301a3e0f114219bf03d/æ°å­ç¼ç .txt", "11/11/2013 13:17:01.099", "æå·¥ä¸ä¼ ", 
NULL, 0, "402882e4424594db014245976d3a0000") 
 {executed in 31 msec}    b3215dda7e8143b4924bb019376bfc15   3    null                               10-11-2013 10:02:25   null	   127.0.0.1   null   åºæ¥ç»æï¼äºä»¶IDï¼1    cb7f848cd0e54281b5f023ff37e08011   3    402881e74042a06d014042a1550e0002   11-11-2013 12:27:46   RightsUserAction   0:0:0:0:0:0:0:1   null*  update RIGHTS_USER set DEPT_ID=NULL, EMP_ID=NULL, NAME="è®¿é®è", ORG_ID=NULL, PASSWORD="86E3CA1C45728EA583ACFC4321ACFC2438FDD1A3", 
PHONENUMBER="12300000000", ROLE_ID="4028808c41637fc50141639054d6000d", STATUS=1, USERNAME="v" 
where ID="4028808c41637fc501416392ac64001a" 
 {executed in 109 msec}    fa6d437ce3794e4681a278f2d048dd7a   1    null                               09-11-2013 22:13:14   null	   127.0.0.1   nullC   åºæ¥å¯å¨ï¼å°éäºä»¶ï¼1 1384006392483 where 123 321 8 10000    a41fb3e4e99044b18ace6a11e6be079d   1    402881e74042a06d014042a1550e0002   10-11-2013 17:32:24   GrabageSiteconfigAction   0:0:0:0:0:0:0:1   null   ééäº40ä¸ªé¡µé¢çåå®¹    c7da3d43bcae4dfb8461ed3e782d2c64   2    402881e74042a06d014042a1550e0002   13-11-2013 12:00:23   DataOriginalAction   0:0:0:0:0:0:0:1   null_   delete from DATA_ORIGINAL where ID="402880964192bd6c014192c00c800000" 
 {executed in 2510 msec}    c3de3ee47e494af1a3d45b395315086c   1    402881e74042a06d014042a1550e0002   13-11-2013 15:47:30   SysOriginTypeAction   0:0:0:0:0:0:0:1   null   insert into SYS_ORIGIN_TYPE (DESCP, NAME, ID) values ("aaa", "aaa", "402882e4425059a90142506de5000000") 
 {executed in 1830 msec}    2ba1f8d9a678480d988889d3c3ed0fc5   1    402881e74042a06d014042a1550e0002   13-11-2013 15:47:52   SysOriginTypeAction   0:0:0:0:0:0:0:1   null~   insert into SYS_ORIGIN_TYPE (DESCP, NAME, ID) values ("aaa", "aaa", "402882e4425059a90142506e440e0001") 
 {executed in 0 msec}    6b80768fca814dedbda8a19b67fad39d   1    402881e74042a06d014042a1550e0002   13-11-2013 15:48:39   SysOriginTypeAction   0:0:0:0:0:0:0:1   null~   insert into SYS_ORIGIN_TYPE (DESCP, NAME, ID) values ("aaa", "aaa", "402882e4425059a90142506efb960002") 
 {executed in 0 msec}    2b48e88ffc3b4f148c709aec4adb8015   2    402881e74042a06d014042a1550e0002   13-11-2013 15:48:47   SysOriginTypeAction   0:0:0:0:0:0:0:1   null`   delete from SYS_ORIGIN_TYPE where ID="402882e4425059a90142506de5000000" 
 {executed in 580 msec}    6d695748ab824f2ca779419ebf0ed429   2    402881e74042a06d014042a1550e0002   13-11-2013 15:48:47   SysOriginTypeAction   0:0:0:0:0:0:0:1   null_   delete from SYS_ORIGIN_TYPE where ID="402882e4425059a90142506e440e0001" 
 {executed in 10 msec}    5d7a30b187bf415fa3a3068161b2e1cb   2    402881e74042a06d014042a1550e0002   13-11-2013 15:48:47   SysOriginTypeAction   0:0:0:0:0:0:0:1   null_   delete from SYS_ORIGIN_TYPE where ID="402882e4425059a90142506efb960002" 
 {executed in 40 msec}    6801da47737d44fe8b32243c3ae54d7b   1    402881e74042a06d014042a1550e0002   13-11-2013 15:49:04   SysOriginTypeAction   0:0:0:0:0:0:0:1   null}   insert into SYS_ORIGIN_TYPE (DESCP, NAME, ID) values ("aa", "aa", "402882e4425059a90142506f59c40003") 
 {executed in 10 msec}    628d7a61df8a458081c6783fc9d04fbc   2    402881e74042a06d014042a1550e0002   13-11-2013 15:49:07   SysOriginTypeAction   0:0:0:0:0:0:0:1   null_   delete from SYS_ORIGIN_TYPE where ID="402882e4425059a90142506f59c40003" 
 {executed in 10 msec}    de3b110005e7461ea1aa43baa620cf2a   3    402881e74042a06d014042a1550e0002   13-11-2013 20:49:59   SysOriginTypeAction   0:0:0:0:0:0:0:1   nullv   update SYS_ORIGIN_TYPE set DESCP="éç³»ç»èªå¨æå.", NAME="äººå·¥ä¸ä¼ " where ID="0 " 
 {executed in 1240 msec}    6cc962d941b542488443c9c021b14042   1    402881e74042a06d014042a1550e0002   13-11-2013 20:50:35   SysOriginTypeAction   0:0:0:0:0:0:0:1   null   insert into SYS_ORIGIN_TYPE (DESCP, NAME, ID) values ("test", "test", "402882e442517d5e0142518366f80002") 
 {executed in 80 msec}    935e3dd490024a349927e0a362dae888   1    402881e74042a06d014042a1550e0002   13-11-2013 20:50:57   SysOriginTypeAction   0:0:0:0:0:0:0:1   null   insert into SYS_ORIGIN_TYPE (DESCP, NAME, ID) values ("è¯­é³ç­çº¿å¹³å°", "è¯­é³ç­çº¿å¹³å°", "402882e442517d5e01425183bdbc0003") 
 {executed in 0 msec}    014744869cd34b30b4787763f7efd296   2    402881e74042a06d014042a1550e0002   13-11-2013 20:51:02   SysOriginTypeAction   0:0:0:0:0:0:0:1   null`   delete from SYS_ORIGIN_TYPE where ID="402882e442517d5e0142518366f80002" 
 {executed in 131 msec}    c1bb6b1aa6604152a49d8681a2ecb1ae   1    402881e74042a06d014042a1550e0002   13-11-2013 20:51:16   SysOriginTypeAction   0:0:0:0:0:0:0:1   null   insert into SYS_ORIGIN_TYPE (DESCP, NAME, ID) values ("æ¥èªç°åº", "ç°åºææ¥", "402882e442517d5e01425184089c0004") 
 {executed in 0 msec}    6f0347de212943e2a58f42b8a18a6bda   1    402881e74042a06d014042a1550e0002   13-11-2013 20:56:20   SysOriginTypeAction   0:0:0:0:0:0:0:1   null   insert into SYS_ORIGIN_TYPE (DESCP, NAME, ID) values ("ç½ç»åªä½", "ç½ç»åªä½", "402882e442517d5e01425188aaae0005") 
 {executed in 0 msec}       %» %»  Ø¯&    19.0    402882e4424159100142415ad2f800171   åäº¬1å¤ç¾¤ç§æ¿èµ·ç« 139å¹³ç±³ç§ä½è¿20äºº7   http://news.sina.com.cn/c/2013-11-10/121728670511.shtml   10-11-2013 12:17:00ë  å¤®å¹¿ç½åäº¬11æ10æ¥æ¶æ¯ï¼è®°èææèï¼æ®ä¸­å½ä¹å£°ãå¤®å¹¿æ°é»ãæ¥éï¼åäº¬1å¤ç¾¤ç§æ¿æ¨å¤©åçäºç«ç¾ï¼è¿ä¸ªæ¿å±139å¹³ç±³ç§ä½è¿20äººã
 å¤§çº¦æ¯å¨æ¨å¤©ä¸­å12ç¹å·¦å³ï¼åäº¬ä¸ä¸ç¯åäºç¾ç¯å®¶å­20å·æ¥¼2005å®¤åçäºå¤§ç«ï¼è¿ä¸ªç«å¿æç»­äºæå°è¿ä¸ä¸ªå°æ¶çæ¶é´ï¼èµ¶å°çæ¶é²åå°å°å¤§ç«æç­ï¼æå¹¸çæ¯æ²¡æäººåçä¼¤äº¡ãæ ¹æ®è®°èäºè§£äºæåå ç°å¨æçæ¯å°ç®±ç­è·¯å¼èµ·çã
 ä»å°åºçç©ä¸äººåäºè§£å°ï¼èµ·ç«çåå å¶å®æ¯ä¸ä¸ªç¾¤ç§æ¿ï¼139å¹³æ¹ç±³è¢«éæ­æ6ã7ä¸ªåé´ï¼ç§ç»äºè¿20ä¸ªäººä½ãå¶å®æ©å¨ä»å¹´ç7æåäº¬å°±åºå°äºåºç§æ¿å±äººåå±ä½é¢ç§¯çæ åï¼è§å®åºç§æ¿äººåå±ä½é¢ç§¯ä¸è½ä½äº5å¹³æ¹ç±³ï¼åä¸ªæ¿é´ä¸è½è¶è¿2äººï¼ä¸è½åå²åºç§ï¼ä¸è½æåºä½åºç§ãå¨æ¿ãå«çé´ãé³å°åå°ä¸å®¤é½æ¯ä¸è½åºç§çã
ï¼åæ é¢ï¼åäº¬ä¸åºç§å±èµ·ç« 20äººâèå±â139å¹³ç±³ï¼
ï¼ç¼è¾ï¼SN095ï¼   ï¼ç¼è¾ï¼SN095ï¼   ä¸­å½å¹¿æ­ç½D  å¤®å¹¿ç½åäº¬11æ10æ¥æ¶æ¯ï¼è®°èææèï¼æ®ä¸­å½ä¹å£°ãå¤®å¹¿æ°é»ãæ¥éï¼åäº¬1å¤ç¾¤ç§æ¿æ¨å¤©åçäºç«ç¾ï¼è¿ä¸ªæ¿å±139å¹³ç±³ç§ä½è¿20äººãå¤§çº¦æ¯å¨æ¨å¤©ä¸­å12ç¹å·¦å³ï¼åäº¬ä¸ä¸ç¯åäºç¾ç¯å®¶å­20å·æ¥¼2005å®¤åçäºå¤§ç«ï¼è¿ä¸ªç«å¿æç»­äºæå°è¿ä¸ä¸ªå°æ¶ç    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ad23b0016@   ç¦å·åºåä¸åº§å®æ´åä»£å¤å¢ å¢è¾¹ä¸æ¾è¢«å»ºåç²ªæ± 7   http://news.sina.com.cn/c/2013-11-10/124328670571.shtml   10-11-2013 12:43:00B	  æ¬æ¥ç¦å·11æ9æ¥çµ(è®°èé«å»ºè¿) ç¦å»ºç¦å·ä¸å±æ°å°åºå¨å¯¹æ§æ¿è¿è¡å è£çµæ¢¯æ¶ï¼ç«ç¶æåºä¸åº§ä¿å­å®æ´çåå¹´å¤å¢ãåç»åå¤å¤©çç´§å¼ å·¥ä½ï¼èå¤äººå9æ¥ç»æäºå¯¹å¤å¢çèå¤åæå·¥ä½ï¼ä»ä¸­åºåäº30å¤ä»¶å½¢å¶ç²¾ç¾çåä»£éç·ãç¸å³äººå£«è¡¨ç¤ºï¼è¿åº§å¢è¬åéªè¬ååæ äºå½æ¶ç¦å·ççæ´»é£ä¿åè²ï¼æ¯æä¸ºé¾å¾çç ç©¶å®ç©ã 
    æ®äºè§£ï¼è¿åº§åä»£å¤å¢ä½äºç¦å·å¸ä»å±±åºä¸æ¥å··ç¦å·åè½çµåä½å®åºåã9æ22æ¥ä¸åï¼å·¥äººå¨å­å·æ¥¼åä¸ºçµæ¢¯äºææ·±åçæ¶åï¼é²åºäºå åå¸¦æéé±æ ·å¼çéç ãæ½å·¥æ¹å½å³åå·¥å¹¶æ¨æäºæç©é¨é¨ççµè¯ãä»å½å¤©åç°å¤å¢å¼å§ï¼å°åºä¸é¨èè¯·äºä¿å®24å°æ¶å¼ç­ï¼ä»¥é²å¤å¢è¢«äººä¸ºç ´åã
 ç¦å·å¸èå¤éç¸å³è´è´£äººåè¯è®°èï¼çãå¸èåèå¤é10æ24æ¥è¿åºæ¸çãå å¤å¢è¾¹ä¸å°±æ¯åç²ªæ± ï¼å¢å®¤æº¢å¥ç²ªæ°´ï¼åæ»¡æ¯æ°ï¼åæå·¥ä½å°é¾ééãå¨åç¨æ¶æ¯åæ¶æ¯åï¼å·¥ä½äººåæ´å¥½é²æ¤é¢ç½©ï¼è¹²å¨å¢å®¤åä¸ç¹ç¹ææ·¤æ³¥æ¸åºå»ã
 9æ¥ä¸åï¼è®°èå¨èå¤ç°åºçå°ï¼è¿åº§ä¸¤ç±³å¤æ·±çéç å¢ç©´æ¨ªå§å¨ä¸¤æ å±æ°æ¥¼ä¸­é´ï¼é¿æ¹å½¢çå¢å®¤å®½1.8ç±³ãé¿çº¦5ç±³ï¼é«çº¦2.2ç±³ãç®åå¢ç©´å·²è¢«æå¼ï¼å·¥ä½äººåæ­£å¨ææå¹¶è£è¢ä¿å­å¢å®¤çéç ï¼å¢ç ä¸æé±çº¹ãè²è±çº¹ãå¶èçº¹ä¸ç§çº¹é¥°ã
 ç¦å·èå¤éä¸ä½ä¸å®¶åè¯è®°èï¼ç»è¿åæ­¥èè¯ï¼è¿æ¯ä¸åº§ä¿å­å®å¥½çåä»£ä¸­æä»¥åçå¤å¢ï¼å¢ä¸»åºæ¯å½å°çå¯è´µäººå®¶ãæ­¤æ¬¡èå¤å±åºå30å¤ä»¶æç©ï¼ä¸»è¦æ¯åä»£éç·ãè¿äºæç©è½åèå°ä¸é¾åå¹´ï¼ä½ä»ä¿å­å®å¥½ï¼æäºççãçå£å£¶ãåç³»ç½ãåè³ç½ãé¦çãé¶ç¶ç­ï¼å¤ä¸ºçæ´»ç¨å·ãè¿äºç·å¨é£æ ¼å¤æ´éè´ãåå½©æ¶¦æ³½ï¼ååå±ç¤ºäºä¸æ¹ç·å¨ç¥ç§å¤éçé­åã
 è¿ä½ä¸å®¶è¡¨ç¤ºï¼ç±äºå¢è¬æ²¡æè¢«ç ´åï¼åºåçå¨ç©é½å¾å®æ´ï¼æ´ä½çæ¥å°±æ¯ä¸ä¸ªå¾®ç¼©çç¤¾ä¼åºæ¯ãä»è¯´ï¼ç±äºæå³åä»£ç¦å·åå±æåµçè®°è½½æå°ï¼æ­¤æ¬¡èå¤åç°å¯¹ç ç©¶åä»£ç¦å·çé£ä¿æåä»¥åå¶ç·å·¥èºç­æçéè¦ä»·å¼ã
 æ®äºè§£ï¼åæå¤å¢èå¤åæå·¥ä½ç»æåï¼èå¤éå°å¯¹å¢ç©´è¿è¡å¼å°æ´ä½æ¬è¿ï¼å¦éåæ¢å¤åè²ï¼ä»¥ä¾ä»åè¿ä¸æ­¥èå¯ç ç©¶ã
 
ï¼ç¼è¾ï¼SN091ï¼   ï¼ç¼è¾ï¼SN091ï¼   åææ¥æ¥X  æ¬æ¥ç¦å·11æ9æ¥çµ(è®°èé«å»ºè¿)ç¦å»ºç¦å·ä¸å±æ°å°åºå¨å¯¹æ§æ¿è¿è¡å è£çµæ¢¯æ¶ï¼ç«ç¶æåºä¸åº§ä¿å­å®æ´çåå¹´å¤å¢ãåç»åå¤å¤©çç´§å¼ å·¥ä½ï¼èå¤äººå9æ¥ç»æäºå¯¹å¤å¢çèå¤åæå·¥ä½ï¼ä»ä¸­åºåäº30å¤ä»¶å½¢å¶ç²¾ç¾çåä»£éç·ãç¸å³äººå£«è¡¨ç¤ºï¼è¿åº§å¢è¬åéªè¬åå    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ad4c60018=   å½å¡é¢éæå¬å¡åå»æ´å¹´é é¡»é¿åæåç¸ç¦å©7   http://news.sina.com.cn/c/2013-11-10/120128670509.shtml   10-11-2013 12:01:00	  å¤®å¹¿ç½åäº¬11æ10æ¥æ¶æ¯ï¼è®°èå¯ä¼ç²ï¼æ®ä¸­å½ä¹å£°ãå¤®å¹¿æ°é»ãæ¥éï¼å½å¡é¢åå±ç ç©¶ä¸­å¿ä¸ä¹åå¬å¸ç"383"æ¹æ¡éæåºè®¾ç«å¬å¡åå»æ´å¹´éï¼ç«å»å¼æ¥åçç­è®®ãæ¹è¯èè®¤ä¸ºï¼æ­¤ä¸¾å®ä¸ºåç¸å¢å å¬å¡åçç¦å©ãå¶å®ï¼"å»æ´å¹´é"å·²è¯ç¹åä½å¹´ï¼ä½æ ä¸é¿ä¹ãä¸å®¶æåºï¼è¥ä¸éåå¬å¡åèªé¬å¶åº¦ãç¤¾ä¼ä¿éå¶åº¦ç­ä¸èµ·æ¹é©ï¼å»æ´å¹´éå¾æå¯è½æ²¦ä¸º"åç¸ç¦å©"ã
 å¬å¼èµææ¾ç¤º2002å¹´æ¹åæµé³åºå°äºæµé³å¸å»æ¿ä¿è¯éå¶åº¦ï¼æµé³å¸å»æ¿ä¿è¯éå®æ½æ¹æ¡ç­æä»¶ï¼å¶ä¸­è§å®ä¸ªäººå¯ä»¥ä¸åä½ç­¾è®¢åè®®å å¥å»æ¿ä¿ééä½ç³»ï¼è®¾ç«ä¸ªäººä¸æ·ï¼ä¸ªäººåéä½æç§1ï¼2çæ¯ä¾ç¼´è´¹ï¼å¦æå å¥å¯¹è±¡å¨å½å°ä»»èæåæ²¡æä»»ä½è¿æ³è¿çºªè¡ä¸ºï¼ææçä¸æ·èµéåå±ä¸ªäººæçï¼å¦ææè¿æ³è¿çºªè¡ä¸ºï¼å°ä»è¿ä¸ªä¸æ·èµéå½ä¸­æè§å®çæ¯ä¾æ£é¤ï¼å¨ææ£é¤è®°å½çç¬¬äºå¹´åä½ä¸äºéå¥ç¼´çº³ã
 æ­¤å¤å¹¿ä¸æ±é¨å¸ä¹æ¾ç»é¢å¸æ±é¨å¸å¸èå»æ¿å¬ç§¯éè¯è¡åæ³ï¼è¿ä¸ªå¶åº¦åç°è¡ä½æ¿å¬ç§¯éå¶åº¦ç±»ä¼¼ï¼ä¸ªäººåè´¢æ¿æç§1ï¼1çæ¯ä¾æ¥ç¼´è´¹ï¼ä¸åççº§å«ç¼´è´¹çæ°éä¸åï¼å¶ä¸­æé«çåçº§æ¯1600åï¼æä½çåäºåæ¯1300åï¼ç¼´è´¹å¨é¨å­å¥ä¸ªäººå¸æ·ï¼æ¯ä»¥5å¹´ä¸ºæï¼å¦ææ²¡æè¿æ³è¿çºªå¯ä»¥é¢å70%çå¬ç§¯éï¼å¦æç´å°éä¼é½å»æ´å¥å¬åå¯ä»¥é¢åå©ä½çï¼å¦åå°æä¸å®æ¯ä¾æ£é¤å¬ç§¯éä¸ç¼´å½åºã
 2003å¹´æ·±å³ä¹å°è¯è¿è®¾ç«å»æ¿éä½æ¯ç¬¬äºå¹´å¤­æï¼åºè¯¥è¯´è¿ä¸å¶åº¦çå¤­æå¤§å¤æºäºäºè®®åååï¼è´¨çèççé®æ¯å»æ´é¾éè¿è¦è´­ä¹°åï¼é£è¿æ¯ä¸æ¯åç¸çç¦å©ï¼è®¸å¤æ¯æè¿é¡¹å¶åº¦çäººé½ä¼æ¬åºåæ°å å¡ãæå½çé¦æ¸¯å°åºè¿æ ·ä¸äºç»éªã
 åäº¬èªç©ºèªå¤©å¤§å­¦å¬å±ç®¡çå­¦é¢ææå»æ´ç ç©¶ä¸æè²ä¸­å¿ä»»å»ºæè¯´æ°å å¡çå»æ´å¹´éå¶åº¦æ¯å»ºè®¾å¨å¨ç¤¾ä¼ç»ä¸ç¤¾ä¼ä¿éå¶åº¦çåºç¡ä¸ï¼å¨å¬å¡äººåçç¤¾ä¼ä¿éä¸éå äºçº¦ææºå¶ï¼ä¸åç°å¨å½åä¸äºå°åºçè¯ç¹ãå¨å¬å¡ååæçä¿éå¶åº¦ä¹å¤åå¢å äºä¸é¡¹ç¦å©ï¼é£èªç¶ä¼é¢å¯¹è´¨çæ æ³æç»­ä¸å»ã
ï¼åæ é¢ï¼å½å¡é¢éæå¬å¡åâå»æ´å¹´éâ é¿åæ²¦ä¸ºâåç¸ç¦å©âï¼
ï¼ç¼è¾ï¼SN095ï¼   ï¼ç¼è¾ï¼SN095ï¼   ä¸­å½å¹¿æ­ç½Z  å¤®å¹¿ç½åäº¬11æ10æ¥æ¶æ¯ï¼è®°èå¯ä¼ç²ï¼æ®ä¸­å½ä¹å£°ãå¤®å¹¿æ°é»ãæ¥éï¼å½å¡é¢åå±ç ç©¶ä¸­å¿ä¸ä¹åå¬å¸ç383æ¹æ¡éæåºè®¾ç«å¬å¡åå»æ´å¹´éï¼ç«å»å¼æ¥åçç­è®®ãæ¹è¯èè®¤ä¸ºï¼æ­¤ä¸¾å®ä¸ºåç¸å¢å å¬å¡åçç¦å©ãå¶å®ï¼å»æ´å¹´éå·²è¯ç¹åä½å¹´ï¼ä½æ ä¸é¿ä¹ãä¸å®¶æ    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ad5620019=   æµ·åä¸äºé­æ´é£é¨è¢­å» èªç­å»¶è¯¯çº¢è²é¢è­¦å¯å¨7   http://news.sina.com.cn/c/2013-11-10/113728670409.shtml   10-11-2013 11:37:00  è§é¢å è½½ä¸­ï¼è¯·ç¨å...
on 
 ä¸­æ°ç½ä¸äº11æ10æ¥çµ (è®°è å°¹æµ·æ)åä»å¹´ç¬¬30å·å¼ºå°é£âæµ·çâå½±åï¼æµ·åå²åé¨10æ¥å¼å§åå°å¼ºé£é¨çè¢­å»ï¼ä¸äºæ´ä¸ªä¸åé½ç¬¼ç½©å¨æ´é£é¨ä¹ä¸­ï¼æºåºå·²ç»å¯å¨å¤§é¢ç§¯èªç­å»¶è¯¯çº¢è²é¢è­¦ã
 è®°èå¨ä¸äºå¸åºçå°ï¼å¤§é£å¹çè¡è¾¹çå¤§æ åè·¯ç¯ææä¸å®ãå¼ºé£æ´é¨å¯¼è´ä¸äºå¤ä¸ªè·¯æ®µçæ¤æ åæ æ¨è¢«å¹åï¼å¤ä¸ªè·¯æ®µåºç°ç§¯æ°´ãå¨ä¸äºæ²³ä¸è·¯ãå­¦é¢è·¯ç­è·¯æ®µæå¤§åæ·å¤å¹¿åçåçµçº¿æè¢«å¹åï¼æ¨ªå§å¨è·¯ä¸ï¼å½±åäº¤éãä¸äºæ²³ä¸è·¯ãä¸äºæ¹¾æµ·æå¹¿åºãéé¸¡å²­è·¯ç­å¤ä¸ªè·¯æ®µç§¯æ°´è¾æ·±ï¼è½¦è¾éè¡ç¼æ¢ã
 âæµ·çâå¸¦æ¥çå¼ºé£å¨æµ·è¾¹æèµ·å¤§æµªãå¨ä¸äºæ¹¾ï¼ä¸å°æ¸¸äººå¨æµ·è¾¹è§æµªï¼æä¸ªå«æ¸¸äººçè³ä¸é¡¾å®å±å¨æµ·è¾¹ææµªï¼ååæé©ã
 æ¥èªä¸äºå¤å°å½éæºåºçæ¶æ¯ï¼æºåºå·²ç»å¯å¨å¤§é¢ç§¯èªç­å»¶è¯¯çº¢è²é¢è­¦ï¼åæ¶è¿å¥æå°é²æ±åºæ¥ç¶æãæªè³ä¸å10æ¶ï¼å¤å°æºåºåå°å½±åçèªç­27æ¶æ¬¡ãå¤å°æºåº10æ¥é¢è®¡åºæ¸¯æå®¢20400äººï¼å·²å®æåºæ¸¯æå®¢çº¦2900äººï¼åå½±åèªç­æå®¢æ­£åå¤å®æéåºä¼æ¯ï¼ç°å·²å®æ1500é´å®¢æ¿ã
 æ®æµ·åçæ°è±¡å°é¢æ¥ï¼å¼ºå°é£âæµ·çâä»å¤©å°ä»æµ·åå²åé¨è¿æµ·ç»è¿ï¼å°ç»æµ·åå²åé¨å°åºå¸¦æ¥å¤§æ´é¨ï¼å¹¶æ10å°11çº§å¤§é£ï¼éµé£12çº§ãæµ·åçæ°è±¡å±éè¿ç­ä¿¡æéæ°ä¼æ³¨æé²èå°é£ã
ï¼åæ é¢ï¼å¼ºå°é£âæµ·çâä¸äºåå¨ èªç­å»¶è¯¯çº¢è²é¢è­¦å¯å¨ï¼
ï¼ç¼è¾ï¼SN095ï¼   ï¼ç¼è¾ï¼SN095ï¼   ä¸­å½æ°é»ç½W  ä¸­æ°ç½ä¸äº11æ10æ¥çµ(è®°èå°¹æµ·æ)åä»å¹´ç¬¬30å·å¼ºå°é£âæµ·çâå½±åï¼æµ·åå²åé¨10æ¥å¼å§åå°å¼ºé£é¨çè¢­å»ï¼ä¸äºæ´ä¸ªä¸åé½ç¬¼ç½©å¨æ´é£é¨ä¹ä¸­ï¼æºåºå·²ç»å¯å¨å¤§é¢ç§¯èªç­å»¶è¯¯çº¢è²é¢è­¦ãè®°èå¨ä¸äºå¸åºçå°ï¼å¤§é£å¹çè¡è¾¹çå¤§æ åè·¯ç¯ææä¸å®ãå¼ºé£æ´é¨å¯¼    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ad64f001a*   ä¸­å½å¤å°äºæ¢å»ºâä¾ç½çºªå¬å­â7   http://news.sina.com.cn/c/2013-11-10/112228670316.shtml   10-11-2013 11:22:00õ  å¤®å¹¿ç½åäº¬11æ10æ¥æ¶æ¯ (è®°èæèµ¢)æ®ä¸­å½ä¹å£°ãå¤®å¹¿æ°é»ãæ¥éï¼æ1.5äº¿å¹´åå²çæé¾åç³æåªäºç§å¯ï¼æé¾æ¯å¦ä½çæ´»çåæ¯ä¸ºä»ä¹ç­äº¡çï¼ä¸ç´å¸å¼çäººç±»çå´è¶£ã"ç°å¨æå½ä»åèå¤å°æ¹åï¼åå°æ¹æ¿åºäºç¸å´å»ºæé¾åç©é¦ï¼èµå©èå¤ææï¼å¸æè½ä»¥å½å°å°åå½åæé¾ã
 ä¸å®¶æé¾åç©é¦é¦é¿ä»ç»ï¼ç­è¡·äºå»ºæé¾åç©é¦ï¼æ¯è®©äººä»¬æ´å äºè§£æå½ç¹æ®çæé¾èµæºï¼åæ¶ä¹è½æ¨å¨å½å°ç»æµãä»ä»ç»ä¸ä¸ªå¥½çæé¾åç©é¦ï¼ä¸ä»ææé¾åç³ï¼è¿æåæç§æä»¿çæ´»ä½æé¾ï¼å°±åä¸ä¸ªçå®ç"ä¾ç½çºªå¬å­"ãä¸å°å®¶é¿å¸¦å­©å­å°±å¯ä»¥äºè§£å²åé¸ççé£éï¼åæ¶å­¦ä¹ å°æé¾æ¹é¢çç§æ®ç¥è¯ãå´å»ºæé¾åç©é¦ä¹å¯ä»¥å¸å¼åäººæèµï¼å ä¸ºæäºåäººè§å¾ï¼æ¢ç¶è¿å¤æ¶åçæé¾é½å¨æ­¤æ æ¯ï¼é£ä¹è¿å¿ä¸å®æ¯ä¸ªå¥½å°æ¹"è¿ä¹å°±æ¯å¤§å®¶ä¸ºä»ä¹è¦ç­è¡·äºå»ºæé¾åç©é¦ã
 æå¤åªæ¥éï¼ä¸­å½äººå°æä¸ºå¨çæªæ¥æææé¾åç³çä¸»åã
 å¨è®¸å¤æåµä¸ï¼å¨ä¸­å½åç°çæ°ç©ç§é½ä¼å¼åå¯¹æé¾çç©å­¦ãæé¾è¿åãæé¾æ¶äº¡çä¸ç§åæï¼å¨æå½ä¸é¨å°±åç°äºå¤§éçæé¾èåæé¾çèèï¼å¬çäºè¿ä¸ªæé¾æé¿çæ°çè®ºã
 æè¿å¨ä¸­å½å±±ä¸çä¹åç°äºå¨ä¸çæå¤§çæé¾çå¢ç©´ï¼æè°ä¸åç§ç±»çæé¾ä¸ºä»ä¹èéå¨ä¸åæä¾äºä¸ä¸ªçè®ºçåºç¡ã
 ä¸­å½ç§å­¦é¢å¤èæ¤å¨ç©ä¸å¤äººç±»ç ç©¶æçé«çº§ç ç©¶åå¾æä»ç»ï¼ç»ä¸ä¸ªä¸çºªä»¥æ¥ï¼ä¸­å½åç°äºå¤§éçæé¾åç³ï¼ä½è¿å»å½åå¯¹è¿ä¸ªé¢åå´è¶£å¹¶ä¸æ¯å¾å¤§ï¼è¿åå¹´æ¥éçæå½çç»æµæç»­çé«éåå±ï¼äººä»¬å¯¹æé¾çå´è¶£ä¹æ¯æ°´æ¶¨è¹é«ã
 å¾ææä»ç»ä»åå¥è¡çæ¶ååªæä¸ä¸ªäººç ç©¶å¤èæ¤å¨ç©ï¼ç°å¨ä»ä»¬ç ç©¶è¯´æ¯å¹´é½ä¼æ20å¤åå­¦çï¼èä¸å¨å¨å½åå°ä¹æ¯æç«äºä¸æ­çæ°çç ç©¶æºæï¼åå°ä¹æ¯äºåçå´åæé¾çåç©é¦ï¼èµå©æé¾çææãå æ­¤å¤åªå°±è®¤ä¸ºæå½å°±ä¼æä¸ºå¨çæªæ¥æææé¾çä¸»åï¼è¿æ ·å¶å®æå©äºå¨ä¸çå¿ç«¥çå­¦ä¹ ååæ¬¢æé¾çå­©å­ä»¬çæé¿ã
(åæ é¢ï¼ä¸­å½æèµ·æé¾ç­ å¤å°äºæ¢å»ºâä¾ç½çºªå¬å­â)
ï¼ç¼è¾ï¼SN095ï¼   ï¼ç¼è¾ï¼SN095ï¼   ä¸­å½å¹¿æ­ç½Y  å¤®å¹¿ç½åäº¬11æ10æ¥æ¶æ¯(è®°èæèµ¢)æ®ä¸­å½ä¹å£°ãå¤®å¹¿æ°é»ãæ¥éï¼æ1.5äº¿å¹´åå²çæé¾åç³æåªäºç§å¯ï¼æé¾æ¯å¦ä½çæ´»çåæ¯ä¸ºä»ä¹ç­äº¡çï¼ä¸ç´å¸å¼çäººç±»çå´è¶£ãç°å¨æå½ä»åèå¤å°æ¹åï¼åå°æ¹æ¿åºäºç¸å´å»ºæé¾åç©é¦ï¼èµå©èå¤ææï¼å¸æè½ä»¥å½å°å°    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ad70c001b0   æ¹åä¸åäº¤è­¦æ§å¤æ¶è¢«è¿åºå­åèº«äº¡7   http://news.sina.com.cn/c/2013-11-10/111928670253.shtml   10-11-2013 11:19:00  æ°åç½é¿æ²11æ10æ¥çµ(è®°è ç¦¹å¿æ)æ¹åçéµé³æ­¦åå¸ä¸äº¤è­¦11æ9æ¥å¨æ§å¤ä¸­ä¸ºä¿æ¤åè­¦åå¨å´ç¾¤ä¼è¢«åºèº«äº¡ï¼ç®ååè­¦èº«è´éä¼¤æ­£å¨å»é¢æ¢æï¼ç¯ç½ªå«çäººå·²è¢«æ§å¶ã
 è®°èä»æ­¦åå¸ç¸å³é¨é¨äºè§£å°ï¼11æ9æ¥14æ¶16åè®¸ï¼æ­¦åå¸éå®è·¯ä¸å®éªå°å­¦äº¤åè·¯å£åçä¸èµ·äº¤éäºæï¼è½¦çä¸ºâæ¹E7F393âçå°è½¦ä¸âç²¤BUX399âå°åè¶éå°è½¦åçç¢°æãæ­¦åå¸å¬å®å±äº¤è­¦å¤§éååºä¸­éå¯ä¸­éé¿æ¨ææ´ªæ¥è­¦åè¿éèµ¶å°ç°åºï¼åéªå®ç°åºåï¼ä¸ºçå¯¼äº¤éï¼æ­£åå¤å°åæ¹äºæè½¦è¾åé©¾é©¶äººåä¸èµ·å¸¦å°äº¤è­¦å¤§éå¤çæ¶ï¼âæ¹E7F393âè½¦é©¾é©¶äººèèçªç¶æå¶å¨åºä¼¤åè­¦å¨ç¿ï¼æ¨ææ´ªä¸ºä¿æ¤å¨ç¿ä¸åå¤ºåå¶å¨ï¼è¢«èèè¿åºå­åã
 å¨ç°åºç¾¤ä¼çåå©ä¸ï¼ç¯ç½ªå«çäººèèè¢«å½åºæè·ãäº¤è­¦æ¨ææ´ªè¢«è¿åºå­ååè¸ãè¹é¨ä¼¤å¿ä¸¥éï¼å¨éå¾å»é¢éä¸­ä¸å¹¸æ­»äº¡ï¼åè­¦å¨ç¿ç®åæ­£å¨å»é¢æ¢æä¸­ã
ï¼ç¼è¾ï¼SN095ï¼   ï¼ç¼è¾ï¼SN095ï¼	   æ°åç½K  æ°åç½é¿æ²11æ10æ¥çµ(è®°èç¦¹å¿æ)æ¹åçéµé³æ­¦åå¸ä¸äº¤è­¦11æ9æ¥å¨æ§å¤ä¸­ä¸ºä¿æ¤åè­¦åå¨å´ç¾¤ä¼è¢«åºèº«äº¡ï¼ç®ååè­¦èº«è´éä¼¤æ­£å¨å»é¢æ¢æï¼ç¯ç½ªå«çäººå·²è¢«æ§å¶ãè®°èä»æ­¦åå¸ç¸å³é¨é¨äºè§£å°ï¼11æ9æ¥14æ¶16åè®¸ï¼æ­¦åå¸éå®è·¯ä¸å®éªå°å­¦äº¤åè·¯å£    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ad9a7001e@   åäº¬è¿ä»å¬é¦æ¬¡å­çº§å¤§é£ ä¸å¨ä¹åå¨å¸å°è·ä¾æ7   http://news.sina.com.cn/c/2013-11-10/110928670249.shtml   10-11-2013 11:09:00î  å¤®å¹¿ç½åäº¬11æ10æ¥æ¶æ¯ æ®ä¸­å½ä¹å£°ãå¤®å¹¿æ°é»ãæ¥éï¼æ¨å¤©èµ·ï¼åäº¬ç»åäºä¸æ¬¡å¤§é£éæ¸©å¤©æ°ï¼åäº¬å¸æ°è±¡å°åå¸çæ°æ®æ¾ç¤ºï¼æ¨å¤©åæå°å¤é´æé«é£åè¾¾å°å­çº§ï¼è¿åºå¤§é£ä¹ä½¿ä»å¤©åäº¬çæ°æ¸©ä¹ä¸è·¯èµ°ä½è³2âå·¦å³ãé£ä¹è¿ç§æåµä¸ï¼åäº¬ä»å¬ä¼ä¸ä¼æåä¾æå¢ï¼
 ä»11æ7å·èµ·åäº¬å¸å·²ç»å¼å§äºç¹ç«è¯ä¾æå·¥ä½ï¼æ®åäº¬å¸å¸æ¿å¸å®¹å§åå¸æ°è±¡å±ç­é¨é¨è¿è¡çæåä¸è½®ä¸´æ¶è°æ´éææå¤©æ°ä¼åç»ææ¾ç¤ºï¼ä»å¹´åäº¬çæ°è±¡æ¡ä»¶æ­£å¸¸ï¼ä¸ä¼æåä¾æã
 åäº¬å¸æ°è±¡å±ä»ç»é¢è®¡ä»å¤©å°15å·åäº¬æ°æ¸©æ¥è¿å¸¸å¹´éæ°´åå°ï¼æä¸¤æ¬¡å·ç©ºæ°æ´»å¨ï¼æ²¡æææ¾çé¨éªå¤©æ°ã
 è½ç¶æ°è±¡æ¡ä»¶æ­£å¸¸æ²¡ææåä¾æï¼ä½æ¯æ°è±¡å°ä¹åæ¶æéå¸æ°å¤åºéè¦åå¥½é²é£ä¿æçåå¤ã
 åäº¬å¸ä¾ç­åç¸å³è´è´£äººä¹è¡¨ç¤ºï¼ç°å¨èµ·åäº¬å¸ç1618å®¶ä¾ç­åä½å·²ç»éç»­å¯å¨äºç¹ç«è¯ä¾æï¼8ä¸äººå°ä¸ºåäº¬å¸ä¾æä¿é©¾æ¤èªï¼æªæ¥ä¸å¨ä¹ååäº¬å¸å±æ°å®¶éçææ°å°éæ¸ç­èµ·æ¥ï¼11æ15å·å±æ°å®¶çå®¤æ¸©å°è¾¾å°è§å®ç18åº¦ã
ï¼åæ é¢ï¼åäº¬è¿ä»å¬é¦æ¬¡å­çº§å¤§é£ ä¸å¨ä¹åå¨å¸å°è·ä¾æï¼
ï¼ç¼è¾ï¼SN095ï¼   ï¼ç¼è¾ï¼SN095ï¼   ä¸­å½å¹¿æ­ç½a  å¤®å¹¿ç½åäº¬11æ10æ¥æ¶æ¯æ®ä¸­å½ä¹å£°ãå¤®å¹¿æ°é»ãæ¥éï¼æ¨å¤©èµ·ï¼åäº¬ç»åäºä¸æ¬¡å¤§é£éæ¸©å¤©æ°ï¼åäº¬å¸æ°è±¡å°åå¸çæ°æ®æ¾ç¤ºï¼æ¨å¤©åæå°å¤é´æé«é£åè¾¾å°å­çº§ï¼è¿åºå¤§é£ä¹ä½¿ä»å¤©åäº¬çæ°æ¸©ä¹ä¸è·¯èµ°ä½è³2âå·¦å³ãé£ä¹è¿ç§æåµä¸ï¼åäº¬ä»å¬ä¼ä¸ä¼æåä¾æå¢ï¼ä»    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ad886001c5   ä¸­çºªå§è¯¦è§£ç¹éçå¯åå·¥ä½14å¹´æ¥æ°åå7   http://news.sina.com.cn/c/2013-11-10/111328670254.shtml   10-11-2013 11:13:00Ã  ä¸­æ°ç½11æ10æ¥çµ æ®ä¸­å¤®çºªå§çå¯é¨ç½ç«æ¶æ¯ï¼çå¯é¨ãçå¯æºå³ç¹éçå¯åå·¥ä½åæ³ãèª11æ1æ¥èµ·æ½è¡ï¼ä¸­çºªå§çå¯é¨ä»æ¥è¯¦ç»ä»ç»äºç¹éçå¯åå¶åº¦èª1989å¹´å»ºç«ä»¥æ¥å·¥ä½æ°ååã
 2013å¹´10æ10æ¥ï¼çå¯é¨å¬å¸ãçå¯æºå³ç¹éçå¯åå·¥ä½åæ³ãï¼å¯¹ç¹éçå¯åå·¥ä½è¿è¡æå¯¼åè§èï¼èª11æ1æ¥èµ·æ½è¡ãè¿æ¯çºªæ£çå¯æºå³è½¬èè½ãè½¬æ¹å¼ãè½¬ä½é£çå·ä½æªæ½ãä¸ºä½¿å¹¿å¤§ç½åæ´å å¨é¢äºè§£ç¹éçå¯åå·¥ä½ï¼ä¸­å¤®çºªå§çå¯é¨ç½ç«è¯¦ç»ä»ç»äºç¹éçå¯åå·¥ä½æ°ååã
 ä¸­å¤®çºªå§çå¯é¨æåºï¼ç¹éçå¯åå¶åº¦æ¯çºªæ£çå¯å·¥ä½çéè¦ç»æé¨åï¼æ¯ä¾é äººæ°ç¾¤ä¼å¼å±åèå¡å»å·¥ä½çéè¦éå¾ãèª1989å¹´çå¯é¨å»ºç«ç¹éçå¯åå¶åº¦ä»¥æ¥ï¼ç¹éçå¯åå·¥ä½å¨å¨å½åçº§çå¯æºå³éæ­¥æ¨å¼ãå®è·µè¯æï¼ç¹éçå¯åå¨åèå¡å»å·¥ä½ä¸­åæ¥äºéè¦ä½ç¨ã
 ä¸­å½å±äº§ååå«å¤§ä»¥æ¥ï¼ä¸­å¤®çºªå§çå¯é¨å¯¹ç¹éçå¯åå·¥ä½æåºæ°çæ´é«çè¦æ±ï¼ä¸ºåå¥½ç¹éçå¯åå·¥ä½ï¼ä¸­å¤®çºªå§çå¯é¨å¨è®¤çæ»ç»20å¤å¹´ç¹éçå¯åå·¥ä½ææåæ³åç»éªçåºç¡ä¸ï¼æ ¹æ®åé£å»æ¿å»ºè®¾ååèè´¥å·¥ä½æ°å½¢å¿ãæ°ä»»å¡çè¦æ±ï¼å¶å®äºãçå¯æºå³ç¹éçå¯åå·¥ä½åæ³ãã
 ä¸­å¤®çºªå§çå¯é¨æåºï¼çºµè§ç¹éçå¯åå·¥ä½åå±åç¨ï¼è¿é¡¹å·¥ä½æä»¥ä¸å ä¸ªæ°ååï¼
 å·¥ä½å¶åº¦éæ­¥è§è
 1991å¹´ï¼çå¯é¨å¶å®äºãçå¯é¨èè¯·ç¹éçå¯ååæ³ããä»åç§°ä¸­å°±å¯ä»¥çåºï¼è¿ä¸ªåæ³è§èçå¯¹è±¡ä»æ¯çå¯é¨ï¼å¯¹å°æ¹çå¯æºå³æ²¡ææ¶åãéçå½¢å¿çåå±ï¼è¯¥åæ³å·²ä¸éåºå½ååä»åå·¥ä½çéè¦ãä¸­å¤®çºªå§çå¯é¨æ ¹æ®æ°å½¢å¿æ°ä»»å¡çè¦æ±ï¼ç ç©¶å¶å®äºãçå¯æºå³ç¹éçå¯åå·¥ä½åæ³ãï¼å¹¶ä»¥çå¯é¨ä»¤çå½¢å¼åå¸ï¼è§èçå¯¹è±¡æ´å¹¿ï¼éç¨äºå¨å½çå¯æºå³ã
 ç¹éçå¯åçåºæ¬æ¡ä»¶
 ãçå¯æºå³ç¹éçå¯åå·¥ä½åæ³ãååºäº7æ¡ç¹éçå¯ååºå½å·å¤çåºæ¬æ¡ä»¶ãå¨è¦æ±ç¹éçå¯åæå±¥è¡èè´£ç¸åºçæ¿æ²»ç´ è´¨ãä¸ä¸ç¥è¯ãæ¿ç­æ°´å¹³åå·¥ä½è½åçåºç¡ä¸ï¼çªåºäºç¹éçå¯åå¨åèªé¢åçå½±ååãä»è¿æ¬¡æ°åå¸ççå¯é¨ç¹éçå¯åååä¸­å°±å¯ä»¥çåºï¼ä»ä»¬æçå¨æ°é»åªä½åäºèç½ä¸æç§¯æçå½±åï¼æçä¸ä¸é¢ååç ç©¶æ¹åä¸åèå¡å»å·¥ä½ç´§å¯ç¸è¿ï¼å¯¹çç£å·¥ä½ä¸ä»å³æ³¨ï¼èä¸æç ç©¶ãè¿æ ·åæå©äºè¿ä¸æ­¥æé«ç¹éçå¯åå·¥ä½çç¤¾ä¼å½±ååï¼ä¼åäººåç»æï¼ä¿ä½¿ç¹éçå¯ååæ¥æ´å ç§¯æçä½ç¨ã
 ç¹éçå¯åçä¸»è¦èè´£
 ãçå¯æºå³ç¹éçå¯åå·¥ä½åæ³ãååºäº6æ¡ç¹éçå¯åçèè´£ãå½çº³èµ·æ¥ï¼å°±æ¯è¦æ±ç¹éçå¯åå­åä¼å¿åç¹é¿ï¼åæ¥å¨è¯¢ãèç³»ãå®£ä¼ ãçç£ç­4ä¸ªæ¹é¢ä½ç¨ãå¨è¯¢ï¼å°±æ¯å©ç¨èªå·±çä¸ä¸ç¥è¯ï¼ç§¯æåæ¥å»ºè¨ç®ç­ï¼åè°å©æçä½ç¨ï¼èç³»ï¼æ¯æèç³»ç¾¤ä¼ï¼åæ¶äºè§£ç¾¤ä¼çå¼å£°åè¦æ±å¹¶åæ ç»çºªæ£çå¯æºå³ï¼åæ¥æ¡¥æ¢çº½å¸¦ä½ç¨ï¼å®£ä¼ ï¼å°±æ¯ä»¥èªå·±åä¸çºªæ£çå¯å·¥ä½çåèº«ä½ä¼ï¼å®£ä¼ çºªæ£çå¯æºå³çæ§è´¨ãèè½ååèå¡å»çææï¼å¢å¼ºå¹¿å¤§ç¾¤ä¼å¯¹çºªæ£çå¯å·¥ä½ççè§£åæ¯æï¼çç£ï¼å°±æ¯éè¿åä¸åç±»ä¸é¡¹æ£æ¥ç­çºªæ£çå¯ä¸å¡å·¥ä½ï¼åæ¥åéçç£ä½ç¨ãä¸æ¹é¢çç£çå¯å¯¹è±¡æ´å¥½å°å±¥è¡èè½ï¼å¦ä¸æ¹é¢ä¹å¯¹è¡æ¿çå¯å·¥ä½è¿è¡çç£ï¼ä¿è¿çå¯æºå³ä¸æ­æ¹è¿å·¥ä½ï¼è¿æ¯çå¯æºå³èªè§æ¥åçç£çä½ç°ã
 ç¹éçå¯åçéèç¨åº
 ãçå¯æºå³ç¹éçå¯åå·¥ä½åæ³ãååºäºèä»»ç¹éçå¯åç5é¨ç¨åºï¼ä»ä¸­å¯ä»¥çåºæåºäººéåè¿è¡èå¯åç±çå¯æºå³çµå¤´ï¼åæ¥ä¸»å¯¼ä½ç¨ã
 ç¹éçå¯åçæ¢å±åä»»æ
 1991å¹´ï¼çå¯é¨å°åçãçå¯é¨èè¯·ç¹éçå¯ååæ³ãè§å®ç¹éçå¯åçä»»ææ¯ä¸å¹´ã1996å¹´ï¼ä¸­å¤®çºªå§çå¯é¨å¯¹ç¹éçå¯åä»»æä½äºä¿®æ¹ï¼ç±ä¸å¹´æ¹ä¸ºäºå¹´ãæ­¤åï¼å¨2000å¹´ã2006å¹´ã2010å¹´ååèè¯·äºç¹éçå¯åããçå¯æºå³ç¹éçå¯åå·¥ä½åæ³ãå¯¹ç¹éçå¯åçæ¢å±åä»»æä½äºæ°çè°æ´ï¼å³è§å®ç¹éçå¯åå¨çå¯æºå³é¢å¯¼ç­å­äº§çåæ¢å±ï¼æ¯å±èç¨æä¸æ¬å±é¢å¯¼ç­å­ä»»æç¸åãä»»æå±æ»¡åå¯ä»¥ç»­èï¼ä½æå¤ç»­èä¸¤å±ã
ï¼åæ é¢ï¼ä¸­å¤®çºªå§çå¯é¨è¯¦è§£ç¹éçå¯åå·¥ä½14å¹´æ¥æ°ååï¼
ï¼ç¼è¾ï¼SN095ï¼   ï¼ç¼è¾ï¼SN095ï¼   ä¸­å½æ°é»ç½E  ä¸­æ°ç½11æ10æ¥çµæ®ä¸­å¤®çºªå§çå¯é¨ç½ç«æ¶æ¯ï¼çå¯é¨ãçå¯æºå³ç¹éçå¯åå·¥ä½åæ³ãèª11æ1æ¥èµ·æ½è¡ï¼ä¸­çºªå§çå¯é¨ä»æ¥è¯¦ç»ä»ç»äºç¹éçå¯åå¶åº¦èª1989å¹´å»ºç«ä»¥æ¥å·¥ä½æ°ååã2013å¹´10æ10æ¥ï¼çå¯é¨å¬å¸ãçå¯æºå³ç¹éçå¯åå·¥ä½åæ³ãï¼å¯¹    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ada37001f:   ç§¦å§çéµåç°âåè±ªéâé¶ä¿:å½©ç»é¢è²åé»7   http://news.sina.com.cn/c/2013-11-10/110628670232.shtml   10-11-2013 11:06:00  æ°åç½è¥¿å®11æ10æ¥çµ (è®°èéæ)è®°èä»éè¥¿çæç©å±è·æï¼å¨ç§¦å§çå¸éµåç©é¢ä¸éè¥¿çèå¤ç ç©¶é¢è¿æçèåèå¤åæä¸­ï¼é¦æ¬¡åç°äºç§¦ä»£é¶ä¿æ°çç±»å¶ä»¥åå¶æè´å«çæååç´ ã
 2011å¹´ä»¥æ¥ï¼ä¸ºéåç§¦å§çå¸éµåç©é¢9901éªè¬åå±åçå»ºè®¾ï¼èå¤äººåå¨ç§¦å§çéµåæçº¦880å¹³æ¹ç±³ï¼å±æ¸çåºææå¢è¬15åº§ãæ°å9åº§ãåºåçæç©ä¸­ï¼å°¤ä»¥è¿30ä»¶é¶ä¿æå¼äººæ³¨ç®ãæ­¤æ¬¡åæåºåçé¶ä¿éä½æ¶æå½©ç»ï¼ä¸èº«çå½©ç»ä¿å­è¾å¥½ï¼ä½é¢è²åé»ãéè¿è§å¯å½©ç»ï¼åå¯è§å¯åºå½©ç»æ¶å·çæ¹åä¸çº¹è·¯ï¼è½ä»è¿æ¹ç§¦ä»£é¶ä¿æ°çç±»å¶ä¸­æ­ç¤ºç§¦ä»£ä¸°å¯å¤å½©çææèºæ¯åç¥ç§çå®«å»·å¨±ä¹æåã
 æ­¤å¤ï¼æ¬æ¬¡åæå·¥ä½è¿åºåäºéå¨10å¤ä»¶ãé¿æ¹ä½éç 10å¤åãéå¨5ä»¶ãé¡å¨1ä»¶ãç³å¨3ä»¶ãæ¤­åä½ç³å¤´3åãæ­£æ¹ä½ç³å2ä»¶ãé¶å¨æ®çè¥å¹²ä»¶ã
 æ®æå³ä¸å®¶ä»ç»ï¼â9901éªè¬åâææ©åç°äº1999å¹´3æï¼å¹¶å¨å½å¹´5æè¿è¡äºè¯æï¼2002å¹´è¿è¡äºç¬¬äºæ¬¡è¯æãæ­¤æ¬¡9901éªè¬åçå¨é¢åææ¯ç°éèå¤åæä¸ç°åºæç©ä¿æ¤çå¨æ°å°è¯ï¼ä¸ºä»¥åçç°éåææç©ä¿æ¤æä¾äºä¸ä¸ªå¯åé´çæ¡ä¾ã
 è¿æ¬¡å©ç¨æ°çèå¤åæçå¿µåç°ï¼9901éªè¬åä¸ç§¦å§çå¸éµå­å»ºè®¾ãä½¿ç¨åç ´ååºæ¬ä¸æ¯åæ­¥çï¼ä½ä¹ææ´ç»åçæ¶é´æ®µãè¿ä¸ªç»åçæ¶é´æ®µï¼ä¹ä¸ºè¿ä¸æ­¥ç ç©¶ç§¦å§çéµçéªè¬å¸å±ãä¸§è¬ä»ªä¿æä¾äºæ°çæè·¯ã
ï¼ç¼è¾ï¼SN095ï¼   ï¼ç¼è¾ï¼SN095ï¼	   æ°åç½O  æ°åç½è¥¿å®11æ10æ¥çµ(è®°èéæ)è®°èä»éè¥¿çæç©å±è·æï¼å¨ç§¦å§çå¸éµåç©é¢ä¸éè¥¿çèå¤ç ç©¶é¢è¿æçèåèå¤åæä¸­ï¼é¦æ¬¡åç°äºç§¦ä»£é¶ä¿æ°çç±»å¶ä»¥åå¶æè´å«çæååç´ ã2011å¹´ä»¥æ¥ï¼ä¸ºéåç§¦å§çå¸éµåç©é¢9901éªè¬åå±åçå»ºè®¾ï¼èå¤äººåå¨    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ad916001d;   ä¸­é¨æå¿1å¹´å¬æ¬¾è´ºå¡è±30ä¸ å¤å»º1æå¸æå°å­¦7   http://news.sina.com.cn/c/2013-11-10/111228670278.shtml   10-11-2013 11:12:00  æ°åç½åæ11æ10æ¥çµ (è®°èçæ³)ä¸­å¤®çºªå§æ¥åååºãå³äºä¸¥ç¦å¬æ¬¾è´­ä¹°å°å¶å¯éè´ºå¹´å¡ç­ç©åçéç¥ãï¼è¦æ±åçº§åæ¿æºå³ãå½æä¼äºä¸åä½åéèæºæï¼ä¸¥ç¦ç¨å¬æ¬¾è´­ä¹°ãå°å¶ãé®å¯ãèµ éè´ºå¹´å¡ãæä¿¡çãå¹´åç­ç©åã
 è®°èè°æ¥åç°ï¼è¿å¹´æ¥è´ºå¹´å¡ãå°åç­æä¸ºä¸å°åæ¿æºå³ãå½ä¼äºä¸åä½å¸åçâå¾®èè´¥âï¼å°å°çº¸çèåéèçâå¤§æµªè´¹âååæäººï¼æçå¿æ­¤é¡¹è±è´¹ç¸å½äºå»ºä¸æå¸æå°å­¦ã
 å«åâçº¸çä¸çèè´¥âå¿å¨å¿è¡
 ä¸å¼ å°å°è´ºå¹´å¡çèè´¥å¼èµ·äºä¸­çºªå§æ³¨æï¼çä¼¼âå°é¢å¤§åâï¼èåæå¶æ·±å»çç°å®å ç´ ã
 åæä¸å®¶æ°è¥å°å·ååé¿åè¯è®°èï¼å¾å¹´ï¼æ¯é¢åæ¦æ¥èä¸´è¿ï¼å°±ä¼æ¥å°ä¸å°æ¥èªåæ¿æºå³ãä¼äºä¸åä½çè´ºå¹´å¡è®¢åï¼æ°ééå¹´å¢å¤ï¼è±æ ·ä¹éå¹´ç¿»æ°ãâåæ¥åªæ¯ç®åå°å°ä¸å¼ çº¸ï¼ç°å¨è¦æ±å¤è§ä¸è¦æç«éãå¹å¸ãå¨ç»ç­ææï¼ææä¸è¦ç¨å®£çº¸ãæªæ¨ãçº¢æ¨ç­ï¼æçè¿éä¸éç®ãåçãçºªå¿µå¸ç­ï¼è¶æ¥è¶è¶äºé«æ¡£å¥¢ä¾ãâ
 æ®ä»ç»ï¼ç±äºè¿äºâå®å¶âéè¦åç¬åºæ¨¡æ¿ï¼ä¸å°æ°è¾å°ï¼å æ­¤åå¼ ãåä»½ææ¬è¾é«ãä¸å¼ è´ºå¡å3åè³10åä¸åæ¡£æ¬¡ï¼ä¸ä»½å°åä¸è¬è´¨ééäºä¸ååï¼å¥½çè¶è¿ç¾åãâä½é½æ¯å¬æ¬¾æ¶è´¹ï¼åªè¦å¼å¥½åç¥¨ï¼è´µç¹ä¹é½ä¸å¨ä¹ãâ
 è°æ¥åç°ï¼ä¸äºåä½è¿æåºâä¸ªæ§åâéæ±ï¼æä¸»è¦é¢å¯¼çå·¥ä½ç§ãç­å­æåçéä½ç§ï¼ä»¥åé¢å¯¼çä¹¦ç»ä½åãææçä¸çåå°é£æ¯ç§ä¸é¨å°å¨è´ºå¡ãå°åä¸ï¼ç¾å¶åæ°âæºå³æåâæèâä¼ä¸æåâï¼èåå®åæ¯âæ·å¬å®¶ä¹æ¨âååé¢å¯¼æ¬¢å¿ã
 ä¸­å¤®çºªå§åé£æ¿é£çç£å®¤ä¸»ä»»è®¸ä¼ æºè¡¨ç¤ºï¼ä¸´è¿åæ¦ï¼æçåä½å·²ç»å¼å§è®¡åè´­ä¹°å°å¶è´ºå¹´å¡ç­ç©åï¼ä¸­å¤®çºªå§å°åè¿ä¸ªéç¥ï¼å°±æ¯è¦æ©ææå¼ãæ©æè¦æ±ï¼åæ¶å¹ä½è¿è¡ä¸æ­£ä¹é£ãç®åï¼ä¸­å¤®çºªå§çå¯é¨å·²å¬å¼äºä¸¾æ¥çµè¯ï¼å¼éäºç½ç»ä¸¾æ¥ï¼é¼å±ç¾¤ä¼å¯¹æ­¤ç±»ä¸æ­£ä¹é£è¿è¡çç£ã
 âå¬æ¬¾è´ºå¡âèåçèè´¥åæµªè´¹æäºº
 è®°èè°æ¥åç°ï¼å¨ä¸äºåæ¿æºå³ãä¼äºä¸åä½ï¼åæ¦ãæ¥èè´ºå¡ä½ä¸ºä¸ç§å¸åçâå¾®èè´¥âï¼å¶èåéå¿çâå¤§æµªè´¹âååæäººã
 ä¸­é¨æå¿ä¸å¿å§å®£ä¼ é¨è´è´£äººåè¯è®°èï¼ä»ä»¬ä»¥å¾æ¯å¹´é½ä¼ä»¥å¿æåä¸ºèæ¯å®å¶ä¸æ¹è´ºå¡ï¼ç¶åä»¥âæå¯¼æ§ä»»å¡âçå½¢å¼è®©åå¿å±ãä¹¡éâè®¤é¢âè´­ä¹°ãå¶ä¸­ï¼å¨å¿16ä¸ªä¹¡éæ¯ä¸ªä¹¡éçæå¯¼æ§ä»»å¡å¹³å1ä¸å¤åã
 âä½ä¸ºä¸­é¨å°åºä¸ä¸ªç»æµåäººå£é½æ¯ä¸­ç­è§æ¨¡çå¿ï¼æ¯å¹´å®å¶è´ºå¡æ»é¢å¨30ä¸åå·¦å³ï¼ç¸å½äºè±æäºå»ºèµ·ä¸æå¸æå°å­¦çèµéãâä»è¡¨ç¤ºã
 è®°èå¨æ±è¥¿æè®¾åºå¸ä¸ç´å±æ¿åºé¨é¨éè®¿ä¹äºè§£å°ï¼è¿ä¸ªå¤çº§åä½ä¸å¹´å°å¶3000å¼ è´ºå¡ï¼æ¯å¼ è´ºå¡4åï¼å¶ä¸­é®èµ2.4åï¼å°å·è´¹1.6åï¼ä¸å¹´çè´­ä¹°è´ºå¡è±è´¹ä¸º1.2ä¸åãè¥æä¸ä¸ªè®¾åºå¸40å¤ä¸ªå¸ç´åä½ä¼°ç®ï¼è¿ä¸ªè®¾åºå¸ä»è´­ä¹°è´ºå¡çè±è´¹å°±è¶è¿40ä¸åã
 é¤åæ¿æºå³å¤ï¼ç§»å¨ãçµä¿¡ãé¶è¡ãçèç­å½ä¼åäºä¸åä½éè´­éä¹âä¸å¯å°è§âãæµæ±æ¿åºéè´­ç½11æ1æ¥åå¸çä¸ä»½âæµæ±å¤§å°å»ºè®¾ææ ä»£çæéå¬å¸å³äºä¸­å½é¶è¡è¡ä»½æéå¬å¸æµæ±çåè¡2014å¹´æåãå°ååè´ºå¡å°å¶é¡¹ç®çå¬å¼ææ å¬åâå¯ç®¡çª¥ä¸æãæ ¹æ®å¬ååå®¹ï¼ä¸­è¡æµæ±åè¡2014å¹´éè´­éä¸ºï¼æå7.39ä¸ä»½ãå°å5.26ä»½ãè´ºå¡(å«ä¿¡å°)2.6ä¸ä»½ãä¸è¿éçä¸­çºªå§ç¦ä»¤çåºå°ï¼è¿ä¸ªè¿å¥ææ ç¯èçè´ºå¡å°å¶é¡¹ç®å·²è¢«ç´§æ¥ç»æ­¢ã
 æå½æ2800å¤ä¸ªå¿çº§è¡æ¿åºã300å¤ä¸ªå°çº§è¡æ¿åºï¼è¿æé¾è®¡å¶æ°çå½ä¼åäºä¸åä½ãè´­ä¹°è´ºå¡å¯¼è´çå¬æ¬¾èè´¥ï¼ç§¯å°æå¤ãèæ²æå¡ãå½å®¶è¡æ¿å­¦é¢ææçä¼è¡¨ç¤ºï¼âå¦æçè½æå¨å½çå¬æ¬¾è´­ä¹°åå°å¶è´ºå¹´å¡ä¹é£å¹ä½ï¼é£èçä¸æ¥çå¬æ¬¾å°æ¯ä»¤äººåèçæ°å­ãâ
 éè®¿ä¸­ï¼ææºå³å·¥ä½äººåè¿è°å°ï¼âè´ºå¡æ»¡å¤©é£âä¸ä»æ¯å¬æ¬¾æµªè´¹ï¼ä¹æ¯è¿èç»¿è²ä½ç¢³çæ´»æ¹å¼çä¸ç§æµªè´¹ãç¯ä¿é¨é¨è®¡ç®ï¼æ¯10ä¸å¼ è´ºå¡ï¼éè¦æ¶èè¿30æ£µ10å¹´ççæ æ¨ãè¿å¹´æ¥ï¼åæ¦æ¥èå¯èµ è´ºå¡ç°è±¡å¤äºï¼èâå¼å°å³å¼âçäººä¹å¤äºãå¨å½æ¯å¹´æ¶èçè´ºå¡æ°éæ°ä»¥äº¿è®¡ï¼å¯¹çæèµæºçæµªè´¹åæ ·æäººã
 ãä»âèå°âå°âçº¸çâï¼åèè´¥ãæµªè´¹ä¸çæ­»è§
 èªä¸­å¤®å«é¡¹è§å®é¢å¸ä»¥æ¥ï¼ä¸­å¤®çºªæ£é¨é¨å¨ä½é¢é¢ï¼åæ¯æ¥èæâèå°ä¸çèè´¥âï¼ç´§æ¥çæ¸æèæâè½¦è½®ä¸çèè´¥âï¼ä¸­ç§æâæé¥¼çå­éçèè´¥âï¼åæ¦ä¸´è¿åæâçº¸çä¸çèè´¥ââ¦â¦
 ä¸äºä¸å®¶åæè®¤ä¸ºï¼ä»éå¶è½¦è½®ãèå°ä¸çâä¸å¬âèè´¥ï¼å°âè´ºå¹´å¡ç¦ä»¤âè¡¨æï¼ä¸­å¤®åâåé£âå·¥ä½âå¤§å¤çç¼å°å¤çæâï¼å·¥ä½è¶æ¥è¶ç»è´ï¼å¨åèè´¥ä¸ï¼ç¨âå¤§å°é½æï¼ä¸çæ­»è§âçå·¥ä½æ¹æ³ï¼âæ¢æ±äºè¥¿çãåæ¡äºèéº»âã
 âåªè¦æ¶åå¬æ¬¾ï¼åå°ä¹è¦æç»ï¼è¡¨æä¸­å¤®åå¯¹æµªè´¹ãéå¶èè´¥çå³å¿ãâåæå¤§å­¦æ³é¢ææé­çç¤¼è¯´ï¼âä½è¯¸å¦âçº¸çä¸çèè´¥âè¿åªæ¯ææ¯å±é¢èè´¥ï¼å½æ ¹å°åºè¿æ¯è¦é é¢ç®å¬å¼ç­å¶åº¦æ¥ä¿éï¼è®©æ¯ä¸ç¬å¬æ¬¾è±éæ¾æå¨âé³åâä¸ãâ
 éçä¸­çºªå§âè´ºå¹´å¡ç¦ä»¤âåå¸ï¼è®°èéè®¿çè¿å®¶åæä¸æ°è¥å°å·åçè´ºå¡è®¢åéå90%ãä¸è¿åé¿åè¯è®°èï¼âä¾æçï¼è¿äºè´ºå¡ç¡®å®æ²¡ä»·å¼ãæ²¡å¿è¦ï¼èªå·±å°èµç¹é±ä¹æ¯æ¯æçãæçä¸å¡å¯ä»¥è½¬åï¼å¸æé£äºå¬å®¶åä½è§å¿µä¹è¦âè½¬è½¬åâãâ
ï¼ç¼è¾ï¼SN095ï¼   ï¼ç¼è¾ï¼SN095ï¼	   æ°åç½\  æ°åç½åæ11æ10æ¥çµ(è®°èçæ³)ä¸­å¤®çºªå§æ¥åååºãå³äºä¸¥ç¦å¬æ¬¾è´­ä¹°å°å¶å¯éè´ºå¹´å¡ç­ç©åçéç¥ãï¼è¦æ±åçº§åæ¿æºå³ãå½æä¼äºä¸åä½åéèæºæï¼ä¸¥ç¦ç¨å¬æ¬¾è´­ä¹°ãå°å¶ãé®å¯ãèµ éè´ºå¹´å¡ãæä¿¡çãå¹´åç­ç©åãè®°èè°æ¥åç°ï¼è¿å¹´æ¥è´ºå¹´å¡ãå°åç­æ    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415abf5a0002:   ä¸æµ·ä¸å­¦æ ¡è¶³çåºçé¨æ¡åå¡è´1äººè¢«ç ¸èº«äº¡7   http://news.sina.com.cn/c/2013-11-10/162428671410.shtml   10-11-2013 16:24:00  ä¸æ¹ç½11æ10æ¥æ¶æ¯ï¼æ¨å¤©æä¸9ç¹ï¼ä¸æµ·çµåå­¦é¢åçä¸èµ·æå¤ï¼æ ¡åè¶³çåºççé¨é¨æ¡åå¡ï¼è´ä½¿ä¸åå­¦çä¸å¹¸è¢«ç ¸èº«äº¡ãç®åï¼è­¦æ¹å·²ä»å¥è°æ¥ã
 å½æ¶è¿å24å²çå¤§å­¦çå¼ æè¢«ç ¸ä¼¤åï¼ç«å³è¢«éå¾å»é¢æ¢æãæ®å»çä»ç»ï¼ä¼¤åå¥é¢æ¶å¤´é¨ä¸¥éåå½¢ï¼å¿è·³ãå¼å¸ç­çå½ä½å¾æ¶å¤±ï¼å·²å®£åä¸æ²»èº«äº¡ã
 æ®åæ­¥äºè§£ï¼å¼ ææ¯ä»æ¹åæ¥æ²ªï¼å°ä¸æµ·çµåå­¦é¢å­¦ä¹ ï¼å½æ¶å¼ æå¯è½ä¸å åå­¦çå¨è¶³çåºä¸è¸¢çï¼ä¸æåä¾§è¶³çé¨æ¡çªç¶åä¸ãè®°èæ³¨æå°ï¼è¿ä¸ªè¶³çé¨æ¡æ¯æ¶å®æ´ï¼æ²¡ææåææ­çæåµï¼èªè¡åä¸çå¯è½æ§è¾å°ã
 äºä»¶åççç¡®åæåµï¼ä¸æµ·çµåå­¦é¢æ ¡æ¹æªæ¥åéè®¿ãäºååï¼åè­¦ãæ³å»å·²èµ¶èµ´ç°åºå¤ç½®ï¼å¯¹è¿åå­¦ççæ­»å å±å¼è¿ä¸æ­¥çè°æ¥ãæ­»èç¶æ¯å·²åé£æºèµ¶å¾ä¸æµ·ã
 
ï¼ç¼è¾ï¼SN091ï¼   ï¼ç¼è¾ï¼SN091ï¼	   ä¸æ¹ç½]  ä¸æ¹ç½11æ10æ¥æ¶æ¯ï¼æ¨å¤©æä¸9ç¹ï¼ä¸æµ·çµåå­¦é¢åçä¸èµ·æå¤ï¼æ ¡åè¶³çåºççé¨é¨æ¡åå¡ï¼è´ä½¿ä¸åå­¦çä¸å¹¸è¢«ç ¸èº«äº¡ãç®åï¼è­¦æ¹å·²ä»å¥è°æ¥ãå½æ¶è¿å24å²çå¤§å­¦çå¼ æè¢«ç ¸ä¼¤åï¼ç«å³è¢«éå¾å»é¢æ¢æãæ®å»çä»ç»ï¼ä¼¤åå¥é¢æ¶å¤´é¨ä¸¥éåå½¢ï¼å¿è·³ãå¼å¸ç­    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415abff600030   äººæ°æ¥æ¥ï¼æå¤§æ²¡ç½çä¹ ä¸»å¸­çæå¾7   http://news.sina.com.cn/c/2013-11-10/161628671385.shtml   10-11-2013 16:16:00d  æå¤§æåå¤ºåäºå å åï¼æäºä¸­å½æç­é¨çè¯é¢ï¼è¿ä¸ªååºçæ¶å»ä½ä¸ºä¸­å½ç¬¬ä¸å¤§æ¥ï¼ãäººæ°æ¥æ¥ãå®æ¹å¾®åè¿ç»­åäºå¤ç¹è¯è®ºï¼ç´è¨æå¤§æ²¡è¾è´ä¹ ä¸»å¸­å¯¹ä¸­å½è¶³ççææï¼åæ¶ä¸­å½è¶³çä»æ§ä»»ééè¿ï¼é©å½å°æªæåï¼åå¿ä»éåªåã
 éåãäººæ°æ¥æ¥ãä¹ä¸å¿ç»æå¤§æåºæ´é«çè¦æ±ï¼âå¹¿å·æå¤§å¤ºå¾äºå å åï¼ä»èè·å¾å½éè¶³èä¸çä¿±ä¹é¨æ¯åèµèµæ ¼ãä¸ä¸ªæåï¼è®©æä»¬åä¸ºå¹¿å·æå¤§å æ²¹ï¼ç¥ç¦æå¤§å¨ä¸ä¿±æ¯æ´è¿ä¸æ­¥ï¼âä¹åï¼ãäººæ°æ¥æ¥ãä¹ç¹è¯äºæå¤§çæåï¼âèèµèä¸ååçç¬¬ä¸ä¸ªäºæ´²å åï¼é¤äºä¼ç§ççååä¸çæ¯å åçº§å«çä¸»æç»ï¼ç§å­¦çç®¡çåå¯¹è¶³çè§å¾çå°éä¸å¯æç¼ºãå¸æä»å¤çèå©ï¼è½é¼èæ´å¤å­©å­èµ°ä¸ç»¿èµåºãä¹å¸æä¸ä¸ªæåï¼å¨ä¸çä¿±æ¯èµåºä¸ï¼æå¤§ååä½³ç»©ï¼å°æ¶ï¼æä»¬åä¸ºæå¤§å æ²¹ï¼âåæ¶è¯¥æ¥ä¹ä¸å¿è°ä¾éæºï¼ä»¥é¼å±çéååä½³ç»©ï¼âéé¿éæºçä¸¾æ¯å¨ä½ç¥æ¾çæ¶©ï¼ä½å«æå¿ï¼ä»¥åä¼ä¹ æ¯çãé»åæè¿å¼ æ¥èå½æçå¾çç¾ï¼â
 æåï¼ãäººæ°æ¥æ¥ãå°æå¤§çå¤ºå ä¸å½å®¶é¢å¯¼äººèç³»å¨ä¸èµ·ï¼âæå¤§äºæ´²å¤ºå æ¯å¯¹ä¸ä¸­å¨ä¼ä¸ä»½åç¤¼ãæ¹é©ä»»å¡å¾éï¼è¶³çå´éªè¯äºä¸ä¸ªéçï¼å¨ä¸å·®é±çä¸­å½ï¼åªè¦ç¨é±çä¸»ä½æ¯ä¼ä¸ï¼é±ç¨å¯¹å°æ¹ï¼è¿æ¯å¯ä»¥åºæç»©çï¼ç¸ä¿¡å¸åºï¼ç¸ä¿¡ä¼ä¸ï¼ç¸ä¿¡èä¸åï¼åè±ªä¸»å¯¼æ¯æ¿åºä¸»å¯¼å¼ºãä¸­å½è¶³çï¼æ²¡ç½çä¹ å¤§å¤§å¯¹ä½ ä»¬çå³æ³¨åæå¾ï¼æå¤§ï¼å¥½æ ·çãâ
ï¼ç¼è¾ï¼SN077ï¼   ï¼ç¼è¾ï¼SN077ï¼	   äººæ°ç½h  æå¤§æåå¤ºåäºå å åï¼æäºä¸­å½æç­é¨çè¯é¢ï¼è¿ä¸ªååºçæ¶å»ä½ä¸ºä¸­å½ç¬¬ä¸å¤§æ¥ï¼ãäººæ°æ¥æ¥ãå®æ¹å¾®åè¿ç»­åäºå¤ç¹è¯è®ºï¼ç´è¨æå¤§æ²¡è¾è´ä¹ ä¸»å¸­å¯¹ä¸­å½è¶³ççææï¼åæ¶ä¸­å½è¶³çä»æ§ä»»ééè¿ï¼é©å½å°æªæåï¼åå¿ä»éåªåãéåãäººæ°æ¥æ¥ãä¹ä¸å¿ç»æå¤§æåºæ´    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415abbc100008   å¼ºå°é£æµ·çå¹æ­ä¸äºä¸èè´§è¹ç¼ç»³ 6äººå¤±è¸ª7   http://news.sina.com.cn/c/2013-11-10/171228671547.shtml   10-11-2013 17:12:00¢  ãä¸äºä¸è´§è¹è¢«å°é£å¹æ­ç¼ç»³ 6äººéè¹å¤±å»èç³»ãè®°èä»ä¸äºæµ·äºå±ååæµ·æå©ä¸­å¿è·æï¼10æ¥ä¸å15ç¹22åï¼å¹¿è¥¿ç±è´§è¹âé¡ºèª998âå¨ä¸äºæ¸¯é¿é£æéåï¼è¢«å¼ºå°é£âæµ·çâå¹æ­ç¼ç»³åï¼é£å¥å¤§æµ·ï¼è¹ä¸6äººå¤±å»èç³»ï¼ä¸äºå¸ç¸å³é¨é¨å·²ç»ç»ç»ææãå¼ºå°é£âæµ·çâè¿å¸¦æ¥å¼ºé£æ´é¨ï¼ææé¾åº¦æ¯è¾å¤§ã
ï¼ç¼è¾ï¼SN077ï¼   ï¼ç¼è¾ï¼SN077ï¼   æ°åç¤¾ä¸­å½ç½äºR  ãä¸äºä¸è´§è¹è¢«å°é£å¹æ­ç¼ç»³6äººéè¹å¤±å»èç³»ãè®°èä»ä¸äºæµ·äºå±ååæµ·æå©ä¸­å¿è·æï¼10æ¥ä¸å15ç¹22åï¼å¹¿è¥¿ç±è´§è¹âé¡ºèª998âå¨ä¸äºæ¸¯é¿é£æéåï¼è¢«å¼ºå°é£âæµ·çâå¹æ­ç¼ç»³åï¼é£å¥å¤§æµ·ï¼è¹ä¸6äººå¤±å»èç³»ï¼ä¸äºå¸ç¸å³é¨é¨å·²ç»ç»ç»ææãå¼ºå°é£â    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415abe870001>   å¼ºå°é£æµ·çè´æµ·å£åºç°8-10çº§å¤§é£ å¤æ°ä¹¡éæ´é¨7   http://news.sina.com.cn/c/2013-11-10/162728671446.shtml   10-11-2013 16:27:00e  ä¸­æ°ç½æµ·å£11æ10æ¥çµ (çå­è°¦å¢ä¿é)ä»å¹´ç¬¬30å·å¼ºå°é£âæµ·çâ10æ¥å¼å§å½±åæµ·å£ï¼è¯¥å¸æ®éå¤§å°æ´é¨ï¼é£åå¨7çº§ä»¥ä¸ï¼äº¤éåå¸æ°çæ´»åå°ä¸å®ç¨åº¦å½±åã
 æµ·å£å¸æ°è±¡å°ä¸å08æ¶32åç»§ç»­åå¸å°é£èè²é¢è­¦ä¿¡å·ï¼24å°æ¶ååç­å¸¦æ°æå½±åï¼æ²¿æµ·æèéå°å¹³åé£åè¾¾6çº§ä»¥ä¸ï¼æèéµé£8çº§ä»¥ä¸å¹¶å¯è½æç»­ãæ®äºè§£ï¼ä¸å8æ¶30åè³ä¸å14æ¶30åï¼æµ·å£å¸æ®éåºç°8â10çº§å¤§é£ï¼å¤§é¨åä¹¡éæ´é¨ï¼å¸åºä¸­å°å¤§é¨ï¼é¢è®¡æªæ¥ä¸å¤©è¿å°æç»­å¤§å°æ´é¨å¤©æ°ã
 åâæµ·çâå½±åï¼ç¼å·æµ·å³¡å®¢æ»è¹äºæ¨æ¥20æ¶èµ·å¨çº¿åèªãæµ·åä¸ç¯éè·¯ä»æ©æ¨7ç¹å¼å§å¨çº¿åè¿ï¼æµ·å£ä¸ç«å¨éåæ ä¸­æç¤ºæå®¢åæ¶å°è½¦ç«éç¥¨çªå£åçéç¥¨ãæ¹ç­¾æéæ©å¶å®äº¤éå·¥å·åºè¡ã
 æµ·å£å¸ä»æ¨å¼å§åºç°æ¶å£å¤©æ°ï¼ä¸´è¿ä¸­åé£é¨å¢å¤§ï¼ä¸å°åºè¡çå¸æ°æä¼é¾è¡ãè®°èå¨å¸åºçå°ï¼é¤æµ·ç¸å²é¨åè·¯æ®µåºç°å°éç§¯æ°´å¤ï¼åå¸éè·¯å¹¶æªåå°ä¸¥éå½±åï¼äº¤éæ­£å¸¸ã
 âæµ·çâæ¥è¢­ï¼æµ·å£èä»·å·²åºç°ä¸æ¶¨ãç¾å°åºæ²¿æ±å¸åºè¬èç±»ä»·æ ¼æ¶¨å¹å¨0.5è³1åé´ï¼æµ·é²ä»·æ ¼ææ å½±åãæè´©ç§°ç±äºå°é£æ¥ä¸´ï¼ææ¥ä»·æ ¼æå°æç»­ä¸æ¶¨1-2åã
(åæ é¢ï¼âæµ·çâæºé£é¨è¢­æµ·å£ å¨è½¦åè¿èä»·ä¸æ¶¨)
ï¼ç¼è¾ï¼SN077ï¼   ï¼ç¼è¾ï¼SN077ï¼   ä¸­å½æ°é»ç½I  ä¸­æ°ç½æµ·å£11æ10æ¥çµ(çå­è°¦å¢ä¿é)ä»å¹´ç¬¬30å·å¼ºå°é£âæµ·çâ10æ¥å¼å§å½±åæµ·å£ï¼è¯¥å¸æ®éå¤§å°æ´é¨ï¼é£åå¨7çº§ä»¥ä¸ï¼äº¤éåå¸æ°çæ´»åå°ä¸å®ç¨åº¦å½±åãæµ·å£å¸æ°è±¡å°ä¸å08æ¶32åç»§ç»­åå¸å°é£èè²é¢è­¦ä¿¡å·ï¼24å°æ¶ååç­å¸¦æ°æå½±åï¼æ²¿æµ·æèé    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ac0a70004:   å¼ºå°é£æµ·çå¹æ­ä¸äºè·¯ç¯ç¯æ é¨åè·¯æ®µåçµ7   http://news.sina.com.cn/c/2013-11-10/161528671454.shtml   10-11-2013 16:15:00H  æ°åç½ä¸äº11æ10æ¥çµ(è®°èéç®å¨)åå¼ºå°é£âæµ·çâå½±åï¼10æ¥ï¼æµ·åçä¸äºå¸å¸åºç¬¼ç½©å¨çé£æ´é¨ä¸­ï¼è¢«å®åçæ æ¨ãäº¤éæ¤æ ãæ½å·¥å´æ ãè·¯ç¯ä»¥åçµå¨èªè¡è½¦éå¤å¯è§ï¼é©¬è·¯ä¸¤è¾¹çä¸äºå¤§æ ä¹è¢«è¿æ ¹æèµ·ã
 10æ¥ä¸å10æ¶ï¼è®°èé¡¶é£åé¨åºé¨éè®¿ç¾æãå¨è®°èå±ä½çå°åºï¼ç±äºé£åè¿å¤§çåå ï¼çµæ¢¯é¨é½æ æ³æ­£å¸¸å³é­ãè®°èä»å®å¨ééèµ°åºæ¥¼éå£ï¼è¢«éµéµå¤§é£å¹å¾åä¸è¿æ°æ¥ï¼èä¸è¿èæ æ³ç«ç¨³ãè½¦è¿æ²¡æå¯å¨ï¼å°±è¢«å¤§é£å¹å¾ä¸åæå¨ã
 è®°èé©¾è½¦èµ°åºå°åºï¼çå°ä¸ä¾§éè·¯æ¨ªä¸ç«å«å°è¢«èººåçäº¤éæ¤æ æ¡ä½ï¼å¦ä¸è¾¹è¢«å®åçå¤§æ æ¦ä½ï¼æåå¨å°åºä¿å®çå¸®å©ä¸ï¼æå¾ä»¥éè¡ã
 éåï¼è®°èé©¾è½¦è¡é©¶å¨ä¸äºå¸åºä¸»å¹²éå¤å°è·¯åè§£æ¾è·¯ä¸ï¼è·¯è¾¹çé¨åè·¯ç¯ç¯æå·²è¢«æ¦è°å¹æ­ï¼åå ä¸é¨åè·¯é¢ä¸çç§¯æ°´ç»éè¡å¸¦æ¥å¾å¤§é»åãçé£æ´é¨ä¸åå°ææå¨è¡é©¶çè½¦çªä¸ï¼è·¯ä¸è½è§åº¦å¾ä½ï¼è®°èåªè½æ¢æ¢åè¡ã
 å½è½¦è¡é©¶å°ä¸äºè§£æ¾è·¯ä¸æ¹ç¾è´§é¨åæ¶ï¼è®°èçå°ä¸ä½åä»éé¢èµ°åºæ¥çå¥³å£«ï¼è¢«å¤§é£ç´æ¥âå®å°âé¨åçä¸æ£µå¤§æ åï¼é£ä½å¥³å£«ä¹ä¹æ±çå¤§æ ä¸æ¾æï¼ç´å°æäººå°å¥¹æè¿è½¦åãä¸ä½éªçµå¨èªè¡è½¦çå¥³å£«è¿äººå¸¦è½¦ä¸å¹¶è¢«å®ç¿»ï¼äº¤è­¦æ¥å¿ä¸åæ´æã
 è®°èå¨ä¸äºæ¹¾æµ·æå¹¿åºå°é¶æµ·è·¯å£è·¯æ®µçå°ï¼å·¥å°æ½å·¥æ¡æ¿å ä¹å¨é¨è¢«é£å¹åï¼æ¤æ ä¹æå¤§é¨åè¢«é£å®åãåæ¶ï¼åä¸å¤§å¦ãå±±æ°´å½éç­è·¯å£çä¿¡å·ç¯è¢«é£å¹åï¼æ æ³å·¥ä½ã
 è®°è13æ¶é©¾è½¦è¿åï¼åç°ä¹åç»è¿è·¯æ®µå·²æ¯ä¸çç¼èï¼æ»¡å°çæ æåæ å¶ï¼å°±è¿åå¾æ¡¶é½å·²ä¸äºé©¬è·¯ï¼è®°èåæè½¦å¼è¿å°åºï¼å°åºç»¿åå¸¦ä¸­å¤®ä¸æ£µæ è¢«æ¦è°å¹æ­ãæ­¤æ¶å¤©ç©ºé´äºå¯å¸ï¼çé£èèï¼å°åºåççµå¨èªè¡è½¦è¢«å®å¾æ¨ªä¸ç«å«èººäºä¸å°ï¼æ¥è­¦å£°ä¸ç»äºè³ã
 æªè³è®°è15æ¶åç¨¿æ¶ï¼ä¸äºå¸åºé¨åè·¯æ®µåçµï¼è·¯ä¸è½è§åº¦å¾ä½ï¼è½¦è¾ç¨å°ï¼åºæ¬çä¸å°è¡äººã
ï¼ç¼è¾ï¼SN077ï¼   ï¼ç¼è¾ï¼SN077ï¼	   æ°åç½S  æ°åç½ä¸äº11æ10æ¥çµ(è®°èéç®å¨)åå¼ºå°é£âæµ·çâå½±åï¼10æ¥ï¼æµ·åçä¸äºå¸å¸åºç¬¼ç½©å¨çé£æ´é¨ä¸­ï¼è¢«å®åçæ æ¨ãäº¤éæ¤æ ãæ½å·¥å´æ ãè·¯ç¯ä»¥åçµå¨èªè¡è½¦éå¤å¯è§ï¼é©¬è·¯ä¸¤è¾¹çä¸äºå¤§æ ä¹è¢«è¿æ ¹æèµ·ã10æ¥ä¸å10æ¶ï¼è®°èé¡¶é£åé¨åºé¨éè®¿ç¾æãå¨    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ac25000059   å¼ºå°é£æµ·çä¸­å¿é£åä¸º14çº§ æ¦è¿æç»éæµ·å7   http://news.sina.com.cn/c/2013-11-10/161028671376.shtml   10-11-2013 16:10:00  #å¼ºå°é£æµ·ç#ãçº¢è²é¢è­¦ï¼å¼ºå°é£æµ·çä¸­å¿é£å14çº§ï¼ãä¸­å¤®æ°è±¡å°ä»æ¥15æ¶åå¸å°é£çº¢è²é¢è­¦ï¼15æ¶ï¼å¼ºå°é£âæµ·çâçä¸­å¿ä½äºæµ·åçä¹ä¸å¿èºæ­æµ·éååä¸æ¹å¤§çº¦50å¬éçè¿æµ·æµ·é¢ä¸ï¼ä¸­å¿éè¿æå¤§é£åæ14çº§ï¼âæµ·çâå³å°æ¦è¿æç»éæµ·åçä¹ä¸å¿æ²¿æµ·ãç¸å³å°åºå±æ°å¡å¿åå¥½é²èã
ï¼ç¼è¾ï¼SN077ï¼   ï¼ç¼è¾ï¼SN077ï¼   å¤®è§æ°é»P  #å¼ºå°é£æµ·ç#ãçº¢è²é¢è­¦ï¼å¼ºå°é£æµ·çä¸­å¿é£å14çº§ï¼ãä¸­å¤®æ°è±¡å°ä»æ¥15æ¶åå¸å°é£çº¢è²é¢è­¦ï¼15æ¶ï¼å¼ºå°é£âæµ·çâçä¸­å¿ä½äºæµ·åçä¹ä¸å¿èºæ­æµ·éååä¸æ¹å¤§çº¦50å¬éçè¿æµ·æµ·é¢ä¸ï¼ä¸­å¿éè¿æå¤§é£åæ14çº§ï¼âæµ·çâå³å°æ¦è¿æç»éæµ·åçä¹ä¸å¿æ²¿    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ac2de00065   çèè¿éå­¦çå¤§å®¢è½¦åçäºæé æ1æ­»8ä¼¤7   http://news.sina.com.cn/c/2013-11-10/161028671453.shtml   10-11-2013 16:10:00  æ°åç½å°å·11æ10æ¥çµ(è®°èå§ä¼è¶)è®°èä»çèçäº¤è­¦ãå®çç­é¨é¨è·æï¼10æ¥ä¸åçèççåèæèªæ²»å·ä¸è¾è¿éåä½å¸èæä¸­å­¦å­¦ççå¤§å®¢è½¦åçä¾§ç¿»ï¼ç®åå·²é æ1åå­¦çæ­»äº¡ï¼8äººåä¼¤ã
 æ®ä»ç»ï¼10æ¥ä¸å8æ¶è®¸ï¼çèçå½é213çº¿çåèæèªæ²»å·å¢åï¼ä¸è¾ç±åä½å¸åå¾è¿­é¨å¿çå®¢è¿ç­è½¦åçä¾§ç¿»ï¼ç®åå·²é æ1äººæ­»äº¡ï¼8äººåä¼¤ï¼ä¼¤èä¸­æ6äººä¸ºå­¦çï¼2äººä¸ºå¸ä¹äººåãè¯¥è½¦è·è½½49äººï¼å®è½½47äººï¼é¤2åå¸ä¹äººåå¤ï¼å¶ä½å¨é¨ä¸ºåä½å¸èæä¸­å­¦çå­¦çã
 äºæåçåï¼çåå·å§å·æ¿åºå¯å¨åºæ¥é¢æ¡ï¼å·ä¸»è¦é¢å¯¼å¸¦é¢æè²ãå¬å®ãå»çç­é¨é¨èµ¶å°ç°åºå¼å±å·¥ä½ãç»åæ­¥è®¤å®ï¼äºæåå ä¸ºå°éªå¤©æ°è·¯é¢ç»å°ï¼å¯¼è´å®¢è½¦ä¾§ç¿»ãç®åï¼ä¼¤èæ­£å¨å»é¢æ¥åæ²»çï¼åç»­å·¥ä½å·²æåºå±å¼ã
ï¼ç¼è¾ï¼SN077ï¼   ï¼ç¼è¾ï¼SN077ï¼	   æ°åç½K  æ°åç½å°å·11æ10æ¥çµ(è®°èå§ä¼è¶)è®°èä»çèçäº¤è­¦ãå®çç­é¨é¨è·æï¼10æ¥ä¸åçèççåèæèªæ²»å·ä¸è¾è¿éåä½å¸èæä¸­å­¦å­¦ççå¤§å®¢è½¦åçä¾§ç¿»ï¼ç®åå·²é æ1åå­¦çæ­»äº¡ï¼8äººåä¼¤ãæ®ä»ç»ï¼10æ¥ä¸å8æ¶è®¸ï¼çèçå½é213çº¿çåèæèªæ²»å·å¢å    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ac35f0007?   åäº¬å°éç§°ä¸ææä¹å®¢âèè«âï¼è¿éä¸æ¬¢è¿ä½ 7   http://news.sina.com.cn/c/2013-11-10/160428671358.shtml   10-11-2013 16:04:00{  ã@åäº¬å°é ï¼ä¸æ¬¢è¿"èè«"ã10æ¥ä¸å11ç¹ï¼@åäº¬å°é å¨ä¸æ¡å¾®åä¸­ç§°ï¼ââèè«âè¿åç10å·çº¿ï¼ä¸çç¼èâ¦åäº¬é¦é½çå®½å®¹å¤§åº¦ä¸ºäººç§°éï¼ä½ææ¶åå®½å®¹è¿äºå¤´ä¹æ¯æå¤§çè¯çãå¯¹äºæ¶æç ´ååäº¬é¦é½çè¡ä¸ºï¼æä»¬åªæ³è¯´âè¿éä¸æ¬¢è¿ä½ ï¼ââç®åè¯¥å¾®åå·²è¢«å é¤ã
ï¼ç¼è¾ï¼SN091ï¼   ï¼ç¼è¾ï¼SN091ï¼	   æ°äº¬æ¥[  ã@åäº¬å°éï¼ä¸æ¬¢è¿èè«ã10æ¥ä¸å11ç¹ï¼@åäº¬å°éå¨ä¸æ¡å¾®åä¸­ç§°ï¼ââèè«âè¿åç10å·çº¿ï¼ä¸çç¼èâ¦åäº¬é¦é½çå®½å®¹å¤§åº¦ä¸ºäººç§°éï¼ä½ææ¶åå®½å®¹è¿äºå¤´ä¹æ¯æå¤§çè¯çãå¯¹äºæ¶æç ´ååäº¬é¦é½çè¡ä¸ºï¼æä»¬åªæ³è¯´âè¿éä¸æ¬¢è¿ä½ ï¼ââç®åè¯¥å¾®åå·²è¢«å     4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ac40000086   é»é¾æ±æå¥æç«è°æ¥ç»è°æ¥å¬å®å±æ¬ æ¬¾ç­7   http://news.sina.com.cn/c/2013-11-10/154528671338.shtml   10-11-2013 15:45:00  æ°åç½åå°æ»¨11æ10æ¥çµ(è®°èç¨å­é¾)æ¥åææ¶æ¯ç§°é»é¾æ±çæå¥å¿å¬å®å±å­å¨æ¬ æ¬¾ãè¶æ è´­ä¹°åå¬è®¾å¤ç­é®é¢ãæå¥å¿10æ¥æç«ç±å¤ä¸ªé¨é¨ç»æçè°æ¥ç»ï¼å¯¹è¿äºé®é¢è¿è¡è°æ¥ï¼å¹¶è®¾ç«äºä¸é¨çæ°é»åè¨äººã
 æ ¹æ®ç¸å³æ¥éï¼æå¥å¿å¬å®å±äº1995å¹´æç«éç¾ç©èµè´¸ææ»å¬å¸ï¼å¬å¸åå¾æå°ç­5äººåæ¬¾å±è®¡20ä¸åå°ä¿ç½æ¯ç§èï¼åæ¬¾å°ç®åä»æªå¿è¿ãæ­¤å¤ï¼åªä½è¿æ¥éäºæå¥å¿å¬å®å±åå¬å®¤é¢ç§¯è¶æ ãè¶æ éè´­åå¬å®¶å·ç­é®é¢ã
 éå¯¹è¿äºæåµï¼æå¥å¿10æ¥æç«ç±å¿çºªæ£å§ä¹¦è®°ä¸ºç»é¿ï¼ä»¥å¿çºªæ£å§ãæ¿æ³å§ãçå¯å±ãè´¢æ¿å±ãç¨å¡å±ãç»ç»é¨ãå®£ä¼ é¨ç­ç¸å³é¨é¨ä¸ºæååä½çè°æ¥ç»ï¼å¨é¢è°æ¥å¬å®å±çé®é¢ï¼åæ¶è®¾ç«äºä¸é¨æ°é»åè¨äººã
 æ®è°æ¥ç»æ°é»åè¨äººé©éªå³°ä»ç»ï¼ç®åå¬å®å±æ¬ æ¬¾é®é¢å·²è§£å³ï¼åºæäººå·²è¡¨ç¤ºæè°¢ãè¶æ åå¬å®¤å·²æ´æ¹ï¼å¬å®å±ä¸»å¨å°åå¬è®¾å¤ä¸äº¤ç»å¿å½èµå±ãå¯¹åå®¶å¼å·çåå¬è®¾å¤åç¥¨çåé®é¢ï¼è°æ¥ç»æ­£å¨è°æ¥ï¼å¹¶å°åæ¶å¬å¸äºä»¶è°æ¥è¿å±ã
ï¼ç¼è¾ï¼SN077ï¼   ï¼ç¼è¾ï¼SN077ï¼	   æ°åç½P  æ°åç½åå°æ»¨11æ10æ¥çµ(è®°èç¨å­é¾)æ¥åææ¶æ¯ç§°é»é¾æ±çæå¥å¿å¬å®å±å­å¨æ¬ æ¬¾ãè¶æ è´­ä¹°åå¬è®¾å¤ç­é®é¢ãæå¥å¿10æ¥æç«ç±å¤ä¸ªé¨é¨ç»æçè°æ¥ç»ï¼å¯¹è¿äºé®é¢è¿è¡è°æ¥ï¼å¹¶è®¾ç«äºä¸é¨çæ°é»åè¨äººãæ ¹æ®ç¸å³æ¥éï¼æå¥å¿å¬å®å±äº1995å¹´æç«éç¾ç©    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ac4f30009=   ä¿å®ä¸åå°å­¦ä½è²èå¸æ¶å«ç¥äºµ6å²å¥³ç«¥è¢«é®æ7   http://news.sina.com.cn/c/2013-11-10/153628671269.shtml   10-11-2013 15:36:00  æ°åç½ç³å®¶åº11æ10æ¥çµ(è®°èçæ)è®°è10æ¥ä»æ²³åä¿å®å¸åå¸åºå¬å®åå±äºè§£å°ï¼è­¦æ¹æåç ´è·äºæ°åè·¯å°å­¦å­¦çè¢«ç¥äºµæ¡ï¼ç¯ç½ªå«çäººæ¯æ°åè·¯å°å­¦ä½è²èå¸ä½æï¼ä½æå æ¶å«ç¥äºµå¿ç«¥ç½ªå·²è¢«åå¸åºå¬å®åå±ä¾æ³é®æã
 9æ21æ¥6æ¶è®¸ï¼6å²çä¿å®æ°åè·¯å°å­¦æå­¦çå¨ç¶æ¯çéªåä¸å°ä¿å®å¸å¬å®å±è¥¿å³æ´¾åºææ¥æ¡ç§°ï¼å¶å¨æ°åè·¯å°å­¦æå­¦æ¥¼åè¢«ä¸åç·èå¸ç¥äºµã
 åå¸åºå¬å®åå±é«åº¦éè§ï¼å¯¹æ¡åç°åºåç¸å³å°ç¹è¿è¡ç»è´åå¯ï¼åæ¶éæ£æåçç¸å³ç©è¯ï¼å¹¶å¯¹è¯¥æ ¡è§é¢çæ§ç³»ç»è¿è¡è°ååæï¼ç§¯æå±å¼èµ°è®¿è°æ¥åå¶ä»å¤å´è°æ¥å·¥ä½ï¼æç»éå®äºç¯ç½ªå«çäººä½æã
 æ®59å²çç¯ç½ªå«çäººä½æäº¤ä»£ï¼ä»å¹´9æ16æ¥ä¸åï¼å¶çå°é£åå°å­¦çå¨æå­¦æ¥¼ä¸æ¥¼ä¸äºæ¥¼ä¹é´çæ¥¼æ¢¯æ¶æä¸ææ»æ¢¯ï¼éèµ·æ­¹æï¼è§å¨å´æ²¡æå¶ä»äººï¼ä¾¿ç¨æå¯¹å¶å®æ½äºç¥äºµï¼äºåè¿è­¦åå¥¹ä¸åè®¸å¯¹ä»»ä½äººè¯´åºæ­¤äºã
 ç®åï¼ç¯ç½ªå«çäººä½æå æ¶å«ç¥äºµå¿ç«¥ç½ªå·²è¢«åå¸åºå¬å®åå±ä¾æ³é®æã
ï¼ç¼è¾ï¼SN077ï¼   ï¼ç¼è¾ï¼SN077ï¼	   æ°åç½N  æ°åç½ç³å®¶åº11æ10æ¥çµ(è®°èçæ)è®°è10æ¥ä»æ²³åä¿å®å¸åå¸åºå¬å®åå±äºè§£å°ï¼è­¦æ¹æåç ´è·äºæ°åè·¯å°å­¦å­¦çè¢«ç¥äºµæ¡ï¼ç¯ç½ªå«çäººæ¯æ°åè·¯å°å­¦ä½è²èå¸ä½æï¼ä½æå æ¶å«ç¥äºµå¿ç«¥ç½ªå·²è¢«åå¸åºå¬å®åå±ä¾æ³é®æã9æ21æ¥6æ¶è®¸ï¼6å²çä¿å®æ°åè·¯å°    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ac713000b-   åäº¬æ¤é¤æ°å®ææ§åååå¾ä¸­è½¬ç«7   http://news.sina.com.cn/c/2013-11-10/151928671285.shtml   10-11-2013 15:19:00 
  ä¸­æ°ç½åäº¬11æ10æ¥çµ (å¢è¾)11æ6æ¥ï¼ä¸­æ°ç½æ¥éäºåäº¬å©æµå··çä¾µåæ¥åæ°å®ææ§åææ¯ä¸¥éï¼è¥¿é¢çä¸ä¸ªå°é¢å­æäºè¡éçåå¾ä¸­è½¬ç«ã10æ¥ï¼å½å°è¡éè´è´£äººè¡¨ç¤ºï¼ç»åªä½æ¥éä»¥åï¼ä»ä»¬ç«å³ä½åºæ´æ¹ï¼ç®ååå¾ä¸­è½¬ç«å·²ç»æ¤é¤ï¼ååå æ¾çåå¾å·²ç»æ¸è¿å®æ¯ã
 11æ6æ¥ï¼ä¸­æ°ç½æ¥éï¼å»å¹´åäº¬å¸æå³æ¹é¢å®£ç§°ï¼ä½äºåäº¬å©æµå··çä¾µåæ¥åæ°å®ææ§åå·²ç»ç«é¡¹ä¿æ¤ï¼å°å»ºææ°å®å¦åå²éåé¦ãèæ¶é´è¿å»1å¹´ï¼å©æµå··ä¸å¸¦çæ°å®ææ§åä¸ä½æ²¡æå¾å°ä¿æ¤ï¼èä¸æ¯1å¹´åçæåµæ´å·®ï¼è¥¿é¢çé¢å­è¿è¢«è¡éå½ä½åå¾ä¸­è½¬ç«ä½¿ç¨ã
 10æ¥ä¸åï¼è®°èåæ¬¡æ¥å°å©æµå··ä¾µåæ¥åæ°å®ææ§åãåååå¾ä¸­è½¬ç«è®¾ç«å¨è¥¿é¢çä¸ä¸ªé¢å­éï¼ç®åè¯¥é¢å­å¤§é¨å·²ç»ç¨æ°´æ³¥å¢å°å µï¼æ æ³å¥åãä»å¢å¤´ååçå»ï¼éé¢ååå ç§¯æ»¡å°çå»ºç­åå¾ãçæ´»åå¾å·²ç»å¨é¨æ¸è¿å®æ¯ã
 åäº¬ç§¦æ·®åºäºèæè¡éå¯ä¸»ä»»å±å¯¿å±±ç§°ï¼å½åæåå¾å æ¾å¨å©æµå··æ¯âæ²¡æåæ³çåæ³âï¼å ä¸ºè¿ä¸æ®µæ¶é´ï¼äºèæè¡éæè¿æ¯è¾å¤ï¼äº§ççå»ºç­åå¾æ¯è¾å¤ï¼èè¾åºåå¤ä¸ºèå°åºï¼å¤§ååå¾æ¸è¿è½¦æ æ³è¿å¥å°åºæ¸è¿åå¾ï¼äºæ¯ä¸´æ¶åç¨å©æµå··çå°é¢å­ä¸´æ¶ä¸­è½¬åå¾ã
 å±å¯¿å±±è¯´ï¼6æ¥åªä½æ¥éä»¥åï¼ä»ä»¬ä¹æè¯å¨æ°å®ææ§åéä¸­è½¬åå¾ï¼è¿æ ·çåæ³å¤éå¸¸ä¸å¦¥ï¼äºæ¯ç¬¬äºå¤©å°±å¼å§æ¸è¿éé¢çåå¾ï¼å¨åå¾æ¸è¿å®æä»¥åï¼è¿ç¨æ°´æ³¥æå¤§é¨å°å µèµ·æ¥ï¼é¿åå¤äººè¿å¥ãâä¸ä¸æ­¥ï¼å°ææ§åå¨è¾¹çç¯å¢æå¹²åï¼è¿æ¯æä»¬æ¬ä»½çå·¥ä½ï¼æä»¬ä¸å®ä¼æå¥½ï¼è¯·åªä½ç»§ç»­çç£æä»¬ãâ
 åå¾ä¸­è½¬ç«çé®é¢ç®åå·²ç»è§£å³ï¼ä½æ°å®ææ§åä¿æ¤çå°æªæå°ç§¦æ·®åºæ¿åºçå·¥ä½æ¥ç¨ä¸ãç§¦æ·®åºæ¿åºæ¿åºç¸å³äººå£«ç§°ï¼ååå©æµå··å±äºåäº¬åç½ä¸åºï¼2012å¹´ç½ä¸åº11æå·²ç»æç®å¼åãä¿æ¤æ§åãä½2013å¹´2æï¼ç½ä¸åºä¸ç§¦æ·®åºåå¹¶ä¸ºä¸ä¸ªåºï¼åç§°ä»ç¶ç¨åç§¦æ·®åºçåç§°ãåå¹¶åï¼ç±äºæ§åå¼åãä¿æ¤çè´¹ç¨ï¼è¶è¿5000ä¸äººæ°å¸ï¼é¢å¯¼ä»¬æè§å¹¶ä¸ç»ä¸ï¼äºæ¯æ­¤äºå°±æç½®äºã
 ä½å¨å©æµå··å¨è¾¹çå¸æ°è¡¨ç¤ºï¼æ§åå¨è¾¹çèä¹±å·®å·²ç»å¾å¤å¹´äºï¼å¸ææ¿åºå°½å¿«å¯å¨æ§åä¿æ¤ï¼ä¸è½ä¸ç´æä¸å»ï¼æ©æ¥å¯¹åå²ãå¯¹å¨è¾¹å±æ°æä¸ªäº¤ä»£ã(å®)
(åæ é¢ï¼åäº¬æ°å®ææ§åååå¾ä¸­è½¬ç«æ¤é¤ åå¾å·²æ¸è¿å¹²å)
ï¼ç¼è¾ï¼SN077ï¼   ï¼ç¼è¾ï¼SN077ï¼   ä¸­å½æ°é»ç½U  ä¸­æ°ç½åäº¬11æ10æ¥çµ(å¢è¾)11æ6æ¥ï¼ä¸­æ°ç½æ¥éäºåäº¬å©æµå··çä¾µåæ¥åæ°å®ææ§åææ¯ä¸¥éï¼è¥¿é¢çä¸ä¸ªå°é¢å­æäºè¡éçåå¾ä¸­è½¬ç«ã10æ¥ï¼å½å°è¡éè´è´£äººè¡¨ç¤ºï¼ç»åªä½æ¥éä»¥åï¼ä»ä»¬ç«å³ä½åºæ´æ¹ï¼ç®ååå¾ä¸­è½¬ç«å·²ç»æ¤é¤ï¼ååå æ¾çåå¾å·²ç»æ¸è¿    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ac5e6000a<   åå®ç¤¾åºæ27ä¸ªèè½é¨é¨çå­ ç½åç§°å ªæ¯ç½å®«7   http://news.sina.com.cn/c/2013-11-10/152328671233.shtml   10-11-2013 15:23:00  ä¸ä¸ªç¤¾åºæäº27åçå­ï¼è¿æ¥ï¼æç½åå¨åå®æé¨æ·ç½ç«è®ºååå¸ï¼å¹¶è´´åºä¸å¼ è¢«ä¼å¤ç½åäºç¸è½¬åçå¾çï¼å¾çæ¾ç¤ºï¼è¯¥ç¤¾åºå±æäºå¤§å¤§å°å°27ä¸ªèè½é¨é¨ççå­ãç½åâ11æ âæå¼ï¼è¯¥ç¤¾åºå¤ªå¼ºå¤§äºï¼çè³âå ªæ¯ç¾å½ç½å®«âã
 ä¸ä¸ªå°å°çç¤¾åºï¼ä¸ºä½è¦æé£ä¹å¤çå­ï¼ä½ä¸ºç¤¾åºå·¥ä½èï¼ä»ä»¬ä¸å¤©çå·¥ä½ãçæ´»é½æ¯ææ ·åº¦è¿çå¢ï¼ä¸ºä¸æ¢ç©¶ç«ï¼è®°èæ¥åæ¥å°è¿ä¸ªè¢«ç½åç§°ä½âæçç¤¾åºâçåå®å¸æç§åç¤¾åºï¼è·éç¤¾åºå·¥ä½èä½éªäºä¸æç¤¾åºçæ´»ã
 ä¸æ´ä¸ªä¸åè¿è½´è½¬ä¸å
 ä¸å8â¶30ï¼æ¸çå°å¹¿åãè®°èæ¥å°æç§åç¤¾åºæ¶ï¼é¦æ¢æ¥åå¶ä»ç¤¾åºå·¥ä½èå·²ç»åå¥½åå¤ï¼æ¿èµ·å°é²å­ãå°å·å­ç­å·¥å·åºäºé¨ãä»ä»¬è¦èµ¶å¨åå®¶å¼é¨ä¹åå°æ°å¼ è´´çå°å¹¿åå¨é½æ¸çå¹²åãé¦æ¢æ¥å¨ç¤¾åºéä¸»è¦è´è´£è®¡çãå·¥ä¼å·¥ä½ï¼ä½å¥¹æ¯å¤©ä¸åä¹è¦åå¶ä»ç¤¾åºå·¥ä½èä¸æ ·ï¼åä¸å°æ¸æ´å«çå·¥ä½ä¸­å»ã
 èªä»å¼å±âç¾ä¸½åå®ã»æ´æ´çéæåºå¤§è¡å¨âä»¥æ¥ï¼åæ¬æ¸çç®¡è¾åºåçå°å¹¿åãå¼å¯¼è½¦è¾ä¸è½ä¹±åä¹±æ¾ãæ´æ²»å°åè´©å éç»è¥ãå®£ä¼ è½å®âé¨åä¸åâè´£ä»»å¶ç­å·¥ä½ï¼ä»ä»¬æ¯å¤©é½å¾å¹²ãæ¯æ¬¡å·¡é»æ¶é´é½å¨1å°æ¶ä»¥ä¸ï¼ååå¾èµ°ä¸æ°å¬éè·¯ç¨ã
 å¨ä¸å¤é«å¢ä¸ï¼è®°èåé¦æ¢æ¥è¸®èµ·èå°ï¼éå¸¸ååå°æ¸çå°å¹¿åãâä»¥åå°å¹¿åé½è´´å¨æ¯è¾ä½ç®çå°æ¹ï¼ç°å¨è¶è´´è¶é«ï¼æ¸çèµ·æ¥ååå°é¾ãâé¦æ¢æ¥è¯´ã
 ä¸å9â¶30ï¼åçåç§è¯æãå¨ä¸ç»å·¥ä½äººåå¤åºå·¡é»çç©ºå½ï¼è´è´£å³å¨ä¿éå·¥ä½çç¤¾åºå·¥ä½èçå¨åå¬å®¤ï¼è´è´£ä¸ºå±æ°åçåé¡¹äºå¡ãè¿ä¸ªæ¶é´æ®µï¼ä¹æ¯å±æ°åæ¥åçåç§è¯æãè¯ä»¶ï¼é¢åå»ä¿åå­çâé«å³°æâã
 å¯ä»¥è¯´ï¼å¡æ¯æ¶åå°å±æ°çæ´»çä»»ä½äºå¡ï¼å ä¹é½è¦å°ç¤¾åºåçãæ·å£æ¬ä¸¢å¤±ãåºå½åæ¤ç§ãå®¶å±è¦ç«åãçµåè½¦è¦ä¸çâ¦â¦ç¤¾åºè¦å¼å·çè¯æå¯è°äºè±å«é¨ãæææ»æ»ã
 ä¸å10â¶00ï¼æ¨ä¸ªç»ç¤¾åºèäººæçµè¯ãæ¥è¿10æ¶ï¼å¤åºå·¡é»ææ¸æ´çå·¥ä½äººåéç»­åå°åå¬å®¤èªå·±çå²ä½ä¸ã
 å·¡é»å·¥ä½ä¸è¬å®è¡è½®æµå¶ï¼è°ä¸å¡ä¸å¿çæ¶åå°±å°å¤é¢å»å·¡é»ï¼å¹¶è´è´£å¯¹åé¡¹å·¥ä½è¿è¡å¼å¯¼ãçéãä¸æ´ä¸ªä¸åï¼å·®ä¸å¤æ¯ä¸ªäººé½è¦å·¡é»ä¸ä¸¤æ¬¡ã
 æ­¤æ¶ï¼ä¸ä½ç¤¾åºèäººåæ¥é¢åéé³èåæ¾ç»éä¼èäººçæ°é®åãå¶åï¼ç¤¾åºä¸»ä»»é±æå¬éå¶ä»å·¥ä½äººåï¼æ¨ä¸ªç»ä¸äºè¿æ²¡æ¥é¢åçèäººæçµè¯ãâææ¶åä¸æå°±æ¯å åä¸ªï¼æä»¬ç¤¾åºçéä¼èäººæ300å¤ä¸ªï¼è¿ç®æ¯è¾å°çãâé±æè¯´ï¼æ¯æ¬¡åæ¾æ°é®ååé¢åå»çä¿é©æ¶ï¼ä»ä»¬é½è¦éå¤è¿ä¸ªç¹ççå·¥ä½ï¼åæ¯å¨ç¤¾åºåä¸ªè§è½å¼ è´´éç¥ï¼ç­åå±æ°åæ¥é¢åãå¦æè¶è¿3å¤©è¿æ²¡æé¢å®ï¼å°±è¦æä¸å åéçµè¯ï¼æ¨ä¸ªéç¥å¤§å®¶åæ¥é¢åã
 ä¸­å12â¶00ï¼å ç­ãä¸­åä¸ç­æ¶é´å°äºï¼ä½ä¸äºç¤¾åºå·¥ä½èä»æ æ³ç¦»å¼åå¬å®¤ãâå¾å¤å°è´¦è¦èµ¶åºæ¥ï¼è¿ä¸¤å¤©å°±è¦æ£æ¥äºãâé±ææ³äºæ³ï¼è¿æ¯å³å®çå¨åå¬å®¤å ç­ãæ¯ä¸ªç¤¾åºé½è¦åå¤100å¤ç§å°è´¦ï¼å¾å¤èµæçåå¤ï¼ä»ä»¬åªè½å©ç¨ä¼æ¯æ¶é´å ç­å®æã
 ä»»å¡ç¹é
 11åç¤¾å·¥åç®¡6000å±æ°
 å¨æç§åç¤¾åºï¼è®°èç»æ°ä¹åï¼åç°å¢ä¸å±ææ27åçå­ï¼å¶ä¸­åæ¬ç¤¾åºæå¡ä¸­å¿ãæ¿å¡æå¡ä¸­å¿ãç¤¾åºååæå¡ç«ãå³å¨ä¿éå·¥ä½ç«ãäººæ°è°è§£å§åä¼ãç¾¤ä¼å·¥ä½å®¤ç­ï¼è¿æå³å¿ä¸ä¸ä»£å·¥ä½å§åä¼ãæ®ç¾äººåä¼ãå®¶é¿å­¦æ ¡ãç»¿è²ç½å§ãå¸æ°ææå­¦æ ¡ç­ã
 å¯¹äºè¿äºæææ»æ»ççå­ï¼é±æè®¤ä¸ºï¼è¿æ°å¥½åæ äºç¤¾åºå·¥ä½èçä»»å¡ç¹éãâå¾å¤äººé½ä»¥ä¸ºç¤¾åºå·¥ä½å¾è½»æ¾ï¼å¶å®ï¼æä»¬çå·¥ä½ä¸ç¹ä¹ä¸è½»æ¾ãä½ ä¹çå°äºï¼åºå±ç¤¾åºå¹²é¨å·¥ä½ä»»å¡éï¼å¤´ç»ªå¤ï¼çº·ç¹å¤æï¼å¼å±èµ·æ¥æ¯è¾æå°é¾ï¼èä¸æå¾å¤å·¥ä½å±æ°ä¸æ¿éåï¼ç¤¾åºå·¥ä½äººåååå¾å¤§ãâä»è¡¨ç¤ºï¼ç¤¾åºå·¥ä½åæ¬å·¡è¡ãåä¸å¡ãä¸æ·ãå¤å¸æ´æ²»ç­ï¼æ¯å¤©é½å¾å¿ï¼ä½è¿ä¹æ¯ç¤¾åºçæ¬èå·¥ä½ï¼å¿é¡»åå¥½ã
 æ®é±æä»ç»ï¼æç§åç¤¾åºè´è´£å·ä½å·¥ä½çåªæ11ä¸ªå·¥ä½äººåï¼å´è¦åç®¡6000å¤ä½å±æ°ï¼å¶ä¸­è¿æ400å¤ä¸ªæµå¨äººå£ãå¤§å®¶åå·¥ä¸åå®¶ï¼äº¤åå·¥ä½ï¼ç»å¸¸ç¸äºå¸®å¿ãâæä»¬æ çä¸è½ç¶æè¿ä¹å¤èè½é¨é¨çåå­ï¼ä½é£å¹¶ä¸ä»£è¡¨ä¸ä¸ªé¨é¨ï¼åªæ¯è¡¨ç¤ºèè½çå·¥ä½åå®¹ï¼è®©ç¾¤ä¼çå°çå­å°±ç¥éæä»¬é½è´è´£ä»ä¹å·¥ä½ãâ
 æå¾çè§£
 åç¤¾åºé½è¦
 æ¬æç»ä¸æ ç
 æ®äºè§£ï¼æç§åç¤¾åºçç¤¾åºæ çä¹æ¯ä¸ä¹ååå¶ä½å¥½ï¼éæ°æ¬æä¸å»çãå¯¹æ­¤ï¼é±æç¬ç§°âç½åæçå¾é«âãä»è¯´ï¼ç±äºæ­¤ååä¸ªç¤¾åºæ ççæè´¨ãé¢è²é½ä¸ç»ä¸ï¼å æ­¤ï¼10æä¸­æ¬ï¼è¥¿ä¹¡å¡åºæ¿å¡ä¸­å¿ç»ä¸å¶ä½äºä¸æ¹æ°çæ çï¼åæ¾å°åä¸ªç¤¾åºï¼æç§åç¤¾åºåé¢å°å°±é©¬ä¸æ´æ¢äºï¼æ²¡æ³å°ç½åç¼çè¿ä¹å°ãâå¶å®ä¸åæ¯æä»¬ç¤¾åºï¼å¶ä»ç¤¾åºä¹é½è¦è´æè¿ä¹å¤èè½çï¼ä»åä¹è¦æ¬æç»ä¸çæ çãâ âä»ä¸ä¸ªä¾§é¢ï¼å®ä¹åæ äºç¤¾åºå·¥ä½èçå·¥ä½ååè¾è¦ãâåæ¹è¡éåå¯ä¸»ä»»èåºæ¢å¦æ¯è®¤ä¸ºãâå¡æ¯æå©äºåå¸å»ºè®¾çäºæï¼ç¤¾åºå·¥ä½èé½è¦å»åï¼è¯´å®è¯ï¼å¤§å®¶å·¥ä½é½å¾è¾è¦ãâèåºæ¢è¯´ï¼ç¤¾åºå·¥ä½èå¹³æ¶å¾å°è½æ½å¾åºæ¶é´éªä¼´å®¶äººï¼å ç­å ç¹æ¯å¸¸æçäºï¼âå¸æç¤¾åºå±æ°è½å¤ä¸äºä½è°æä»¬çç¤¾åºå·¥ä½èï¼éåä»ä»¬æå·¥ä½åå¥½ãâ
ï¼ç¼è¾ï¼SN091ï¼   ï¼ç¼è¾ï¼SN091ï¼   å¹¿è¥¿æ°é»ç½\  ä¸ä¸ªç¤¾åºæäº27åçå­ï¼è¿æ¥ï¼æç½åå¨åå®æé¨æ·ç½ç«è®ºååå¸ï¼å¹¶è´´åºä¸å¼ è¢«ä¼å¤ç½åäºç¸è½¬åçå¾çï¼å¾çæ¾ç¤ºï¼è¯¥ç¤¾åºå±æäºå¤§å¤§å°å°27ä¸ªèè½é¨é¨ççå­ãç½åâ11æ âæå¼ï¼è¯¥ç¤¾åºå¤ªå¼ºå¤§äºï¼çè³âå ªæ¯ç¾å½ç½å®«âãä¸ä¸ªå°å°çç¤¾åºï¼ä¸ºä½è¦æé£ä¹å¤ç    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ac852000d=   åäº¬å°å»ºå»èæå¡è¯ä¼°å¶åº¦ æç¡®è¡¥è´´é¢åèµæ ¼7   http://news.sina.com.cn/c/2013-11-10/140628670926.shtml   10-11-2013 14:06:00	  èäººä½å»èé¢å°âè¯ä¼°â
 æ¶åççãç²¾ç¥ãç»æµæ¡ä»¶ãçæ´»ç¶åµä»¥æä¾ç¸åºçæå¡ä¿éæç¡®è¡¥è´´é¢åèµæ ¼
 æ³å¶ææ¥è®¯(è®°èéæ¯) åäº¬å°å»ºç«å»èæå¡è¯ä¼°å¶åº¦ï¼å¯¹èå¹´äººçççãç²¾ç¥ãç»æµæ¡ä»¶ãçæ´»ç¶åµè¿è¡ç»¼ååæåè¯ä»·ï¼ä»¥æä¾ç¸åºçæå¡åä¿éãæªæ¥ï¼å¬å»ºå»èé¢å¥ä½æ¡ä»¶åå°ä¸è¯ä¼°å¶åº¦æå³ã
 æ³å¶ææ¥è®°èä¸åè·æï¼å¸æ¿åºé¢å¸äºãå³äºå å¿«æ¨è¿å»èæå¡ä¸åå±çæè§ãï¼ä»¥åä¸ä¹éå¥çå»èæºæå»ºè®¾å®æ½åæ³ãè¿æ¯åäº¬è´¯å½»è½å®åçåå«å¤§æ¥åæåºçâç§¯æåºå¯¹äººå£èé¾åãå¤§ååå±èé¾æå¡äºä¸åäº§ä¸æç¥ç®æ âçå·ä½æåµã
 å¸æ°æ¿å±å¯å±é¿æçº¢åµè¡¨ç¤ºï¼è¯¥æè§ä¸­æåºäºåºæ¬å»èæå¡å¶åº¦ï¼è¿ä¼æ¯ä»¥åææåºçä¸ºèæå¡çåºæ¬å¬å±æå¡æ´å·ä½ãå³äºæå¡å¯¹è±¡ãä»åæå¡å¯¹è±¡å°è¦äº«åçæå¡ãæå¡çåºæ¬æ°´å¹³ï¼å°å¨æªæ¥æ¿åºå·ä½çå®æ½åæ³ãåäº¬è¿å°æå»ºç«å»èæå¡çè¯ä¼°å¶åº¦ï¼ä½ä¸ºä»åæ¿åºå¯¹å¾èå¹´äººç¸å³åºæ¬å¬å±æå¡åå®¹çåææ¡ä»¶ã
 åäº¬å°åºå°çè¯ä¼°å¶åº¦å°å¯¹èå¹´äººçççãç²¾ç¥ãç»æµæ¡ä»¶ãçæ´»ç¶åµè¿è¡ç»¼ååæåè¯ä»·ï¼ç§å­¦å°ç¡®å®å¯¹èå¹´äººæå¡çç±»åï¼å¹¶æç¡®æ¤çå»èæå¡è¡¥è´´é¢åçèµæ ¼ãæçº¢åµéé²ï¼ä»åï¼åæ¬å¥ä½ä¸äºå¬å»ºæ°è¥çå»èé¢ãå¬ç«å»èé¢çæ¡ä»¶ï¼é½å°è·è¯ä¼°å¶åº¦æå³ã
 å»èæå¡è¯ä¼°å¶åº¦å®æ½åï¼ä½æ¶å¥ãå¤±è½ãå¤±ç¬ãé«é¾åç¹æ®å°é¾èå¹´äººï¼å°ç±æ¿åºç»äºç¸åºçç¦å©ä¿éï¼åå®ä¿éç»æµå°é¾çå­¤å¯¡ãå¤±è½ãé«é¾ãå¤±ç¬ç­èå¹´äººæå¡éæ±ã
 ä¸å®¶è§£è¯»
 è¯ä¼°å°å¯¹å¥ä½åæå¡æä¾åèæ å
 åäº¬å¸èå¤§å­¦ä¸­å½å¬çç ç©¶é¢é¢é¿çæ¯èè¡¨ç¤ºï¼å¯¹èå¹´äººç¶åµè¿è¡ç»¼åè¯ä¼°æ¯å»èæå¡é¢åçå½éæ¯ä¾ãæå½ä¹åä»æ¯å¯¹ç»æµæ¶å¥è¿è¡è¯ä¼°ï¼èä»¥å®éç»éªæ¥çï¼å¾å¤æ¶å¥é«äºä½ä¿æ åçèå¹´äººãèå¹´å¯äººï¼åæ ·æ²¡æè½åç§æèªå·±ãå æ­¤ï¼æªæ¥è¿å°å å¥ççãç²¾ç¥çæ´»ç¶åµç­ï¼æä¸ºç»¼åè¯ä¼°ã
 è¯ä¼°å¶åº¦å¦æä¸å¬å»ºå»èé¢å¥ä½æ¡ä»¶æé©ï¼çæ¯èè®¤ä¸ºï¼ä¸ä»æ¯å¬å»ºå»èé¢ï¼åºè¯¥åæ¬ææçå»èé¢å¨åï¼è¯ä¼°å¶åº¦å¯¹å¥ä½åæå¡æä¾åèæ åï¼è¿äºé½æéå¸¸å®éçæä¹ã
 
ï¼ç¼è¾ï¼SN091ï¼   ï¼ç¼è¾ï¼SN091ï¼   æ³å¶ææ¥g  èäººä½å»èé¢å°âè¯ä¼°âæ¶åççãç²¾ç¥ãç»æµæ¡ä»¶ãçæ´»ç¶åµä»¥æä¾ç¸åºçæå¡ä¿éæç¡®è¡¥è´´é¢åèµæ ¼æ³å¶ææ¥è®¯(è®°èéæ¯)åäº¬å°å»ºç«å»èæå¡è¯ä¼°å¶åº¦ï¼å¯¹èå¹´äººçççãç²¾ç¥ãç»æµæ¡ä»¶ãçæ´»ç¶åµè¿è¡ç»¼ååæåè¯ä»·ï¼ä»¥æä¾ç¸åºçæå¡åä¿éãæªæ¥ï¼å¬å»ºå»èé¢    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415acd29000f>   å¼ºå°é£æµ·çè¿å¥æµ·ååé¨æµ·é¢ 2ä¸å¤èæ¸è¹åæ¸¯7   http://news.sina.com.cn/c/2013-11-10/134628670853.shtml   10-11-2013 13:46:00;  ä¸­æ°ç¤¾æµ·å£11æ10æ¥çµ  (è®°è ä»ç¾æ)10æ¥ä¸åï¼ä»å¹´ç¬¬30å·å°é£âæµ·çâ(å¼ºå°é£çº§)æ­£è¿å¥æµ·åå²åé¨æµ·é¢ï¼æµ·åçä¸æ²å¸å¤§é¨åå²ç¤ç°10â12çº§çå¤§é£ï¼ä¸äºç­æµ·åå²åé¨å¸å¿å·²ç°æ´é£é¨ãæªè³10æ¥8æ¶ï¼æµ·åå¨ç26930èæ¸è¹å·²å¨é¨åæ¸¯é¿é£ã
 æµ·åçâä¸é²åâå¯ä¸»ä»»ãæ°é»åè¨äººéæ­¦è¡¨ç¤ºï¼æµ·åå¯å¨äºé²æ±é²å°é£â£åºæ¥ååºã
 æ®æµ·åæ°è±¡å°çæµï¼åâæµ·çâå½±åï¼9æ¥8æ¶â10æ¥7æ¶ï¼æµ·åçä¸æ²å¸å¤§é¨åå²ç¤åºç°10â12çº§çå¤§é£ï¼æå¤§ä¸ºåç¤å²12çº§(34.7ç±³/ç§)ï¼åæ¶åå²ç¤æ®éä¸­å°å¤§é¨ï¼å¦å¤ï¼æµ·åå²ä¸åé¨æ²¿æµ·éå°æ®éåºç°7â9çº§å¤§é£ï¼ä¸­ä¸é¨å°åºåºç°ä¸­å°å¤§é¨ãå±å°æ´é¨ï¼æå¤§ä¸ºç¼ä¸­è¥æ ¹é66.5æ¯«ç±³ãé¢è®¡âå¼ºå°é£âæµ·çâ10æ¥å°ä»æµ·åå²åé¨è¿æµ·ç»è¿ï¼å°åé¨å°åºå¸¦æ¥å¤§æ´é¨ï¼å¹¶æ10å°11çº§å¤§é£ï¼éµé£12çº§ã
 ç¼å·æµ·å³¡å·²äº9æ¥20æ¶å¨çº¿åèªï¼è¿åºç¼å²çè½®è¹ãåè½¦åçéç­è½¦å¨é¨åè¿ãç²¤æµ·éè·¯å¯å¨äºé²å°é£åºæ¥é¢æ¡ï¼å¯¹åå°æ»¨ãè¥¿å®ãåäº¬ãä¸æµ·ãé¿æ²ãæé½ç­å°å¾è¿æµ·å£æèä¸äºç6å¯¹æå®¢åè½¦çè¿è¡å¾é½è¿è¡äºè°æ´ã10æ¥ä¸åï¼æµ·åä¸ç¯é«éå¨è½¦ç»åè¿ã
 ä¸äºå¤å°æºåºå®æ¹å¾®åæ¶æ¯ï¼æªè³10æ¥10æ¶ï¼è¯¥æºåºåå½±åèªç­è¾¾27æ¶æ¬¡ãæºåºç°å¯å¨å¤§é¢ç§¯èªç­å»¶è¯¯çº¢è²é¢è­¦(Içº§ååº)ï¼åæ¶è¿å¥æå°é²æ±åºæ¥ç¶æã(å®)
(åæ é¢ï¼å¼ºå°é£âæµ·çâè¿å¥æµ·ååé¨æµ·é¢ 2ä¸å¤èæ¸è¹åæ¸¯)
ï¼ç¼è¾ï¼SN095ï¼   ï¼ç¼è¾ï¼SN095ï¼   ä¸­å½æ°é»ç½;  ä¸­æ°ç¤¾æµ·å£11æ10æ¥çµ(è®°èä»ç¾æ)10æ¥ä¸åï¼ä»å¹´ç¬¬30å·å°é£âæµ·çâ(å¼ºå°é£çº§)æ­£è¿å¥æµ·åå²åé¨æµ·é¢ï¼æµ·åçä¸æ²å¸å¤§é¨åå²ç¤ç°10â12çº§çå¤§é£ï¼ä¸äºç­æµ·åå²åé¨å¸å¿å·²ç°æ´é£é¨ãæªè³10æ¥8æ¶ï¼æµ·åå¨ç26930èæ¸è¹å·²å¨é¨åæ¸¯é¿é£ãæµ·    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415aca76000e:   å¤åªèç¦ä¸ä¸­å¨ä¼ ç§°ä¸­å½ç»æµæ¹é©æ°é¢å¶æ¶7   http://news.sina.com.cn/c/2013-11-10/135228670854.shtml   10-11-2013 13:52:008  èç¦ä¸­å½å®è°ç»æµæ¿ç­ç§°ä¸ä»ç¾å§è·çè¿å°å½±åæ´ä¸ªä¸çç±äºå¨çå¢éä½è¿·ââ
 å¤åªç§°ç»æµæ¹é©æ°é¢å¶æ¶
 ä¸­å±åå«å±ä¸ä¸­å¨ä¼9æ¥å¨åäº¬å¼å¹ãè¿æ¬¡å·æç©ºåæ¹é©æä¹çå¤§ä¼å¸å¼äºå¨çç®åãèä½ä¸ºå¨ççç¬¬äºå¤§ç»æµä½ï¼ä¸­å½å¨ç»æµæ¹é©ä¸çä¸ä¸¾ä¸å¨çµå¨çå¨ççæ¯ä¸ä¸ªç¥ç»ã
 å¤åªçº·çº·è¯è®ºç§°ï¼å¨å¨çç»æµæç»­ä½è¿·çæåµä¸ï¼ä¸­å½å¨æ­¤æ¶æ¨è¿ç»æµæ¹é©æ°é¢å¶æ¶ã
 èç¦ç»æµä¸ºç»æµæ¿ç­å®è°ä¸çç¿é¦ä¼ç¼
 å¯¹äºæ­¤æ¬¡ä¸ä¸­å¨ä¼ï¼å¤å®¶å¤åªâå¿æçµçâå°å³æ³¨ä¸­å½ç»æµæ¹é©ãæ³æ°ç¤¾9æ¥æ¥éç§°ï¼æ­¤æ¬¡ä¼è®®å°ä¸ºä¸­å½æ°ä¸å±æ¿åºçç»æµæ¿ç­âå®è°âã
 èè±å½ãéèæ¶æ¥ãåæ¥éç§°ï¼åå«å±ä¸ä¸­å¨ä¼å°ååºâä¸­å½è¿èå¤§è¹æ²¿çæ­£ç¡®èªååè¡âçä¿¡å·ï¼ä¸­å½ç»æµå°è½¬åæ´å éè§æ¶è´¹ååæ°é©±å¨ãå¯æç»­åå±çæ¨¡å¼ãé¢è®¡ä¼è®®å°æåºä¸ä»½æ¶µçè¯¸å¤é¢åçæ¹é©æ¹æ¡ï¼å¼ºè°å®åç¤¾ä¼ä¸»ä¹å¸åºç»æµã
 âç¸ä¿¡ä¸­å½çç»æµè½¬ååæ¯æ¯ç¾å¥½çãâå°åº¦ãç»æµæ¶æ¥ãç§°ï¼ä¸­å½éæ©å¨è¿ä¸æ¶å»æ¨è¿ç»æµæ¹é©ï¼æ¯ä¸ä¸çºª90å¹´ä»£çä»»ä½ä¸ä¸ªæ¶é´èç¹é½è¦æ¥å¾æ°å½ãå ä¸ºå¨çç»æµå¢éä¾æ§ä½è¿·ï¼èä¸­å½éæ©æ­¤æ¶éæ¯ç»æµæ¹é©å¯¹ä¸çç»æµçæä¹ï¼å°æ¯ä»¥å¾ä»»ä½æ¶åé½è¦éè¦ãç¾å½åæ¬§çç­åè¾¾ç»æµä½æ­£ç¿é¦ä»¥ç¼ã
 âè¿æ¯æ¶åå¨çç¬¬äºå¤§ç»æµä½æ¹é©çå³é®éç¨ç¢ï¼æ¯è¶³ä»¥å½±åä¸­å½ä¼å¦å¨2020å¹´è¶è¶ç¾å½æä¸ºå¨çç»æµé¾å¤´çéå¤§äºä»¶ãâé¦æ¸¯ãææ¥ãçæ¥éå¦æ­¤å®ä¹ä¸ä¸­å¨ä¼çéè¦æ§ï¼ç§°å¨çæ¿åºååå¤§åªä½åå¤ä»¥æ¾å¤§éä»ç»è§å¯ä¼è®®è®®ç¨ä»¥åæ°æ¹é©æªæ½ã
 âä¸­å±åå«å±ä¸ä¸­å¨ä¼ä¸ä»å¯¹ä¸­å½æä¹éå¤§ï¼å¯¹æ´ä¸ªä¸çä¹å½±åæ·±è¿ãä¸­å½çè¿ä¸æ­¥å¼æ¾ä»¥å
 é¼å±ä¸­å½æ¶è´¹èæ©å¤§æ¶è´¹çæ¿ç­å°ç»ç¾å½å¬å¸å¸¦æ¥å·¨å¤§å©çãâç¾å½ãåçé¡¿é®æ¥ãçæ¥ééæ©ä»¥æ°å­è¯´è¯ï¼ ä¸­å½ç»æµä»¥å¹³åæ¯å¹´10%å·¦å³çéåº¦å¢é¿ï¼ç»æµæ»éå å¨çæ¯éä¹ç±1980å¹´ççº¦2%ä¸åè³ç®åç15%ã
 çè°æ¹é©æè±æ°å­æç¼å¯»æ±å¨æ°æ¹æ¡
 å¨ç»æµæ¹é©é¢åï¼ä¸­å½æåªäºäºæéè¦å»åï¼å¤åªçº·çº·éåºèªå·±çæå¾ä¸é¢æµãç¾å½ãå¤äº¤æ¿ç­ãçæ¥éåé¡¾ç§°ï¼ä¸­å½30å¹´æ¥äº«åçåä½æ°çé«éç»æµå¢é¿ï¼å®ç°äºåææªæçåä¸¾ï¼ä½¿å¾æ°ä»¥ç¾ä¸è®¡çäººå£æè±äºè´«å°ã
 âèç°å¨ï¼ä¸­å½éè¦åå±æ´ä¸ºå¯æç»­çç»æµåå±æ¨¡å¼ãä¸­å½é¢å¯¼äººæ­£å´ç»è¿ä¸ç¹é¸é ä¸ä¸ªå¨æ°çç»æµæ¨¡å¼ãäºå®ä¸ï¼ä¸­å½é«å±é¢å¯¼äººå¯¹ç»æµæ¹é©ååéè§ãâãå¤äº¤æ¿ç­ãä¸¾ä¾è¯´ï¼ä¸­å½åæ®µæ¶é´å¼å¯äºä¸æµ·èªè´¸åºã
 âä¸åªå¯¹ç»æµæ°å­âè¾çâï¼ä¸­å½æ°æ¿åºæ­£å¨å¯»æ±æ°çè§£å³æ¹æ¡ãâç¾å½CNNçæ¥éè¯´ï¼å°æ¹æ¿åºæ¹é©å°æ¯ä¸­å½æ¹åç»æµå¢é¿æ¨¡å¼çå³é®ãé¦åï¼ä»ä¸­å¤®æ¿åºå¼å§ï¼æè±ç»æµå¢é¿ç®æ çæç¼ï¼è¿èå®æ½ç³»ç»åçä¸æ½å­æ¹é©æ¹æ¡ï¼å¯¹å°æ¹æ¿åºè¿è¡æ¹é©ãå¶æ¬¡ï¼ä½¿å°æ¹æ¿åºæ´å å³æ³¨åå±åä¸åå¸åºï¼ä½¿å¾åå¸æ´å å®å±ï¼è®©ä¸­å½å®ç°å¯æç»­ååå±ã
 æ¥æ¬éèæ°é»åå¨å±å¼å¹¿æ³è°æ¥åå¾åºç»è®ºï¼âåæ¹ä¸è´è®¤åï¼ä¸ä¸­å¨ä¼æåºçæ¹é©æªæ½å¯¹ä¸­å½ç»æµçåå±æçå¼ºæåçä¿è¿ä½ç¨ãâæ¥éç§°ï¼ä»ä¸çæ§çè°æ¥æ¥çï¼ç»å¤§å¤æ°çåè®¿èè®¤ä¸ºï¼ä¸­å½é¢å¯¼å±
 çæè§£å³å°æ¹æ¿åºåºå¡é®é¢ï¼å¹¶æ¨è¿éèæ¹é©ï¼ä¸ä¸­å¨ä¼çå¼å±æ çå°å¸®å©ä¸­å½éä½ä»ååçéèå±æºçæ¦çã
 å³æ³¨æ°çæ¹é©è®¡åå°åºçèç¾å§è·ç
 ç»æµæ¹é©æ­¥å¥æ­£è½¨ï¼æ¯å³å®æ°çå¤§è®¡çå³é®ãè±å½ãæ¯æ¥çµè®¯æ¥ãè®¤ä¸ºï¼æ­¤æ¬¡å¨ä¼å°å¸¦æ¥âæ·±å»åé©âï¼å®è¡æ¹é©å°ä½¿å¤å³çä¸­å½äººæ´å¤å°ä»å½æ°çäº§ä¸­è·çã
 è±å½å¹¿æ­å¬å¸(BBC)ä¹å¨é¢ä¸ºãä¸ºä½ä¸­å½çä¸ä¸­å¨ä¼å¦æ­¤éè¦ãçæç« ç§°ï¼æ¬å±ä¸ä¸­å¨ä¼å°å³æ³¨æ®éèç¾å§çæ°çå¤§è®¡ï¼å¯è§å¶éè¦æ§ã
 æ¥éä»¥åäº¬é²å¤©å¸åºçä¸å¹å¼ç¯ï¼âå¨ä¸ä¸ªç¹å¿çå¸åºï¼ä¸­å½èç¾å§å¨å¯»æ¾ä¾¿å®ãæ°é²çè¬èãâæ¥éæ¥çæåºï¼èå°±å¨ä¸è¿å¤ï¼ä¸­å±åå«å±ä¸ä¸­å¨ä¼æ­£å¨å¬å¼ãæ­¤æ¬¡ä¼è®®ä¹æä»¥å¦æ­¤éè¦ï¼æ­£æ¯å ä¸ºå°æå¾å¤æ¶åæ°çé®é¢çè®¡ååºçï¼èè¿ç´æ¥å³ä¹å¨ä¸­å½çè³æµ·å¤çæ¯ä¸ä¸ªäººã
 ç¾å½ãå¤äº¤æ¿ç­ãçæ¥éä¹è®¤ä¸ºï¼ä¸­å½æ­£å¨éæ¸å½¢æçâæ¹é©å¿å¤´âå°ä¼å¯¹å¸åºè¿è¡æ¹é©ï¼è¿æ­£æ¯æ°ä¼ä¹äºçå°çãæ¥éæ»ç»æåºï¼æµ©å¤§èå·ä½çæ¹é©ä¸å¯è½ä¸è¹´èå°±ï¼ä½æ¯ä¸ä¸­å¨ä¼ä¸­ä¼ éåºæ¥çä¿¡å·æ¯ä¸­å½âæ­£é¢ç§¯æãæä¹åæ°é¢çâæ¹é©ä¹é£ã
 å­¦èå£°é³ä¸­å½ç»æµåéå·¨å¤§æ¯ä»¶äºé½æ¯å¤§äº
 å¯¹äºä¸­å½å³å°å¨é¢å±å¼çç»æµæ¹é©ï¼å¤ä½å½å¤ç¥åå­¦èæ¥åæ³æè®°èéè®¿ï¼çè°ä»ä»¬çç¬ç¹è§è§£ã
 ç¾å½èåç»æµå­¦å®¶æ´å°ã»ä¹æ ¹æ£®ä»æ¨å¨æ¥åæ³æè®°èéè®¿æ¶è¡¨ç¤ºï¼å¯¹äºä¸­å½æ­¤æ¬¡è¦è¿è¡å¨é¢æ·±åæ¹é©ï¼æ¨è¡è¿è´¯åå¨é¢çå¢é¿æç¥ï¼å½éç¤¾ä¼å°ä¼è¡¨ç¤ºæ¬¢è¿ãæ­¤æ¬¡ä¼è®®ä¸ï¼ä¸­å½æ°ä¸å±é¢å¯¼ç­å­å¶å®å·ä½çè®¡åï¼å°ä¼ä¸ºå®ç°ä¸­å½æ¢¦è®¾ç«èå°ã
 ä¹æ ¹æ£®è¿ä¸æ­¥æåºï¼å¨ä¸­å½æ°ä¸å±é¢å¯¼äººçé¢å¯¼ä¸ï¼ä¸­å½ç»æµåå±çä¸»è¦æ¨åå°æ¥èªåå¸åæ¹é©ï¼èæéè¦çåçº¿æ¹é©å°æ¯æ·ç±æ¹é©å¶åº¦ãèä¸­å½æ¹é©çä¸å¤§æ¯æ±å°æ¥èªåå°åéãå³å¨ååèµæ¬å¸åºçæ¨è¿ï¼æ¹é©æ¿åºè¡æ¿é¨é¨ï¼å¤§å¹åå°å®¡æ¹ç¨åºï¼æ´å¤ä¾èµç»æµå¸åºï¼ä»¥åå¼æ¾å¸åºãå¢å¼ºç«äºåï¼å®ç°åæ°åç»æµçè½¬åã
 âä¸ä¸­å¨ä¼å°ä¼å¶å®ä¸­å½ä¸ç³»åæ¹é©æªæ½çæ¡æ¶ï¼æ¶åç»æµç­å¹¿æ³é¢åãå¶ä¸­åæ¬åå±åæåå°å¸åºï¼ä»¤å½æä¼ä¸å¨å½ååæµ·å¤å¸åºæ´å·ç«äºè½åï¼ä»¥åè¿ä¸æ­¥æ¹é©éèä½ç³»ç­ãâåä½å¤§å­¦ä¸äºç»æµä¸­å¿ä¸»äººå¾·æç¹ã»å¸éæ¯ä»æ¨åè¯æ³æè®°èã
 è°å°ä¸­å½ç»æµï¼éç åå½ä¹ç¶ï¼èåç»æµå­¦å®¶åå§ã»å¥¥å°¼å°å¨æ¥åæ³æè®°èéè®¿æ¶è¡¨ç¤ºï¼âå³ä¾¿ç®åä¸­å½åºç°äºç»æµæ¾ç¼ï¼ä½æ¯ä¸­å½æ¯å¹´ä»ç¶ä¸ºå¨çç»æµè´¡ç®1ä¸äº¿ç¾åçç»æµäº§å¼ãä¸­å½ç»æµåççæ¯ä¸ä»¶äºå¯¹å¨çç»æµæ¥è¯´é½æ¯å¤§äºãç¹å«æ¯å½ä¸­å½ä¿è¿æ¶è´¹å¨å½æ°ç»æµä¸­çä½ç¨æ¶ï¼è¿ä¸åéæ¯å·¨å¤§çãâ
 å¥¥å°¼å°è¡¨ç¤ºï¼å¨çé½éå¸¸å³æ³¨æ­¤æ¬¡ä¸ä¸­å¨ä¼ãâæ­¤æ¬¡ä¼è®®å¬å¼åï¼ä¸­å½çæ¿ç­å¶å®èå·²ç»éæ¾åºäºâè¦å¤§å¹²ä¸åºâçä¿¡å·ï¼å¯è§ä¼è®®çéå¤§æä¹ãâ
 ãå°åº¦æ¶æ¥ãï¼ä¸ä¸­å¨ä¼é¢ç¤ºä¸­å½ç»æµç¤¾ä¼å·¨åè±å½BBCï¼ä¸ºä½ä¸ä¸­å¨ä¼å¦æ­¤éè¦ï¼
 é¦æ¸¯ãååæ©æ¥ãï¼å¯¹ä¸ä¸­å¨ä¼çæ¹é©ææ
 ç¾å½ãå¤äº¤æ¿ç­ãï¼ä¸ä¸­å¨ä¼çé­åæå¨
 æ¬çæ/è®°èé»å²ç¿å¶å¾/å»å
 
ï¼ç¼è¾ï¼SN091ï¼   ï¼ç¼è¾ï¼SN091ï¼   æ³å¶ææ¥f  èç¦ä¸­å½å®è°ç»æµæ¿ç­ç§°ä¸ä»ç¾å§è·çè¿å°å½±åæ´ä¸ªä¸çç±äºå¨çå¢éä½è¿·ââå¤åªç§°ç»æµæ¹é©æ°é¢å¶æ¶ä¸­å±åå«å±ä¸ä¸­å¨ä¼9æ¥å¨åäº¬å¼å¹ãè¿æ¬¡å·æç©ºåæ¹é©æä¹çå¤§ä¼å¸å¼äºå¨çç®åãèä½ä¸ºå¨ççç¬¬äºå¤§ç»æµä½ï¼ä¸­å½å¨ç»æµæ¹é©ä¸çä¸ä¸¾ä¸å¨çµå¨çå¨ççæ¯ä¸ä¸ªç¥    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415acdbf0010@   7æ¬¡ä¸ä¸­å¨ä¼å¬æ¥é«é¢è¯çç¹ï¼åå±æ¹é©è¢«ææå¤7   http://news.sina.com.cn/c/2013-11-10/133328670767.shtml   10-11-2013 13:33:007  35å¹´åçå²æ«ï¼ä¸­å½å±äº§ååä¸å±ä¸ä¸­å¨ä¼å¬å¼ï¼å¼å¯äºä¸åºæ³¢æ¾å£®éçä¼å¤§æ¹é©ã
 åçäººå£«æ®éè®¤ä¸ºï¼æ¬å±ä¸ä¸­å¨ä¼å°å¾åæªæ¥10å¹´ä¸­å½æ¹é©èå¾ï¼è®®é¢æå°è§¦åè¡æ¿ä½å¶æ¹é©ãéèæ¹é©ãåéååå±ãèµæºä»·æ ¼æ¹é©ç­åå®¹ã
 è®°èçç¹1978å¹´ä»¥æ¥åå¸ç7æ¬¡ä¸ä¸­å¨ä¼å¬æ¥ï¼åç°åæåä¸ãå¸åºç»æµãæ¹é©åå±ç­æä¸ºåºç°é¢çæé«çå³é®è¯ãå¶ä¸­"åå±"å"æ¹é©"æåæå¤ï¼è¾¾å°289æ¬¡ã
 æ¥åï¼ååå½å®¶é¢å¯¼äººå·²å¨ä¸åå¬å¼åºåè¡¨ç¤ºï¼æ­¤æ¬¡ä¸ä¸­å¨ä¼å°æåº"ç»¼åæ¹é©æ¹æ¡"ï¼èä¸"æ¹é©èå´ä¹å¹¿ï¼ååº¦ä¹å¤§ï¼é½å°æ¯ç©ºåç"ã
 "åæ"ä¸è¯æäº125æ¬¡
 æå½æ¯ä¸ä¸ªæ¥æåå¤äº¿äººå£çåå±ä¸­å¤§å½ãåä¸åæ¥é½æ¯å®å¤©ä¸ãç¨³æ°å¿çæç¥äº§ä¸ãå¦ä½å¨å¸åºç»æµä¸æå¥½"ä¸å"é®é¢æä¸ºä¸­å¤®é¢å¯¼äººå¿é¡»æèçéè¦é®é¢ï¼ä¹è®©ä¸åé®é¢æä¸ºåå±ä¸ä¸­å¨ä¼å¬æ¥ä¸­åºç°æå¤çé«é¢è¯ã
 è®°èç»è®¡åç°ï¼å¨åä¸å±ä¸ä¸­å¨ä¼ä»¥æ¥çå¬æ¥ä¸­ï¼"åæ"è¢«æå125æ¬¡ï¼"åä¸"è¢«æå77æ¬¡ï¼"åæ°"è¢«æå43æ¬¡ã
 1978å¹´çåä¸å±ä¸ä¸­å¨ä¼ã1998å¹´çåäºå±ä¸ä¸­å¨ä¼å2008å¹´çåä¸å±ä¸ä¸­å¨ä¼å¬æ¥ä¸­é½æåäºåæçç»æµé®é¢ï¼ä¾å¦åä¸å±ä¸ä¸­å¨ä¼çåæäººæ°å¬ç¤¾ãåäºå±ä¸ä¸­å¨ä¼çå®¶åº­æ¿åç»è¥ä¸ºåºç¡çç»åç»åçåå±ç»æµä½å¶ï¼ä»¥ååä¸å±ä¸ä¸­å¨ä¼å¯¹åææ¹é©çå¨é¢è¡¨è¿°ã
 æ­¤å¤ï¼ä¸ä¸åé®é¢ç¸å³ç"åä¹¡"ã"åææ¹é©"ã"æ°åæ"ç­è¯ä¹å¤æ¬¡å¨å¬æ¥ä¸­åºç°ã
 1998å¹´10æçåäºå±ä¸ä¸­å¨ä¼å¬æ¥æåºï¼è¦å»ºè®¾ç¤¾ä¼ä¸»ä¹æ°åæãä¼è®®å®¡è®®éè¿äºãä¸­å±ä¸­å¤®å³äºåä¸ååæå·¥ä½è¥å¹²éå¤§é®é¢çå³å®ãï¼æåºäºå°2010å¹´å»ºè®¾æä¸­å½ç¹è²ç¤¾ä¼ä¸»ä¹æ°åæçå¥æç®æ ã
 2008å¹´çåä¸å±ä¸ä¸­å¨ä¼ï¼æåº"æ¨è¿åææ¹é©è¿ä¸æ­¥æ·±å¥"ï¼ä¼è®®éè¿äºãä¸­å±ä¸­å¤®å³äºæ¨è¿åææ¹é©åå±è¥å¹²éå¤§é®é¢çå³å®ãï¼ä¼è®®æå¤§ççªç ´æ¯åæåå°æ¿åç»è¥æçæµè½¬ï¼æåºå å¼ºåæå¶åº¦å»ºè®¾ï¼ç§¯æåå±ç°ä»£åä¸ï¼æé«åä¸ç»¼åçäº§è½åï¼å å¿«åå±åæå¬å±äºä¸ã
 âé¢æµæ­¤å±ä¸ä¸­å¨ä¼ææ¶åå°å¶åº¦æ¹é©ï¼
 æç§æ­¤åä¸ä¸­å¨ä¼"ä¸å±è°åæï¼ä¸å±è°å¸åº"çè§å¾ï¼ä¸å°ä¸å®¶é¢æµæ­¤æ¬¡å°æ¶ååææ¹é©ï¼å¶ä¸­åå°å¶åº¦æ¯ä¸å¯åé¿çè¯é¢ãæ¥åï¼å½å¡é¢åå±ç ç©¶ä¸­å¿åç¤¾ä¼å¬å¼çå¶ä¸ºåå«å±ä¸ä¸­å¨ä¼æäº¤ç"383"æ¹é©æ¹æ¡æ»æ¥å
 ä¸­ï¼æå°äºåå°å¶åº¦æ¹é©åå®¹ã
 è¯¥æ¥åæåºï¼å°èµäºåæ°éä½åå°å¤ç½®æãæµæ¼æåè½¬è®©æï¼æå»ºå¹³ç­è¿å¥ãå¬å¹³äº¤æçåå°å¸åºï¼åè®¸åæéä½åå°ä¸å½æåå°å¹³ç­è¿å¥éåç¨å°å¸åºï¼åæéä½å»ºè®¾ç¨å°ç´æ¥å¥å¸ï¼é½æ¯ä¸­å½åå°å¶åº¦ææ°çéå¤§æ¹é©ã
 å¸åºç»æµæä¸ºåå±ç­ç¹
 è®°èåç°ï¼ä»åä¸å±ä¸ä¸­å¨ä¼ä»¥æ¥ï¼å¤§é¨åä¸ä¸­å¨ä¼é½èç¦å¨ç»æµæ¹é©çè®®é¢ä¸ï¼èæ¿æ²»è®¨è®ºæ¶åè¾å°ãç»æµè®®é¢ä¸ï¼åæååå¸åºæ¬åå ä¸åãèè¿å»20å¹´çåå²è¡¨æï¼ä¸ä¸­å¨ä¼å¾å¾æ¯å¯å¨éè¦ç»æµä½å¶æ¹é©çè¸æ¿ã
 å¨1978å¹´ä»¥æ¥çåå±ä¸ä¸­å¨ä¼å¬æ¥ä¸­ï¼"å¸åº"è¢«æå55æ¬¡ï¼"ç»æµä½å¶"è¢«æå38æ¬¡ï¼"å¸åºç»æµ"è¢«æå29æ¬¡ã
 1993å¹´çååå±ä¸ä¸­å¨ä¼æ­£å¼ç¡®ç«å»ºè®¾ç¤¾ä¼ä¸»ä¹å¸åºç»æµçåºæ¬æ¹éï¼æåºä¸­å¤®å±é¢ä¸æå¤§çæ¹é©æ¯å»ºç«è®¡åãè´¢æ¿åè´§å¸ä¸ä½ä¸ä½çå®è§è°æ§ä½ç³»ï¼æ¿åºè¿ç¨ç»æµææ®µãæ³å¾ææ®µåå¿è¦çè¡æ¿ææ®µç®¡çå½æ°ç»æµï¼ä¸ç´æ¥å¹²é¢ä¼ä¸ççäº§ç»è¥æ´»å¨ã
 2003å¹´çåå­å±ä¸ä¸­å¨ä¼çæ¹é©è¦ç¹å¨äºè¿ä¸æ­¥æ¨è¿ç¤¾ä¼ä¸»ä¹å¸åºåæ¹é©ï¼è¦æ±å¤§ååå±åç§¯æå¼å¯¼éå¬æå¶ç»æµã
 âé¢æµå¸åºç»æµæ¹é©å¨é¢æ¨è¿ï¼
 ä»å¹´æ¯æ¹é©å¼æ¾35å¨å¹´ï¼æåºå»ºç«ç¤¾ä¼ä¸»ä¹å¸åºç»æµä½å¶20å¨å¹´ï¼å®åå»ºç«ç¤¾ä¼ä¸»ä¹å¸åºç»æµä½å¶10å¨å¹´ãæç§è§å¾ï¼æè¯è®ºçæµï¼åå«å±ä¸ä¸­å¨ä¼å°æ¯å¸åºç»æµæ¹é©å¨é¢æ¨è¿ãç»§ç»­æ·±åçéè¦æ¶é´ç¹ã
 å½å¡é¢åå±ç ç©¶ä¸­å¿ç ç©¶åãèåç»æµå­¦å®¶å´æ¬çå¨æ¥ååªä½éè®¿æ¶è¯´ï¼æ¿åºä¸å¸åºçå³ç³»ï¼ä¸ç´æ¯ä¸­å½ç»æµæ¹é©é¢ä¸´çæ ¸å¿é®é¢ã
 å´æ¬çè®¤ä¸ºï¼ä¸ä¸æ­¥æ¹é©å¿é¡»è¦åæ¸æ¥æ¿åºåå¸åºçè¾¹çï¼æç´æ¥æ§å¶ç»æµçå¨è½åæ¿åºæ¹é ä¸ºæä¾å¬å±æå¡çæå¡åæ¿åºï¼å¹¶å°æ¿åºè¡ä¸ºç½®äºæ°ä¼ççç£ä¹ä¸ã
 âæ¹é©âæ¯ä¸åä¸»é¢
 åä¸å±ä¸ä¸­å¨ä¼æ¯æ¹é©çåå²èµ·ç¹ï¼è¿æ¬¡ä¼è®®æåºâæå¨åå·¥ä½ççéç¹è½¬ç§»å°ç¤¾ä¼ä¸»ä¹ç°ä»£åå»ºè®¾ä¸æ¥çå»ºè®®âï¼èªæ­¤ï¼ä¸­å½è¿å¥å¨é¢ç»æµå»ºè®¾æ¶æï¼åä¸å±ä¸ä¸­å¨ä¼å¼å¯äºæ¹é©å¼æ¾æ°æ¶æã
 1978å¹´ä»¥æ¥ï¼åå±åçä¸ä¸­å¨ä¼é½æ¿è½½çä¿è¿ç»æµåå±åæ·±åç»æµä½å¶æ¹é©çéå¤§ä½¿å½ã
 1978å¹´æ¥ç7æ¬¡ä¸ä¸­å¨ä¼ï¼âæ·±åæ¹é©âå§ç»æ¯è´¯ç©¿å¶ä¸­çä¸åä¸»é¢ãè¿7æ¬¡ä¸ä¸­å¨ä¼ï¼æ5æ¬¡ç´æ¥æ¯ä¸æ·±åæ¹é©ç¸å³ï¼2æ¬¡åååææ¹é©ä¸åå±ç¸å³ã
 ç»è®¡å¾åºï¼å¨åå±ä¸ä¸­å¨ä¼å¬æ¥ä¸­ï¼âæ¹é©âè¢«æå116æ¬¡ï¼ä¸æ¹é©ç´§å¯ç¸å³çâç°ä»£åâãâå®åâãâå¼æ¾âä¹è¢«æ°åæ¬¡æåã
 å¨åå«å±ä¸ä¸­å¨ä¼å¼å¹åå¤ï¼ä¸­å¤®é«å±å¥èµ´å¨å½å¤å°å´ç»å¨é¢æ·±åæ¹é©ãç§æåæ°ãåæç»æµç­é®é¢è¿è¡å¯éè°ç ãå°½ç®¡é¢åä¸åï¼ä½æ¹é©ç¡®æ¯ä¸­å¤®é«å±å¨è°ç æ¶é½ä¼æåçè¯æ±ã
 âé¢æµ æ¹é©ååº¦ç©ºå
 æ¥åï¼ååå½å®¶é¢å¯¼äººå·²å¨ä¸åå¬å¼åºåè¡¨ç¤ºï¼æ­¤æ¬¡ä¸ä¸­å¨ä¼å°æåºâç»¼åæ¹é©æ¹æ¡âï¼èä¸âæ¹é©èå´ä¹å¹¿ï¼ååº¦ä¹å¤§ï¼é½å°æ¯ç©ºåçâã
 å½å®¶è¡æ¿å­¦é¢ææãä¸­å½è¡æ¿ä½å¶æ¹é©ç ç©¶ä¼å¯ä¼é¿æ±ªçå¯æ¥ååªä½éè®¿æ¶è¡¨ç¤ºï¼æ¯æ¬¡ä¸ä¸­å¨ä¼é½ä¼æä¸äºéå¤§çæ½æ¿çº²é¢åºæ¥ï¼è¿ä¸ªæ½æ¿çº²é¢ä¸æ¯ç­æçï¼æ¯è¦æå¯¼ä¸æ®µæ¶æçå·¥ä½çï¼ä½ä¸ºæç¥é¨ç½²ã
 æ±ªçå¯è¯´ï¼ç»æµæ¹é©ãæ¿æ²»æ¹é©ãè¡æ¿æ¹é©è¿äºé½è¿ä¸ºä¸ä½ï¼å¿é¡»è¦èå¨æ¨å¨ï¼ä»ä»é åç¹æ¨å¨æ¯ä¸å¯è½çãè¿æ¬¡æ¹é©çæè·¯å¾æ¸æ°ï¼è¡æ¿ä½å¶æ¯æ¹é©éç¹ï¼è½¬åæ¿åºèè½æ¯éä¸­ä¹éãæ¿åºèè½ä¸è½¬åï¼å¾å¤æ¹é©æ¹ä¸å¨ã
 æ¬çæ/è®°èçéè¾æ°æ®æ¥æºäºä¸­å½å±äº§åæ°é»ç½
 
ï¼ç¼è¾ï¼SN091ï¼   ï¼ç¼è¾ï¼SN091ï¼   æ³å¶ææ¥Y  35å¹´åçå²æ«ï¼ä¸­å½å±äº§ååä¸å±ä¸ä¸­å¨ä¼å¬å¼ï¼å¼å¯äºä¸åºæ³¢æ¾å£®éçä¼å¤§æ¹é©ãåçäººå£«æ®éè®¤ä¸ºï¼æ¬å±ä¸ä¸­å¨ä¼å°å¾åæªæ¥10å¹´ä¸­å½æ¹é©èå¾ï¼è®®é¢æå°è§¦åè¡æ¿ä½å¶æ¹é©ãéèæ¹é©ãåéååå±ãèµæºä»·æ ¼æ¹é©ç­åå®¹ãè®°èçç¹1978å¹´ä»¥æ¥åå¸ç7æ¬¡ä¸ä¸­å¨    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ace4f0011+   æµ·å6å¯¹æå®¢åè½¦å å°é£æµ·çè°æ´7   http://news.sina.com.cn/c/2013-11-10/131728670726.shtml   10-11-2013 13:17:00  è§é¢å è½½ä¸­ï¼è¯·ç¨å...
on 
 åæµ·ç½æµ·å£11æ9æ¥æ¶æ¯(åæµ·ç½è®°èæ¨é½è¹ éè®¯åå¾æ­¦) è®°è9æ¥ä»ç²¤æµ·éè·¯è·æï¼å å°é£âæµ·çâå½±åï¼ä¸ºç¡®ä¿æå®¢åè½¦å®å¨ï¼ç²¤æµ·éè·¯å¯å¨äºé²å°åºæ¥é¢æ¡ï¼å¯¹è¿åºæµ·åå²ç6å¯¹æå®¢åè½¦è¿è¡å¾ä½åºè°æ´ï¼æµ·åä¸ç¯é«éä¹å°è§å°é£è­¦æ¥æåµè¿è¡è°æ´ã
 å·ä½è°æ´ä¸ºï¼
 11æ8æ¥ã9æ¥åäº¬è¥¿å¼T201æ¬¡è¿è¡è³å¹¿å·ç«ç»æ­¢ï¼11æ9æ¥ã10æ¥ä¸äºå¼T202æ¬¡æ¹ä¸º11æ10æ¥ã11æ¥å¨å¹¿å·ç«å§åãåæ¶å¹¿å·-ä¸äºé´T201æ¬¡ãT202æ¬¡åè¿ã
 11æ9æ¥ã10æ¥ä¸æµ·åå¼K511æ¬¡è¿è¡è³å¹¿å·ç«ç»æ­¢ï¼11æ9æ¥ã10æ¥æµ·å£å¼K512æ¬¡æ¹ä¸º11æ10æ¥ã11æ¥å¨å¹¿å·ç«å§åãåæ¶å¹¿å·-æµ·å£é´K511æ¬¡ãK512æ¬¡åè¿ã
 11æ8æ¥ã9æ¥è¥¿å®å¼K1167æ¬¡è¿è¡è³å¹¿å·ç«ç»æ­¢ï¼11æ10æ¥ã11æ¥æµ·å£å¼K408æ¬¡æ¹ä¸ºå½æ¥å¨å¹¿å·ç«å§åãåæ¶å¹¿å·-æµ·å£é´K1167æ¬¡ãK408æ¬¡åè¿ã
 11æ9æ¥ã10æ¥é¿æ²å¼K407æ¬¡è¿è¡è³å¹¿å·ç«ç»æ­¢ï¼11æ9æ¥ã10æ¥æµ·å£å¼K1168æ¬¡æ¹ä¸º11æ10æ¥ã11æ¥å¨å¹¿å·ç«å§åãåæ¶å¹¿å·-æµ·å£é´K407æ¬¡ãK1168æ¬¡åè¿ã
 11æ7æ¥ã8æ¥åå°æ»¨å¼K1121æ¬¡è¿è¡è³å¹¿å·ä¸ç«ç»æ­¢ï¼11æ10æ¥ã11æ¥æµ·å£å¼K1122æ¬¡æ¹ä¸º11æ11æ¥ã12æ¥å¨å¹¿å·ä¸ç«å§åãåæ¶å¹¿å·ä¸-æµ·å£é´K1121æ¬¡ãK1122æ¬¡åè¿ã
 11æ8æ¥ã9æ¥æé½ä¸å¼K485æ¬¡è¿è¡è³å¡å£åæ¹ä¸ºå°æ¹æ±ç«ç»æ­¢ï¼11æ9æ¥ã10æ¥æµ·å£å¼K486æ¬¡æ¹ä¸º11æ10æ¥ã11æ¥å¨å»æ±ç«å§åãåæ¶å¡å£-æµ·å£é´K485æ¬¡ãæµ·å£-å»æ±é´K486æ¬¡åè¿ã
 å å°é£å½±åæå®¢åºè¡ï¼éè·¯é¨é¨è¡¨ç¤ºæ­æï¼å¹¶æéæå®¢åºè¡åå³æ³¨åç¸å³è½¦ç«çå¬åï¼åè½¦è°æ´æå¡ä¿¡æ¯å¯ç»é12306éè·¯å®¢æä¸­å¿ç½ç«æè´çµ12306å®¢æ·çµè¯æ¥è¯¢ã
 
ï¼ç¼è¾ï¼SN091ï¼   ï¼ç¼è¾ï¼SN091ï¼	   åæµ·ç½[  åæµ·ç½æµ·å£11æ9æ¥æ¶æ¯(åæµ·ç½è®°èæ¨é½è¹éè®¯åå¾æ­¦)è®°è9æ¥ä»ç²¤æµ·éè·¯è·æï¼å å°é£âæµ·çâå½±åï¼ä¸ºç¡®ä¿æå®¢åè½¦å®å¨ï¼ç²¤æµ·éè·¯å¯å¨äºé²å°åºæ¥é¢æ¡ï¼å¯¹è¿åºæµ·åå²ç6å¯¹æå®¢åè½¦è¿è¡å¾ä½åºè°æ´ï¼æµ·åä¸ç¯é«éä¹å°è§å°é£è­¦æ¥æåµè¿è¡è°æ´ãå·ä½è°æ´ä¸ºï¼1    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415acf750012/   ä¸äºæºåº27æ¶æ¬¡èªç­åå°é£æµ·çå½±å7   http://news.sina.com.cn/c/2013-11-10/131328670722.shtml   10-11-2013 13:13:00ô  åæµ·ç½ä¸äº11æ10æ¥æ¶æ¯(ä¸äºæ°é»ç½è®°èé©¬ä¼å) 11æ10æ¥ï¼è®°èç±ä¸äºå¤å°æºåºè·æï¼åå°é£âæµ·çâå½±åï¼æªæ­¢è³10æ¶ï¼è¯¥æºåºåå½±åèªç­è¾¾27æ¶æ¬¡ï¼ä»æ¥åºæ¸¯æå®¢é¢è®¡20400äººï¼ç®åå·²å®æåºæ¸¯æå®¢çº¦2900äººï¼åå½±åèªç­æå®¢æ­£åå¤å®æéåºä¼æ¯ï¼ç°å·²å®æçº¦1500é´å®¢æ¿ã
 ç®åï¼å¤å°æºåºç°å¯å¨å¤§é¢ç§¯èªç­å»¶è¯¯çº¢è²é¢è­¦(Içº§ååº)ï¼åæ¶è¿å¥æå°é²æ±åºæ¥ç¶æã
 
ï¼ç¼è¾ï¼SN091ï¼   ï¼ç¼è¾ï¼SN091ï¼	   åæµ·ç½:  åæµ·ç½ä¸äº11æ10æ¥æ¶æ¯(ä¸äºæ°é»ç½è®°èé©¬ä¼å)11æ10æ¥ï¼è®°èç±ä¸äºå¤å°æºåºè·æï¼åå°é£âæµ·çâå½±åï¼æªæ­¢è³10æ¶ï¼è¯¥æºåºåå½±åèªç­è¾¾27æ¶æ¬¡ï¼ä»æ¥åºæ¸¯æå®¢é¢è®¡20400äººï¼ç®åå·²å®æåºæ¸¯æå®¢çº¦2900äººï¼åå½±åèªç­æå®¢æ­£åå¤å®æéåº    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ad0470013>   æµ·åå¤å°é­éå°é£æµ·çè¢­å» é¨åå°åºç°8çº§çé£7   http://news.sina.com.cn/c/2013-11-10/130728670705.shtml   10-11-2013 13:07:00ê  2013å¹´11æ10æ¥ä¸å10æ¶30åï¼ç¬¬30å·å¼ºå°é£âæµ·çâç®åæ­£å¨åè¶åé¼è¿ï¼ä¸­å¿éè¿æå¤§é£å14çº§ãåå¶å½±åï¼æµ·åé¨åå°åºåºç°8çº§ä»¥ä¸çé£ãä¸äºå¸æ°è±¡å°10æ¥æ©08æ¶28ååæ´å°é£é»è²é¢è­¦ä¿¡å·ä¸ºå°é£æ©è²é¢è­¦ä¿¡å·ï¼ç®åå°é£âæµ·çâç¯æµå·²å½±åä¸äºï¼æ²¿æµ·åéå°å¹³åé£åå¯è½è¾¾10çº§ä»¥ä¸ï¼éµé£12çº§ï¼å¹¶ä¼´æå¤§é¨å°æ´é¨ï¼è¦æ±æå³åä½åäººååå¥½é²èå·¥ä½ã
ï¼ç¼è¾ï¼SN095ï¼   ï¼ç¼è¾ï¼SN095ï¼   ä¸­å½æ¥æ¥ç½ç«:  2013å¹´11æ10æ¥ä¸å10æ¶30åï¼ç¬¬30å·å¼ºå°é£âæµ·çâç®åæ­£å¨åè¶åé¼è¿ï¼ä¸­å¿éè¿æå¤§é£å14çº§ãåå¶å½±åï¼æµ·åé¨åå°åºåºç°8çº§ä»¥ä¸çé£ãä¸äºå¸æ°è±¡å°10æ¥æ©08æ¶28ååæ´å°é£é»è²é¢è­¦ä¿¡å·ä¸ºå°é£æ©è²é¢è­¦ä¿¡å·ï¼ç®åå°é£âæµ·çâç¯æµå·²    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ad1040014-   æµ·åä¸ç¯é«éå å°é£å½±åå¨çº¿åè¿7   http://news.sina.com.cn/c/2013-11-10/125728670693.shtml   10-11-2013 12:57:00T  åæµ·ç½æµ·å£11æ10æ¥æ¶æ¯(åæµ·ç½è®°è æ¨é½è¹ éè®¯å å¾æ­¦)è®°èåä»ç²¤æµ·éè·¯è·æï¼åå°é£âæµ·çâå½±åï¼ä¸ç¯é«é11æ10æ¥å¨å¤©åè¿ã
 å å°é£å½±åæå®¢åºè¡ï¼éè·¯é¨é¨è¡¨ç¤ºæ­æï¼å¹¶æéæå®¢åºè¡åå³æ³¨åç¸å³è½¦ç«çå¬åï¼å¯¹è´­ä¹°äºå°é£æé´åè¿è½¦æ¬¡è½¦ç¥¨çæå®¢ï¼å¯å°å°±è¿è½¦ç«å®ç¥¨çªå£åçéç¥¨ææ¹ç­¾æç»­ï¼åè½¦è°æ´æå¡ä¿¡æ¯å¯ç»é12306éè·¯å®¢æä¸­å¿ç½ç«æè´çµ12306å®¢æ·çµè¯æ¥è¯¢ã
ï¼åæ é¢ï¼åå°é£âæµ·çâå½±åä¸ç¯é«éå¨çº¿åè¿ï¼
ï¼ç¼è¾ï¼SN095ï¼   ï¼ç¼è¾ï¼SN095ï¼	   åæµ·ç½T  åæµ·ç½æµ·å£11æ10æ¥æ¶æ¯(åæµ·ç½è®°èæ¨é½è¹éè®¯åå¾æ­¦)è®°èåä»ç²¤æµ·éè·¯è·æï¼åå°é£âæµ·çâå½±åï¼ä¸ç¯é«é11æ10æ¥å¨å¤©åè¿ãå å°é£å½±åæå®¢åºè¡ï¼éè·¯é¨é¨è¡¨ç¤ºæ­æï¼å¹¶æéæå®¢åºè¡åå³æ³¨åç¸å³è½¦ç«çå¬åï¼å¯¹è´­ä¹°äºå°é£æé´åè¿è½¦æ¬¡è½¦ç¥¨çæå®¢ï¼    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415adda200222   æ±èå¸¸çä¸å®¶ä¸å£è¢«æ çç¯6å°æ¶è¢«æ7   http://news.sina.com.cn/c/2013-11-10/104728670157.shtml   10-11-2013 10:47:00q  æ°åç½åäº¬11æ10æ¥çµï¼è®°èåå·å·ï¼è®°è10æ¥ä»æ±èçå¸¸çå¸å§å®£ä¼ é¨è·æï¼è¯¥å¸9æ¥åçä¸èµ·ä¸å®¶ä¸å£è¢«ææ¡ãç®åï¼ç¯ç½ªå«çäººå·²è¢«è­¦æ¹ææå½æ¡ã
 11æ9æ¥18æ¶54åï¼å¸¸çå¸å¬å®å±æ¥ç¾¤ä¼æ¥è­¦ï¼ç§°è¯¥å¸æ¢æéä¸å±æ°å®¶ä¸­ä¸å®¶ä¸å£æ¾ä¸å°äººï¼ä¸å®¶ä¸­æè¡è¿¹ãæ¥æ¥åï¼å¸¸çè­¦æ¹ç«å³å¯å¨çä¼¼è¢«ä¾µå®³å¯¹è±¡å¤ç½®é¢æ¡ï¼å¨åå¼å±ä¾¦æ¥å·¥ä½ã
 è³10æ¥é¶æ¶30åï¼ä¾¦å¯åå¨è¯¥å¸ç¢§æºªéä¸åºç§å±åæåæè·ç¯ç½ªå«çäººè§æãç»å®¡æ¥ï¼å¶å¯¹ææ­»ä¸äººçç¯ç½ªäºå®ä¾è®¤ä¸è®³ã
ï¼ç¼è¾ï¼SN095ï¼   ï¼ç¼è¾ï¼SN095ï¼	   æ°åç½O  æ°åç½åäº¬11æ10æ¥çµï¼è®°èåå·å·ï¼è®°è10æ¥ä»æ±èçå¸¸çå¸å§å®£ä¼ é¨è·æï¼è¯¥å¸9æ¥åçä¸èµ·ä¸å®¶ä¸å£è¢«ææ¡ãç®åï¼ç¯ç½ªå«çäººå·²è¢«è­¦æ¹ææå½æ¡ã11æ9æ¥18æ¶54åï¼å¸¸çå¸å¬å®å±æ¥ç¾¤ä¼æ¥è­¦ï¼ç§°è¯¥å¸æ¢æéä¸å±æ°å®¶ä¸­ä¸å®¶ä¸å£æ¾ä¸å°äººï¼ä¸å®¶ä¸­æè¡è¿¹    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415adae50020:   å·ç©ºæ°æºé¨éªæ¥è¢­ äº¬æ´¥åå³å°å¼å¯å¥å¬è¿ç¨=   http://weather.news.sina.com.cn/news/2013/1110/062796177.html   10-11-2013 06:27:00þ	  ä¸­å½å¤©æ°ç½è®¯ è¿ä¸¤æ¥ï¼åè¾å¼ºå·ç©ºæ°å½±åï¼æ°çå±å°åºç°å¤§å°æ´éªãæªæ¥ä¸¤å¤©ï¼è¿è¡å·ç©ºæ°å°èªåååç»§ç»­ç»æå½å¸¦æ¥å¤§èå´çé¨éªãå¤§é£ãéæ¸©å¤©æ°ï¼11æ¥é»æ²³ä»¥åå°åºæä½æ°æ¸©å°æ®éè·è³å°ç¹ä»¥ä¸ãä¸13æ¥è³14æ¥è¿å°æä¸è¡å¼±å·ç©ºæ°æ¥è¢­ï¼äº¬æ´¥åç­å°å°å¨è¿æå¼å¯å¥å¬è¿ç¨ã
 æ¨å¤©ï¼ææ¾éæ°´ç»§ç»­ç¼ ç»å¨æ°çæ²¿å¤©å±±ä¸å¸¦ï¼ä¸è¿è¾åæ¥ï¼å¼ºåº¦å·²ææåå¼±ãæ¸©æ³ãåä¹ãç²¾æ²³ãé¿æå±±å£ãä¹èãå·´é³å¸é²åãæåãä¹é²æ¨é½ç­å°åæééªåºç°ï¼å¶ä¸­ï¼æåãæ¸©æ³ãåä¹ééªè¾å¼ºï¼è¾¾å°å¤§éªéçº§ãåæ¶ï¼è¥¿åå°åºä¸é¨å°ä¸åä¸å¸¦çé¨éªä¹å·²éç»­å±å¼ï¼çä¼åå¸ä¸­å¤ªåãç³å®¶åºãå¤©æ´¥ãæµåãåäº¬ãæ²é³é½æå¼±éé¨åºç°ï¼å¶ä¸­åäº¬æ¨å¤©05æ¶è³ä»å¤©05æ¶éæ°´éå·²è¾¾12æ¯«ç±³ï¼è¾¾å°äºä¸­é¨éçº§ã
 åå·ç©ºæ°ä¸ç§»åä¸åé¨éªå¤©æ°çå±åå½±åï¼æ¨å¤©14æ¶ç¸è¾åå¤©åæ¶æ¬¡ï¼æ°çä¸­åé¨ãéæµ·åé¨ãè¥¿åå°åºä¸é¨ãåèå¤ãä¸åå°åºä¸­åé¨ãååä»¥åå±±ä¸åé¨ç­å°æ°æ¸©æ®éåºç°äº3è³8âçä¸æ»ãéæ¸©æå§ççåºååä¸»è¦éä¸­å¨åèå¤æ²³å¥å°åºè³ä¸åé¨çé¨åå°åºï¼åèå¤ä¸­é¨æ¨å¤©14ç¹çæ°æ¸©è¿å¨10âä¸ä¸ï¼ä»å¤©14ç¹å·²éè³0âå·¦å³ã
 æªæ¥ä¸¤å¤©ï¼è¾å¼ºå·ç©ºæ°å°èªåååå¤§é¢ç§¯éºå±å¼æ¥ï¼å¤å°éæ¸è¢«é¨éªéæ¸©å¤©æ°åä»£ï¼éæ¸©å°æä¸ºæªæ¥å å¤©çä¸»è¦åºè°ãä¸­å¤®æ°è±¡å°é¢è®¡ï¼ä¸åå°åºä¸é¨ãåååé¨ãé»æ·®ä¸­ä¸é¨ãæ±æ·®ä¸é¨ãæ±åè¥¿é¨ãè´µå·ä¸é¨ç­å°æ6ï½8âéæ¸©ï¼å±é¨å°åºéæ¸©å¯è¾¾8ï½10âï¼ä¸è¿°å°åºå¹¶ä¼´æ4ï½6çº§ååé£ãåççå°ãçèè¥¿é¨ç­å°çé¨åå°åºææ¬æ²å¤©æ°ã
 åæ­¤æ¬¡å·ç©ºæ°å½±åï¼ä»å¤©ï¼åæ¹å¤§é¨å°åºçæé«æ°æ¸©å°å·æ°ä¸åå¹´æ¥çæä½çºªå½ãæå¤©æ©æ¨ï¼é»æ²³ä»¥åå°åºçæä½æ°æ¸©å°æ®éè¾¾å°å°ç¹ä»¥ä¸ãæ­¤å¤ï¼13è³14æ¥è¿æä¸è¡å¼±å·ç©ºæ°å³å°å½±ååæ¹ï¼å æ­¤åäº¬ãå¤©æ´¥ãæ²³åãå±±ä¸ãéè¥¿çä¸äºå°åºå¯è½å¨è¿æéæ­¥è¿å¥æ°è±¡æä¹ä¸çå¬å­£ã
 å·ç©ºæ°è£¹æé¨éªæ±¹æ¶æ¥è¢­ï¼æå½å¤å°é½å°æåå°âæ¹¿å·âå¤©æ°çå¨åãåæ¹¿åå·çç©ºæ°æ¸éåå¤§ï¼ä¼å½±åäººä½å³èç»ç»åé¨çè¡æ¶²å¾ªç¯ï¼å½è¡æ¶²å¾ªç¯ä¸å¥½ï¼ä¾è¡åå°æ¶ï¼å³èçæµæåå°±ä¼ä¸éï¼ä»èæ£ä¸å³èç¾çãå æ­¤ï¼å¨è¿æ ·çå¤©æ°éè¦ç¹å«æ³¨æé²å¯ä¿æï¼éæ¶æ·»å è¡£ç©ï¼é¿åå¼åèº«ä½ä¸éãÿÿÿÿ   ä¸­å½å¤©æ°ç½ å¾®å_  ä¸­å½å¤©æ°ç½è®¯è¿ä¸¤æ¥ï¼åè¾å¼ºå·ç©ºæ°å½±åï¼æ°çå±å°åºç°å¤§å°æ´éªãæªæ¥ä¸¤å¤©ï¼è¿è¡å·ç©ºæ°å°èªåååç»§ç»­ç»æå½å¸¦æ¥å¤§èå´çé¨éªãå¤§é£ãéæ¸©å¤©æ°ï¼11æ¥é»æ²³ä»¥åå°åºæä½æ°æ¸©å°æ®éè·è³å°ç¹ä»¥ä¸ãä¸13æ¥è³14æ¥è¿å°æä¸è¡å¼±å·ç©ºæ°æ¥è¢­ï¼äº¬æ´¥åç­å°å°å¨è¿æå¼å¯    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415adcb60021$   éè¥¿éæ±¡æå¤©ä¸­å°å­¦æåè¯¾7   http://news.sina.com.cn/c/2013-11-10/105428670206.shtml   10-11-2013 10:54:00;  æ°åç½è¥¿å®11æ10æ¥çµï¼è®°èéæï¼éçå¬å­£å°æ¥ï¼é¾é¾å¤©åæ¬¡æä¸ºéè¥¿å¤ä¸ªå¿å¸æå¸¸åºç°çå¤©æ°ãè®°èè¿æ¥è·æï¼éè¥¿å°å¨è¿æä¿®æ¹ãéè¥¿çå¤§æ°æ±¡æé²æ²»æ¡ä¾ãï¼æ°æ¡ä¾ä¸­å¯è½ä¼æå³äºéæ±¡æå¤©ä¸­å°å­¦åè¯¾ç­è§å®ã
 æ®ä»ç»ï¼éè¥¿çäººå¤§å¸¸å§ä¼æ³å·¥å§ç®åå·²ç»çæå¯¹ãéè¥¿çå¤§æ°æ±¡æé²æ²»æ¡ä¾ãè¿è¡è¿ä¸æ­¥ä¿®æ¹ï¼å¹¶å¼å§é¢åç¤¾ä¼å¬å¼å¾æ±æè§ãä¿®æ¹çæ¡ä¾ä¸­è§å®ï¼å¨å¤§æ°åå°ä¸¥éæ±¡æãå¯è½åçå±å®³äººä½å¥åº·åå®å¨çç´§æ¥æåµä¸ï¼çãè®¾åºçå¸äººæ°æ¿åºåºå½åæ¶åå¸å¤§æ°æ±¡æåºæ¥å¬åï¼æ ¹æ®æ±¡æç­çº§å¯å¨åºæ¥é¢æ¡ï¼éåè´£ä»¤ææ±¡åä½éäº§åäº§ãæºå¨è½¦åæ¬å°ç®¡æ§ãä¸­å°å­¦åè¯¾ä»¥åæ°è±¡å¹²é¢ç­åºå¯¹æªæ½ï¼å¹¶å¼å¯¼å¬ä¼åå¥½å«çé²æ¤ã
 æ¡ä¾ä¸­è¿è§å®ï¼å¯¹å¤§æ°ç¯å¢æéå¤§å½±åçå»ºè®¾é¡¹ç®ï¼åºå½ç±å¿çº§ä»¥ä¸ç¯ä¿é¨é¨ç»ç»å¬è¯ï¼å¬åç¤¾ä¼å¬ä¼åå©å®³å³ç³»äººçæè§ï¼å¬è¯ç»æåºå½ä½ä¸ºå®¡æ¹ç¯å¢å½±åè¯ä»·çéè¦ä¾æ®ã
 å¨éè¥¿çç¯ä¿åéæ¥çç¬¬ä¸å­£åº¦ç¯å¢è´¨éç¶åµä¸­ï¼è¥¿å®çåå¸ç©ºæ°ç¯å¢è´¨éä»æ¶è·3ä¸ªâä¼âï¼èæ±¡æå¤©æ°å´æ46å¤©ï¼è¶è¿åæ°ï¼å¶ä¸­ä¸­ãéåº¦æ±¡ææ13å¤©ï¼é²æ²»å¤§æ°æ±¡æå»ä¸å®¹ç¼ã
ï¼ç¼è¾ï¼SN095ï¼   ï¼ç¼è¾ï¼SN095ï¼	   æ°åç½`  æ°åç½è¥¿å®11æ10æ¥çµï¼è®°èéæï¼éçå¬å­£å°æ¥ï¼é¾é¾å¤©åæ¬¡æä¸ºéè¥¿å¤ä¸ªå¿å¸æå¸¸åºç°çå¤©æ°ãè®°èè¿æ¥è·æï¼éè¥¿å°å¨è¿æä¿®æ¹ãéè¥¿çå¤§æ°æ±¡æé²æ²»æ¡ä¾ãï¼æ°æ¡ä¾ä¸­å¯è½ä¼æå³äºéæ±¡æå¤©ä¸­å°å­¦åè¯¾ç­è§å®ãæ®ä»ç»ï¼éè¥¿çäººå¤§å¸¸å§ä¼æ³å·¥å§ç®åå·²ç»çæå¯¹    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ade8e0023@   å¤®è¡æå¯¹âè¶çº§ç½é¶âæ¶è´¹ è½¬è´¦è´¹æè½¬å«æ¶è´¹è7   http://news.sina.com.cn/c/2013-11-10/104228670226.shtml   10-11-2013 10:42:00[  å¤®å¹¿ç½åäº¬11æ10æ¥æ¶æ¯ï¼è®°èæ±¤ä¸äº®ï¼æ®ä¸­å½ä¹å£°ãå¤®å¹¿æ°é»ãæ¥éï¼æ·±åç½é¶ç¨æ·æ¬¢è¿çå®æ¶è·¨è¡è½¬è´¦ãè·¨è¡è´¦æ·æ¥è¯¢ãèµéå½éç­åè½ä¾èµäºâè¶çº§ç½é¶âç³»ç»ãèæ®äºè§£ï¼âè¶çº§ç½é¶âçåè´¹å¤§é¤æè®¸å¾å¿«å°±å°ç»æäºãå¤®è¡å·²ç»åé¶è¡ä¸åäºãæ¯ä»ç»ç®å¸ç½ä¸æ¯ä»è·¨è¡æ¸ç®ç³»ç»ä¸å¡æ¶è´¹æ¹æ¡(å¾æ±æè§ç¨¿)ãï¼å¶å®äºåæ­¥æ¶è´¹æ¹æ¡ã
 æ®äºè§£å¤®è¡çæ°ä¸ä»£æ¯ä»ç³»ç»è¯çä¸å¹´å¤æ¥å¹¿åæ¬¢è¿ä¸å¡ç¹å¿ï¼å æ­¤å¤®è¡æ­£å¨èèå¯¹åä¸çé¶è¡è¿è¡æ¶è´¹ï¼ä½æ¯ç¸å³ç¥æäººå£«è¯´ï¼å¤®è¡æ­¤æ¬¡æè§ç¨¿å¹¶æ²¡ææç¡®å·ä½çæ¶è´¹æ¹æ¡ã
 æ·±åç½é¶ç¨æ·æ¬¢è¿çå®æ¶è·¨è¡è½¬å¸ãè·¨è¡èªå¨æ¥è¯¢è¿æèµéå½éç­åè½äºä¸ä½çè¶çº§ç½é¶ç³»ç»ç®åå¨å½åå¤å®¶é¶è¡ææºé¶è¡è½¬å¸é½å®è¡åè´¹çï¼è¿ä¸ªå½åäºç³»ç»ä¸æ¶è´¹ãæä»¥å¤®è¡çæ°æ®å°±æ¾ç¤ºè¯´ï¼è¿è¡ä¸å¹´å¤æ¥ä¸å±æ130å®¶åä¸é¶è¡æ³äººæ¥å¥ï¼åºæ¬çè¦çäºå¨é¨å·²ç»å¼åç½ä¸ä¸å¡çåä¸é¶è¡ãå¨2013å¹´8æä»½çæ¶åï¼ç³»ç»çæ¥åå¤çä¸å¡æ223ä¸å¤ç¬ï¼304å¤äº¿åï¼åæ¯å¢é¿äº176.27%å184.08%ãå ä¸ºè¿ä¸ªç³»ç»åå¥½ç¨ååè´¹ï¼æä»¥å¾å¤é¶è¡çè³å°å¤§é¢çä¸å¡æåæå¤ç¬å°éé¢ä¸å¡ï¼éè¿è¶çº§ç½é¶å¤çæ¥é¿åä¸å¡æ¶è´¹ã
 å°±æ­¤å¤®è¡ç¸å³äººå£«å°±è¯´ï¼ä¸ºäºå¼å¯¼åä¸èåçå©ç¨æ­¤ç³»æ¥åçè¿ä¸ªä¸å¡ï¼æå¿è¦ååä¸èæ¶è´¹ãå¦å¤åè´¹ç­ç¥å¼èµ·çä¸å¡æ¿å¢ï¼ä¸å©äºç»´æ¤æ­£å¸¸çæ¯ä»æå¡å¸åºç§©åºï¼ä¼é æç³»ç»é¢ä¸´è¾å¤§çä¸å¡å¤çååï¼å¹¶ä¸å¯¼è´å¤çä¸å¡å¼å¸¸ï¼å æ­¤å¤®è¡æ­£å¨èèå¯¹åä¸çé¶è¡æ¶è´¹ã
 ç½ä¸æ¯ä»è·¨è¡æ¸ç®ç³»ç»ä¸ºä½è¢«ç§°ä½"è¶çº§ç½é¶"ï¼å®ç©¶ç«è½ç»å¤§å®¶å¸¦æ¥åªäºæ¹ä¾¿å¢ï¼
 ç½ä¸æ¯ä»è·¨è¡æ¸ç®ç³»ç»æ¯ä»2010å¹´8æåºå¼å§å»ºæè¿è¡çï¼ä¸»è¦æ¯æ¥å¤çå®¢æ·éè¿å¨çº¿çæ¹å¼åèµ·çè·¨è¡æ¯ä»ï¼éé¢æ¯å¨5ä¸åä»¥ä¸çï¼è¿æå¸æ·ä¿¡æ¯æ¥è¯¢ä¸å¡ãå¨ä¸çº¿çåæä¸ºäºé¼å±åä¸èååå©ç¨è¿ä¸ªç³»ç»æ¥åçä¸å¡ï¼å¤®è¡å°±å¯¹ç³»ç»çåä¸èå®è¡äºåæ¶è´¹çç­ç¥ã
 è½ç¶å¤®è¡è¿ä¸ªç³»ç»å¹¶ä¸ç´æ¥æå¡äºç¤¾ä¼å¬ä¼ï¼ä½æ¯ç±äºå®æåå®¶é¶è¡çç½é¶èéèµ·æ¥äºï¼æä»¥åè¢«äººä»¬ç§°ä¸ºè¶çº§ç½é¶ã
 ç°å¨æäººæå¿å¦æè¶çº§ç½é¶æ¶è´¹ï¼é¶è¡å°±ä¼å°è¿ç¬è´¹ç¨è½¬å«ç»æ¶è´¹èï¼ä½æ¯ç°å¨é¶è¡ä¸åäººå£«è¡¨ç¤ºè¯´å°åºæ¯æååä¸çé¶è¡æä¸å¡éçè§æ¨¡æ¥æ¶åä¸ä¸ªæ»çè´¹ç¨ï¼è¿æ¯æç§è¦å¶å®åºæ¯ç¬äº¤æçä»·æ ¼ï¼ç°å¨é½æ²¡ææåçå®è®ºï¼è¿ä¹å°±æå³çå¤®è¡æç»æ¶è´¹ä¹åï¼é¶è¡ä¹ä¸ä¸å®ä¼æè¿äºè´¹ç¨é½è½¬å«ç»æ¶è´¹èãæä¸äºåéåä½æ¶è´¹ç­ç¥çè¡ä»½å¶åä¸é¶è¡ï¼ä»å¾å¯è½èªå·±å°±æ¿æäºå¨é¨çè´¹ç¨ï¼ä¸ç´å¯¹å®¢æ·åè´¹ãä½æ¯ä¹è¯å®ä¼æé¶è¡åºäºææ¬çèèå°è´¹ç¨è½¬å«ç»æ®éå®¢æ·ãå¦æé¶è¡å¯¹è¶çº§ç½é¶æ¶è´¹æ åä¸ä¸çè¯ï¼ä¹å¿å¿ä¼å¨å¸åºä¸å½¢ææ°çç«äºå±é¢ã
ï¼åæ é¢ï¼å¤®è¡æå¯¹âè¶çº§ç½é¶âæ¶è´¹ è·¨è¡è½¬è´¦è´¹æè½¬å«æ¶è´¹èï¼
ï¼ç¼è¾ï¼SN095ï¼   ï¼ç¼è¾ï¼SN095ï¼   ä¸­å½å¹¿æ­ç½`  å¤®å¹¿ç½åäº¬11æ10æ¥æ¶æ¯ï¼è®°èæ±¤ä¸äº®ï¼æ®ä¸­å½ä¹å£°ãå¤®å¹¿æ°é»ãæ¥éï¼æ·±åç½é¶ç¨æ·æ¬¢è¿çå®æ¶è·¨è¡è½¬è´¦ãè·¨è¡è´¦æ·æ¥è¯¢ãèµéå½éç­åè½ä¾èµäºâè¶çº§ç½é¶âç³»ç»ãèæ®äºè§£ï¼âè¶çº§ç½é¶âçåè´¹å¤§é¤æè®¸å¾å¿«å°±å°ç»æäºãå¤®è¡å·²ç»åé¶è¡ä¸åäºãæ¯ä»ç»ç®å¸ç½ä¸    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415adf2d00246   åå·å®åä¸ºå¿å©ç¤¼å¤§æåå®´ å®´è¯·å®¾å®¢54æ¡7   http://news.sina.com.cn/c/2013-11-10/103728670160.shtml   10-11-2013 10:37:00Ø  å¤®å¹¿ç½æé½11æ10æ¥æ¶æ¯ï¼è®°èè´¾ç«æ¢ï¼æ®ä¸­å½ä¹å£°ãå¤®å¹¿æ°é»ãæ¥éï¼åå·ççºªå§æ¥åå¬å¼æå4èµ·æ¶å"åé£"æ¹é¢çå¸åæ¡ä»¶ï¼å¶ä¸­èªè´¡å¸åæ¹å§å¯ä¸»ä»»ç»å¿å­å¤§åå©å®´ãæ¶åç¤¼éï¼è¢«èªè´¡å¸çºªå§ç»äºååè­¦åå¤åã
 èªè´¡å¸çºªå§ç»äºååè­¦åå¤åï¼åå æ¯èªè´¡å¸åæ¹å§å¯ä¸»ä»»å®é«2013å¹´5æ3æ¥åèªè´¡å¸çºªå§æ¥ååå¤ç»å¿å­ä¸¾åå©ç¤¼ï¼å¸çºªå§å¯¹å®é«è¿è¡äºå»æ´æéï¼æç¡®è¦æ±ä¸è½å¤§æå¤§åä¹ä¸è½éè¯·ç®¡çæå¡å¯¹è±¡åå ã6æ1æ¥å®é«ä¸ºå¶å­ä¸¾è¡å©ç¤¼ï¼å®´è¯·å®¾å®¢54æ¡ï¼å¹¶ä¸æ¶åç®¡çæå¡å¯¹è±¡30äººæéç¤¼é2ä¸1åå¤åã6æ7æ¥èªè´¡å¸çºªå§å°±ç»äºäºå®é«ååè­¦åå¤åï¼å¹¶å°è¿è§æ¶åçç¤¼éäºä»¥æ¶ç¼´ã
 å¼å±æ¿é£èçºªä»¥æ¥ï¼åå·çåçº§çºªæ£çå¯æºå³å·²ç»æ¥å¤æ¶ååé£æ¹é¢çæ¡ä»¶597ä»¶ï¼åå·ççºªå§æ¾å¨ä¸­ç§å½åºåå¤ä¸¤æ¬¡å¬å¼æåå¤èµ·å¸åæ¡ä»¶ï¼å¨æ¥ååå·ççºªå§æåçæ¶ååé£æ¹é¢çå¸åæ¡ä»¶è¿æè¾¾å·å¸æ¶è´«åç§»æ°å·¥ä½å±åç»ä¹¦è®°å±é¿è°¢æ¿è¿°ç­äººå¬æ¬¾ååãå¬æ¬¾æ¶è´¹5700ä½åï¼ä»å¹´8æè°¢æ¿è¿°ãåç²çè¿çºªæ§é®é¢å°±è¢«è¾¾å·å¸çºªå§ç«æ¡è°æ¥ãåæ±å¸å¸ä¸­åºé¾å®¶ä¹¡å«çé¢åæ¯é¨ä¹¦è®°èµµæºéç­äººå¬æ¬¾ååãå¬æ¬¾å¨±ä¹æ¶è´¹3200ä½åï¼èµµæºéè¢«ç»äºååè­¦åå¤åã
ï¼åæ é¢ï¼èªè´¡å¸åæ¹å§å¯ä¸»ä»»ä¸ºå¿å©ç¤¼å¤§æåå®´é­ååè­¦åå¤åï¼
ï¼ç¼è¾ï¼SN095ï¼   ï¼ç¼è¾ï¼SN095ï¼   ä¸­å½å¹¿æ­ç½^  å¤®å¹¿ç½æé½11æ10æ¥æ¶æ¯ï¼è®°èè´¾ç«æ¢ï¼æ®ä¸­å½ä¹å£°ãå¤®å¹¿æ°é»ãæ¥éï¼åå·ççºªå§æ¥åå¬å¼æå4èµ·æ¶ååé£æ¹é¢çå¸åæ¡ä»¶ï¼å¶ä¸­èªè´¡å¸åæ¹å§å¯ä¸»ä»»ç»å¿å­å¤§åå©å®´ãæ¶åç¤¼éï¼è¢«èªè´¡å¸çºªå§ç»äºååè­¦åå¤åãèªè´¡å¸çºªå§ç»äºååè­¦åå¤åï¼åå æ¯èªè´¡å¸åæ¹    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415adfd10025@   å°é£æµ·çéæ¸é è¿è¶å æµ·åå¹¿è¥¿ç­å°è¿çé£æ´é¨=   http://weather.news.sina.com.cn/news/2013/1110/072696176.html   10-11-2013 07:26:00/  ä¸­å¤®æ°è±¡å°11æ10æ¥6æ¶ç»§ç»­åå¸å°é£æ©è²é¢è­¦ï¼
 ä»å¹´ç¬¬30å·å°é£âæµ·çâ(å¼ºå°é£çº§)çä¸­å¿ä»å¤©æ©æ¨5ç¹éä½äºæµ·åçä¸æ²å¸è¥¿åæ¹å¤§çº¦195å¬éçåæµ·ä¸­è¥¿é¨æµ·é¢ä¸ï¼å°±æ¯åçº¬15.9åº¦ãä¸ç»110.8åº¦ï¼ä¸­å¿éè¿æå¤§é£åæ14çº§(42ç±³/ç§)ï¼ä¸­å¿æä½æ°åä¸º955ç¾å¸ï¼7çº§é£ååå¾380å¬éï¼10çº§é£ååå¾120å¬éãï¼æ¥çå¨æè·¯å¾ï¼
 é¢è®¡ï¼âæµ·çâå°ä»¥æ¯å°æ¶25-30å¬éçéåº¦åè¥¿åæ¹åç§»å¨ï¼å¼ºåº¦ååä¸å¤§ï¼éæ¸åè¶åä¸­åé¨ä¸å¸¦æ²¿æµ·é è¿ï¼å¹¶å¯è½äºæå¤©æ©æ¨å°ä¸­åå¨è¿ä¸å¸¦æ²¿æµ·ç»éãä»å¤©ç½å¤©å°å¤é´ï¼åæµ·å¤§é¨æµ·åãåé¨æ¹¾ãç¼å·æµ·å³¡ãæµ·åå²æ²¿æµ·ãå¹¿ä¸è¥¿é¨æ²¿æµ·å°æ7-9çº§å¤§é£ï¼å¶ä¸­åæµ·ä¸­è¥¿é¨ååé¨æ¹¾çé¨åæµ·åå°æ10-12çº§å¤§é£ï¼âæµ·çâä¸­å¿ç»è¿çéè¿æµ·åçé£åæ13-14çº§ï¼éµé£å¯è¾¾15-16çº§ï¼æµ·åå²åè¥¿æ²ç¾¤å²åä¸­æ²ç¾¤å²ãå¹¿è¥¿ä¸­åé¨ãå¹¿ä¸è¥¿åé¨æå¤§å°æ´é¨ï¼å¶ä¸­æµ·åå²åé¨çé¨åå°åºå¤§æ´é¨ã
 é²å¾¡æåï¼
 1.æ¿åºåç¸å³é¨é¨æç§èè´£åå¥½é²å°é£æ¢é©åºæ¥å·¥ä½ï¼
 2.åæ­¢å®¤åå¤å¤§åéä¼åé«ç©ºç­æ·å¤å±é©ä½ä¸ï¼
 3.ç¸å³æ°´åæ°´ä¸ä½ä¸åè¿å¾è¹è¶éåç§¯æçåºå¯¹æªæ½ï¼å åºæ¸¯å£è®¾æ½ï¼é²æ­¢è¹è¶èµ°éãææµåç¢°æï¼
 4.å åºæèæé¤æè¢«é£å¹å¨çæ­å»ºç©ï¼äººååå¿éæå¤åºï¼ç¡®ä¿èäººå°å­©çå¨å®¶ä¸­æå®å¨çå°æ¹ï¼å±æ¿äººååæ¶è½¬ç§»ã
 5.ç¸å³å°åºåºå½æ³¨æé²èå¼ºéæ°´å¯è½å¼åçå±±æ´ªãå°è´¨ç¾å®³ãÿÿÿÿ   ä¸­å½å¤©æ°ç½ å¾®å.  ä¸­å¤®æ°è±¡å°11æ10æ¥6æ¶ç»§ç»­åå¸å°é£æ©è²é¢è­¦ï¼ä»å¹´ç¬¬30å·å°é£âæµ·çâ(å¼ºå°é£çº§)çä¸­å¿ä»å¤©æ©æ¨5ç¹éä½äºæµ·åçä¸æ²å¸è¥¿åæ¹å¤§çº¦195å¬éçåæµ·ä¸­è¥¿é¨æµ·é¢ä¸ï¼å°±æ¯åçº¬15.9åº¦ãä¸ç»110.8åº¦ï¼ä¸­å¿éè¿æå¤§é£åæ14çº§(42ç±³/ç§)ï¼ä¸­    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ae11f0027@   å å¤§æ·æ±°è½åäº§è½ååº¦åå¤å¹´ é·å¥è¶å»è¶å¤æªå7   http://news.sina.com.cn/c/2013-11-10/100828670111.shtml   10-11-2013 10:08:00@"  æ°åç½åäº¬11æ10æ¥çµï¼è®°èé©æ´ãçæãå´éï¼35å¹´æ¹é©å¼æ¾ï¼æå°±äºä¸­å½ä»å¤©âä¸çç¬¬äºå¤§ç»æµä½âçå¥è¿¹ã
 ç¯é¡¾å¨çï¼ä¸çç»æµæ ¼å±æ­£å¨æ·±åº¦è°æ´ï¼é«éå¢é¿çä¸­å½åè½¦ä¹å¼å§åéãå¨ä¸çç©ç®ï¼å·²è¿å¥æ·±æ°´åºåæ»åæçä¸­å½æ¹é©ï¼å°å¦ä½å¼é¢ä¸­å½ç»æµæ¶é©æ»©ãé¯å³éï¼ç»­ååå±å¥è¿¹ã
 âåå±ä¸è½¬åâå³ï¼äºå¾çªç ´ä¼ ç»å¢é¿æ¨¡å¼æç¼
 2013å¹´ç§å¬ä¹äº¤ï¼æ¥ä¹ä¸å»çé¾é¾ååº¦èæ°ä¸­å½ã
 åæ¹åå¸åå°æ»¨å éåº¦é¾é¾ä¸åº¦å¨å¸åè¯¾ãäº¤éç«çªï¼é¦é½åäº¬é¾è§ç§é«æ°ç½çå¥½å¤©æ°ï¼å°±è¿âäººé´å¤©å âæ­å·ä¹æ·±é·é¾é¾å°æ°ã
 å¯¹å¤å¨è½¬åå³å£çä¸­å½ï¼é¾é¾ç»éä»æ¯ç¯å¢çç¾å®³ï¼æ´æ¯å¯¹ä¸­å½é«è½èå¢é¿æ¨¡å¼çä¸¥éè­¦ç¤ºã
 åå¤å¹´æ¥ï¼æå½å±¡å±¡å å¤§æ·æ±°è½åäº§è½çååº¦ï¼ä½å´é·å¥âäº§è½è¶å»è¶å¤âçæªåã
 âå¨é¢éäº§è½ä¸¥éè¿å©æåµä¸ï¼ä¸äºå°æ¹ä»å¨ä¸é©¬å¤§åé¢éé¡¹ç®ï¼æççè³ä»¥ç»¿è²ééç­åç§°åè£ãâéå¯¹è°ç åç°çé®é¢ï¼å¨å½äººå¤§å¸¸å§ä¼å§åçæé¯è¯´ï¼å½åä»æä¸äºå°æ¹åç¸æ¯æäº§è½è¿å©è¡ä¸æ©å¼ ã
 åè§£äº§è½è¿å©ä¹é¾ï¼æå°åºä¸­å½ç»æµè½¬åä¹è°ã
 âè¡¨é¢çæ¯äº§è½è¿å©ï¼å®éä¸æ¯ä¸äºå°æ¹æ¿åºç²ç®ç«äºä¸é¡¹ç®ï¼é æéå¤å»ºè®¾âéå°å¼è±âãâä¸­å¤®åæ ¡ç»æµå­¦é¨ä¸»ä»»èµµæ¯åè¯´ã
 ä»å¹´6æï¼åéµäºé¶è¡é´çâé±èâç°è±¡ï¼å°éèå¨ä¸­å½ç»æµèåçå°æ¹åºå¡æ¿å¢ãå½±å­é¶è¡ãæ¿å°äº§æ³¡æ²«ç­é£é©é®é¢æ¾å¤§ï¼æ´é²åºæ´å¤ä¸­å½ç»æµè½¬åå¿é¡»ç´é¢ççå¤ã
 âè¿äºé®é¢ï¼ä¸å°æ¹è¿½æ±ï¼§ï¼¤ï¼°çæ¿ç»©è§æå³ï¼æ´é²åºä¼ ç»å¢é¿æ¨¡å¼çå¼ç«¯ï¼ç»æµå¢é¿ç¼ºä¹åçå¨åãâä¸­å½ç¤¾ç§é¢ä¸çç»æµä¸æ¿æ²»ç ç©¶æç ç©¶åå¼ æè¯´ã
 è¿å å¹´ï¼å°æ¹æ¿åºå¬å¸åè¶å¿ææ¾ï¼ä¸å°å°æ¹æçæ¨è¿åéåæå·æé åè¿å¨ï¼æ¿åºç»è¥åå¸ï¼åå°æåâå°çâé¢åºï¼æ¿ä»·è¶è°è¶é«â¦â¦
 âä¸­å½æåºè½¬åå¢é¿æ¹å¼å·²è¿20å¹´ï¼ä¸ºä»ä¹ææä¸å¤æ¾èï¼æ ¹æºå°±å¨äºä½å¶æ§éç¢ãâç»æµå­¦å®¶å´æ¬çæåºï¼å¯ææ¨è¿å¸åºåæ¹é©ï¼æ¹è½ä¸ºç»æµè½¬ååçº§éºå¹³éè·¯ã
 å°½ç®¡ä¸­å¤®æåºâä¸ä»¥ï¼§ï¼¤ï¼°è®ºè±éâï¼ä½ä¸å°å°æ¹é¢å¯¼å£å¤´ä¸è®²è½¬ååå±çå¿µï¼å®éä¸èµ°çè¿æ¯æèµä¸ºä¸»ãè¿½æ±ï¼§ï¼¤ï¼°é«å¢é¿çèè·¯ï¼åå¿«å¿§æ¢ã
 è½¬ä¸å¨çèåï¼è¿æç°è¡åå°ãéèãè´¢ç¨ãä»·æ ¼ç­æºå¶ä¸å®åå¸¦æ¥çè¯¸å¤å¶çº¦ï¼å°æ¹æ¿åºç¼ºä¹èªä¸»è´¢æºãæå¡ä¸ç­æ°å´äº§ä¸é¾ä»¥æä¸ºç»æµä¸»å¯¼åéï¼å¯¼è´äº§ä¸ç»æè°æ´æ»åã
 åå±ä¸è½¬åï¼å®å¦æå¨ä¸­å½ç»æµè¾é£çâåç¿¼âï¼åªææ¾å°äºèé´çâé»éå¹³è¡¡ç¹âï¼å¨åå±ä¸­å£®å¤§ç»æµç¨³ä½å°±ä¸ï¼å¨è½¬åä¸­æåç»æµè´¨éåæçï¼æè½ç¡®ä¿å¢éâæ¢æ¡âæçä¸­å½ç»æµè¡ç¨³è´è¿ã
 åçåå«å¤§ä»¥æ¥ï¼æå½åºå°ä¸ç³»åä¸¾æªå®£ç¤ºæ·±åæ¹é©ãå å¿«ç»æµè½¬åçå³å¿ï¼å¨é¢å®¡è®¡å°æ¹æ¿åºåºå¡ãåºå°åè§£äº§è½ä¸¥éè¿å©çç¾æ¹é©âè·¯çº¿å¾âãå å¿«ä¿éæ§ä½æ¿å»ºè®¾ãé¼å±ç§æåæ°â¦â¦
 âå¯¹ä¸­å½æ¥è¯´ï¼ç»ææ§çæ¹é©æªæ½æ´åä¸åè¦å£è¯è¯ï¼ææ¶ä¼å¸¦æ¥ä¸äºçè¦ï¼ä½æå©äºä¿æç»æµå¥åº·ï¼é¿åä»åå¯è½çæ´å¤§å±æºãâå½éè´§å¸åºéç»ç»æ°ä»»é©»åé¦å¸­ä»£è¡¨é¿å°å¼é·å¾·ã»å¸­æ®åè¯´ã
 ç®åï¼ä¸­å½ï¼ä¸æµ·ï¼èªç±è´¸æè¯éªåºçå¯å¨ï¼æä¸ºä¸­å½æç ´ä½å¶æºå¶å£åçæ°çªç ´ãåçæå¾ï¼åå«å±ä¸ä¸­å¨ä¼è½éæ¾æ´å¤è´¢ç¨ãéèãåå°ãä»·æ ¼ç­ä½å¶æºå¶æ¹é©å¨åï¼ä¸ºä¸­å½ç»æµåçº§è½¬åä¿é©¾æ¤èªã
 âæ¿åºä¸å¸åºâå³ï¼åæ¸ç¸äºçè¾¹ç
 éå²å¸é«æ°åºä»å¹´æ¨åºä¸é¡¹éè¦æ¹é©ï¼ååç®¡å§ä¼å¤§åå¤§æ½çå­å¤§æ¿åºèè½ï¼å¦ä»âææä¸­é´ï¼åªçä¸¤ç«¯âï¼å°ç§æå­åºå»ºè®¾ãèèµãè¯ä¼°ãè¿è¥åå¤§ç¯èäº¤ç»å¸åºï¼æ¿åºæ´å¤æ³¨éåå¥½è§ååæå¡ã
 âæ¿åºè¦ææä¸ºææä¸ä¸ºãâéå²å¸é«æ°åºå·¥å§ä¹¦è®°éé£åè¯è®°èï¼ä»å¹´ä»ä»¬å°è¯å¼å¥ç¾å½ç¡è°·ãæ¸åç§æå­ç­äº§ä¸å¹³å°ï¼æ´å¤è®©å¸åºååã
 å¦ä½çæ¸æ¿åºåå¸åºççéï¼ç¨æ¿åºæåçâåæ³âæ¢åå¸åºæ´»åçâå æ³âï¼è¿æ¯å¤å¨æ·±æ°´åºçä¸­å½æ¹é©å¿é¡»è·¨è¿çé¾å³ã
 å½åï¼æå½è¡æ¿å®¡æ¹äºé¡¹ä¾ç¶è¿å¤ï¼å°æ°å°æ¹ãé¨é¨è®¾ç½®å®¡æ¹ãè®¸å¯çéææ§å¤§ï¼ç¨åºä¸è§èï¼æç¼äºä¼ä¸ãå¬æ°åä¸ç»æµæ´»å¨çç§¯ææ§ï¼å®¹æåºç°æé±äº¤æç­èè´¥è¡ä¸ºã
 ä¸ä»å¦æ­¤ï¼å¦ææ¿åºå¯¹å¸åºç»æµçä¸»ä½ä¸è½ä¸è§åä»ï¼ä¹ä¼æç¼ç¤¾ä¼èµæ¬çæ´»åã
 å½æä¼ä¸åæ°è¥ä¼ä¸æ¯æ¯æå½æ°ç»æµçä¸¤å¤§æ¯æ±ï¼ä½å ä¸­å½ä¼ä¸æ»æ°ä¹æä»¥ä¸ãæ»éçªç ´åä¸å®¶çæ°è¥ä¼ä¸åå±ä»é¢ä¸´è¯¸å¤éç¢ã
 âæç ´è¡ä¸åæ­ï¼æªæ¥å¿é¡»è¿ä¸æ­¥åå°è¡æ¿å®¡æ¹ï¼æ¾å¼å¸åºåå¥ï¼æå¼é¿æå­å¨çâç»çé¨ââå¤©è±æ¿âãâå½å¡é¢åå±ç ç©¶ä¸­å¿å®è§ç»æµé¨ç ç©¶åå¼ ç«ç¾¤è¯´ã
 âä¸äºæ¿åºé¨é¨è¿åº¦å¹²é¢ç»æµçèåï¼å­å¨é¨é¨å©ççé©±å¨ãâå½å®¶è¡æ¿å­¦é¢æææ±ªçå¯è¯´ï¼å°æ°æ¿åºé¨é¨çè¿ä¸å¾åå·²æä¸ºä¸æ°äºå©çæ ¹æºã
 çæ¸æ¿åºä¸å¸åºççéï¼ä»æ ¹æ¬ä¸è½¬åâä¸è½æ¿åºâå½¢è±¡ï¼å»ºè®¾æå¡åæ¿åºï¼å¹¶éæäºãâæ¨å¨æ¿åºèªèº«æ¹é©ï¼ç­äºæ¿åå­å²èªå·±çèï¼æ¯èµ°ä¸æ­¥é½ä¸å®¹æãâæ±ªçå¯ç´è¨ã
 éçæ°ä¸è½®è¡æ¿ä½å¶æ¹é©å¼å¯å¤§å¹ï¼æ¨è¿å½å¡é¢æºææ¹é©ãåæ¶ä¸æ¾æ°ç¾é¡¹è¡æ¿å®¡æ¹äºé¡¹ãå®è¡å¬å¸æ³¨åèµæ¬âé¶é¨æ§âãå«åå¬æ¬¾èå¯æ§åºè®¿ãå¤§ååº¦åèå¡å»â¦â¦ä»å¹´è¯¸å¤æ¹é©éæ¾åºè°æ´å©çå¨çæ ¼çæ»åä¿¡å·ã
 è§¦å¨å©çæ¯è§¦åçµé­è¿é¾ãæâä¸å¬âç»è´¹ç»è´¦ãæ¨å®åè´¢äº§å¬ç¤ºãåå¹¶æ¿åºæºæãæå»è´ªæ±¡èè´¥â¦â¦é¢å¯¹ä¸ä¸ªä¸ªâç¡¬éª¨å¤´âï¼æ¹é©æå¾è¿ä¸æ­¥çªç ´ã
 âå¬å¹³ä¸æ­£ä¹âå³ï¼åªåå®ç°å±äº«å±å¯
 è¿ä¸æ®µæ¶é´ï¼å»èéæ¹é©æä¸ºç¤¾ä¼äºè®ºçç¦ç¹ãé¤äºå»èéç¼ºå£å·¨å¤§å¼åç¤¾ä¼æå¿§ï¼æ´å¤äºè®ºæ¯éå¯¹åè½¨å¶å¸¦æ¥çç¤¾ä¼ä¸å¬ãåçæå¾æ°ä¸è½®æ¹é©è½æ¨è¿è¿ä¸é®é¢çè§£å³ã
 âå¬å±äº§åç­ç¼ºæ­£æä¸ºå½åç¤¾ä¼ççªåºçç¾ãâä¸­å½ï¼æµ·åï¼æ¹é©åå±ç ç©¶é¢é¢é¿è¿ç¦æè¯´ï¼éçç»æµç¤¾ä¼çè¿æ­¥ï¼äººä»¬å¯¹æè²ãå»çãç¤¾ä¼ä¿éç­é®é¢æ´å å³æ³¨ï¼å¯¹å¬å¹³æäºæ´é«æ´è¿«åçè¦æ±ã
 åç»35å¹´æ¹é©å¼æ¾ï¼ä¸­å½è§£å³äºç©è´¨ç­ç¼ºï¼æé«äºç¾å§ç©è´¨çæ´»æ°´å¹³ï¼ä½æè²ãå»çãç¤¾ä¼ä¿éç­å¬å±äº§åçç­ç¼ºæä¸ºç¤¾ä¼åå±çæ°çç¾ãåä¹¡äºåå³ç³»æ´å¯¼è´ä¸ç³»åèµ·ç¹ä¸å¬å¹³é®é¢ã
 å½ä»ï¼ä¸­å½çº¦2ï¼6äº¿åæ°å·¥å·²æä¸ºåå¸ä¸å¯æç¼ºçä¸é¨åï¼ä½æ·ç±ãå°±ä¸ãç¤¾ä¿ãå­å¥³å°±å­¦ç­ä¸ééâé¨æ§âï¼å´ä»¤ä»ä»¬ä¸è½ä¸åéäººäº«æåç­æè²ãå»çãç¤¾ä¿ä»¥åå°±ä¸æºä¼ã
 è´¢å¯åéä¸å¬å¼åçè´«å¯å·®è·é®é¢ï¼ä¹æä¸ºå½±åç¤¾ä¼ç¨³å®çä¸å¤§éæ£ã
 è¿å»åå¹´ï¼åæ è´«å¯å·®è·çä¸­å½å±æ°æ¶å¥åºå°¼ç³»æ°ä¸ç´é½å¨0ï¼4çè­¦æçº¿ä»¥ä¸ãå¤å°çåºçâæ¿å§ââæ¿åâäºä»¶ï¼ç¤¾ä¼ä¸å³äºå¾æ¶æ¿äº§ç¨ãéäº§ç¨çæ¿çäºè®ºï¼é½å¸æ¾åºå¨ç¤¾ä¼å¯¹æ¶å¥åéæ¹é©çé«åº¦å³æ³¨ã
 ä¸­å½æ¹é©åºéä¼å½æ°ç»æµç ç©¶æå¯æé¿çå°é²è¯´ï¼è¦ç ´è§£è¿ä¸é¾é¢ï¼åªæéè¿ä½å¶æºå¶æ¹é©ï¼å µä½å¯¼è´æ¶å¥åéæ­æ²çä¸ç³»åå¶åº¦æ¼æ´ã
 âä¸­å½ç¤¾ä¼è¿å»çä¸è´æ§æ­£å¨åå¤æ ·æ§è½¬åï¼ç¹å«æ¯ä¸ªäººä¸»ä½æè¯çå´èµ·ï¼å¨æ¨è¿ç¤¾ä¼è¿æ­¥çåæ¶ï¼ä¹å å¤§ç¤¾ä¼æ²»çé¾åº¦ãâå½å®¶è¡æ¿å­¦é¢ææç«¹ç«å®¶è¯´ã
 å®ç°å¬å¹³æ­£ä¹ï¼æ¯åå±çæ´»åæºæ³ä¸ç¤¾ä¼åè°ç¨³å®çåºç¡ï¼ä¹æ¯ä¸­å½å¨ç¤¾ä¼è½¬åæå¿é¡»è·¨è¿çå³å£ã
 ä»å¹´ä»¥æ¥ï¼å½å®¶åºå°äºä¸ç³»åä¿éèµ·ç¹å¬å¹³çæ¹é©ä¸¾æªï¼æé«éç¹é«æ ¡ææ¶åæå­¦çæ¯ä¾ï¼æ¨è¿å¬å¹³å¸åºåå¥ï¼è¥é å¬å¹³çå°±ä¸ç¯å¢â¦â¦ä¼ éåºä¿è¿æå©å¬å¹³ãæºä¼å¬å¹³ãè§åå¬å¹³çæ¹é©æ¹åã
 å°±å¨åå«å±ä¸ä¸­å¨ä¼å¬å¼åå å¤©ï¼æé«äººæ°æ³é¢åºå°äºä¸ä»½æ¨å¨æ¨è¿å¬æ­£å¸æ³ãæé«å¸æ³å¬ä¿¡åçæ¹é©æè§ï¼å¼åå¹¿æ³å³æ³¨ã
 âå¤åéæ¡æ¯å¸æ³å¬ä¿¡çå¤§æãâæé«äººæ°æ³é¢ç ç©¶å®¤ä¸»ä»»è¡äºè¾è¯´ï¼ä¸ä¸æ­¥å°æ·±åå¸æ³æ¹é©ï¼è®©âæ³å¾ä¹é¨âåå¬ä¼æå¼ï¼å®ç°å¸æ³ä¸ºæ°ï¼å¬æ­£å¸æ³ã
 å®ç°å¬å¹³æ­£ä¹ï¼ä¼ éçä¸­å½å¨é¢æ·±åæ¹é©çéè¦ç®æ ââè®©æ¹é©åå±æææ´å¤æ´å¬å¹³æ åå¹¿å¤§äººæ°ã
ï¼ç¼è¾ï¼SN095ï¼   ï¼ç¼è¾ï¼SN095ï¼	   æ°åç½\  æ°åç½åäº¬11æ10æ¥çµï¼è®°èé©æ´ãçæãå´éï¼35å¹´æ¹é©å¼æ¾ï¼æå°±äºä¸­å½ä»å¤©âä¸çç¬¬äºå¤§ç»æµä½âçå¥è¿¹ãç¯é¡¾å¨çï¼ä¸çç»æµæ ¼å±æ­£å¨æ·±åº¦è°æ´ï¼é«éå¢é¿çä¸­å½åè½¦ä¹å¼å§åéãå¨ä¸çç©ç®ï¼å·²è¿å¥æ·±æ°´åºåæ»åæçä¸­å½æ¹é©ï¼å°å¦ä½å¼é¢ä¸­å½ç»æµæ¶é©æ»©    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51    402882e4424159100142415ae07800267   åäº¬å¹´åºååä»·é«äº4ä¸åçæ¥¼çä¸åé¢å®7   http://news.sina.com.cn/c/2013-11-10/101928670112.shtml   10-11-2013 10:19:00ä  æ°åç½åäº¬11æ10æ¥çµï¼âæ°åè§ç¹âè®°è å­ç¥¥é« å¶é éé§å¤©ï¼âä¸æµ·ãæ·±å³äºå¥æ¿é¦ä»æè³7æï¼ä¸æµ·å¯¹éæ·ç±äººå£«éè´­ä»ä¸¥ï¼åäº¬æ¨åºèªä½åååä½æ¿ï¼æ¶¨ä»·æ¥¼çä¸æ¹é¢å®è¯â¦â¦âè¿æï¼äº¬ãæ·±ãæ²ªç­æ¿ä»·æ¶¨å¹è¶åçä¸çº¿åå¸æ¥è¿åºæï¼æ¥¼å¸è°æ§è¿ä¸æ­¥âåçº§âã
 ä¸åäººå£«æåºï¼ä¸å°åå¸è¦å®æä»å¹´æ¿ä»·æ§å¶ç®æ é¾åº¦éå¸¸å¤§ãä¸´è¿å¹´æ«ï¼ä¸çº¿åå¸è°æ§âåçº§âè½ç¶æå©äºæ¥¼å¸ç­æ¶âéæ¸©âï¼ä½ä»¥âå µâä¸ºä¸»çâçªå»å¼âè°æ§é¾ä»¥ä»æ ¹æ¬ä¸è§£å³ä½æ¿åæ¿ä»·é®é¢ãæªæ¥è¿æå¾è¿ä¸æ­¥ä»âå¤§å¤çç¼âï¼å å¿«æ¨è¿ä½æ¿ä¿éåä¾åºä½ç³»å»ºè®¾ã
 âä»ä¸¥æ§è¡âï¼è°æ§âåçº§çâæç¨å ä½ï¼
 å½å®¶ç»è®¡å±æ°æ®æ¾ç¤ºï¼ä»å¹´5æï¼åä¸å¹¿æ·±åä¸ªä¸çº¿åå¸çæ°å»ºååä½å®ä»·æ ¼åæ¯å¢å¹å¨é¢çªç ´ä¸¤ä½æ°ï¼è9ææ¶¨å¹æ´æ¯å¨é¢è¶è¿20ï¼ãä¸­åå°äº§å¸åºç ç©¶é¨æ»çå¼ å¤§ä¼è¡¨ç¤ºï¼ä¸äºæ¿ä»·åæ¯æ¶¨å¹è¾å¤§çå¤§ä¸­åå¸ï¼å®æå¹´åº¦è°æ§ä»»å¡å ä¹æ æã
 éå¯¹äº¤æéä¸æ­å¢é¿ãæ¿ä»·ä¸æ¶¨è¾å¿«çæå¿ï¼åäº¬ãæ·±å³ãä¸æµ·ç­å°è¿ææ¥è¿åºæã
 ä¸æµ·8æ¥å¬å¸çâæ²ªä¸æ¡âè¦æ±ï¼äºå¥æ¿æä½é¦ä»ä»æ­¤åçå­ææé«è³ä¸æãæ·±å³è¿ææåºçè°æ§ä¸¾æªä¹åæ¬è¿ä¸åå®¹ãå¨éè´­æ¹é¢ï¼ä¸æµ·å¯¹éæ·ç±å±æ°å®¶åº­è´­æ¿ç¼´çº³ç¨æ¶æç¤¾ä¿è´¹å¹´éï¼ä»æ­¤åçâå2å¹´åå¨æ¬å¸ç´¯è®¡ç¼´çº³1å¹´ä»¥ä¸âï¼è°æ´ä¸ºâå3å¹´åå¨æ¬å¸ç´¯è®¡ç¼´çº³2å¹´ä»¥ä¸âã
 ä»å¹´ä»¥æ¥ï¼åäº¬äºç¯å¤çâåéâçä¸åº¦âä¸æ¿é¾æ±âï¼æ¿ä»·ä¸è·¯èµ°é«ï¼ä¸å°æ¥¼çè¿å©ç¨æåæ¯å¯åç²¾è£åååç¸æ¶¨ä»·ãå¯¹æ­¤ï¼åäº¬å¸ä½å»ºå§å¬éå¼ååä¸¾è¡ä¼è®®ï¼æç¡®å¹´åºä¹åï¼æ¶¨ä»·æ¥¼çä¸äºæ¹åé¢å®ï¼åä»·é«äº4ä¸åçæ¥¼çä¸äºæ¹åé¢å®ï¼å¯¹äºä»å¹´ä»¥æ¥ä¸å¸çé¡¹ç®ï¼è¦æ±æ°ççä»·æ ¼ä¸åææå¹³ï¼å¹¶å«åæç»ç²¾è£ä¿®ä»¥ä¾¿éé¿çç®¡çéå®æ¹å¼ã
 å¯¹äºä¸çº¿åå¸çè°æ§âåçº§çâï¼ä¸å°ä¸åäººå£«è¡¨ç¤ºï¼âä¸äºæªæ½ææååæéâãå¤®è¡ä¸æµ·æ»é¨è°æ¥ç»è®¡é¨å¯ä¸»ä»»é¡¾é­å¾·è¯´ï¼ç®åä¸æµ·å°åºåæ¾çè´­æ¿è´·æ¬¾ä¸­ï¼äºå¥æ¿è´·æ¬¾ä¸å°20ï¼ãæé«äºå¥æ¿é¦ä»ååº¦åªè½å½±åä¸å°é¨åäººç¾¤ã
 å¯¹äºåäº¬æ§å¶é¢å®çåæ³ï¼çå¥½å¤§å´åºå°é4å·çº¿é¦ç«ä¸ä¸ªé¡¹ç®çè´­æ¿èéåçè¡¨ç¤ºå¾âæ å¥âãâä¸¤ä¸ªå¤æåå°±è¯´è¦å¼çï¼ä½ä¸ç´æ²¡å¨éãç°å¨æç¥éæ¯å ä¸ºé¡¹ç®æ³æ¶¨ä»·ï¼é¢å®è¯æ¹ä¸ä¸æ¥ãä»å¹´ä¸æ¹ï¼æ¯ä¸æ¯æå¹´å°±è½æ¹ï¼ä»·æ ¼é¾éä¼éä¸æ¥åï¼âéåçåé®ã
 ä¸­å½æ¿å°äº§å­¦ä¼å¯ä¼é¿éå½å¼ºè¡¨ç¤ºï¼è¿ä¸æ­¥æå¶éæ±ï¼æ§å¶é¢å®è¯åæ¾ç­è°æ§âåçº§âæ¹å¼ä¹è®¸ä¼æå¶å¹´åºæ¿ä»·æåï¼ä½æ¯ç«åªæ¯æå®ä¹è®¡ã
 âå¼ºè°ä¾åºâï¼å¸åºé¢æè½å¦ç¨³å¾ä½ï¼
 ä¸æµ·âæ²ªä¸æ¡âè¦æ±ï¼ä»å¹´ä½æ¿ç¨å°ä¾åºéå¨ä¸ä½äºè¿å»5å¹´å¹³åä¾åºéçåºç¡ä¸ï¼åå¢å 30ï¼çä¾åºéï¼ç¡®ä¿ä½æ¿ç¨å°ä¾åº1000å¬é¡·ï¼å¹¶è¿ä¸æ­¥å å¤§ä¸­å°å¥åä½æ¿ç¨å°ä¾åºï¼ç¡®ä¿åå°å¸åºäº¤æå¹³ç¨³ã
 ææä¾åºçç¸å¯¹ç­ç¼ºï¼ä¸ç´æ¯å°æ°ç­ç¹åå¸æ¥¼å¸çä¸ä¸ªå³é®é®é¢ãå°¤å¶æ¯é¢å¯¹è¿æè¿ä¸æ³¢æ¿ä»·æ¶¨å¿ï¼âç¨³å®ä¾æ±å³ç³»âçè°æ§è¯æ±æ´å è¿«åãå¼ å¤§ä¼åææåºï¼ä¸æµ·ççâæ²ªä¸æ¡âåå®¹ï¼ä»éå¶ååº¦ä¸ææ¾è¶è¿æ­¤ååäº¬çâäº¬ä¸æ¡âåæ·±å³çæ¬ãä½å¨ä¾åºç¯èï¼ç¸æ¯åäº¬æ¨åºçèªä½åååä½æ¿æ¿ç­åååº¦æéã
 åäº¬å¸æç¡®è¦åå±ä»·æ ¼ä½äºå¨è¾¹å¸åº30ï¼ï¼é¢ç§¯ä»¥90å¹³æ¹ç±³ä»¥ä¸ä¸ºä¸»çèªä½åååä½æ¿ãä»å¹´å°ä¾å°2ä¸å¥çè§æ¨¡ï¼æå¹´è®¡åä¾å°5ä¸å¥ãåäº¬å¸ä½å»ºå§ç¸å³è´è´£äººä»ç»ï¼å¯¹äºä½æ¶å¥ç¾¤ä½ï¼æ¿åºå¯æä¾ä¿éæ¿ï¼é«æ¶å¥ç¾¤ä½è½æ¿åé«åè´¨ååæ¿ï¼èªä½åååä½æ¿åæ¯éå¯¹ä¸­ç«¯ï¼æå©äºè§£å³éæ±æºççâå¤¹å¿å±âå®¶åº­çä½æ¿å°é¾ã
 åé¡¾åå°æ¥¼å¸è°æ§çåå²ï¼éå¶éæ±ãä»¥âå µâä¸ºä¸»æä¸ºåæ¬¡è°æ§åéçææ®µï¼å¦ä½å¨ä¾ç»ç«¯ææä½ä¸ºï¼ä¸åå±¡æ¬¡å¼åï¼å´è¿è¿ä¸è§å®éè¡å¨ãåäº¬æ­¤æ¬¡æ¨åºèªä½åååä½æ¿è½ç¶è¿å¨ä¾å°é¶æ®µï¼å¯¹å¸åºå½±åè¿æå¾è§å¯ï¼ä½æ¯è°æ§æè·¯åä¾ç»ç«¯è½¬åè¿åºçå®è´¨æ§ä¸æ­¥ã
 å¯¹äºç»æµéç¨æ¿ãéä»·ååæ¿ç­ä¿éæ¿çåéé®é¢ä¸ç´è¢«ä¸åè¯çï¼å¸¦æä¿éæ§è´¨çååä½æ¿çåéç¯èåæ ·è¢«èè®ºå³æ³¨ãè´¢ç»è¯è®ºåé©¬åè¿è¡¨ç¤ºï¼ä¾åºç»æçè½¬åå°å¯¹å¸åºé¢æäº§çå½±åãèªä½åååä½æ¿è½å¦åæ¥ä½ç¨ï¼åéãäº¤æç­ç¯èççç®¡è³å³éè¦ã
 é¾å®¶å°äº§å¸åºç ç©¶é¨åæå¸å¼ æ­è¡¨ç¤ºï¼âéçè¿æè°æ§ä»ä¸¥ï¼ä»åäº¬äºææ¿çéæ±åäº¤æçæåµæ¥çï¼ä¸å°é¨åºå®¢æµéé½åºç°äºä¸æ»ï¼è´­æ¿èçé¢æç¡®å®å¨éæ¸©ãâ
 âæ¿ä»·ç®æ âï¼é¿ææºå¶ä½æ¶è½å»ºç«ï¼
 è¿å å¹´çæ¿å°äº§è°æ§æ¯è¾æ³¨éâç®æ ç®¡çâï¼è®¸å¤åå¸é½æè¦æ±æåºäºå¹´åº¦æ¿ä»·æ§å¶ç®æ ï¼ä½ç¸å¯¹å®½æ³ï¼æ¯å¦âåºæ¬ç¨³å®ââä¿æç¨³å®âç­ãå³ä¾¿å¦æ­¤ï¼å®æç®æ å½¢å¿ä¾ç¶ä¸¥å³»ã
 âåææ¶¨å¾å¤ªå¿«ï¼æå¿åææ¿ä»·âæ¶ä¸ä½âãâéå½å¼ºè¯´ï¼âåºäºå¹´åº¦è°æ§ç®æ çèèï¼ä¸äºåå¸ä¸å¾å·²è¿è¡è°æ§åçº§ãâè´¢ç»è¯è®ºåé©¬åè¿åè¡¨ç¤ºï¼ä¸´è¿å¹´åºï¼å¦æè°æ§ä»ä¸¥ä»ä»æ¯ä¸ºäºç»ç»è®¡æ°å­ä¸ä¸ªäº¤ä»£ï¼é£å°±æ¯å¨âä½ç§âãä¸äºâçªå»å¼âçè°æ§åªä¼å å§ä¾éçç¾ãæ§å¶ä»·æ ¼åºè¯¥èªå§è³ç»ï¼ä¸åºç­å°å¹´åºæååã
 è®°èå¨åäº¬ãä¸æµ·ç­å°çä¸­ä»æºæèµ°è®¿æ¶äºè§£å°ï¼ä¸å°âåéâè´­æ¿èçè§ææç»ªååº¦åºç°ãä¸åæå¿§ï¼å¹´åºæ¶ç´§æ¿ç­ææä¼é æéæ±çç§¯åã
 ä»åæ¬¡æ¥¼å¸è°æ§çæææ¥çï¼è§ææç»­ä¸æ®µæ¶é´åï¼å¸åºå¾å¿«ä¼åæãä¸å°è´­æ¿èæå¿ï¼âè¿æ¬¡è§æåä¼æç»­å¤ä¹å¢ï¼âä¸å³å°âå µâå·²ç»å¾é¾è§£å³æ¿å°äº§å¸åºçâé¡½ç¾âï¼å¯¹æ¥¼å¸çåºå¯¹ä¹ç­åºææ´é¿è¿çèéã
 âå¸åºå·²ç»å°äºäºé¡»åºå°é¿ææºå¶çæ¶æãâå¼ å¤§ä¼è¡¨ç¤ºï¼å½åè¡æ¿è°æ§çä½ç¨æ¯åº¸ç½®çï¼ä½æ¿ä»·ä¾ç¶ä¸æ¶¨æå¯è½å¯¼è´æ°ä¼å¯¹æ¿ç­é¢æçä¿¡å¿ä¸è¶³ãå¼ºè°æ¿å°äº§è°æ§çé¿ææºå¶ï¼æ¯è¦å å¼ºå¯¹å¸åºææ®µçæ³¨éï¼è¦è®©å¸åºè§å¾åæ¥æ´å¤§çä½ç¨ã
 ä¸åäººå£«å»ºè®®ï¼æ¿å°äº§å¸åºè°æ§æ¿ç­åºä¿æè¿ç»­æ§åç¨³å®æ§ï¼å¹¶ä¸æ­å¢å åè°æ§ä¸éå¯¹æ§ãæ¯å¦ï¼ä¿¡è´·ææ®µåºåæä½ç°å·®å«åï¼æ¯æåéï¼éå¶ææºï¼å¨æ¿ä»·ä¸æ¶¨ææ¾çåå¸ï¼åºå å¿«éåå¢å ä½å®ç¨å°ä¾åºï¼ç¼è§£ä¾æ±çç¾ï¼åæ¶ï¼æ¿åºåºå å¿«æ¨è¿ä½æ¿ä¿éåä¾åºä½ç³»å»ºè®¾ï¼å°½å¿«å®åæå³æ¿å°äº§çç¨æ¶å¶åº¦ã
ï¼ç¼è¾ï¼SN095ï¼   ï¼ç¼è¾ï¼SN095ï¼	   æ°åç½^  æ°åç½åäº¬11æ10æ¥çµï¼âæ°åè§ç¹âè®°èå­ç¥¥é«å¶ééé§å¤©ï¼âä¸æµ·ãæ·±å³äºå¥æ¿é¦ä»æè³7æï¼ä¸æµ·å¯¹éæ·ç±äººå£«éè´­ä»ä¸¥ï¼åäº¬æ¨åºèªä½åååä½æ¿ï¼æ¶¨ä»·æ¥¼çä¸æ¹é¢å®è¯â¦â¦âè¿æï¼äº¬ãæ·±ãæ²ªç­æ¿ä»·æ¶¨å¹è¶åçä¸çº¿åå¸æ¥è¿åºæï¼æ¥¼å¸è°æ§è¿ä¸æ­¥âåçº§âã    4028808c412bcd5701412bd1727f0001   10-11-2013 17:30:51       Ñ  Ñ   +Í     20.0   5   ç³»ç»ç®¡ç   11ÿÿÿÿÿÿÿÿ   1   0   5001   ç¨æ·ç®¡ç   12   /pages/RightsUser/list.doÿÿÿÿ   2   5   5002   è§è²ç®¡ç   13   /pages/RightsRole/list.doÿÿÿÿ   2   5   5005   ç³»ç»æ¥å¿   16   /pages/LogBusi/list.do*   æ­¤é¡µå¯æ¥çæä½åç³»ç»åé¨æ¥å¿   2   5   1001001   éç½®åè¡¨   5    /pages/GrabageSiteconfig/list.do!   éç½®ééç«ç¹çç¸å³ä¿¡æ¯   3   1001   1001   ç½ç»åªä½   4ÿÿÿÿÿÿÿÿ   2   1   2001   æ°æ®åè¡¨   8   /pages/DataIdentify/list.do   å·²è¯å«çç¾ææ°æ®   2   2   3001
   new node-3   10ÿÿÿÿÿÿÿÿ   2   3   1001002   å·²ééåè¡¨   6   /pages/Pageinfo/list.do   å·²ééçç½é¡µåå®¹   3   1001   5006   å°éäºä»¶ç»´æ¤   17   /pages/SysEarthquake/list.do   å°éäºä»¶ç»´æ¤   2   5   5003   èµæºç®¡ç   14   /pages/RightsResource/list.doÿÿÿÿ   2   5   0   ç¾æè¯å«å±ç¤ºç³»ç»   1ÿÿÿÿÿÿÿÿ   0   0   1   ç¾ææ±é   2ÿÿÿÿÿÿÿÿ   1   0   2   ç¾æå¤ç   7ÿÿÿÿÿÿÿÿ   1   0   3   ç¾æå±ç°   9ÿÿÿÿÿÿÿÿ   1   0   1002   åå§æ°æ®åè¡¨   3   /pages/DataOriginal/list.doÿÿÿÿ   2   1   5004   ç è¡¨ç»´æ¤   15   /pages/CommonDict/list.doÿÿÿÿ   2   5       >  >   ^     21.0    4028808c412ba9b101412bac47dc0001   17-09-2013 19:26:52    402881e74042a06d014042a1550e0002   1001001    402881e74068d5d1014068d65b410001    4028808b40f201020140f20246570001   06-09-2013 14:42:50    402881e74042a06d014042a1550e0002   5005    402881e74068d5d1014068d65b410001    ff80808140d3db8a0140d3e169ec0001   31-08-2013 18:18:20    402881e74042a06d014042a1550e0002   2001    402881e74068d5d1014068d65b410001    ff80808140d3db8a0140d3e169ec0002   31-08-2013 18:18:20    402881e74042a06d014042a1550e0002   1001    402881e74068d5d1014068d65b410001    ff80808140d3db8a0140d3e169ec0003   31-08-2013 18:18:20    402881e74042a06d014042a1550e0002   3001    402881e74068d5d1014068d65b410001    402881e5417794110141779d43410001   02-10-2013 13:21:37    402881e74042a06d014042a1550e0002   5006    4028808c41637fc50141638e74f10000    402881e5417794110141779d6a830002   02-10-2013 13:21:47    402881e74042a06d014042a1550e0002   5006    4028808c41637fc50141639054d6000d    402881e64140a201014140a5bc2d0001   21-09-2013 21:11:45    402881e74042a06d014042a1550e0002   1001002    402881e74068d5d1014068d65b410001    402881e5417794110141779d2d500000   02-10-2013 13:21:31    402881e74042a06d014042a1550e0002   5006    402881e74068d5d1014068d65b410001    ff80808140d384250140d3880fc60001   31-08-2013 16:40:44    402881e74042a06d014042a1550e0002   5004    402881e74068d5d1014068d65b410001    4028809541832fae014183394deb0001   04-10-2013 19:27:52    402881e74042a06d014042a1550e0002   1002    402881e74068d5d1014068d65b410001    4028808c41637fc50141638e764d0001   28-09-2013 15:53:02    402881e74042a06d014042a1550e0002   3    4028808c41637fc50141638e74f10000    4028808c41637fc50141638e764d0002   28-09-2013 15:53:02    402881e74042a06d014042a1550e0002   1001    4028808c41637fc50141638e74f10000    4028808c41637fc50141638e764d0003   28-09-2013 15:53:02    402881e74042a06d014042a1550e0002   2001    4028808c41637fc50141638e74f10000    4028808c41637fc50141638e764d0004   28-09-2013 15:53:02    402881e74042a06d014042a1550e0002   1    4028808c41637fc50141638e74f10000    4028808c41637fc50141638e764d0005   28-09-2013 15:53:02    402881e74042a06d014042a1550e0002   2    4028808c41637fc50141638e74f10000    4028808c41637fc50141638e764d0006   28-09-2013 15:53:02    402881e74042a06d014042a1550e0002   5    4028808c41637fc50141638e74f10000    4028809541832fae014183398dc40002   04-10-2013 19:28:09    402881e74042a06d014042a1550e0002   1002    4028808c41637fc50141639054d6000d    4028808c41637fc50141638e764d0008   28-09-2013 15:53:02    402881e74042a06d014042a1550e0002   5005    4028808c41637fc50141638e74f10000    4028808c41637fc50141638e764d0009   28-09-2013 15:53:02    402881e74042a06d014042a1550e0002   3001    4028808c41637fc50141638e74f10000    4028808c41637fc50141638e764e000a   28-09-2013 15:53:02    402881e74042a06d014042a1550e0002   1001001    4028808c41637fc50141638e74f10000    4028808c41637fc50141638e764e000b   28-09-2013 15:53:02    402881e74042a06d014042a1550e0002   1001002    4028808c41637fc50141638e74f10000    4028808c41637fc50141638e764e000c   28-09-2013 15:53:02    402881e74042a06d014042a1550e0002   0    4028808c41637fc50141638e74f10000    4028808c41637fc5014163905542000e   28-09-2013 15:55:05    402881e74042a06d014042a1550e0002   3    4028808c41637fc50141639054d6000d    4028808c41637fc5014163905542000f   28-09-2013 15:55:05    402881e74042a06d014042a1550e0002   1001    4028808c41637fc50141639054d6000d    4028808c41637fc50141639055420010   28-09-2013 15:55:05    402881e74042a06d014042a1550e0002   2001    4028808c41637fc50141639054d6000d    4028808c41637fc50141639055420011   28-09-2013 15:55:05    402881e74042a06d014042a1550e0002   1    4028808c41637fc50141639054d6000d    4028808c41637fc50141639055420012   28-09-2013 15:55:05    402881e74042a06d014042a1550e0002   2    4028808c41637fc50141639054d6000d    4028808c41637fc50141639055420013   28-09-2013 15:55:05    402881e74042a06d014042a1550e0002   5    4028808c41637fc50141639054d6000d    4028809541832fae01418339a2970003   04-10-2013 19:28:14    402881e74042a06d014042a1550e0002   1002    4028808c41637fc50141638e74f10000    4028808c41637fc50141639055420015   28-09-2013 15:55:05    402881e74042a06d014042a1550e0002   5005    4028808c41637fc50141639054d6000d    4028808c41637fc50141639055420016   28-09-2013 15:55:05    402881e74042a06d014042a1550e0002   3001    4028808c41637fc50141639054d6000d    4028808c41637fc50141639055420017   28-09-2013 15:55:05    402881e74042a06d014042a1550e0002   1001001    4028808c41637fc50141639054d6000d    4028808c41637fc50141639055430018   28-09-2013 15:55:05    402881e74042a06d014042a1550e0002   1001002    4028808c41637fc50141639054d6000d    4028808c41637fc50141639055430019   28-09-2013 15:55:05    402881e74042a06d014042a1550e0002   0    4028808c41637fc50141639054d6000d    ff80808140d37b0d0140d37b5a6d0001   31-08-2013 16:26:51    402881e74042a06d014042a1550e0002   3    402881e74068d5d1014068d65b410001    ff80808140d37b0d0140d37b5a7d0003   31-08-2013 16:26:51    402881e74042a06d014042a1550e0002   1    402881e74068d5d1014068d65b410001    ff80808140d37b0d0140d37b5a7d0004   31-08-2013 16:26:51    402881e74042a06d014042a1550e0002   2    402881e74068d5d1014068d65b410001    ff80808140d37b0d0140d37b5a7d0005   31-08-2013 16:26:51    402881e74042a06d014042a1550e0002   5001    402881e74068d5d1014068d65b410001    ff80808140d37b0d0140d37b5a7d0006   31-08-2013 16:26:51    402881e74042a06d014042a1550e0002   5002    402881e74068d5d1014068d65b410001    ff80808140d37b0d0140d37b5a7d0007   31-08-2013 16:26:51    402881e74042a06d014042a1550e0002   5003    402881e74068d5d1014068d65b410001    ff80808140d37b0d0140d37b5a7d0008   31-08-2013 16:26:51    402881e74042a06d014042a1550e0002   5    402881e74068d5d1014068d65b410001    ff80808140d37b0d0140d37b5a7d0009   31-08-2013 16:26:51    402881e74042a06d014042a1550e0002   0    402881e74068d5d1014068d65b410001