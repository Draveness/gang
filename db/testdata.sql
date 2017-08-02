insert into users values
	(1, 'avatar/ks.png', 'kahs', 'kahsolt', '17801004452', 'Kahsolt', 0, 'BUAA', 'Senior', 'SE',1,1,'2017-5-8','2017-5-8'),
	(2, 'avatar/al.png', 'alice', 'Alice', '17851004452', 'Alitheia', 1, 'BUCC', 'Senior', 'SasdE',0,0,'2017-5-9','2017-6-8'),
	(3, 'avatar/lu.png', 'lupper', 'Luper', '13801004452', 'Lupas', 0, 'BUBB', 'Junior', 'SE',0,0,'2017-1-8','2017-5-5');
insert into sites values
	(1, 'BUAA','img/loc1.jpg',12.0,156.3,'2017-5-8','2017-5-8');
insert into categories values
	(1, 'program','2017-5-8','2017-5-8'),
	(2, 'life','2017-5-8','2017-5-8');
insert into tags values
	(1, 'code','2017-5-8','2017-5-8'),
	(2, 'love','2017-5-8','2017-5-8'),
	(3 ,'hate','2017-5-8','2017-5-8');
insert into topics values
	(1,'Ruby',1,'2017-5-8','2017-5-8'),
	(2,'Python',1,'2017-5-8','2017-5-8'),
	(3,'reading',2,'2017-5-8','2017-5-8');
insert into topics_subtopics values
	(1,'is Ruby ok','rbrbrbrbrbrb',1,'2017-5-8','2017-5-8'),
	(2,'is Ruby not ok','rbrbrbrbrbrb',1,'2017-5-8','2017-5-8'),
	(3,'is Python good','pypypypyp',2,'2017-5-8','2017-5-8'),
	(4,'is Python bad','pypypypyp',2,'2017-5-8','2017-5-8'),
	(5,'like reading?','raedingggg',3,'2017-5-8','2017-5-8');
insert into tags_topics values
	(1,1),
	(1,2),
	(2,3),
	(3,3);
insert into likes values
	(1,1,2,'2017-8-8','2017-8-8'),
	(2,2,1,'2017-8-8','2017-8-8'),
	(3,1,3,'2017-8-8','2017-8-8');
insert into activities values
	(1,'2017-9-9','A new Act!',1,1,'2017-8-8','2017-8-8'),
	(2,'2017-10-10','Another new Act!',1,2,'2017-8-8','2017-8-8');
insert into enrolls values
	(1,1,1,'2017-8-8','2017-8-8'),
	(2,3,1,'2017-8-8','2017-8-8'),
	(3,2,2,'2017-8-8','2017-8-8'),
	(4,3,2,'2017-8-8','2017-8-8'),
	(5,1,2,'2017-8-8','2017-8-8');
