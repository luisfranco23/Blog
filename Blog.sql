CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "fistName" varchar(30) NOT NULL,
  "lastName" varchar(30) NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "age" integer,
  "is_active" boolean DEFAULT true,
  "role_id" integer
);

CREATE TABLE "role" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "posts" (
  "id" serial PRIMARY KEY,
  "title" varchar NOT NULL,
  "author" varchar NOT NULL,
  "content" text NOT NULL,
  "user_id" integer,
  "category_id" integer
);

CREATE TABLE "comments" (
  "id" serial PRIMARY KEY,
  "name" text,
  "user_id" integer,
  "post_id" integer
);

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "role" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");


select * from "users" u ;
select * from "role" r ;
select * from posts p ;
select * from "comments" c ;
select * from categories c ;


insert into "role" (name) values ('guest'),('admin'),('creator');
insert into users ("fistName", "lastName", email, password, age, role_id) values ('luis', 'franco', 'luis@gmail.com', 'root','20',1),('carlos','perez','carlos@gmail.com','1234','28',2); 
insert into categories (name) values ('home'),('school'),('worked');
insert into posts (title, author, content, user_id, category_id) values ('Api Rest', 'Luis', 'Esto es una prueba de un post','1','2'),('Front-End','Mario', 'Todo lo que debes saber sobre front','2','1');
insert into "comments" (name, user_id, post_id) values ('Excelente post','2','1'),('Me gusta mucho el front','2','2');



select * from posts p join "comments" c on p.id = c.post_id;