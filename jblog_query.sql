/*********계정생성(system)****************/
create user jblog identified by jblog;
grant resource, connect to jblog;

/*DB초기화***********************************************************************/
--comments 테이블, 시퀀스 삭제
drop table comments;
drop sequence seq_comments_no;

--post 테이블, 시퀀스 삭제
drop table post;
drop sequence seq_post_no;

--category 테이블/시퀀스 삭제
drop table category;
drop sequence seq_category_no;

--blog 테이블 삭제
drop table blog;

--users 테이블/시퀀스 삭제
drop table users;
drop sequence seq_user_no;

--users 테이블/시퀀스 생성 및 데이터 삽입
create table users(
    userNo number,   --회원식별번호
    id varchar2(50) unique not null,   --아이디
    userName varchar2(100) not null,   --회원이름
    password varchar2(50) not null,   --비밀번호
    joinDate date not null,   --가입일
    primary key(userNo)
);

create sequence seq_user_no
increment by 1
start with 1
nocache;

insert into users values(seq_user_no.nextval, 'admin', '관리자', '1234', sysdate);

--blog 테이블 생성 및 데이터 삽입
create table blog(
    id varchar(20),   --식별번호(회원아이디)
    blogTitle varchar(200) not null,   --블로그 제목
    logoFile varchar(200),   --블로그 이미지 경로
    primary key(id),
    constraint fk_blog_id foreign key (id)
    references users(id)
);

insert into blog values('admin', '관리자의 블로그입니다.', '/assets/images/spring-logo.jpg');

--category 테이블/시퀀스 생성 및 데이터 삽입
create table category(
    cateNo number,   --식별번호
    id varchar2(50),   --회원아이디
    cateName varchar(200) not null,   --카테고리 명
    description varchar(500),     --카테고리 설명
    regDate date not null,   --등록일
    primary key (cateNo),
    constraint fk_cate_id foreign key (id)
    references blog(id)
);
 
create sequence seq_category_no
increment by 1
start with 1
nocache;

insert into category values(seq_category_no.nextval, 'admin', '미분류', '기본으로 만들어지는 카테고리 입니다.', sysdate);

--post 테이블/시퀀스 생성 및 데이터 삽입
create table post(
    postNo number,   --식별번호
    cateNo number,   --카테고리 번호
    postTitle varchar2(300) not null,   --글 제목
    postContent varchar2(4000),   --글 내용
    regDate date not null,   --글 작성일
    primary key(postNo),
    constraint fk_post_no foreign key(cateNo)
    references category(cateNo)
);

create sequence seq_post_no
increment by 1
start with 1
nocache;

insert into post values(seq_post_no.nextval, '1', '등록된 글이 없습니다.', null, sysdate);

select *
from post;

delete post
where postNo = 23;

--comments 테이블/시퀀스 생성 및 데이터 삽입
create table comments(
    cmtNo number,   --식별번호
    postNo number,   --글번호
    userNo number,   --회원번호
    cmtContent varchar(1000) not null,   --글내용
    regDate date not null,   --등록일
    primary key(cmtNo),
    constraint fk_cmt_postNo foreign key(postNo)
    references post(postNo),
    constraint fk_cmt_userNo foreign key(userNo)
    references users(userNo)
);

create sequence seq_comments_no
increment by 1
start with 1
nocache;

insert into comments values(seq_comments_no.nextval, '1', '1', '내가 쓴글', sysdate);

--commit
commit;

/*users table*******************************************************************/
--데이터 삽입
insert into users values(seq_user_no.nextval, 'admin', '관리자', '1234', sysdate);

--commit
commit;

--전체 데이터 보기
select  userNo,
        id,
        userName,
        password,
        joinDate
from users;

--id 중복체크 (selectById)
select  userNo,
        id,
        userName,
        joinDate
from users
where id = 'admin';

--1개의 UserVo 가져오기
select  us.userNo,
        us.id,
        us.userName,
        us.joinDate,
        bl.blogTitle,
        bl.logoFile
from users us, blog bl
where us.id = bl.id
and us.id = 'sjh';

-- 수정
update blog
SET logoFile = '/assets/images/spring-logo.jpg'
where id = 'sjh';

--로그인 (selectByIdNPw)
select  userNo,
        id
from users
where id = 'admin'
and password = '1234';

select  us.userNo,
        			us.id,
        			bl.blogTitle
			from users us, blog bl
			where us.id = bl.id 
            and us.id = 'jus'
			and us.password = '1234';
/*blog table********************************************************************/
--데이터 삽입
insert into blog values('admin', '관리자의 블로그입니다.', '/assets/images/spring-logo.jpg');

--commit
commit;

--전체 데이터보기
select  id,
        blogTitle,
        logoFile
from blog;

--test
select  id,
        blogTitle,
        logoFile
from blog
where id = 'admin';

--수정
update blog
set blogtitle = '1',
    logofile = '1'
where id = 'admin';




/*category table****************************************************************/
--데이터 삽입
insert into category values(seq_category_no.nextval, 'admin', '미분류', '기본으로 만들어지는 카테고리 입니다.', sysdate);

--commit
commit;

--데이터 전체 보기
select  cateNo,
        id,
        cateName,
        description,
        regDate
from category;

--계정의 포스트 수가 추가된 카테고리 리스트 불러오기,  (selectCateList)
select  ca.cateNo,
        ca.id,
        ca.cateName,
        ca.description,
        ca.regDate,
        nvl (pCnt.cnt, 0) as postCnt
from category ca left outer join (select cateNo,
                                  count(cateNo) as cnt
from post
group by cateNo) pCnt
on ca.cateNo = pCnt.cateNo
where ca.id = 'admin'
order by cateNo desc;

--cateNo로 카테고리 한개 불러오기
select  ca.cateNo,
        ca.id,
        ca.cateName,
        ca.description,
        ca.regDate,
        nvl (pCnt.cnt, 0) as postCnt
from category ca, (select cateNo,
       count(cateNo) as cnt
from post
group by cateNo) pCnt
where ca.cateNo = pCnt.cateNo
and ca.cateNo = 1;

select cateNo,
       count(cateNo)
from post
group by cateNo;

--cateNo로 삭제
delete category
where cateNo = 13;

rollback;

/*post table********************************************************************/
--테이터 삽입
insert into post values(seq_post_no.nextval, '1', '등록된 글이 없습니다.', null, sysdate);

--commit
commit;

--전체 데이터 보기
select  postNo,
        cateNo,
        postTitle,
        postContent,
        regDate
from post;

--카테고리의 글정보 가져오기
select  postNo,
        cateNo,
        postTitle,
        replace(postContent, chr(10), '<br>') postContent,
        to_char(regDate, 'YYYY/MM/DD') regDate
from post
where cateNo = 1
order by postNo desc;

-- 페이징이 적용된 글리스트 가져오기
select  r.rn,
        r.postNo,
        r.cateNo,
        r.postTitle,
        r.regDate
from(select rownum rn,
            o.postNo,
            o.cateNo,
            o.postTitle,
            o.regDate
     from(select postNo,
                 cateNo,
                 postTitle,
                 to_char(regDate, 'YYYY/MM/DD') regDate
          from post
          where cateNo = 21
          order by postNo desc) o) r
where r.rn >= 1
and r.rn <= 5;

update post
set cateNo = 16
where postNo = 12;



/*comments table****************************************************************/
--데이터 삽입
insert into comments values(seq_comments_no.nextval, '1', '1', '내가 쓴글', sysdate);

--commit
commit;

--전체 데이터 보기
select  cmtNo,
        postNo,
        userNo,
        cmtContent,
        regDate
from comments;

--포스트에 달린 코멘트 불러오기
select  co.cmtNo,
        co.postNo,
        co.userNo,
        co.cmtContent,
        to_char(co.regDate, 'YYYY/MM/DD') regDate,
        us.userName as writer
from comments co, users us
where co.userNo = us.userNo
and postNo = 7
order by cmtNo asc;

-- 특정 코멘트 삭제
delete comments
where cmtNo = 1;