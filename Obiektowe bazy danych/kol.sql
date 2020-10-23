-- Zad 1
DECLARE
proc NUMBER(5,4) := &procent
CURSOR ks IS 
SELECT * FROM KSIAZKI ks 
INNER JOIN AUTORZY au ON ks.id_autora = au.id_autora
INNER JOIN WYDAWNICTWO wyd ON wyd.id_wyd = ks.id_wyd
WHERE au.imie = 'Adam' AND au.nazwisko = 'Mickiewicz'
FOR UPDATE;
zmiana NUMBER(5,4);
cenaPo KSIAZKI.cena%TYPE;
cenaPrzed KSIAZKI.cena%TYPE;
BEGIN
zmiana := proc / 100;
FOR licznik IN ks LOOP
cenaPrzed = licznik.cena;
UPDATE KSIAZKI SET cena = (1 - zmiana) * cena WHERE CURRENT OF ks
RETURNING cena INTO cenaPo;
DBMS_OUTPUT.PUT_LINE();
END LOOP;
EXCEPTION
WHEN CASE_NO_FOUND THEN DBMS_OUTPUT.PUT_LINE('Case no found');
WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Wystapil jakis wyjatek');
END;

-- Zad 2
DECLARE
CURSOR aut IS
SELECT * FROM KSIAZKI ks
INNER JOIN AUTORZY aut ON ks.id_autora = aut.id_autora
INNER JOIN WYDAWNICTWO wyd ON ks.id_wyd = wyd.id_wyd
WHERE wyd.nazwa = 'WNT' AND ROWNUM = 1
GROUP BY aut.id_autora
autor AUTORZY%ROWTYPE;
BEGIN
FOR a IN aut LOOP

EXIT WHEN 
END LOOP:
END:


-- Zad 3
DECLARE
CURSOR kur IS 
SELECT wyd.nazwa, count(ks.id_ksiazki) FROM KSIAZKI ks 
INNER JOIN WYDAWNICTWO wyd ON ks.id_wyd = wyd.id_wyd;
GROUP BY wyd.Nazwa
HAVING COUNT(ks.id_ksiazki) > 0;
nazwaWydawnictwa WYDAWNICTWO.nazwa%TYPE;
liczba NUMBER(5);
BEGIN
OPEN kur;
LOOP
FETCH kur INTO nazwaWydawnictwa, liczba;
DBMS_OUTPUT.PUT_LINE('Wydawnictwo: ' || nazwaWYdawnictwa || ' ' || 'liczba: ' || liczba);
END LOOP;
CLOSE kur;
END;


-- Zad 4
DECLARE
CURSOR kur IS 
SELECT* FROM CZYTELNICY czyt 
INNER JOIN WYPOZYCZENIA wyp ON czyt.id_czytelnika = wyp.id_czytelnika
GROUP BY czyt.id_czytelnika
HAVING COUNT(wyp.id_wypozyczenia) > 0;
nazw CZYTELNICY.nazwisko%TYPE:
im CZYTELNICY.imie%TYPE;
pes CZYTELNICY.pesel%TYPE;
BEGIN
OPEN kur;
LOOP
FETCH kur INTO 
EXIT WHEN kur%NOTFOUND OR kur%ROWCOUNT >= 5
END LOOP;
CLOSE kur;
END:











