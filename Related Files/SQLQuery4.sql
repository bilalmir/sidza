use Elearning
select * from tbllesson where lessonid=1
select * from tbltitle
select  [tblclass].classname, [tblsubject1].subjectname, [tblmaterial1].filename, [tbllesson].lessonname,
[tbltitle].titlename FROM 
 [tblclass] INNER JOIN [tblsubject1] ON [tblclass].classid = [tblsubject1].classid INNER JOIN [tbllesson] on 
 [tbllesson].subjectid=[tblsubject1].subjectid inner join [tbltitle] on [tbltitle].lessonid=[tbllesson].lessonid  inner join
 [tblmaterial1] ON [tblsubject1].subjectid = [tblmaterial1].subjectid INNER JOIN [tbltype] ON [tblmaterial1].typeid = [tbltype].typeid 
  where tblmaterial1.typeid=2 and tblsubject1.subjectid=1 and tbllesson.lessonid=1

  select distinct classname,subjectname,lessonname,titlename,filename from tblclass C inner join tblsubject1 S on C.classid=S.subjectid inner join
  tbllesson L on L.subjectid=S.subjectid inner join tbltitle T on T.lessonid=L.lessonid inner join tblmaterial1 M on M.lessonid =L.lessonid   
 inner join tbltype Typ on Typ.typeid=M.typeid where S.subjectid=1 and Typ.typeid=2 and L.lessonid=1 and C.classid=1

 select * from dbo.[tbllesson] where [tbllesson].subjectid=1

 select subjectid,subjectname from tblsubject inner join tblclass C on C.classid=tblsubject.classid where [tblsubject].classid=1
 select * from dbo.[tbllesson] where [tbllesson].subjectid=2
 select * from dbo.[tbltitle] where [tbltitle].lessonid=2

 select filename from tblmaterial1 where subjectid=2 and lessonid=2 and typeid=2
  select * from tblmaterial1 inner join tblclass 
   on tblsubject1.classid=tblclass.classid and lessonid='1' and typeid='2'

select distinct classname,subjectname,lessonname,titlename,filename from tblclass,tblsubject1,tbllesson,tbltitle,tbltype,tblmaterial1 where tblclass.classid=tblsubject1.classid
and tblsubject1.subjectid=tbllesson.subjectid and tbllesson.lessonid=tbltitle.lessonid and tblsubject1.subjectid=tblmaterial1.subjectid and tblmaterial1.lessonid=tbllesson.lessonid
and  tblmaterial1.subjectid=1 and tblmaterial1.lessonid=1 and tblmaterial1.typeid=4

select tblmaterial1.filename from tblmaterial1,tblsubject1,tblclass where tblmaterial1.subjectid=1 and tblmaterial1.lessonid=1 and tblmaterial1.typeid=2 and 
tblclass.classid =1 and tblsubject1.classid=tblclass.classid

select tblmaterial1.filename,tblclass.classid,tblclass.classname from tblmaterial1,tblclass where tblmaterial1.subjectid=3 and tblmaterial1.lessonid=2 and tblmaterial1.typeid=2 
and tblclass.classid= (select classid from tblclass where tblclass.classid=3)

select filename from tblmaterial1 where subjectid=1 and tblmaterial1.classid=2 and lessonid=1 and typeid=4 order by lessonid