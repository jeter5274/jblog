--------------------------------------------------------
--  파일이 생성됨 - 화요일-2월-23-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_CATEGORY_NO
--------------------------------------------------------

   CREATE SEQUENCE  "JBLOG"."SEQ_CATEGORY_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 22 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_COMMENTS_NO
--------------------------------------------------------

   CREATE SEQUENCE  "JBLOG"."SEQ_COMMENTS_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_POST_NO
--------------------------------------------------------

   CREATE SEQUENCE  "JBLOG"."SEQ_POST_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 146 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_USER_NO
--------------------------------------------------------

   CREATE SEQUENCE  "JBLOG"."SEQ_USER_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 19 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BLOG
--------------------------------------------------------

  CREATE TABLE "JBLOG"."BLOG" 
   (	"ID" VARCHAR2(20 BYTE), 
	"BLOGTITLE" VARCHAR2(200 BYTE), 
	"LOGOFILE" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------

  CREATE TABLE "JBLOG"."CATEGORY" 
   (	"CATENO" NUMBER, 
	"ID" VARCHAR2(50 BYTE), 
	"CATENAME" VARCHAR2(200 BYTE), 
	"DESCRIPTION" VARCHAR2(500 BYTE), 
	"REGDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table COMMENTS
--------------------------------------------------------

  CREATE TABLE "JBLOG"."COMMENTS" 
   (	"CMTNO" NUMBER, 
	"POSTNO" NUMBER, 
	"USERNO" NUMBER, 
	"CMTCONTENT" VARCHAR2(1000 BYTE), 
	"REGDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table POST
--------------------------------------------------------

  CREATE TABLE "JBLOG"."POST" 
   (	"POSTNO" NUMBER, 
	"CATENO" NUMBER, 
	"POSTTITLE" VARCHAR2(300 BYTE), 
	"POSTCONTENT" VARCHAR2(4000 BYTE), 
	"REGDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "JBLOG"."USERS" 
   (	"USERNO" NUMBER, 
	"ID" VARCHAR2(50 BYTE), 
	"USERNAME" VARCHAR2(100 BYTE), 
	"PASSWORD" VARCHAR2(50 BYTE), 
	"JOINDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into JBLOG.BLOG
SET DEFINE OFF;
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('admin','관리자의 블로그입니다.','/assets/images/spring-logo.jpg');
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('jus','정우성의 블로그입니다.','/upload/16139540118634cff93f1-cf14-4eb7-bd9f-24f55b72294c.jpg');
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('sjh','서장훈의 블로그입니다.','/assets/images/spring-logo.jpg');
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('yjs','국민MC MC유의 블로그','/upload/1613953994981c6fd2ffc-8536-4819-8d49-ce788326270d.jpg');
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('jus2','이정재의 블로그입니다.','/assets/images/spring-logo.jpg');
REM INSERTING into JBLOG.CATEGORY
SET DEFINE OFF;
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (1,'admin','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (2,'admin','자바프로그래밍','자바프로그래밍',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (3,'admin','오라클','오라클',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (4,'admin','서블릿_JSP','서블릿_JSP',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (5,'admin','스프링MVC','스프링MVC',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (6,'jus','미분류','기본으로 만들어지는 카테고리입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (7,'jus','자바프로그래밍','자바기본문법과 객체지향',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (8,'jus','오라클','오라클설치와 sql문',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (9,'jus','서블릿_JSP','인터넷프로그래밍',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (10,'jus','스프링MVC','스프링설정과 사용법',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (14,'yjs','생애','유재석의 생애',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (12,'sjh','미분류','기본으로 만들어지는 카테고리입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (13,'yjs','미분류','기본으로 만들어지는 카테고리입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (15,'yjs','출연작','유재석이 데뷔이래 출연한 방송정보',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (16,'yjs','수상','유재석의 역대 수상 내역',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (17,'yjs','가족','유재석의 가족관계',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (19,'yjs','인간관계','방송관련 주변인 정보',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (20,'jus2','미분류','기본으로 만들어지는 카테고리입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (21,'sjh','페이징','페이징을 적용해 보겠습니다.',to_date('21/02/22','RR/MM/DD'));
REM INSERTING into JBLOG.COMMENTS
SET DEFINE OFF;
Insert into JBLOG.COMMENTS (CMTNO,POSTNO,USERNO,CMTCONTENT,REGDATE) values (4,7,4,'우성씨 유퀴즈 나와줘서 참 고마웠어요',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.COMMENTS (CMTNO,POSTNO,USERNO,CMTCONTENT,REGDATE) values (5,7,3,'아 우성씨 아는형님도 한번 나와줘요~',to_date('21/02/22','RR/MM/DD'));
REM INSERTING into JBLOG.POST
SET DEFINE OFF;
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (1,1,'등록된 글이 없습니다.',null,to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (2,5,'1. mvc란?','mvc는 모델 뷰 컨트롤러의 약자로
mvc는 모델 뷰 컨트롤러의 약자로
mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로mvc는 모델 뷰 컨트롤러의 약자로',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (3,10,'스프링 시작하기','스프링 프레임워크(영어: Spring Framework)는 자바 플랫폼을 위한 오픈 소스 애플리케이션 프레임워크로서 간단히 스프링(Spring)이라고도 한다. 동적인 웹 사이트를 개발하기 위한 여러 가지 서비스를 제공하고 있다. 대한민국 공공기관의 웹 서비스 개발 시 사용을 권장하고 있는 전자정부 표준프레임워크의 기반 기술로서 쓰이고 있다.


스프링은 다른 프레임워크에 비해 다음과 같은 특징을 가진다. 
경량 컨테이너로서 자바 객체를 직접 관리한다. 각각의 객체 생성, 소멸과 같은 라이프 사이클을 관리하며 스프링으로부터 필요한 객체를 얻어올 수 있다.
스프링은 Plain Old Java Object 방식의 프레임워크이다. 일반적인 J2EE 프레임워크에 비해 구현을 위해 특정한 인터페이스를 구현하거나 상속을 받을 필요가 없어 기존에 존재하는 라이브러리 등을 지원하기에 용이하고 객체가 가볍다.
스프링은 제어 반전(IoC : Inversion of Control)을 지원한다. 컨트롤의 제어권이 사용자가 아니라 프레임워크에 있어서 필요에 따라 스프링에서 사용자의 코드를 호출한다.
스프링은 의존성 주입(DI : Dependency Injection)을 지원한다. 각각의 계층이나 서비스들 간에 의존성이 존재할 경우 프레임워크가 서로 연결시켜준다.
스프링은 관점 지향 프로그래밍(AOP : Aspect-Oriented Programming)을 지원한다. 따라서 트랜잭션이나 로깅, 보안과 같이 여러 모듈에서 공통적으로 사용하는 기능의 경우 해당 기능을 분리하여 관리할 수 있다.
스프링은 영속성과 관련된 다양한 서비스를 지원한다. iBATIS나 하이버네이트 등 이미 완성도가 높은 데이터베이스 처리 라이브러리와 연결할 수 있는 인터페이스를 제공한다.
스프링은 확장성이 높다. 스프링 프레임워크에 통합하기 위해 간단하게 기존 라이브러리를 감싸는 정도로 스프링에서 사용이 가능하기 때문에 수많은 라이브러리가 이미 스프링에서 지원되고 있고 스프링에서 사용되는 라이브러리를 별도로 분리하기도 용이하다.
',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (4,10,'스프링_주요어노테이션','Annotation(@)은 사전적 의미로는 주석이라는 뜻이다.
자바에서 Annotation은 코드 사이에 주석처럼 쓰이며 특별한 의미, 기능을 수행하도록 하는 기술이다.
(즉, 프로그램에게 추가적인 정보를 제공해주는 메타데이터라고 볼 수 있다.
meta data : 데이터를 위한 데이터)

<어노테이션의 용도>
- 컴파일러에게 코드 작성 문법 에러를 체크하도록 정보를 제공한다.
- 소프트웨어 개발 툴이 빌드나 배치시 코드를 자동으로 생성할 수 있도록 정보를 제공한다.
- 실행시(런타임시)특정 기능을 실행하도록 정보를 제공한다.

<어노테이션을 사용하는 순서>
1. 어노테이션을 정의한다.
2. 클래스에 어노테이션을 배치한다.
3. 코드가 실행되는 중에 Reflection을 이용하여 추가 정보를 획득하여 기능을 실시한다.

 [Reflection 이란?]
Reflection이란 프로그램이 실행 중에 자신의 구조와 동작을 검사하고, 조사하고, 수정하는 것이다.

Reflection은 프로그래머가 데이터를 보여주고, 다른 포맷의 데이터를 처리하고, 통신을 위해 serialization(직렬화)를 수행하고, bundling을 하기 위해 일반 소프트웨어 라이브러리를 만들도록 도와준다.

Java와 같은 객체 지향 프로그래밍 언어에서 Reflection을 사용하면 컴파일 타임에 인터페이스, 필드, 메소드의 이름을 알지 못해도 실행 중에 클래스, 인터페이스, 필드 및 메소드에 접근할 수 있다.

또한 새로운 객체의 인스턴스화 및 메소드 호출을 허용한다.

Java와 같은 객체 지향 프로그래밍 언어에서 Reflection을 사용하여 멤버 접근 가능성 규칙을 무시할 수 있다.
[EX] reflection을 사용하면 서드 파티 라이브러리의 클래스에서 private 필드의 값을 변경할 수 있다.

Spring에서 BeanFactory라는 Container에서 객체가 호출되면 객체의 인스턴스를 생성하게 되는데 이 때 필요하게 된다. 즉, 프레임워크에서 유연성있는 동작을 위해 쓰인다.

Annotation 자체는 아무런 동작을 가지지 않는 단순한 표식일 뿐이지만, Reflection을 이용하면 Annotation의 적용 여부와 엘리먼트 값을 읽고 처리할 수 있다.

Class에 적용된 Annotation 정보를 읽으려면 java.lang.Class를 이용하고
필드, 생성자, 메소드에 적용된 어노테이션 정보를 읽으려면 Class의 메소드를 통해 java.lang.reflect 패키지의 배열을 얻어야 한다.

Class.forName(), getName(), getModifier(), getFields() getPackage() 등등 여러 메소드로 정보를 얻을 수 있다.

Reflection을 이용하면 Annotation 지정만으로도 원하는 클래스를 주입할 수 있다.

<주요 Annotation>
@Controller   
@Service
@Repository
@Component  
@Autowired
@RequestMapping
@RequestParam
@ModelAttribute
@PathVariable 등',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (5,10,'스프링_마이바티스','마이바티스(MyBatis)는 자바 퍼시스턴스 프레임워크의 하나로 XML 서술자나 애너테이션(annotation)을 사용하여 저장 프로시저나 SQL 문으로 객체들을 연결시킨다.

마이바티스는 아파치 라이선스 2.0으로 배포되는 자유 소프트웨어이다.

마이바티스는 IBATIS 3.0의 포크이며 IBATIS의 원 개발자들이 포함된 팀에 의해 유지보수되고 있다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (6,10,'스프링 어플리케이션 아키텍쳐','어플리케이션 아키텍쳐 : 어떤 경계안에 있는 내부 구성 요소들이 어떤 책임을 지고 있으며 경계를 두고 서로 어떻게 동작하는지를 규정하는 것

애플리케이션을 구성하는 오브젝트들을 비슷한 성격과 책임을 가진 것끼리 묶는다.
- 사용자 요청을 처리하는 컨트롤(Controll)
- 비지니스 로직을 구현해 놓은 비지니스 서비스 오프젝트(Service)
-데이터 액세스 로직을 담당하는 DAO(Repository)

성격과 책임이 다른 것을 그룹으로 분리하는 것을 아키텍쳐중 계층형 아키텍쳐라 한다.
보통 웹 기반의 엔터프라이즈 애플리케이션은 세 개의 계층을 갖기 때문에 3계층( 3-tier, 3-layer) 애플리케이션이라 한다. 
반드시 3계층으로 만들어야 하는 것은 아니지만, 책임과 성격을 보면 3계층의 논리적 분류가 가능

스프링에서는 3계층은 스프링을 사용하는 엔터프라이즈 애플리케이션에서 가장 많이 사용되는 구조이며, 스프링 주요 모듈과 기술을 보면 3계층 구조에 맞게 설계되어있다.
단, 논리적 개념이므로 언제든지 상황과 조건에 따라 달라 질 수 있다.

',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (7,10,'자바스크립트_jquery_ajax','자바스크립트(JavaScript)는 객체 기반의 스크립트 프로그래밍 언어이다. 이 언어는 웹 브라우저 내에서 주로 사용하며, 다른 응용 프로그램의 내장 객체에도 접근할 수 있는 기능을 가지고 있다.

jQuery(제이쿼리)는 HTML의 클라이언트 사이드 조작을 단순화 하도록 설계된 크로스 플랫폼의 자바스크립트 라이브러리다. 존 레식이 2006년 뉴욕 시 바캠프(Barcamp NYC)에서 공식적으로 소개하였다. jQuery는 오늘날 가장 인기있는 자바스크립트 라이브러리 중 하나이다.

AJAX의 Asynchronous JavaScript and XML의 약자로, 말그대로 JavaScript와 XML을 이용한 비동기적 정보 교환 기법이다. 거의 JSON데이터를 다룬다. 용어와 실제 기술간의 차이가 커져서 요즘에는 약어가 아닌 고유명사 취급하고 있다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (8,19,'개요','심형래와는 영화 촬영을 통해 같이 인연을 맺어온 사이이며 KBS 공채 7기 개그맨으로서 KBS 공채 개그맨 중 꽃이라 불리는 7기 멤버들과도 깊은 친분을 유지하고 있다. 또한 여러 프로그램에 출연하면서 여러 연예인들과 인맥을 형성했는데 슈퍼 TV 일요일은 즐거워에 출연하면서 강호동, 신정환, 이혁재, 이휘재와 친분이 생겼고 무한도전에 출연하면서 정준하, 정형돈, 전진, 길 등과 두터운 친분이 생겼으며 런닝맨에 출연하면서부터는 개리, 하하, 송중기, 이광수, 송지효, 양세찬, 전소민 등과 두터운 친분이 생겼다. 참고로 런닝맨 멤버 중 지석진은 유재석보다 나이는 많지만 유재석의 코미디언 공채 후배이다. 특히 김종국과는 친분이 매우 깊어 2015년 터보가 재결성되자 터보의 노래를 피처링해주기도 했다. 최근에는 유재석과 제시가 각종 예능 프로그램에서 재미있게 활동하여 재-제 커플이라는 소문도 존재한다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (9,19,'후속작에 고정출연한 바 있거나 고정출연중인, 또는 고정으로 출연예정인 스타','- 박명수 (놀러와, 무한도전, X맨, 하자Go, 해피투게더3)
- 송은이 (스타 서바이벌 동거동락 2기, 코미디타운, 진실게임)
- 김제동 (해피투게더, X맨)
- 정준하 (서바이벌 대작전, 코미디타운, 대결! 반전 드라마, 무한도전)
- 정형돈 (무한도전)
- 노홍철 (놀러와, 무한도전)
- 하  하 (X맨, 무한도전, 하자Go, 옛날TV, 런닝맨)
- 조세호 (놀러와, 해피투게더3・4, 무한도전, 유 퀴즈 온 더 블럭)
- 길     (놀러와, 무한도전)
- 황광희 (무한도전, 요즘 애들)
- 전  진 (스타 서바이벌 동거동락 2기, 무한도전)
- 김종국 (스타 서바이벌 동거동락 2기, X맨, 패밀리가 떴다 1기, 런닝맨)
- 지석진 (진실게임, 런닝맨)
- 이광수 (런닝맨, 범인은 바로 너 1기)
- 송지효 (런닝맨)
- 전소민 (런닝맨, 식스센스)
- 양세찬 (런닝맨)
- 전현무 (해피투게더3・4)
- 이효리 (해피투게더 프렌즈, 패밀리가 떴다 1기)
- 윤종신 (하자Go, 옛날TV, 기적의 승부사, 패밀리가 떴다)
- 박경림 (멋진친구들, 스타 서바이벌 동거동락 1기, X맨)
- 박미선 (해피투게더3)
- 신봉선 (해피투게더 프렌즈, 해피투게더3)
- 유희열 (투유 프로젝트 - 슈가맨)
- 김이나 (투유 프로젝트 - 슈가맨)
- 김수로 (패밀리가 떴다) - 1기 출연
- 박예진 (패밀리가 떴다) - 1기 출연
- 대  성 (패밀리가 떴다) - 1기 출연
- 박시연 (패밀리가 떴다) - 1기 출연
- 박해진 (패밀리가 떴다) - 1기 출연
- 이천희 (패밀리가 떴다) - 1기 출연
- 김종민 (천하제일 외인구단, X맨, 놀러와, 범인은 바로 너 1・2기)
- 이승기 (X맨, 범인은 바로 너 2기)
- 양세형 (무한도전, 미추리 8-1000 시즌 1・시즌 2)
- 김원희 (스타 서바이벌 동거동락 2기, 놀러와)
- 권오중 (놀러와, 나는 남자다)
- 은지원 (X맨, 놀러와)
- 이수근 (해피투게더 프렌즈)
- 김하온 (요즘애들)',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (10,17,'가장 유재석','2008년 7월 6일 당시 MBC 소속 아나운서였던 나경은과 결혼
2010년 5월 1일 아들 유지호 탄생
2018년 10월 19일 딸 유나은 탄생',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (11,16,'요약','- 방송 3사 연예대상 최다 수상자 (총 15회 - KBS 2회, MBC 7회, SBS 6회)

- 방송 3사 연예대상 두 번째 그랜드슬램 달성

- 백상예술대상 사상 예능인으로서는 두번째로 TV부문 대상 수상',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (12,16,'연도별 수상내역','[1991년]
KBS 대학개그제 장려상

[2000년]
MBC 연기대상 MC 부문 특별상 (스타 서바이벌 동거동락)

[2003년]
KBS 연예대상 TV 진행 부문 최우수상 (슈퍼 TV 일요일은 즐거워, 해피투게더 쟁반노래방)
MBC 방송연예대상 쇼 버라이어티 부문 최우수상 (느낌표! - 책책책 책을 읽읍시다)

[2004년]
SBS 연기대상 TV MC 부문 특별상 (진실게임, 일요일이 좋다)

[2005년]
KBS 연예대상 대상 (해피투게더 프렌즈)

[2006년]
MBC 방송연예대상 대상 (무한도전, 놀러와)
백상예술대상 TV부문 남자 예능상 (일요일이 좋다)

[2007년]
MBC 방송연예대상 대상 (무한도전, 놀러와 / 무한도전 팀 자격으로 이순재와 공동수상)

[2008년]
Mnet 20''s Choice 버라이어티 스타
SBS 연예대상 대상 (일요일이 좋다 - 패밀리가 떴다)

[2009년]
MBC 방송연예대상 PD상 (무한도전 / 무한도전 팀 자격으로 공동수상)
MBC 방송연예대상 대상 (무한도전, 놀러와)
SBS 연예대상 대상 (일요일이 좋다 - 패밀리가 떴다 / 이효리와 공동수상)

[2010년]
KBS 연예대상 베스트 팀워크상 (해피투게더 시즌3 / 해피투게더 시즌3 팀 자격으로 수상)
MBC 방송연예대상 대상 (무한도전, 놀러와)
SBS 연예대상 창사 20주년 10대 스타상

[2011년]
MBC 방송연예대상 최우수상 (무한도전, 놀러와)
SBS 연예대상 대상 (일요일이 좋다 - 런닝맨)

[2012년]
제3회 대한민국 대중문화예술상 국무총리 표창
MBC 방송연예대상 PD상 (무한도전, 놀러와)
SBS 연예대상 시청자가 뽑은 최고 인기상 (일요일이 좋다 - 런닝맨)
SBS 연예대상 대상 (일요일이 좋다 - 런닝맨)

[2013년]
제49회 백상예술대상 TV 부문 대상 (해피투게더 시즌3, 무한도전, 일요일이 좋다 - 런닝맨)
SBS 연예대상 시청자가 뽑은 최고 인기상 (일요일이 좋다 - 런닝맨)

[2014년]
KBS 연예대상 대상 (해피투게더 시즌3, 나는 남자다)
MBC 방송연예대상 대상 (무한도전)
SBS 연예대상 시청자가 뽑은 최고 인기상 (일요일이 좋다 - 런닝맨)

[2015년]
MBC 방송연예대상 공로상 (무한도전 / 무한도전 팀 자격으로 수상)
SBS 연예대상 시청자가 뽑은 최고 인기상 (일요일이 좋다 - 런닝맨)
SBS 연예대상 대상 (일요일이 좋다 - 런닝맨, 동상이몽, 괜찮아 괜찮아 / 김병만과 공동수상)

[2016년]
KBS 연예대상 베스트 팀워크상 (해피투게더 시즌3 / 해피투게더 시즌3 팀 자격으로 수상)
MBC 방송연예대상 대상 (무한도전)

[2017년]
SBS 연예대상 글로벌 스타상 (런닝맨 / 런닝맨 팀 자격으로 수상)

[2018년]
제9회 대한민국 대중문화예술상 대통령 표창
SBS 연예대상 베스트 팀워크상 (런닝맨 / 런닝맨 팀 자격으로 수상)

[2019년]
KBS 연예대상 베스트 팀워크상 (해피투게더 시즌4 / 해피투게더 시즌4 팀 자격으로 수상)
SBS 연예대상 글로벌 프로그램상 (런닝맨 / 런닝맨 팀 자격으로 수상)
SBS 연예대상 대상 (런닝맨)
MBC 방송연예대상 남자 신인상 (놀면 뭐하니?)
MBC 방송연예대상 올해의 예능인상 (놀면 뭐하니?)

[2020년]
브랜드 고객충성도 대상 예능인 부문
백상예술대상 TV부문 남자 예능상 (놀면 뭐하니?)
SBS 연예대상 골든콘텐츠상 (런닝맨 / 런닝맨 팀 자격으로 수상)
2021 대한민국 퍼스트브랜드 대상 예능인부문 (남자)
MBC 방송연예대상 올해의 예능인상 (놀면 뭐하니?)
MBC 방송연예대상 베스트 커플상 (with 이효리)
MBC 방송연예대상 대상 (놀면 뭐하니?)
제5회 동아닷컴’s PICK 덕업일치 했어YOO
',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (13,15,'현재 방송중인 프로그램','SBS 《런닝맨》
tvN 《유 퀴즈 온 더 블럭》
MBC 《놀면 뭐하니?》',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (14,15,'종영 / 중도하차 / 게스트 출연 프로그램','[2000년 이후]

[2001년]
KBS 《뮤직플러스》 공동 MC
KBS 《이유있는 밤》 공동 MC
KBS 《슈퍼 TV 일요일은 즐거워 - TV해결사 대한민국 만세》 MC
KBS 《슈퍼 TV 일요일은 즐거워 - TV해결사 사랑의 쌀사세요》 공동 MC
KBS 《슈퍼 TV 일요일은 즐거워 - 유재석의 금연학교》 MC
MBC 《!느낌표 - 책책책! 책을 읽읍시다!》 공동 MC
SBS 《초특급 일요일 만세》 - 헌혈합시다》 공동 MC
SBS 《초특급 일요일 만세》 - 황금보물선을 찾아라》 MC
SBS 《초특급 일요일 만세》 - 날아라 번지왕》 MC
SBS 《초특급 일요일 만세》 - 유재석의 장롱면허 탈출대작전》 MC
SBS 《초특급 일요일 만세》 - 유재석의 조용한 가족》 MC
SBS 《초특급 일요일 만세》 - 스타 서바이벌 만찬》 MC
SBS 《이홍렬쇼》
SBS 《박수홍 박경림의 아름다운 밤》

[2002년]
KBS 《슈퍼 TV 일요일은 즐거워 - 미션MC대격돌 공포의 쿵쿵따》 공동 MC
SBS 《토요일이 온다》 MC
SBS 《코미디타운》
SBS 《기분전환 수요일 - 대결 맛대맛》 공동 MC
SBS 《기분전환 수요일 - 기분전환 패밀리》 MC
SBS 《진기록 팡!팡!팡!》 MC

[2003년]
KBS 《해피투게더 - 쟁반노래방》 공동 MC (2003년 ~ 2005년)
KBS 《논쟁 버라이어티 - 당신의 결정》 공동 MC
KBS 《슈퍼 TV 일요일은 즐거워 - MC대격돌 위험한 초대》 공동 MC
KBS 《슈퍼 TV 일요일은 즐거워 - 천하제일 외인구단》 MC
KBS 《슈퍼 TV 일요일은 즐거워 - MC대격돌 운명의 바퀴》 공동 MC
SBS 《실제상황 토요일 - X맨》 MC
SBS 《TV장학회》 MC
SBS 《진실게임》 MC
SBS 《가슴을 열어라》 MC
SBS 《야심만만 만명에게 물었습니다》

[2004년]
MBC 《유재석 김원희의 놀러와》 공동 MC (2004년 ~ 2012년)
SBS 《일요일이 좋다 - 건강남녀》 공동 MC
SBS 《일요일이 좋다 - 태극기 휘날리며》 MC
SBS 《일요일이 좋다 - 특집 스타올림피아드》 MC
SBS 《일요일이 좋다 - 유재석과 감개무량》 MC
SBS 《일요일이 좋다 - 대결! 반전 드라마》 MC
SBS 《일요일이 좋다 - X맨》 MC
SBS 《이경규의 굿타임》
SBS 《김용만 신동엽의 즐겨찾기》

[2005년]
KBS 《해피투게더 프렌즈》 공동 MC (2005년 ~ 2007년)
MBC 《토요일 - 무(모)한 도전》 MC
MBC 《강력추천 토요일 - 무(리)한 도전》 MC
MBC 《강력추천 토요일 - 무한도전: 퀴즈의 달인》 MC

[2006년]
MBC 《무한도전》 MC (2006년 ~ 2018년)
SBS 《일요일이 좋다 - NEW X맨》 MC

[2007년]
SBS 《일요일이 좋다 - 하자GO》 MC
SBS 《일요일이 좋다 - 옛날 TV》 MC
KBS2 《해피투게더 시즌3》 MC (2007년 ~ 2018년)
SBS 《일요일이 좋다 - 기적의 승부사》 MC
SBS 《일요일이 좋다 - 기승史》 MC

[2008년]
SBS 《일요일이 좋다 - 패밀리가 떴다》 MC
tvN 《현장 토크쇼 택시》 게스트

[2009년]
KBS 《유희열의 스케치북》 게스트

[2013년]
KBS 《인간의 조건》 게스트

[2014년]
KBS 《나는 남자다》 MC
MBC FM4U 《타블로와 꿈꾸는 라디오》 9월 11일 일일DJ(무한도전 라디오데이 촬영)
저장위성 《달려라 형제 시즌 1》 11월 7일 게스트

[2015년]
SBS 《동상이몽, 괜찮아 괜찮아》 MC
JTBC 《투유 프로젝트 - 슈가맨》 MC

[2018년]
tvN 《유 퀴즈 온 더 블럭 시즌 1》
JTBC 《투유 프로젝트 - 슈가맨 시즌 2》 MC
넷플릭스 《범인은 바로 너》 시즌 1
KBS2 《해피투게더 시즌4》 MC (2018년 ~ 2020년)

[2019년]
JTBC 《요즘 애들》
tvN 《일로 만난 사이》
넷플릭스 《범인은 바로 너》 시즌 2
KBS1 《아침마당》

[2020년]
JTBC 《투유 프로젝트 - 슈가맨 시즌 3》 MC
tvN 《식스센스》',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (15,15,'영화','1994년 《영구와 우주괴물 불괴리》 - 반장 역
1994년 《티라노의 발톱》 - 원시인 역
2008년 《꿀벌 대소동》 - 베리 B. 벤슨 더빙 목소리 역
2009년 《리틀 비버》 - 내레이션 / 부엉이 목소리 역
2020년 《피원에이치: 새로운 세계의 시작》 - 한 역 (까메오)',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (16,15,'드라마/시트콤','1997년 ~ 1998년 KBS2 《아무도 못말려》 - 유재석 역
2000년 ~ 2001년 KBS2 《멋진친구들》 - 유재석 역
2005년 KBS2 《올드미스 다이어리》 - 도둑 역 (우정출연)
2007년 MBC 《김치 치즈 스마일》 - 결혼식 사회 역 (특별출연)
2008년 MBC 《이산》 - 가마꾼 / 주막 행인 / 호위병 역 (특별출연)
2009년 MBC 《내조의 여왕》 - 취업 준비생 / 신입사원 역 (특별출연)
2015년 SBS 《냄새를 보는 소녀》 - 런닝맨 MC 역 (특별출연)
2015년 MBC 《내 딸, 금사월》 - 헤더 신 수행비서 / 천재 화가 / 톱스타 역 (특별출연)
2019년 KBS2 《사랑은 뷰티풀 인생은 원더풀》 - 해피투게더 MC 역 (특별출연)
2020년 KBS2 《좀비탐정》 - 영화 강시와 백허그의 남주인공 역 (특별출연)',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (17,15,'뮤직비디오','2002년 하지만 - 굳세어라 내 청춘
2004년 신나고 - 이쁘니까
2005년 강호동 - 캐롤앨범 오해피데이 ''창밖을 보라''
2012년 싸이 - 강남 스타일
2013년 싸이 - 젠틀맨
2014년 박지윤 - Beep
2015년 지누션- 한번 더 말해줘',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (18,14,'탄생~데뷔','1972년 서울시 성북구 수유동(현재는 강북구 관할)에서 1남 2녀 중 첫째로 태어났다.[1] 1991년 KBS에서 주최한 제1회 대학 개그제에서 최승경과 함께 장려상을 받으면서 데뷔했다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (19,14,'무명생활','《유머일번지》 등에서 작은 역할로 등장하면서 1994년말 입대부터 군 제대 후까지 무명 시절을 거치던 중, 1997년 KBS2 《코미디 세상만사》의 코너인 《남편은 베짱이》에서 남편 역할을 맡으면서 조금씩 대중에게 알려지기 시작한다.

한편 유재석은 코미디언을 처음 시작할 때 심형래의 밑에서 일을 하기도 했다.[2] 심형래는 김청기 감독의 《외계에서 온 우뢰매》의 출연을 시작해서 이후엔 자신이 직접 감독이 되어 영화를 촬영하기도 했는데 심형래는 이 영화들을 촬영하면서 당시 무명이었던 유재석을 서찬호와 같이 데리고 다니면서 자신의 영화에 출연시켜 줬다. 그 대표작으로 《영구와 우주괴물 불괴리》(배역 : 초등학교 6학년), 《티라노의 발톱》(배역 : 원시인 1)[3] 등 다수가 존재한다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (20,14,'무명시절 탈출',' 1990년대 후반 최고의 인기를 구가했던 토크쇼인 《서세원 쇼》였다. 《서세원 쇼》에서 가장 인기 있는 코너였던 ''토크박스''에서 유재석은 자신의 재밌었던 경험담을 무명시절부터 꾸준히 다져온 그만의 재치와 입담으로 맛깔스럽게 풀며, ''유재석''이라는 자신의 이름을 대중들에게 점차 각인시키게 됐다. 《''슈퍼TV 일요일은 즐거워》 - 출발 드림팀''에서 자주 망가지는 모습과 어이가 없는 결과로 웃음을 유발하였고, 이 시기에 번지점프했던 장면 역시 토크의 소재였다. 《자유선언! 오늘은 토요일 - 60년을 이어라》에서 메뚜기 탈을 쓰면서 진행을 하는 바람에 지금까지 부르고 있는 메뚜기라는 별명이 이때 생겨났다.[4]《자유선언! 오늘은 토요일 - 잠을 잊은 그대》에게 에서는 본래의 취지였던 도서관이 문을 닫을 때까지 마지막으로 나오는 학생을 만나서 선물을 주기보다는 개그맨 남희석의 매니저였던 김종석과의 퀴즈 배틀이 더 화제가 되었다. 또한 MBC에서 방송했던 ''박상원의 아름다운TV 얼굴''에 상의를 탈의한 장면과 ''슈퍼TV 일요일은 즐거워 - MC대격돌 공포의 쿵쿵따''에서 치마가 풀리는 사고가 일어나 젖꼭지가 남들보다 아래에 있는 것이 밝혀져 이것이 가끔씩 예능에서 개그의 소재로 사용되었고, 이후 무한도전 WM7편에서 ''저쪼아래''라는 별칭으로 알려지기도 했다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (21,14,'첫 메인MC 발탁',' MBC 《목표달성! 토요일》 - 《스타 서바이벌 동거동락》이다. 《스타 서바이벌 동거동락》은 인기 스타들을 한 방에 몰아넣고 하룻밤을 지새게 하며 진행했던 초유의 프로그램이며, 이러한 방식은 떼거리로 연예인들이 팀을 이뤄 미션을 이행하고, 볼거리를 만들어 내는 , ''X맨(엑스맨)'', ''무한도전'', ''런닝맨'' 등과 같은 이후 버라이어티 포맷의 원조로 꼽을 수 있다. 이 프로그램이 기획된 2000년 당시 유재석은 현재와 같은 명성이 있다기보다는 예능계에서 재능을 인정받고 점차 인지도가 있던 정도에 지나지 않았다. 그럼에도 불구하고 당시에 유재석이 전격적으로 공중파 예능 프로그램의 메인 MC로서 발탁될 수 있었던 이유는 바로 배우 최진실이 강력 추천한 덕분이었다. 《스타 서바이벌 동거동락》을 기획할 당시 담당 PD가 MC를 누구로 해야 할지 고민하던 도중에, 최진실로부터 ''메뚜기(유재석의 별명)라는 개그맨이 있는데, 너무 재밌다며 새로 하는 프로그램이 있으면 한번 MC로 기용 해보라''는 강력 추천을 받았던 것이다.[5][6] 당시 《목표달성! 토요일》은 유재석이 진행하는 《스타 서바이벌 동거동락》 외에도 《god의 육아일기》, 《악동클럽》 등의 타 코너들 또한 엄청난 인기를 얻게 되면서 명실상부 ''2000년-2001년 겨울 시즌'' 최고의 예능 프로그램으로 기록됐으며, 《스타 서바이벌 동거동락》의 경우 출연진들의 성향을 배려하는 한편, 적절한 타이밍에 망가져 주면서 분위기를 자연스럽게 살리는 유재석만의 스타일인 ''배려형 MC'' 캐릭터를 마음껏 발산한 첫 프로그램이었다. 또한 이로 인해 2000년 MBC 방송연예대상 MC 부문 특별상을 받았다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (22,14,'이후 우리가 아는 유재석','MBC에서 맡은 《느낌표!》의 〈책책책, 책을 읽읍시다!〉로 2003년 MBC 방송연예대상 쇼버라이어티 부문 최우수상을 거머줬다. 특히 이후에 《슈퍼 TV 일요일은 즐거워》 - 〈MC대격돌: 공포의 쿵쿵따〉로서 누구보다 웃기는 남자로 인정받고, 그때 함께 참여했던 강호동, 이휘재 등은 이후에도 예능에서 높은 활약을 펼쳐, 이 프로그램이 얼마나 가치 있었는지를 간접적으로 입증하고 있다. 이후 쿵쿵따의 인기가 한창일 무렵 이휘재, 김한석, 송은이, 홍록기, 정준하 등과 정통 세트형 코미디 프로그램인 코미디타운을 SBS에서 진행했으나 실패하고, 이후 〈MC 대격돌: 운명의 바퀴/위험한 초대〉로 복귀하였다. 《해피투게더》, 《진실게임》등의 MC를 맡으면서 능력을 인정받게 되고, SBS의 예능 프로그램인 《실제상황 토요일 - X맨》의 메인 MC를 맡고, 이 프로그램의 인기로 국민 MC라는 별명을 얻게 된다. 또한 MBC의 토크쇼 프로그램인 《놀러와》에 배우 김원희와 함께 공동 MC로 투입되어 본격적인 예능계의 별로 떠오르기 시작했다. 하지만 이외의 유재석이 MC를 맡은 몇몇 프로그램들은 큰 빛을 받지 못하고 폐지됐다. 2005년 유재석은 "평균보다 모자란 남자들의 유쾌한 도전"이라는 컨텐츠에 대한 애정이 깊었고, 이전에 출연한 바보 드림팀이라고 비난받았던 KBS에서 방송된 《천하제일 외인구단》, SBS에서 방송된 《유재석과 감개무량》, 이름과 출연진만 다르고 같은 포맷의 프로그램을 계속 진행하다 MBC 《토요일》의 코너 〈무모한 도전〉을 맡게 됐는데, 초창기엔 고전을 면치 못했다. 당시 인포테인먼트 프로그램인 《스펀지》와의 경쟁 때문이었는데, 《강력추천 토요일》의 〈무한도전 - 퀴즈의 달인〉으로 프로그램 포맷이 변경이 되면서 프로그램의 인지도가 높아지고, 이에 힘입어 2006년 5월 6일부터는 《무한도전》이라는 독립 프로그램으로 편성되면서 대한민국 예능 프로그램의 새로운 경향을 제시하게 된다. 그 후 《해피투게더 시즌3》, 《패밀리가 떴다》에 출연하며 대한민국 예능계에서의 최고의 MC로서 입지를 굳혔다. 1년 8개월 동안의 방영을 끝으로《패밀리가 떴다》가 막을 내린 후, 2010년 유재석은 《런닝맨》으로 SBS 예능 프로그램에 메인 MC로 복귀했다. 그 후, 4년 만에 KBS2에서 나는 남자다라는 프로그램을 새로 시작하고, 시즌제로 운영하다 20회로 막을 내렸다. 그리고 2015년 8월에는 JTBC에 들어가서 새로운 파일럿 프로그램에 메인 MC를 맡고 있으며, 《동상이몽, 괜찮아 괜찮아》에서 김구라와 함께 메인 MC를 맡았다. 또한, 《런닝맨》의 인기도가 상승함에 따라 해외 인지도도 상승하였다. 2020년 7월, 《런닝맨》이 10주년을 맞이하게 되면서 대한민국 방송인 역사상 최초로 지상파 방송 3사 모두 20년 이상 활동하게 되면서 이들 방송사의 예능 프로그램을 10년 이상 진행하게 되는 기록을 보유하게 되었다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (24,21,'1번째 글입니다.','1번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (25,21,'2번째 글입니다.','2번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (26,21,'3번째 글입니다.','3번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (27,21,'4번째 글입니다.','4번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (28,21,'5번째 글입니다.','5번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (29,21,'6번째 글입니다.','6번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (30,21,'7번째 글입니다.','7번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (31,21,'8번째 글입니다.','8번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (32,21,'9번째 글입니다.','9번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (33,21,'10번째 글입니다.','10번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (34,21,'11번째 글입니다.','11번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (35,21,'12번째 글입니다.','12번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (36,21,'13번째 글입니다.','13번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (37,21,'14번째 글입니다.','14번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (38,21,'15번째 글입니다.','15번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (39,21,'16번째 글입니다.','16번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (40,21,'17번째 글입니다.','17번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (41,21,'18번째 글입니다.','18번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (42,21,'19번째 글입니다.','19번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (43,21,'20번째 글입니다.','20번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (44,21,'21번째 글입니다.','21번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (45,21,'22번째 글입니다.','22번째 글 내용 입니다.',to_date('21/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (46,21,'23 번 글입니다.','23 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (47,21,'24 번 글입니다.','24 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (48,21,'25 번 글입니다.','25 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (49,21,'26 번 글입니다.','26 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (50,21,'27 번 글입니다.','27 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (51,21,'28 번 글입니다.','28 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (52,21,'29 번 글입니다.','29 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (53,21,'30 번 글입니다.','30 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (54,21,'31 번 글입니다.','31 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (55,21,'32 번 글입니다.','32 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (56,21,'33 번 글입니다.','33 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (57,21,'34 번 글입니다.','34 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (58,21,'35 번 글입니다.','35 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (59,21,'36 번 글입니다.','36 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (60,21,'37 번 글입니다.','37 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (61,21,'38 번 글입니다.','38 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (62,21,'39 번 글입니다.','39 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (63,21,'40 번 글입니다.','40 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (64,21,'41 번 글입니다.','41 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (65,21,'42 번 글입니다.','42 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (66,21,'43 번 글입니다.','43 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (67,21,'44 번 글입니다.','44 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (68,21,'45 번 글입니다.','45 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (69,21,'46 번 글입니다.','46 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (70,21,'47 번 글입니다.','47 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (71,21,'48 번 글입니다.','48 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (72,21,'49 번 글입니다.','49 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (73,21,'50 번 글입니다.','50 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (74,21,'51 번 글입니다.','51 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (75,21,'52 번 글입니다.','52 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (76,21,'53 번 글입니다.','53 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (77,21,'54 번 글입니다.','54 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (78,21,'55 번 글입니다.','55 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (79,21,'56 번 글입니다.','56 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (80,21,'57 번 글입니다.','57 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (81,21,'58 번 글입니다.','58 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (82,21,'59 번 글입니다.','59 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (83,21,'60 번 글입니다.','60 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (84,21,'61 번 글입니다.','61 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (85,21,'62 번 글입니다.','62 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (86,21,'63 번 글입니다.','63 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (87,21,'64 번 글입니다.','64 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (88,21,'65 번 글입니다.','65 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (89,21,'66 번 글입니다.','66 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (90,21,'67 번 글입니다.','67 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (91,21,'68 번 글입니다.','68 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (92,21,'69 번 글입니다.','69 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (93,21,'70 번 글입니다.','70 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (94,21,'71 번 글입니다.','71 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (95,21,'72 번 글입니다.','72 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (96,21,'73 번 글입니다.','73 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (97,21,'74 번 글입니다.','74 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (98,21,'75 번 글입니다.','75 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (99,21,'76 번 글입니다.','76 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (100,21,'77 번 글입니다.','77 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (101,21,'78 번 글입니다.','78 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (102,21,'79 번 글입니다.','79 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (103,21,'80 번 글입니다.','80 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (104,21,'81 번 글입니다.','81 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (105,21,'82 번 글입니다.','82 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (106,21,'83 번 글입니다.','83 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (107,21,'84 번 글입니다.','84 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (108,21,'85 번 글입니다.','85 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (109,21,'86 번 글입니다.','86 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (110,21,'87 번 글입니다.','87 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (111,21,'88 번 글입니다.','88 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (112,21,'89 번 글입니다.','89 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (113,21,'90 번 글입니다.','90 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (114,21,'91 번 글입니다.','91 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (115,21,'92 번 글입니다.','92 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (116,21,'93 번 글입니다.','93 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (117,21,'94 번 글입니다.','94 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (118,21,'95 번 글입니다.','95 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (119,21,'96 번 글입니다.','96 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (120,21,'97 번 글입니다.','97 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (121,21,'98 번 글입니다.','98 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (122,21,'99 번 글입니다.','99 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (123,21,'100 번 글입니다.','100 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (124,21,'101 번 글입니다.','101 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (125,21,'102 번 글입니다.','102 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (126,21,'103 번 글입니다.','103 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (127,21,'104 번 글입니다.','104 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (128,21,'105 번 글입니다.','105 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (129,21,'106 번 글입니다.','106 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (130,21,'107 번 글입니다.','107 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (131,21,'108 번 글입니다.','108 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (132,21,'109 번 글입니다.','109 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (133,21,'110 번 글입니다.','110 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (134,21,'111 번 글입니다.','111 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (135,21,'112 번 글입니다.','112 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (136,21,'113 번 글입니다.','113 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (137,21,'114 번 글입니다.','114 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (138,21,'115 번 글입니다.','115 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (139,21,'116 번 글입니다.','116 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (140,21,'117 번 글입니다.','117 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (141,21,'118 번 글입니다.','118 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (142,21,'119 번 글입니다.','119 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (143,21,'120 번 글입니다.','120 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (144,21,'121 번 글입니다.','121 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (145,21,'122 번 글입니다.','122 번 글 내용입니다.',to_date('21/02/23','RR/MM/DD'));
REM INSERTING into JBLOG.USERS
SET DEFINE OFF;
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (1,'admin','관리자','1234',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (2,'jus','정우성','1234',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (3,'sjh','서장훈','1234',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (4,'yjs','유재석','1234',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (18,'jus2','이정재','1234',to_date('21/02/22','RR/MM/DD'));
--------------------------------------------------------
--  Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE "JBLOG"."COMMENTS" MODIFY ("CMTCONTENT" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."COMMENTS" MODIFY ("REGDATE" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."COMMENTS" ADD PRIMARY KEY ("CMTNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "JBLOG"."CATEGORY" MODIFY ("CATENAME" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."CATEGORY" MODIFY ("REGDATE" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."CATEGORY" ADD PRIMARY KEY ("CATENO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table POST
--------------------------------------------------------

  ALTER TABLE "JBLOG"."POST" MODIFY ("POSTTITLE" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."POST" MODIFY ("REGDATE" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."POST" ADD PRIMARY KEY ("POSTNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "JBLOG"."USERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."USERS" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."USERS" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."USERS" MODIFY ("JOINDATE" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."USERS" ADD PRIMARY KEY ("USERNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JBLOG"."USERS" ADD UNIQUE ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BLOG
--------------------------------------------------------

  ALTER TABLE "JBLOG"."BLOG" MODIFY ("BLOGTITLE" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."BLOG" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BLOG
--------------------------------------------------------

  ALTER TABLE "JBLOG"."BLOG" ADD CONSTRAINT "FK_BLOG_ID" FOREIGN KEY ("ID")
	  REFERENCES "JBLOG"."USERS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "JBLOG"."CATEGORY" ADD CONSTRAINT "FK_CATE_ID" FOREIGN KEY ("ID")
	  REFERENCES "JBLOG"."BLOG" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE "JBLOG"."COMMENTS" ADD CONSTRAINT "FK_CMT_POSTNO" FOREIGN KEY ("POSTNO")
	  REFERENCES "JBLOG"."POST" ("POSTNO") ENABLE;
  ALTER TABLE "JBLOG"."COMMENTS" ADD CONSTRAINT "FK_CMT_USERNO" FOREIGN KEY ("USERNO")
	  REFERENCES "JBLOG"."USERS" ("USERNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table POST
--------------------------------------------------------

  ALTER TABLE "JBLOG"."POST" ADD CONSTRAINT "FK_POST_NO" FOREIGN KEY ("CATENO")
	  REFERENCES "JBLOG"."CATEGORY" ("CATENO") ENABLE;
