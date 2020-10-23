-- Zad 7 - 1 wariant
SET SERVEROUTPUT ON;

DECLARE
stud STUDENT%ROWTYPE;
CURSOR kur IS
SELECT* FROM STUDENT;
BEGIN
OPEN kur;
LOOP
FETCH kur INTO stud;
EXIT WHEN kur%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('Id: ' || stud.ID_STUDENT || ' ' || 'Imie: ' || stud.IMIE || ' ' || 'Nazwisko: ' || stud.NAZWISKO);
END LOOP;
CLOSE kur;
END;

-- Zad 7 - 2 wariant
DECLARE
CURSOR kur IS
SELECT ID_STUDENT, IMIE, NAZWISKO FROM STUDENT;
TYPE stud IS RECORD(
id STUDENT.ID_STUDENT%TYPE,
imie STUDENT.IMIE%TYPE,
nazwisko STUDENT.NAZWISKO%TYPE
);
st stud;
BEGIN
FOR licznik IN kur LOOP
st.id := licznik.ID_STUDENT;
st.imie := licznik.IMIE;
st.nazwisko := licznik.NAZWISKO;
DBMS_OUTPUT.PUT_LINE('Id: ' || st.id || ' ' || 'Imie: ' || st.imie || ' ' || 'Nazwisko: ' || st.nazwisko);
END LOOP;
END;

-- Zad 9 -- 
DECLARE
BEGIN
FOR licznik IN (SELECT* FROM STUDENT) LOOP
DBMS_OUTPUT.PUT_LINE('Id: ' || licznik.ID_STUDENT || ' ' || 'Imie: ' || licznik.IMIE || ' ' || 'Nazwisko: ' || licznik.NAZWISKO);
END LOOP;
END;


-- Zad 6
DECLARE
CURSOR kur IS
SELECT zaj.ID_PRZEDMIOT, count(zaj.ID_PRZEDMIOT) as liczba FROM ZAJECIA zaj
INNER JOIN PRZEDMIOT p ON zaj.ID_PRZEDMIOT = p.ID_PRZEDMIOT
INNER JOIN WYKLADOWCA wyk ON zaj.ID_WYKLADOWCA = wyk.ID_WYKLADOWCA
GROUP BY zaj.ID_PRZEDMIOT;
BEGIN
FOR licznik IN kur LOOP
DBMS_OUTPUT.PUT_LINE('Imie: ' || licznik.IMIE || ' ' || 'Nazwisko: ' || licznik.NAZWISKO || ' ' || 'Liczba przedmiotow: ' || licznik.liczba);
END LOOP;
END;


-- Zad 11
DECLARE
CURSOR kur(id STUDENT.ID_STUDENT%TYPE) IS 
SELECT oc.* FROM OCENA oc
INNER JOIN STUDENT stud ON oc.ID_STUDENT = stud.ID_STUDENT
WHERE stud.ID_STUDENT = id
FOR UPDATE;
oc OCENA.OCENA%TYPE;
BEGIN
FOR licznik IN kur(21) LOOP
UPDATE OCENA SET OCENA = OCENA + 1 WHERE ID_OCENA = licznik.ID_OCENA
RETURNING OCENA INTO oc;
DBMS_OUTPUT.PUT_LINE('Ocena: ' || oc);
END LOOP;
END;

select * from ocena where ID_STUDENT = 21





