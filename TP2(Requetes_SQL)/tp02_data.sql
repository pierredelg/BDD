COPY avion (ano, type, places, compagnie) FROM stdin;
1	A310	200	Air France
2	B727	230	Air France
3	A350	300	Air Liberte
4	B727	230	Corsair
5	A330	250	Corsair
6	B747	200	Sabena
7	Caravelle	100	Air France
8	Caravelle	100	Air Liberte
\.



COPY ligne (lno, depart, arrivee) FROM stdin;
1	Lille	Paris
2	Paris	Lille
3	Paris	Marseille
4	Marseille	Paris
5	Marseille	Lyon
6	Lyon	Marseille
7	Paris	Lyon
8	Lyon	Paris
9	Paris	Nice
10	Paris	Brest
11	Brest	Paris
12	Lille	Nice
13	Nice	Lille
14	Lyon	Brest
15	Brest	Lyon
16	Lyon	Nice
17	Nice	Lyon
\.


COPY pilote (pno, nom, prenom, adresse) FROM stdin;
1	Baert	Alexandre	Boeseghem
2	Barhoune	Rachid	Grenay
3	Becue	Grégory	Wingles
4	Brunoir	Corinne	Boos
5	Cardon	Matthieu	Lomme
6	Cramet	Benjamin	Brie Comte Robert
7	Darcourt	Franck	Coudekerque
8	Dehurtevent	François	Achicourt
9	Florte	Jeremy	Tourcoing
10	Forciniti	Tony	Saint pol sur mer
11	Fourmault	Guillaume	Wattrelos
12	Hetru	Mathieu	Lesquin
13	Hoofd	Guillaume	Dunkerque
14	Jezequel	Sylvain	Plouha
15	Masquelier	Guillaume	Bachy
16	Moullet	Jean-Yves	Villeneuve d'ascq
17	Nuttin	Michaël	Bray Dunes
18	Simonet	Gregory	Tours
19	Vincent	Marc	Blairville
20	Wabinski	Martine	Lille
21	Belyahiaoui	Abd Al Aziz	Lille
22	Wandrebeck	Laurent	Dunkerque
\.


COPY vol (ano, pno, lno, hdep, harr) FROM stdin;
1	2	7	12:00:00	13:00:00
2	1	16	16:00:00	17:30:00
2	2	6	17:00:00	18:00:00
3	1	1	08:30:00	09:00:00
3	1	7	11:00:00	12:00:00
5	1	13	19:00:00	20:30:00
5	3	14	21:00:00	22:00:00
5	3	15	10:30:00	11:00:00
7	2	4	09:00:00	10:00:00
\.
