--���� ��� 

select * from ta_member;
create sequence seq_mycalendar
start with 1
increment by 1;

create table my_calendar(
    edit_no number primary key, --������ �ѹ� 
    mem_no number,  --ȸ����ȣ 
    mem_name varchar(20) , --ȸ�� �̸�
    edit_title varchar(30), --���� �̸� 
    edit_start Date,  --���۳�¥
    edit_end Date, --����¥ 
    edit_color varchar(20), --���� 
    edit_desc varchar(2000) --�󼼼���
);
alter table my_calendar modify(edit_end Date);
delete from my_calendar;
select * from my_calendar where MEM_NO=10001;
drop table my_calendar;
insert into my_calendar VALUES(seq_mycalendar.nextval,10001,'�ƹ���','����','2019/09/22','2019/09/24','#74c0fc','�� ����');
select * from my_calendar;
select * from ta_member;
 alter session set nls_date_format = 'YYYY.MM.DD HH24:MI:SS'; 
commit;
rollback;
--fsutdy

create sequence seq_fstudy
start with 1
increment by 1
maxvalue 999;

create table f_study(
    f_no number constraint fstudy_pk primary key, --���͵� ��ȣ
    f_title varchar2(30), --���͵� Ÿ��Ʋ
    f_name varchar2(30), --���͵� �̸�
    f_area varchar2(30), --���͵� ����
    f_day  varchar2(30), --���͵� ����,�ָ�
    f_studyperson number, --���͵� �ο�
    f_category varchar2(25),--���͵� ī�װ�
    f_intro1 varchar2(1000), --���͵� �Ұ� 1
    f_intro2 varchar2(1000), --���ͱ� �Ұ� 2
    f_imgtitle varchar(225), --�̹��� Ÿ��Ʋ
    f_img1 varchar2(255), --�̹��� 1
    f_img2 varchar2(255), --�̹��� 2
    f_img3 varchar2(255), --�̹��� 3
    f_timestart varchar(30), --���͵� �ð� ����
    f_timeend varchar(30), --���͵� �ð� ��
    f_datestart date default sysdate not null, --���� ��¥
    f_dateend date not null, --����¥
    f_like number default 0, --���ƿ�
    f_readername varchar(30) default null --���� �̸� 
);


--���罺�͵�
create sequence seq_pstudy
start with 1
increment by 1
maxvalue 999;

create table p_study(
    p_no number primary key, --���͵� ��ȣ
    p_title varchar2(30), --���͵� Ÿ��Ʋ
    p_name varchar2(30), --���͵� �̸�
    p_area varchar2(30), --���͵� ����
    P_day  varchar2(30), --���͵� ����,�ָ�
    p_studyperson number, --���͵� �ο�
    p_price number, --���͵� ����
    p_category varchar2(30),--���͵� ī�װ�
    p_intro1 varchar2(1000), --���͵� �Ұ� 1
    p_intro2 varchar2(1000), --���ͱ� �Ұ� 2
    p_imgtitle varchar(225), --�̹��� Ÿ��Ʋ
    p_img1 varchar2(255), --�̹��� 1
    p_img2 varchar2(255), --�̹��� 2
    p_img3 varchar2(255), --�̹��� 3
    p_timestart varchar(30), --���͵� �ð� ����
    P_timeend varchar(30), --���͵� �ð� ��
    p_datestart date default sysdate not null, --���� ��¥
    p_dateend date not null, --����¥
    p_like number default 0, --���ƿ�
    p_teachername varchar(30) default null, --���� �̸� 
    p_status varchar(20) default 'Y', --���̴� �뵵 delete �Ⱦ� 
    p_studyMember number default 0--���͵� ���� Ȯ�� ��� �ѹ� 
);
--���͵� ����
create sequence seq_my_purchase
start with 1
increment by 1;
CREATE TABLE MY_PURCHASE(
    PUR_ID NUMBER PRIMARY KEY,--���Ź�ȣ
    mem_no number, -- ������ ȸ�� ��ȣ
    f_no number default null , -- ��û�� ���ὺ�͵� ��ȣ
    p_no number default null, -- ������ ���罺�͵� ��ȣ
    PURCHASE_DATE DATE, --����,��û ��¥
    PURCHASE_CANCEL_STATUS CHAR(1) DEFAULT 'N' CONSTRAINT PURCHASE_CANCEL_STATUS_CK CHECK (PURCHASE_CANCEL_STATUS IN ('N','Y')), --��ҿ���
    CANCEL_DATE DATE, --��� ��¥
    PURCHASE_STATUS CHAR(1) DEFAULT 'N' CONSTRAINT PURCHASE_CK CHECK (PURCHASE_STATUS IN ('N','Y')),--���͵� ���࿩��/������Y, �Ϸ�N
    SUBMIT_FILE CHAR(1) DEFAULT 'N' CONSTRAINT SUBMIT_FILE_CK CHECK (SUBMIT_FILE IN ('N','Y'))--���⼭���߱�����/������Y,�������N
);