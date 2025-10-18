USE newdatabase;
create table branch(Branch_name varchar(30),Branch_city varchar(25),assets int,PRIMARY KEY (Branch_name));
desc branch; 
insert into branch values('SBI_Chamrajpet','Bangalore','50000');
insert into branch values('SBI_ResidencyRoad','Bangalore','10000');
insert into branch values('SBI_ShivajiRoad','Bombay','20000');
insert into branch values('SBI_ParlimentRoad','Delhi','10000');
insert into branch values('SBI_Jantarmantar','Delhi','20000');
select* from branch;

create table BankAccount(Accno int,Branch_name varchar(30),Balance int,PRIMARY KEY(Accno),foreign key (Branch_name) references branch(Branch_name));
desc BankAccount;
insert into BankAccount values('1','SBI_Chamrajpet','2000');
insert into BankAccount values('2','SBI_ResidencyRoad','5000');
insert into BankAccount values('3','SBI_ShivajiRoad','6000');
insert into BankAccount values('4','SBI_ParlimentRoad','9000');
insert into BankAccount values('5','SBI_Jantarmantar','8000');
insert into BankAccount values('6','SBI_ShivajiRoad','4000');
insert into BankAccount values('8','SBI_ResidencyRoad','4000');
insert into BankAccount values('9','SBI_ParlimentRoad','3000');
insert into BankAccount values('10','SBI_ResidencyRoad','5000');
insert into BankAccount values('11','SBI_Jantarmantar','2000');
select* from BankAccount;

create table BankCustomer(Customername varchar(20),Customer_street varchar(30),CustomerCity varchar (35),PRIMARY KEY(Customername));
desc BankCustomer;
insert into BankCustomer values('Avinash','Bull_Temple_Road','Bangalore');
insert into BankCustomer values('Dinesh','Bannergatta_Road','Bangalore');
insert into BankCustomer values('Mohan','NationalCollege_Road','Bangalore');
insert into BankCustomer values('Nikil','Akbar_Road','Delhi');
insert into BankCustomer values('Ravi','Prithviraj_Road','Delhi');
select* from BankCustomer;

create table Depositer(Customername varchar(20),Accno int,PRIMARY KEY(Customername,Accno),foreign key (Accno) references BankAccount(Accno),foreign key (Customername) references BankCustomer(Customername));
desc Depositer;
insert into Depositer values('Avinash','1');
insert into Depositer values('Dinesh','2');
insert into Depositer values('Nikil','4');
insert into Depositer values('Ravi','5');
insert into Depositer values('Avinash','8');
insert into Depositer values('Nikil','9');
insert into Depositer values('Dinesh','10');
insert into Depositer values('Nikil','11');
select* from Depositer;

create table Loan(Loan_number int,Branch_name varchar(30),Amount int,PRIMARY KEY(Loan_number),foreign key (Branch_name) references branch(Branch_name));
desc Loan;
insert into Loan values('1','SBI_Chamrajpet','1000');
insert into Loan values('2','SBI_ResidencyRoad','2000');
insert into Loan values('3','SBI_ShivajiRoad','3000');
insert into Loan values('4','SBI_ParlimentRoad','4000');
insert into Loan values('5','SBI_Jantarmantar','5000');
select* from Loan;

SELECT d.Customername
FROM Depositer d
JOIN BankAccount ba ON d.Accno = ba.Accno
JOIN branch b ON ba.Branch_name = b.Branch_name
WHERE b.Branch_city = 'Delhi'
GROUP BY d.Customername
HAVING COUNT(DISTINCT ba.Branch_name) = (
    SELECT COUNT(*) FROM branch WHERE Branch_city = 'Delhi'
);

-- Hypothetical table
CREATE TABLE Borrower (
    Customername VARCHAR(20),
    Loan_number INT,
    PRIMARY KEY (Customername, Loan_number),
    FOREIGN KEY (Customername) REFERENCES BankCustomer(Customername),
    FOREIGN KEY (Loan_number) REFERENCES Loan(Loan_number)
);

SELECT DISTINCT b.Customername
FROM Borrower b
WHERE b.Customername NOT IN (
    SELECT DISTINCT d.Customername FROM Depositer d
);
SELECT DISTINCT d.Customername
FROM Depositer d
JOIN BankAccount ba ON d.Accno = ba.Accno
JOIN branch b1 ON ba.Branch_name = b1.Branch_name
WHERE b1.Branch_city = 'Bangalore'
AND d.Customername IN (
    SELECT DISTINCT br.Customername
    FROM Borrower br
    JOIN Loan l ON br.Loan_number = l.Loan_number
    JOIN branch b2 ON l.Branch_name = b2.Branch_name
    WHERE b2.Branch_city = 'Bangalore'
);
SELECT Branch_name
FROM branch
WHERE assets > ALL (
    SELECT assets FROM branch WHERE Branch_city = 'Bangalore'
);
DELETE FROM BankAccount
WHERE Branch_name IN (
    SELECT Branch_name FROM branch WHERE Branch_city = 'Bombay'
);
UPDATE BankAccount
SET Balance = Balance * 1.05;