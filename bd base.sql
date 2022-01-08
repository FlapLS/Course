Create table Base(

Base_ID SERIAL PRIMARY KEY,

Name TEXT NOT NULL,

Location TEXT NOT NULL

);
Create type Types_of_Energon as enum('Usual','Dark');
Create table Energon(

Energon_ID SERIAL PRIMARY KEY,

Capacity Integer NOT NULL CHECK(Capacity >= 1000),

Type Types_of_Energon,

Kkal Integer NOT NULL CHECK(Kkal >=3000),

EnoughDays Integer NOT NULL CHECK(EnoughDays >=1)

);
Create table Transport(

Transport_ID SERIAL PRIMARY KEY,

Name TEXT NOT NULL,

Status TEXT NOT NULL,

Location TEXT NOT NULL

); 
Create table Operation(

Operation_ID SERIAL PRIMARY KEY,

Name TEXT NOT NULL,

start_time Timestamp without time zone,

end_time Timestamp without time zone,

Enemie TEXT NOT NULL,

Location TEXT NOT NULL

);
Create type Armors as enum('Ligth','Medium','Heavy');
Create table Equipment(

Equipment_ID SERIAL PRIMARY KEY,

SpecialArmor Armors,

Communication TEXT,

Midecal Integer NOT NULL CHECK(Midecal > 0),

Energon_ID Integer NOT NULL REFERENCES Energon

);
Create table EquipmentType(

EquipmentType_ID SERIAL PRIMARY KEY,

Equipment_ID Integer NOT NULL REFERENCES Equipment,

EquipmentType Integer NOT NULL CHECK(EquipmentType > 0) 

);
Create table Weapon(

Weapon_ID SERIAL PRIMARY KEY,

Name TEXT NOT NULL,

Type Text NOT NULL,

Calliber Real NOT NULL CHECK(Calliber > 0),

Rate_of_fire Integer NOT NULL CHECK(Rate_of_fire > 0),

FiringRange Integer NOT NULL CHECK(FiringRange > 0)

);
Create type Squads as Enum('AF','GF');
Create table Position(

Position_ID SERIAL PRIMARY KEY,

Name TEXT NOT NULL,

Rank Text,

EquipmentType_ID Integer NOT NULL REFERENCES EquipmentType,

Squad Squads

);
Create table Transformer(

Transformer_ID SERIAL PRIMARY KEY,

Name TEXT UNIQUE NOT NULL,

Date_of_build Timestamp without time zone,

Position_ID INTEGER NOT NULL REFERENCES Position,

Base_ID INTEGER NOT NULL REFERENCES Base,

Status TEXT NOT NULL

);
Create type BodyParts as Enum('Head','Body','Hand','Leg');
Create table Modification(

Modification_ID SERIAL PRIMARY KEY,

Name TEXT NOT NULL,

Date_of_modification Timestamp without time zone,

ModificationPart BodyParts,

IsChecked Boolean NOT NULL 

);
Create table SigmaCard(

CardID SERIAL PRIMARY KEY,

Transformer_ID INTEGER NOT NULL REFERENCES Transformer,

Height_m Integer NOT NULL CHECK(Height_m > 0),

Weight_t Integer NOT NULL CHECK(Weight_t > 0),

Modification_ID INTEGER NOT NULL REFERENCES Modification

);
Create table Operation_Transformer(

Transformer_ID INTEGER NOT NULL REFERENCES Transformer,

Operation_ID INTEGER NOT NULL REFERENCES Operation

);
Create table Operation_Transport(

Transport_ID INTEGER NOT NULL REFERENCES Transport,

Operation_ID INTEGER NOT NULL REFERENCES Operation

);
Create table Equipment_Weapon(

Equipment_ID INTEGER NOT NULL REFERENCES Equipment,

Weapon_ID INTEGER NOT NULL REFERENCES Weapon

);
Create table Inspection(

Transport_ID INTEGER NOT NULL REFERENCES Transport,

Transformer_ID INTEGER NOT NULL REFERENCES Transformer,

ServiceDate Timestamp without time zone,

Discription TEXT NOT NULL

);
