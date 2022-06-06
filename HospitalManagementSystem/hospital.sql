CREATE TABLE Patients(
  email varchar(50) PRIMARY KEY,
  password varchar(50) NOT NULL,
  name varchar(50) NOT NULL,
  gender varchar(50) NOT NULL,
  address varchar(100) NOT NULL
);
CREATE TABLE MedicalHistory(
	id int PRIMARY KEY,
	date DATE NOT NULL,
	condition varchar(50) NOT NULL,
	surgeries varchar(50) NOT NULL,
	medication varchar(50) NOT  NULL
);
CREATE TABLE Doctor(
	email varchar(50) PRIMARY KEY,
	password varchar(50) NOT NULL,
	name varchar(50) NOT NULL,
	gender varchar(50) NOT NULL
);
CREATE TABLE Appointments(
	id int PRIMARY KEY,
	date DATE NOT NULL,
	status varchar(50) NOT NULL,
	starttime TIME NOT NULL,
	endtime TIME NOT NULL
);
CREATE TABLE Schedules(
	id int NOT NULL,
	starttime TIME NOT NULL,
	endtime TIME NOT NULL,
	breaktime TIME NOT NULL,
	day varchar(20) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE PatientAttendAppoints(
	covers varchar(50) NOT NULL,
	symptoms varchar(50) NOT NULL,
	patient varchar(50) NOT NULL,
	appt int NOT NULL,
	FOREIGN KEY (patient) REFERENCES Patients(email) ON DELETE CASCADE,
	FOREIGN KEY (appt) REFERENCES  Appointments(id) ON DELETE CASCADE,
	PRIMARY KEY(patient,appt)
);
CREATE TABLE PatientFillHistory(
	patient varchar(50) NOT NULL,
	history int NOT NULL,
	FOREIGN KEY (patient) REFERENCES Patients(email) ON DELETE CASCADE,
	FOREIGN KEY (history) REFERENCES MedicalHistory(id) ON DELETE CASCADE,
	PRIMARY KEY(history)
);
CREATE TABLE DoctorsViewHistory(
	history int NOT NULL,
	doctor varchar(50) NOT NULL,
	FOREIGN KEY (history) REFERENCES MedicalHistory(id) ON DELETE CASCADE,
	FOREIGN KEY (doctor) REFERENCES Doctor(email) ON DELETE CASCADE,
	PRIMARY KEY(history,doctor)
);

CREATE TABLE Diagnoses(
	appt int NOT NULL,
	doctor varchar(50) NOT NULL,
	diagnosis varchar(50) NOT NULL,
	prescription varchar(150) NOT NULL,
	FOREIGN KEY (doctor) REFERENCES Doctor(email) ON DELETE CASCADE,
	FOREIGN KEY (appt) REFERENCES  Appointments(id) ON DELETE CASCADE,
	PRIMARY KEY(appt,doctor)
);

CREATE TABLE DoctorHaveSche(
	sch int NOT NULL,
	doctor varchar(50) NOT NULL,
	FOREIGN KEY (doctor) REFERENCES Doctor(email) ON DELETE CASCADE,
	FOREIGN KEY (sch) REFERENCES Schedules(id) ON DELETE CASCADE,
	PRIMARY KEY(sch,doctor)
);