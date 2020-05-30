/*Phoenix_Market_City*/

INSERT INTO EMPLOYEE values ( 1 , 'Joy'    , 10000 , '03-05-2003' );
INSERT INTO EMPLOYEE values ( 2 , 'Pranav' , 20000 , '03-04-1973' );
INSERT INTO EMPLOYEE values ( 3 , 'Aman'  , 30000 , '23-05-1943' );
INSERT INTO EMPLOYEE values ( 4 , 'Shyam' , 40000 , '01-06-1950' );
INSERT INTO EMPLOYEE values ( 5 , 'Satya'  , 40070 , '01-06-1950' );
INSERT INTO EMPLOYEE values ( 6 , 'Atul'   , 34070 , '29-11-1967' );



INSERT INTO BRAND values ( 'Central'    , 9 , 20 , 2);
INSERT INTO BRAND values ( 'Big_Bazaar' , 7 , 20 , 1);



INSERT INTO WORKSFOR values ( 1 , 'Central'     ,23 );
INSERT INTO WORKSFOR values ( 2 , 'Big_Bazaar'  , 3 );
INSERT INTO WORKSFOR values ( 6 , 'Big_Bazaar'  , 12);
INSERT INTO WORKSFOR values ( 3 , 'Big_Bazaar'  ,4  );
INSERT INTO WORKSFOR values ( 4 , 'Central'     , 30);
INSERT INTO WORKSFOR values ( 5 , 'Central'     , 17);



INSERT INTO CITY values ( 1 , 'Mumbai' , 21000 ); 
INSERT INTO CITY values ( 2 , 'Delhi'    , 18000 ); 



INSERT INTO LOCALITY values ( 1 , 1 , 'Kurla_West' , 20  );



INSERT INTO MALL values ( 1 , 'Phoenix_Market_City' , 20000 , 3  );



INSERT INTO LOCATED_IN values ( 1, 1 );



INSERT INTO WORKSIN values ( 1 , 1  , 1);
INSERT INTO WORKSIN values ( 2 , 1  , 0);
INSERT INTO WORKSIN values ( 3 , 1  , 0);
INSERT INTO WORKSIN values ( 4 , 1  , 0);
INSERT INTO WORKSIN values ( 5 , 1  , 1);
INSERT INTO WORKSIN values ( 6 , 1  , 1);



INSERT INTO PRESENTIN values (1 , 'Central' );
INSERT INTO PRESENTIN values (1 , 'Big_Bazaar' );



INSERT INTO MANAGER values ( 1 , 'Ashok' , 10000   );



INSERT INTO MANAGES values ( 1 , 1  );



INSERT INTO MGR_CONTACT_NO values (1,5678800000);

/* R-City Mall, Ghatkopar West, Mumbai */

INSERT INTO EMPLOYEE values ( 1 , 'Jaya'    , 10009 , '03-05-2003' );
INSERT INTO EMPLOYEE values ( 2 , 'Pavan' , 15000 , '23-04-1973' );
INSERT INTO EMPLOYEE values ( 3 , 'Anji'  , 30000 , '25-05-1943' );
INSERT INTO EMPLOYEE values ( 4 , 'Shyam' , 45000 , '11-06-1950' );
INSERT INTO EMPLOYEE values ( 5 , 'Steve'  , 40071 , '21-06-1950' );
INSERT INTO EMPLOYEE values ( 6 , 'Tacko'   , 94070 , '29-10-1967' );



INSERT INTO BRAND values ( 'Adidas'    , 9 , 20 , 3);
INSERT INTO BRAND values ( 'Nike' , 7 , 20 , 1);



INSERT INTO WORKSFOR values ( 1 , 'Adidas'     ,23 );
INSERT INTO WORKSFOR values ( 2 , 'Nike'  , 3 );
INSERT INTO WORKSFOR values ( 6 , 'Nike'  , 12);
INSERT INTO WORKSFOR values ( 3 , 'Nike'  ,4  );
INSERT INTO WORKSFOR values ( 4 , 'Adidas'     , 30);
INSERT INTO WORKSFOR values ( 5 , 'Adidas'     , 17);



INSERT INTO LOCALITY values ( 2 , 1 , 'Ghatkopar_West' , 18  );



INSERT INTO MALL values ( 2 , 'R-City Mall' , 30000 , 3  );



INSERT INTO LOCATED_IN values ( 1, 2 );



INSERT INTO WORKSIN values ( 1 , 2  , 1);
INSERT INTO WORKSIN values ( 2 , 2  , 0);
INSERT INTO WORKSIN values ( 3 , 2  , 0);
INSERT INTO WORKSIN values ( 4 , 2  , 0);
INSERT INTO WORKSIN values ( 5 , 2  , 1);
INSERT INTO WORKSIN values ( 6 , 2  , 1);



INSERT INTO PRESENTIN values (1 , 'Adidas' );
INSERT INTO PRESENTIN values (1 , 'Nike' );



INSERT INTO MANAGER values ( 2 , 'Arsh' , 70000   );



INSERT INTO MANAGES values ( 2 , 2  );



INSERT INTO MGR_CONTACT_NO values (2,5678800089);

