create database desafio_luis_sanchez_222
\C desafio_luis_sanchez_222

CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente
VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );


--1. ¿Cuántos registros hay?
select count(*) from inscritos;
--2. ¿Cuántos inscritos hay en total?
select sum(cantidad) from inscritos;
--3. ¿Cuál o cuáles son los registros de mayor antigüedad?
select * from inscritos where fecha = (select fecha from inscritos order by fecha limit 1);
--4. ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de
-- ahora en adelante)
select fecha, sum(cantidad) from inscritos GROUP by fecha;
--5. ¿Cuántos inscritos hay por fuente?
select fuente, sum(cantidad) from inscritos GROUP by fuente;
--6. ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se
-- inscribieron en ese día?
select fecha, sum(cantidad) from inscritos group by fecha order by sum(cantidad) desc limit 1;
--7. ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas
--8. personas fueron?
select fecha, sum(cantidad) from inscritos where fuente = 'Blog' group by fecha order by sum(cantidad) desc limit 1;
--9. ¿Cuántas personas en promedio se inscriben en un día?
select avg(totalcantidad) from (select fecha, sum(cantidad) as totalcantidad from inscritos group by fecha) as sumafecha;
--10. ¿Qué días se inscribieron más de 50 personas?
select fecha, sum(cantidad) from inscritos group by fecha having sum(cantidad)> 50;
--11. ¿Cuántas personas se registraron en promedio cada día a partir del tercer día?
select avg(totalcantidad) from (select fecha, sum(cantidad) as totalcantidad from inscritos group by fecha) as sumafecha where fecha >= '01/03/2021';


