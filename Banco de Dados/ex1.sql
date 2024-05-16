
CREATE TABLE Fornecedor (fcod int,
                     	fone varchar(20),
                     	status int,
                     	cidade varchar(20),
                     	PRIMARY KEY(fcod)
                     	);
CREATE TABLE Peça (pcod int NOT NULL,
               	pnome varchar(30) NOT NULL,
               	cor varchar(20) NOT NULL,
               	peso float NOT NULL,
               	cidade varchar(30) NOT NULL,
               	PRIMARY KEY (pcod)
               	);   
              	 
CREATE TABLE Projeto (prcod int ,
               	prnome varchar(30),
               	cor varchar(20),
               	cidade varchar(30),
               	PRIMARY KEY (prcod)
               	);
              	 
CREATE TABLE Fornecimento (fcod int,
                       	pcod int,
                       	prcod int,
                       	quantidade int,
                       	PRIMARY KEY(fcod, pcod, prcod),
                       	FOREIGN KEY (fcod) REFERENCES Fornecedor(fcod),
                       	FOREIGN KEY (pcod) REFERENCES Peça(pcod),
                       	FOREIGN KEY (prcod) REFERENCES Projeto(prcod) ON DELETE CASCADE
                      	);
                     	 
ALTER TABLE Projeto
ADD horas DATETIME     	 
Alter table Peça DROP COLUMN cidade
                                     	

