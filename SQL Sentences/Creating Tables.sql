Create table bd_meli_challenger.Inventariobd (
	bdname varchar(30) primary key,
    bdclassification varchar(10)
    );

Create table bd_meli_challenger.nomina (
	usercc varchar(30) primary key,
    username varchar(10),
    useremail varchar(50) ,
    userposition varchar(50)
    );
    
    Create table bd_meli_challenger.jefes (
	idowner varchar(30),
    idmanager varchar(30),
	foreign key (idowner) references bd_meli_challenger.nomina(usercc),
    foreign key (idmanager) references bd_meli_challenger.nomina(usercc)
    );
    
    Create table bd_meli_challenger.bdowners (
	bdname varchar(30),
    usercc varchar(30),
	foreign key (bdname) references bd_meli_challenger.Inventariobd(bdname),
    foreign key (usercc) references bd_meli_challenger.nomina(usercc)
    );
   
	Create table bd_meli_challenger.revalida (
	bdname varchar(30),
    owneremail varchar(30),
    manageremail varchar(30),
    bdclassification varchar(10),
	foreign key (bdname) references bd_meli_challenger.Inventariobd(bdname),
    foreign key (owneremail) references bd_meli_challenger.nomina(useremail),
    foreign key (manageremail) references bd_meli_challenger.nomina(useremail),
    foreign key (bdclassification) references bd_meli_challenger.Inventariobd(bdclassification)
    )
    