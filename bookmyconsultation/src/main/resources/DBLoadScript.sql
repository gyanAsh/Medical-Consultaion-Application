CREATE TABLE `address` (
  `id` varchar(255) NOT NULL,
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

address(
id:varchar [255],
address_line1:varchar [255],
address_line2:varchar [255],
city:varchar [255],
postcode:varchar [255],
state:varchar [255]
)

CREATE TABLE `appointment` (
  `appointment_id` varchar(255) NOT NULL,
  `appointment_date` varchar(255) DEFAULT NULL,
  `created_date` varchar(255) DEFAULT NULL,
  `doctor_id` varchar(255) DEFAULT NULL,
  `doctor_name` varchar(255) DEFAULT NULL,
  `prior_medical_history` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `symptoms` varchar(255) DEFAULT NULL,
  `time_slot` varchar(255) DEFAULT NULL,
  `user_email_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

appointment(
appointment_id:varchar [255],
appointment_date:varchar [255],
created_date:varchar [255],
doctor_id:varchar [255],
doctor_name:varchar [255],
prior_medical_history:varchar [255],
status:varchar [255],
symptoms:varchar [255],
time_slot:varchar [255],
user_email_id:varchar [255],
user_id:varchar [255],
user_name:varchar [255]
)

CREATE TABLE `doctor` (
  `id` varchar(255) NOT NULL,
  `college` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `highest_qualification` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `pan` varchar(255) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `speciality` varchar(255) DEFAULT NULL,
  `total_years_of_exp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


doctor(
id:varchar [255],
college:varchar [255],
dob:varchar [255],
email_id:varchar [255],
first_name:varchar [255],
highest_qualification:varchar [255],
last_name:varchar [255],
mobile:varchar [255],
pan:varchar [255],
rating:double ,
speciality:varchar [255],
total_years_of_exp:int [11]
)

CREATE TABLE `rating` (
  `id` varchar(255) NOT NULL,
  `appointment_id` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `doctor_id` varchar(255) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


rating(
id:varchar [255],
appointment_id:varchar [255],
comments:varchar [255],
doctor_id:varchar [255],
rating:int [11]
)

CREATE TABLE `user` (
  `email_id` varchar(255) NOT NULL,
  `created_date` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

user(
email_id:varchar [255],
created_date:varchar [255],
dob:varchar [255],
first_name:varchar [255],
last_name:varchar [255],
mobile:varchar [255],
password:varchar [255],
salt:varchar [255]
)


CREATE TABLE `user_auth_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(1000) DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `login_at` datetime DEFAULT NULL,
  `logout_at` datetime DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsgoqgsfs8lfll3g069mei5l13` (`user_id`),
  CONSTRAINT `FKsgoqgsfs8lfll3g069mei5l13` FOREIGN KEY (`user_id`) REFERENCES `user` (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

user_auth_token(
id:bigint [20],
access_token:varchar [255],
expires_at:datetime,
login_at:datetime,
logout_at:datetime,
user_id:varchar [255]
)


INSERT INTO `doctor` (`id`,`college`,`dob`,`first_Name`,`last_Name`,`speciality`,`mobile`,`email_Id`,`highest_Qualification`,`rating`,`total_Years_Of_Exp`,`pan`) VALUES ("UUID-1","Bibendum Incorporated","2021-05-16","Amity","Stokes","GENERAL_PHYSICIAN","16750509 2135","Aliquam@musDonecdignissim.edu","MBBS",2,7,"YTV22PUB4TQ"),("UUID-2","Enim Consequat Purus LLC","2021-09-16","Blossom","Valentine","PULMONOLOGIST","16030728 0891","malesuada@lacusMaurisnon.com","MDS",5,20,"KAR90SJR5KQ"),("UUID-3","Risus Duis PC","2021-02-05","Nina","Gill","CARDIOLOGIST","16501009 0784","ipsum.leo.elementum@purusac.com","BDS",4,13,"JOP27DKW3XQ"),("UUID-4","Odio Vel Est Consulting","2022-03-28","Martha","Rivers","ENT","16771219 2348","dignissim.tempor@lorem.net","MBBS",2,49,"NIN10STB6ZJ"),("UUID-5","Justo Sit Amet Limited","2021-01-12","Judith","Best","ENT","16940301 8329","sit.amet@eulacus.ca","MDS",3,1,"GYX95GRG8FW"),("UUID-6","Nullam Enim Institute","2022-03-17","Sara","Carson","CARDIOLOGIST","16170217 4143","auctor@tinciduntnibhPhasellus.net","MDS",1,30,"OBL13JHJ9PW"),("UUID-7","Sed Diam Lorem LLP","2021-04-16","Zahir","Levine","GASTRO","16190627 3881","Aliquam.vulputate@Naminterdumenim.co.uk","MBBS",5,44,"VRV00DCP6NU"),("UUID-8","Phasellus Ornare Fusce LLC","2021-07-20","Cathleen","Bernard","DENTIST","16640729 9103","egestas.lacinia.Sed@Donecest.co.uk","MBBS",1,21,"YOS61WAA1ND"),("UUID-9","Ipsum Corporation","2021-01-02","Jamalia","Crane","PULMONOLOGIST","16970417 5513","nunc.In.at@MaurismagnaDuis.ca","MBBS",2,42,"XYC71FET6GO"),("UUID-10","Tellus Non Magna Associates","2022-04-03","Mia","Ewing","GASTRO","16470722 7619","ornare@MorbivehiculaPellentesque.co.uk","MDS",3,18,"NNC54LGX7OO");
INSERT INTO `doctor` (`id`,`college`,`dob`,`first_Name`,`last_Name`,`speciality`,`mobile`,`email_Id`,`highest_Qualification`,`rating`,`total_Years_Of_Exp`,`pan`) VALUES ("UUID-11","Interdum Ligula PC","2021-11-17","Ocean","Garner","PULMONOLOGIST","16060416 1182","id.erat@conubianostra.edu","BDS",5,36,"XRA69VTH2CE"),("UUID-12","Lobortis Augue Scelerisque Foundation","2020-10-24","Uriah","Head","CARDIOLOGIST","16540220 1361","enim@Phasellus.edu","MDS",4,46,"FCG60XRE5TA"),("UUID-13","Odio Nam Incorporated","2022-01-09","Georgia","Cameron","DENTIST","16171026 3177","augue.ac.ipsum@egestashendreritneque.edu","BDS",3,34,"DPM49XGU8SY"),("UUID-14","Elementum Industries","2021-04-10","Daniel","Gilliam","GASTRO","16761107 6071","hendrerit.id.ante@risusDonec.edu","MBBS",2,18,"YVX94RGG8OF"),("UUID-15","Ac Mi Industries","2021-09-17","Dakota","Elliott","DENTIST","16200412 4455","ornare.libero.at@enim.com","MDS",1,44,"RFA97HAA8TH"),("UUID-16","Primis In Ltd","2020-09-19","Imelda","Gomez","DENTIST","16831204 9656","egestas.a.dui@acnulla.co.uk","MDS",1,12,"MOC34NRE2HM"),("UUID-17","Proin Sed Turpis Institute","2020-12-16","Jessica","Molina","PULMONOLOGIST","16041002 6520","fringilla@ami.com","MDS",1,45,"FEY04ICD6SV"),("UUID-18","Purus Nullam Consulting","2021-06-04","Neville","Holloway","GASTRO","16061210 4836","dictum.augue@euultricessit.net","MBBS",2,38,"TND34NCX1FK"),("UUID-19","Eget Corporation","2022-04-06","Kennan","Hess","GENERAL_PHYSICIAN","16131024 0187","arcu.Curabitur@loremDonecelementum.org","MBBS",5,23,"DAT70NTH3GB"),("UUID-20","Et Magnis Dis Corp.","2020-11-01","Caleb","Galloway","GENERAL_PHYSICIAN","16700212 1205","odio.sagittis.semper@nonhendrerit.co.uk","MDS",2,46,"QKW35EZP3PH");
INSERT INTO `doctor` (`id`,`college`,`dob`,`first_Name`,`last_Name`,`speciality`,`mobile`,`email_Id`,`highest_Qualification`,`rating`,`total_Years_Of_Exp`,`pan`) VALUES ("UUID-21","Proin Limited","2022-06-22","Joseph","Gay","PULMONOLOGIST","16090904 8282","nisl@euismod.edu","BDS",4,5,"HCB18DMV8KB"),("UUID-22","Nunc Corp.","2021-08-17","Lavinia","Peck","PULMONOLOGIST","16410722 6302","leo@tinciduntorciquis.com","MDS",3,29,"DVH21HKT7CK"),("UUID-23","Non Inc.","2020-10-21","September","Patterson","ENT","16691120 5398","ligula.elit.pretium@enimnislelementum.co.uk","MDS",4,21,"IEE97JYU1KQ"),("UUID-24","Odio Phasellus At Consulting","2022-01-26","Dorian","Sawyer","GASTRO","16290706 5060","primis@erosNam.edu","MBBS",5,2,"PZG02HQK5MG"),("UUID-25","Elit Pede LLP","2021-06-21","Francesca","Jensen","DENTIST","16441019 5459","nec.cursus@mi.net","MDS",2,39,"LXK88HAN1SH"),("UUID-26","Curabitur Ltd","2022-03-06","Duncan","Wolf","DENTIST","16550318 4953","nonummy.ultricies@In.ca","BDS",2,15,"IOU66NNE6AX"),("UUID-27","Massa Non Institute","2021-04-01","Virginia","Wiggins","DENTIST","16650128 1874","lorem.Donec@pede.net","MBBS",4,48,"SXK26DKI7CU"),("UUID-28","Mollis Phasellus Limited","2022-02-10","Halee","Leonard","GENERAL_PHYSICIAN","16390323 9634","ligula.Nullam.enim@molestie.ca","BDS",5,33,"YXY56CMI5QN"),("UUID-29","Eu Ltd","2021-04-09","Orla","Mcfadden","DENTIST","16480108 2399","pulvinar.arcu@augueeutellus.net","MBBS",3,36,"OCP64ZJU1JN"),("UUID-30","Et Nunc Quisque LLP","2022-01-01","Kirby","Hawkins","DENTIST","16351030 5414","ipsum.cursus@blanditenimconsequat.net","MBBS",3,21,"ZOU95IDQ0ZW");
INSERT INTO `doctor` (`id`,`college`,`dob`,`first_Name`,`last_Name`,`speciality`,`mobile`,`email_Id`,`highest_Qualification`,`rating`,`total_Years_Of_Exp`,`pan`) VALUES ("UUID-31","Odio Limited","2022-02-08","Calvin","Kennedy","DENTIST","16871215 7042","magnis@cursusNunc.ca","BDS",3,16,"MXP05ZJA1KK"),("UUID-32","Egestas Sed PC","2022-03-09","Darrel","Rodgers","CARDIOLOGIST","16540811 1697","ante@Aeneaneuismod.com","MBBS",3,25,"BRF88AUD1ZY"),("UUID-33","Donec LLP","2021-05-23","Nissim","Woodard","DENTIST","16170714 3192","vel.arcu.Curabitur@elit.com","MDS",3,48,"ORY56XHG7JJ"),("UUID-34","Vivamus Non Lorem Foundation","2022-04-03","Meghan","Jordan","CARDIOLOGIST","16891025 2785","vel@sitametdapibus.net","MBBS",5,39,"JFT53IQX9CP"),("UUID-35","Vivamus Limited","2021-11-16","Kyla","Higgins","DENTIST","16470916 2087","luctus.ipsum.leo@a.co.uk","MDS",1,35,"TVR16GHG5ZG"),("UUID-36","Morbi Neque Tellus LLP","2020-12-19","Hilary","Porter","ENT","16740615 9280","nec.tempus.mauris@nibh.com","MBBS",5,11,"YBD84UZN5UW"),("UUID-37","Non Limited","2021-05-16","Hermione","Kelley","DENTIST","16901013 8262","eu@velsapienimperdiet.net","MBBS",5,29,"FBK36EEI6FD"),("UUID-38","Velit Pellentesque PC","2021-06-05","Aline","Montgomery","DENTIST","16380505 8728","molestie@pedeultrices.edu","MBBS",1,31,"VUR85DFD7RF"),("UUID-39","Eu Ligula LLC","2020-12-17","Britanni","Page","DENTIST","16890401 9513","non@Aliquam.com","MDS",3,37,"NNX03RJA2YU"),("UUID-40","At Auctor Ullamcorper Corp.","2022-05-31","Chase","Reyes","CARDIOLOGIST","16370311 5141","massa.Quisque@tellusid.net","BDS",2,28,"KCM94EMR7BJ");
INSERT INTO `doctor` (`id`,`college`,`dob`,`first_Name`,`last_Name`,`speciality`,`mobile`,`email_Id`,`highest_Qualification`,`rating`,`total_Years_Of_Exp`,`pan`) VALUES ("UUID-41","Risus A Incorporated","2022-02-01","Maxwell","Underwood","GASTRO","16260907 9104","Duis@Aliquamrutrum.net","MDS",1,48,"EJB58THT7IW"),("UUID-42","Maecenas Malesuada Limited","2020-11-07","Alexis","Rodriguez","CARDIOLOGIST","16021123 4984","nec@vestibulumnec.co.uk","BDS",5,21,"ZPA53CWC0FT"),("UUID-43","Malesuada Vel Incorporated","2021-06-07","Katelyn","Marks","GASTRO","16800624 8838","pede.Praesent@elementumpurus.ca","MDS",3,11,"LJH75HEW3BR"),("UUID-44","Cursus Et Magna Institute","2021-03-15","Charity","Cobb","DENTIST","16650815 2730","id.mollis@lobortisquis.ca","MBBS",1,35,"ZHS57JJC2TX"),("UUID-45","Arcu Limited","2021-06-02","Cadman","Garcia","DENTIST","16790923 8268","volutpat.ornare.facilisis@elit.net","MDS",5,48,"HNC73ARA1LF"),("UUID-46","Augue Malesuada Corporation","2021-03-21","Erica","Harrell","CARDIOLOGIST","16970117 9492","Donec@ipsumnuncid.edu","MBBS",4,19,"WGA82QMJ9CF"),("UUID-47","Tincidunt Consulting","2021-02-20","Phoebe","Weber","GASTRO","16511205 7970","dictum.eleifend.nunc@blanditviverra.net","MBBS",2,28,"KUK17APW6DH"),("UUID-48","Sit Amet Consectetuer Corp.","2022-05-13","Holmes","Hansen","CARDIOLOGIST","16170916 4626","lorem.vitae.odio@Suspendissealiquet.net","MBBS",5,41,"JXG01DCS3RE"),("UUID-49","Ultrices Sit Institute","2020-07-28","Tanner","Carpenter","GASTRO","16930206 4168","vel.nisl@arcuSed.ca","BDS",5,38,"GRV24SWP2LN"),("UUID-50","Nibh Sit Amet LLP","2020-08-25","Sacha","Ross","DENTIST","16141122 8552","ac.turpis@tempordiamdictum.co.uk","MBBS",2,32,"OXA30NTU3RX");
INSERT INTO `doctor` (`id`,`college`,`dob`,`first_Name`,`last_Name`,`speciality`,`mobile`,`email_Id`,`highest_Qualification`,`rating`,`total_Years_Of_Exp`,`pan`) VALUES ("UUID-51","A Corporation","2021-01-16","Kylie","Campos","DENTIST","16280505 6575","a.enim@pedeultricesa.org","MBBS",1,7,"BDS68TEB8HB"),("UUID-52","Donec Limited","2020-12-23","Jolie","Holloway","CARDIOLOGIST","16880729 8099","urna.Vivamus@nullaat.co.uk","MBBS",5,50,"UAT08PVG6JC"),("UUID-53","Ligula Aliquam Ltd","2021-01-22","Trevor","Scott","CARDIOLOGIST","16781219 0598","eleifend.nunc@ipsumprimis.co.uk","MDS",3,26,"TAV94XZO6SS"),("UUID-54","Id Mollis Nec Institute","2021-11-20","Griffith","Kirkland","GENERAL_PHYSICIAN","16990305 7538","ornare.In.faucibus@tortorInteger.org","BDS",3,4,"XTG67HUC4RV"),("UUID-55","Erat Vel Pede Corp.","2021-03-15","Xantha","Wyatt","ENT","16000629 6990","ipsum.Phasellus.vitae@nequeNullam.edu","MDS",4,45,"PYK87PQG7EJ"),("UUID-56","Scelerisque Mollis Phasellus Consulting","2020-12-17","Zeus","Marquez","PULMONOLOGIST","16170107 4237","urna.nec@Sed.ca","MBBS",2,5,"KGD46QXU8LB"),("UUID-57","Arcu Company","2022-02-21","Cyrus","Butler","GASTRO","16250627 5946","sodales@nec.ca","BDS",3,20,"KKC62DGA1PU"),("UUID-58","Mus Proin Vel Institute","2021-02-01","Sharon","Mcmahon","GASTRO","16240402 3802","bibendum@estmollis.co.uk","MDS",3,31,"JXG94UIO9OL"),("UUID-59","Semper Rutrum Fusce Consulting","2020-09-18","Joan","Dominguez","CARDIOLOGIST","16481206 0871","eleifend.egestas@velfaucibus.ca","MDS",1,12,"CGU58XTE9CN"),("UUID-60","Curabitur Consequat Lectus Company","2021-10-01","Gisela","Simpson","PULMONOLOGIST","16521217 6662","Mauris@acipsumPhasellus.net","MBBS",2,38,"UIA31TDY0FO");
INSERT INTO `doctor` (`id`,`college`,`dob`,`first_Name`,`last_Name`,`speciality`,`mobile`,`email_Id`,`highest_Qualification`,`rating`,`total_Years_Of_Exp`,`pan`) VALUES ("UUID-61","Suspendisse Eleifend Cras Industries","2021-04-10","Justin","Mcpherson","PULMONOLOGIST","16480714 1827","In@Donecfringilla.net","MBBS",4,43,"ONQ63AHH0JF"),("UUID-62","Quisque Corp.","2021-08-17","Zeph","Gonzales","DENTIST","16270328 4105","in@augueac.net","MDS",5,27,"KPT11FMZ5WB"),("UUID-63","Non Foundation","2021-11-15","Evan","Mcclure","GENERAL_PHYSICIAN","16480621 6430","est.Nunc@Vivamus.edu","MDS",1,23,"ISX52ARJ5UH"),("UUID-64","Non Corporation","2022-05-17","Anthony","Daniel","DENTIST","16611204 9496","mus.Donec.dignissim@Integervitae.net","BDS",4,4,"ZAJ41WDC3QS"),("UUID-65","Non Feugiat Ltd","2022-05-01","Genevieve","Gonzales","GASTRO","16650626 1582","Pellentesque.habitant@et.com","BDS",5,22,"SIP07KSM0XE"),("UUID-66","Lobortis Nisi Nibh Consulting","2021-06-14","Yoko","Frye","CARDIOLOGIST","16171104 2653","posuere@interdumNuncsollicitudin.co.uk","BDS",2,39,"XLV71TKK9GV"),("UUID-67","Facilisis Lorem Tristique LLP","2021-11-13","Ivan","Lynch","PULMONOLOGIST","16480401 6857","Mauris.vel@enim.com","MBBS",4,33,"SCN42DTU4LN"),("UUID-68","Senectus Et Netus Foundation","2021-03-20","Ira","Mcfadden","GASTRO","16540607 7247","nunc.risus.varius@blandit.com","BDS",3,30,"ZTS61OLC1EF"),("UUID-69","Sit Amet Ltd","2022-06-22","Brenna","Stuart","GENERAL_PHYSICIAN","16960811 6647","vulputate.ullamcorper@aliquamiaculis.com","BDS",3,29,"DGD74ZMH5ZJ"),("UUID-70","Neque Foundation","2020-10-22","Burton","Hodges","DENTIST","16861229 9340","molestie.dapibus.ligula@ipsumSuspendissenon.ca","MDS",4,40,"OFY73SLT7FI");
INSERT INTO `doctor` (`id`,`college`,`dob`,`first_Name`,`last_Name`,`speciality`,`mobile`,`email_Id`,`highest_Qualification`,`rating`,`total_Years_Of_Exp`,`pan`) VALUES ("UUID-71","A Auctor Non Incorporated","2021-01-26","Dai","Colon","PULMONOLOGIST","16870712 0161","varius.Nam@adipiscingelitAliquam.edu","BDS",1,13,"VME32CIZ6NI"),("UUID-72","Sodales Incorporated","2021-11-08","Kermit","Tillman","CARDIOLOGIST","16620614 0110","Pellentesque.habitant.morbi@feugiat.org","BDS",3,48,"NQE04AEA3MI"),("UUID-73","Vulputate Lacus Cras Company","2021-09-21","Karen","Turner","DENTIST","16391113 4058","tempus.non.lacinia@sed.com","MBBS",2,11,"DAE61XKV2AG"),("UUID-74","Fermentum Vel Mauris Institute","2022-02-08","Oscar","Barton","GENERAL_PHYSICIAN","16350321 6388","tellus.Suspendisse.sed@Sed.org","MDS",4,14,"USB46KPV5UG"),("UUID-75","Etiam Ligula Tortor Incorporated","2020-08-21","Lyle","Gibson","PULMONOLOGIST","16750520 0860","Cras@auctorvelit.edu","MBBS",3,37,"JLK87EBD6WF"),("UUID-76","Leo Morbi Neque LLC","2022-02-16","Colby","Mcleod","CARDIOLOGIST","16761007 7450","urna.suscipit@Phasellusornare.co.uk","MDS",2,8,"UQD20CZD6KW"),("UUID-77","Facilisis Lorem Tristique Foundation","2021-10-12","Iona","Strickland","DENTIST","16440416 9783","Praesent.luctus@arcuVestibulum.com","BDS",2,29,"NOA42ZEE5WR"),("UUID-78","Ullamcorper Magna Sed Industries","2020-09-11","Jamal","Sellers","ENT","16381212 4869","Suspendisse@MorbimetusVivamus.org","BDS",1,16,"FDE94QDX1FP"),("UUID-79","Ultricies Sem Magna LLC","2020-09-03","Scarlett","Rivers","GENERAL_PHYSICIAN","16300820 8591","molestie@tortor.com","BDS",4,7,"BCM48WSS8KM"),("UUID-80","Pede Consulting","2020-12-21","Ivor","Bell","ENT","16580620 6750","Mauris.vestibulum.neque@arcuSedet.co.uk","BDS",2,24,"DNX05SUJ6FT");
INSERT INTO `doctor` (`id`,`college`,`dob`,`first_Name`,`last_Name`,`speciality`,`mobile`,`email_Id`,`highest_Qualification`,`rating`,`total_Years_Of_Exp`,`pan`) VALUES ("UUID-81","Tellus Imperdiet Non Inc.","2020-11-18","Flavia","Whitfield","ENT","16900903 3052","vitae.purus.gravida@risusNulla.net","MDS",1,39,"MVH56IHV3PR"),("UUID-82","Gravida Mauris Ut Corp.","2021-04-17","Madonna","Schneider","ENT","16150526 6815","aliquam.arcu.Aliquam@auctorodioa.edu","MDS",2,33,"KYY97FKL5HT"),("UUID-83","Mollis Lectus Pede Corporation","2021-07-28","Ahmed","Guy","CARDIOLOGIST","16790626 5389","erat@nequepellentesque.co.uk","BDS",5,32,"JHE02GCY8FM"),("UUID-84","Mus Proin Institute","2020-10-05","Aileen","Becker","PULMONOLOGIST","16060427 4985","fringilla@eros.org","BDS",4,45,"GFU69RQD6QY"),("UUID-85","Massa Non Ante Corporation","2020-10-13","Shana","Baldwin","GASTRO","16930906 1068","vitae.diam@Vestibulumuteros.org","BDS",5,39,"OHV20XBB6LN"),("UUID-86","Ut LLP","2021-02-15","Byron","Sawyer","PULMONOLOGIST","16931126 2084","nisi.Aenean@egetvariusultrices.com","MBBS",2,44,"BTS78UQJ4XE"),("UUID-87","Malesuada Malesuada Integer LLP","2020-07-28","Pamela","Franklin","PULMONOLOGIST","16090809 4022","fermentum.arcu@placerat.edu","BDS",2,50,"MVA18COH6EO"),("UUID-88","Mattis Ornare Corp.","2021-03-24","Callum","Burch","GENERAL_PHYSICIAN","16781209 8478","dui.Cras.pellentesque@aliquameuaccumsan.org","MBBS",4,20,"KSJ73KZH5AA"),("UUID-89","Nullam LLC","2020-11-26","Zephania","Kinney","CARDIOLOGIST","16321017 3245","bibendum@dictumPhasellusin.net","MDS",2,24,"FDE65VEX1IK"),("UUID-90","Aliquam Adipiscing Incorporated","2021-01-15","Brandon","Stanley","GENERAL_PHYSICIAN","16201219 4383","convallis@et.com","MDS",5,28,"OWS40ZOL7YR");
INSERT INTO `doctor` (`id`,`college`,`dob`,`first_Name`,`last_Name`,`speciality`,`mobile`,`email_Id`,`highest_Qualification`,`rating`,`total_Years_Of_Exp`,`pan`) VALUES ("UUID-91","Pede Malesuada Vel Associates","2020-12-28","Zeph","Kelley","CARDIOLOGIST","16501201 1044","cursus.non@faucibus.org","MDS",5,22,"XGR58GZL2II"),("UUID-92","Ultricies Consulting","2022-04-11","Meghan","Carlson","ENT","16340328 5657","venenatis.a@quam.co.uk","MBBS",2,6,"HTC88IJY4QR"),("UUID-93","Nam Institute","2022-02-01","Davis","Gonzales","PULMONOLOGIST","16330912 5296","amet.risus@Praesenteu.org","BDS",2,5,"ERP75PXO9QO"),("UUID-94","Eu Company","2021-01-15","Ira","Tyson","GENERAL_PHYSICIAN","16830515 0222","Phasellus.at@euplacerat.edu","BDS",5,49,"OXZ94PZX9LY"),("UUID-95","Ultrices Sit Amet Corp.","2021-04-18","Alden","Franco","PULMONOLOGIST","16010426 4163","dapibus.quam.quis@lectus.org","MDS",1,2,"JCB17TSR0WQ"),("UUID-96","Eget Ipsum PC","2021-01-18","Rhonda","Levine","PULMONOLOGIST","16910417 6830","neque.Morbi@odioPhasellusat.net","MDS",1,40,"MOU96WGT2DS"),("UUID-97","Faucibus Associates","2021-03-28","Benedict","Trujillo","DENTIST","16450616 3072","nonummy@pedemalesuada.edu","BDS",1,31,"SKH76UQG2VP"),("UUID-98","Malesuada Company","2021-07-04","Jackson","Shaw","GASTRO","16781218 7867","eget.varius.ultrices@inlobortis.net","MDS",2,43,"WSS50UYH3ZX"),("UUID-99","Dignissim Tempor Associates","2022-06-22","Calvin","Ruiz","PULMONOLOGIST","16600310 6801","tristique.senectus@vestibulummassarutrum.org","BDS",2,22,"LUR08YNM0GZ"),("UUID-100","Molestie In Corp.","2020-12-26","Chiquita","Hernandez","PULMONOLOGIST","16830419 0674","non.lacinia.at@nisi.net","MBBS",3,45,"EYX49MAS3MP");


INSERT INTO `address` (`id`,`address_Line1`,`address_Line2`,`city`,`state`,`postcode`) VALUES ("UUID-1","P.O. Box 494, 5698 Felis. Ave","-12.24821, 86.15196","Vienna","Wie","80066"),("UUID-2","103-4867 Nullam Ave","-45.85534, 146.33318","Patalillo","San José","L2S 2T0"),("UUID-3","Ap #759-8196 At St.","-49.58494, 121.5553","Ránquil","VII","97424"),("UUID-4","Ap #953-7851 Dolor St.","-64.94051, 149.44884","Delicias","Chihuahua","3048"),("UUID-5","P.O. Box 751, 6657 Imperdiet Street","-75.1136, 127.11311","Desamparados","SJ","1614 HF"),("UUID-6","P.O. Box 486, 2790 Non, St.","9.55374, 97.73643","Galway","Connacht","23350-536"),("UUID-7","P.O. Box 241, 9380 Felis Av.","58.64052, -127.43642","Panketal","Brandenburg","13961-260"),("UUID-8","Ap #407-6217 Ullamcorper. Street","26.44977, 103.31945","Crawley","Sussex","638125"),("UUID-9","2910 Consequat St.","41.18222, 145.58182","Apartadó","Antioquia","6201"),("UUID-10","3578 Nisl Street","80.86218, 49.58877","Cork","Munster","67297");
INSERT INTO `address` (`id`,`address_Line1`,`address_Line2`,`city`,`state`,`postcode`) VALUES ("UUID-11","P.O. Box 771, 4467 Id Avenue","-79.27567, 36.24963","Bello","Antioquia","33457"),("UUID-12","5865 Purus St.","-58.41035, -68.5989","Gresham","Oregon","817559"),("UUID-13","665-7419 Sit Street","-52.90714, 61.48712","Alhué","RM","RB4 7PG"),("UUID-14","P.O. Box 860, 9270 Lacus. Street","16.44007, 25.97876","Cork","M","29966"),("UUID-15","512-2479 Sit Rd.","52.92, -1.72489","Cartagena","Bolívar","45763"),("UUID-16","Ap #675-9844 Ac St.","35.98661, 132.71938","Muzaffarpur","Bihar","99585"),("UUID-17","5900 Neque Street","18.22648, -156.96882","Sagamu","Ogun","208985"),("UUID-18","4089 Consectetuer Rd.","29.17934, 67.56259","Wrocław","Dolnośląskie","9448"),("UUID-19","P.O. Box 210, 8076 Mi. St.","-23.39101, -148.43591","Milmort","Luik","6624"),("UUID-20","378-2605 Morbi Rd.","15.55024, 16.32272","Kirov","KIR","6892");
INSERT INTO `address` (`id`,`address_Line1`,`address_Line2`,`city`,`state`,`postcode`) VALUES ("UUID-21","Ap #234-838 Vestibulum St.","2.33969, -140.42432","Cap-Rouge","QC","41858"),("UUID-22","Ap #427-919 Risus. Ave","43.76449, -110.65906","Novosibirsk","NVS","633706"),("UUID-23","Ap #343-9367 Convallis Avenue","68.0304, 39.08487","Pyeongtaek","Gyeonggi","9165"),("UUID-24","4137 Arcu. Street","13.16383, -146.36","Shreveport","LA","92-504"),("UUID-25","7310 Leo. Ave","-73.05154, -88.83974","Serang","BT","92364"),("UUID-26","7819 Massa. Avenue","32.64201, -84.05834","Bekasi","West Java","30419"),("UUID-27","Ap #762-9834 Tempus Rd.","53.87798, 78.63467","Levallois-Perret","IL","UM9 5SS"),("UUID-28","Ap #292-4197 Proin Rd.","-18.9192, 79.43402","Magadan","MAG","33618"),("UUID-29","Ap #292-6263 A, Street","68.74778, -71.016","Nadrin","LX","11725"),("UUID-30","746-888 Ut Avenue","-87.19466, -81.38577","Kalyan","Maharastra","00951");
INSERT INTO `address` (`id`,`address_Line1`,`address_Line2`,`city`,`state`,`postcode`) VALUES ("UUID-31","Ap #124-7625 Cursus. Rd.","22.60963, -32.67752","Burns Lake","British Columbia","983742"),("UUID-32","Ap #641-5269 Nisi. Avenue","-37.04397, 77.07521","Berlin","Berlin","16695"),("UUID-33","Ap #168-1923 Massa Ave","-71.31029, -19.37075","Vienna","Vienna","Z1622"),("UUID-34","P.O. Box 985, 6300 Odio. Road","57.40999, -121.87884","Oud-Turnhout","Antwerpen","3514"),("UUID-35","P.O. Box 622, 8043 Lobortis Ave","-69.93969, -6.76355","Buckingham","Quebec","51859"),("UUID-36","486-4766 Lacinia Avenue","-73.45229, 126.99075","Itagüí","Antioquia","890675"),("UUID-37","Ap #256-8501 Id, Rd.","49.0933, 122.50113","Chicago","Illinois","23384"),("UUID-38","7709 Non, Av.","-62.15099, 112.68038","Vienna","Wie","983253"),("UUID-39","Ap #711-810 Pharetra, St.","-84.02932, 2.18434","Coquimbo","IV","01-753"),("UUID-40","9913 Amet, Ave","-33.89613, 175.93613","Rotorua","North Island","441556");
INSERT INTO `address` (`id`,`address_Line1`,`address_Line2`,`city`,`state`,`postcode`) VALUES ("UUID-41","9580 Et Rd.","85.64998, 78.45408","Chimay","Henegouwen","70704"),("UUID-42","P.O. Box 120, 1291 Non St.","46.75055, 83.74275","Avignon","PR","49083"),("UUID-43","204 Nunc, Ave","80.44971, -76.4067","Bandar Lampung","Lampung","1976"),("UUID-44","P.O. Box 916, 8781 Nulla St.","67.0157, -28.50123","Battagram","Khyber Pakhtoonkhwa","18722"),("UUID-45","2341 Metus Rd.","-21.16956, -168.01797","Gullegem","WV","41303"),("UUID-46","4767 Aenean St.","-50.52455, -134.59285","Tambov","Tambov Oblast","453248"),("UUID-47","1458 Eu, Rd.","73.11485, 37.95259","Cannes","PR","63302"),("UUID-48","7662 Dolor St.","34.31709, -16.75835","Belo Horizonte","MG","367962"),("UUID-49","271-823 A, Road","81.87556, -162.06552","Nicoya","G","820346"),("UUID-50","9323 Sem St.","-2.0589, -70.61304","Barddhaman","West Bengal","518138");
INSERT INTO `address` (`id`,`address_Line1`,`address_Line2`,`city`,`state`,`postcode`) VALUES ("UUID-51","6412 Id Av.","89.82019, -33.51612","Vejano","Lazio","Z8090"),("UUID-52","Ap #685-6922 Rutrum Avenue","11.94224, -0.45829","Westport","SI","2196"),("UUID-53","262-4587 Curabitur Avenue","4.6771, -120.14537","Gorzów Wielkopolski","LB","7903"),("UUID-54","P.O. Box 617, 2246 Adipiscing Street","88.16283, -135.78422","Pukekohe","NI","17332"),("UUID-55","Ap #149-8363 Tincidunt St.","-60.38583, -46.39971","San Vicente de Cañete","Lima","357660"),("UUID-56","P.O. Box 998, 2091 Accumsan Street","-76.54918, 155.94306","Istanbul","Istanbul","798025"),("UUID-57","Ap #760-5204 Auctor, Rd.","-24.70913, 166.56532","Beauvais","Picardie","227290"),("UUID-58","533-5323 Vel Street","-15.3186, -120.1195","Mazatlán","Sinaloa","5471 UL"),("UUID-59","8967 Metus Road","23.37389, -172.61022","Napier","NI","673528"),("UUID-60","711-1155 At Avenue","9.16257, -8.66292","Morolo","LAZ","X1B 0X9");
INSERT INTO `address` (`id`,`address_Line1`,`address_Line2`,`city`,`state`,`postcode`) VALUES ("UUID-61","P.O. Box 105, 6108 Luctus Rd.","-26.90959, -63.67697","Sens","Bourgogne","60109"),("UUID-62","2017 Ipsum Road","67.77552, 44.09892","Albury","New South Wales","53-132"),("UUID-63","8758 Facilisis Rd.","-85.08433, 152.14611","Göteborg","O","736239"),("UUID-64","543 Nunc Rd.","-17.68263, 21.29672","Belo Horizonte","MG","E4J 8L4"),("UUID-65","280 Est, Avenue","-69.16321, -119.20171","Ongole","Andhra Pradesh","S4 8BK"),("UUID-66","886-7217 Sit Rd.","43.98886, -28.5105","Suarlee","NA","6887 SV"),("UUID-67","Ap #271-2213 Laoreet St.","-83.25287, -90.06066","Yamuna Nagar","Haryana","T2G 9A4"),("UUID-68","4013 Vehicula St.","-36.7276, -26.25412","Etobicoke","ON","08545-89713"),("UUID-69","Ap #777-8502 Neque. St.","47.60377, -132.01811","Palagianello","PUG","558333"),("UUID-70","2587 Integer Rd.","77.88744, 25.58494","Goes","Zl","56290");
INSERT INTO `address` (`id`,`address_Line1`,`address_Line2`,`city`,`state`,`postcode`) VALUES ("UUID-71","Ap #816-1740 Eu Av.","58.53452, 121.29411","Henderson","NV","3342"),("UUID-72","518-5154 Magna Av.","-77.38097, -105.10324","Palmerston North","North Island","20415"),("UUID-73","P.O. Box 213, 7104 Vestibulum Avenue","-39.1968, 121.17034","Ottawa","ON","Z5709"),("UUID-74","Ap #859-4933 Dapibus Rd.","10.10014, 35.00191","Bollnäs","X","39853"),("UUID-75","Ap #518-5083 Ullamcorper Avenue","-69.54127, 63.78212","Istanbul","Ist","J5N 8X3"),("UUID-76","Ap #493-5117 Nibh. Avenue","-26.49574, -97.43467","Owerri","Imo","68422-73915"),("UUID-77","830-9930 Egestas Rd.","-18.25957, -125.22821","Cisano Bergamasco","Lombardia","8617"),("UUID-78","Ap #399-2511 Tempus Avenue","-82.81426, -19.49933","Vologda","Vologda Oblast","18620"),("UUID-79","962-9396 Enim Rd.","-75.47409, -67.31862","Mogi das Cruzes","São Paulo","4247"),("UUID-80","Ap #125-4439 In Street","83.39168, 93.03198","Chiclayo","LAM","61545-110");
INSERT INTO `address` (`id`,`address_Line1`,`address_Line2`,`city`,`state`,`postcode`) VALUES ("UUID-81","556-8874 Nec, Rd.","-36.43374, 36.21515","Fort Smith","AR","73684"),("UUID-82","P.O. Box 203, 6408 Arcu St.","32.10628, 6.465","Palembang","SS","01506"),("UUID-83","Ap #784-7638 Quam Av.","37.8144, 39.13138","Çermik","Diy","DY2V 1OK"),("UUID-84","P.O. Box 238, 916 Velit. Street","-5.5317, -89.97669","Lleida","Catalunya","321034"),("UUID-85","182-3702 At, Rd.","-35.22562, -171.10507","Cartagena","Bolívar","434953"),("UUID-86","P.O. Box 816, 7682 Sed, Road","49.45098, 64.38045","Warri","DE","6308"),("UUID-87","Ap #292-2259 Donec Road","-42.84345, -56.39187","Khairpur","Punjab","142549"),("UUID-88","602-9130 Magna. Ave","53.09232, -99.98488","Lo Prado","RM","RL5 5QC"),("UUID-89","309-5462 Ullamcorper, Ave","15.70422, 131.03439","Sechura","PIU","7577"),("UUID-90","P.O. Box 790, 2511 Per Av.","-87.21455, 118.61338","Hafizabad","Punjab","572473");
INSERT INTO `address` (`id`,`address_Line1`,`address_Line2`,`city`,`state`,`postcode`) VALUES ("UUID-91","Ap #156-4629 Sit St.","80.76402, 51.24831","Vienna","Vienna","78238"),("UUID-92","P.O. Box 352, 6053 At, Ave","-58.0673, 52.99224","Gwangju","Gye","2088"),("UUID-93","2790 Cursus Rd.","-82.34946, -144.92295","Timaru","SI","893692"),("UUID-94","Ap #431-8311 Pede Street","-42.32868, -69.39806","Pabianice","LD","95937"),("UUID-95","562-7646 Magna Road","-87.84873, -11.11033","Brandon","Manitoba","11654-69638"),("UUID-96","2854 Nullam Ave","26.18882, -131.70011","Utrecht","U.","53930"),("UUID-97","P.O. Box 935, 4533 Tellus Street","13.51632, 149.55655","Tulsa","OK","40804"),("UUID-98","P.O. Box 657, 356 Amet Avenue","2.35202, 18.74333","Berlin","BE","49395"),("UUID-99","P.O. Box 382, 6353 Sed Ave","-65.60873, -106.07911","Mataró","Catalunya","376688"),("UUID-100","8068 Pulvinar Rd.","4.15097, -72.68161","Murree","PU","88570-68315");

