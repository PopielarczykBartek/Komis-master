SET SERVEROUTPUT ON

-- Random
	
	name := &name_input;  			-- pobieranie z klawiatuyr
	greeting :=  'Czesc ' || name;	-- konkatenacja
	dbms_output.put_line(text);		-- wypisanie


-- Stałe
	DECLARE
	pii	 	CONSTANT NUMBER(5,4) := 3.1415;
	itsTrue CONSTANT BOOLEAN := TRUE
	
-- Zmienne
	DECLARE
	ocena NUMBER(6) NOT NULL	:= 5;
	nazwa VARCHAR2(100) 		:= 'ZAAWANSOWANE';
	dataa DATE DEFAULT DATE '2014-02-24';
	egzamin BOOLEAN NOT NULL DEFAULT TRUE;
	
-- Zmienne Rekordowe
	DECLARE
	TYPE DaneOsobowe IS RECORD (
		nazwisko 	VARCHAR2(25),
		imie 		VARCHAR2(20));
		
	osoba DaneOsobowe;
	BEGIN
	osoba.nazwisko := 'Iksiński';
	osoba.imie := 'Alfred';

-- Atrybuty
	
	marka 			samochody.marka%TYPE;
	dane_samochodu 	samochody%ROWTYPE;
	model v_marka%TYPE := 'Ford';
	
	
-- IF
	IF age > 17 THEN
		dbms_output.put_line('ok');
	ELSIF age > 14 AND age < 18
		dbms.output.put_line(':>');
	ELSE
		dbms.output.put_line('meh');

-- CASE
	proc := CASE vat
	WHEN 0 THEN '0%'
	WHEN 0.7 THEN '7%'
	WHEN 0.22 THEN '22%'
		
-- LOOP
	LOOP
		i := i + 1;
		dbms_output.put_line(to_char(licznik));
		EXIT WHEN i = 5;
	END LOOP;
	
	FOR i IN 1.. 5 LOOP
		dbms_output.put_line(to_char(licznik));
	END LOOP;
		
		

-- Zapytania PL/SQL

	SELECT p1.id_przedmiot
    INTO v_przedmiot
    FROM przedmiot p1
    JOIN zajecia z1 ON p1.id_przedmiot = z1.id_przedmiot
    JOIN ocena o1 ON z1.id_zajecia = o1.id_zajecia
    GROUP BY p1.id_przedmiot, p1.nazwa
    HAVING sum(o1.ocena) / count(o1.id_ocena) = 
    (   SELECT min( d.srednia)
        FROM
        (   SELECT p.id_przedmiot, p.nazwa,  sum(o.ocena) / count(o.id_ocena) AS srednia 
            FROM przedmiot p
            JOIN zajecia z ON p.id_przedmiot = z.id_przedmiot
            JOIN ocena o ON z.id_zajecia = o.id_zajecia
            GROUP BY p.id_przedmiot, p.nazwa
        ) d  
    );
	
	BEGIN
		INSERT INTO pracownicy (id_prac, imie, nazwisko) VALUES (100, 'Jan','Kowalski')
		RETURNING id_prac INTO id;
		dbms_output.put_line(to_char(id));
	END;
	
	DECLARE
		instytut instytuty%ROWTYPE;
	
	BEGIN
		instytut.id := 20;
		instytut.nazwa := 'INFORMATYKA';
		instytut.adres := 'PODCHORĄŻYCH 1';
		INSERT INTO instytuty VALUES instytut;
		instytut.nazwa := 'INFORMATYKA STOSOWANA';
		instytut.adres := 'WARSZAWSKA 24';
		UPDATE instytuty SET ROW = instytut WHERE id = 20;
	END;
	
	
-- Kursory

	W celu wykonania rozkazu SQL system tworzy pewien obszar roboczy nazywany przestrzenią kontekstu,
	a który możemy nazwać i odwoływać się do zawartych nim danych za pomocą kursorów.
	
	W jednym bloku kursor możemy otworzyć tylko raz.
	
	-- Deklaracja
		
		DECLARE
		CURSOR kursor IS
		SELECT * FROM jobs;
		
	-- Otwarcie
	
		BEGIN
		OPEN kursor.
	
	-- Dla 1 wiersza pobranego.
		DECLARE
		CURSOR kursor IS
		SELECT name FROM jobs WHERE id = 1;
		some_name varchar2(40);
		
		BEGIN
		OPEN kursor;
		FETCH kursor INTO some_name;
		CLOSE kursor;
		
		
	-- Dla x wierszy.
		DECLARE
		CURSOR kursor IS
		SELECT * FROM jobs WHERE id = 1;
		
		BEGIN
		FOR job IN kursor LOOP;
			dbms_output.put_line(to_char(job.id));
		END LOOP;
		CLOSE kursor;
		END;
		
	-- Atrybuty 
		ISOPEN 		– Zwraca „true” jeśli kursor jest otwarty i „false” jeśli kursor jest zamknięty.
		ROWCOUNT 	– Zwraca ilość wierszy które już zostały ściągnięte z kursora
		NOTFOUND 	– Służy najczęściej do sprawdzania czy w kursorze są jeszcze jakieś dane. Zwraca „true” jeśli komenda FETCH nie może pobrać kolejnego wiersza. Jeśli FETCH może pobierać dane dalej, zwraca „false”
		FOUND 		- Służy najczęściej do sprawdzania czy w kursorze są jeszcze jakieś dane. W przeciwieństwie do NOTFOUND zwraca „false” jeśli komenda FETCH nie może pobrać kolejnego wiersza. Jeśli FETCH może pobierać dane dalej, zwraca „true”
	
		BEGIN
		OPEN kursor;
		FETCH kursor INTO some_name;
		EXIT WHEN kursor%NOTFOUND;
		CLOSE kursor;
	
	-- Sparametryzowane
	
		DECLARE
			department NUMBER;
			
			CURSOR sparametryzowany1 IS
			SELECT * FROM employees WHERE department_id = department;
			
			CURSOR sparametryzowany2(id INT) IS
			SELECT * FROM employees WHERE department_id = id;
			
		BEGIN
			department := 90;
			OPEN sparametryzowany1;
			OPEN sparametryzowany2(90);
		END;
		
	-- FOR z kursorem
	
		DECLARE
			CURSOR cur_samochod(p_id_sam NUMBER) IS
			SELECT Id_sam, id_kli, data_wyp, data_zwr
			FROM wypozyczenia WHERE id_sam = p_id_sam;
		BEGIN
			FOR v_cur IN cur_samochod(100) LOOP
				dbms_output.put_line(to_char(cur_samochod%ROWCOUNT)	|| '. ' || v_cur.id_kli || ' ' || v_cur.id_sam	|| ' ' || v_cur.data_wyp || ' ' || v_cur.data_zwr);
			END LOOP;
		END;
		
	-- FOR z podzapytaniem
	
		DECLARE
			v_marka samochody.marka%TYPE := '&nazwa_marki';
		BEGIN
			dbms_output.put_line('Modele samochodu marki: ' || v_marka);
		FOR v_mod IN (SELECT model, nr_rej, poj_sil FROM samochody WHERE marka = v_marka) LOOP
			dbms_output.put_line(v_mod.model || ' ' || v_mod.nr_rej || 	v_mod.poj_sil);
		END LOOP;
		END;
		
	-- WHERE CONCURRENT OF
	
		DECLARE
			CURSOR cur_samochody(p_id_sam NUMBER) IS
			SELECT marka, koszt_dnia FROM samochody WHERE id_sam = p_id_sam	FOR UPDATE;
			zmiana NUMBER(4,1);
		BEGIN
			FOR marki IN cur_samochody(100) LOOP
				IF marki.marka = 'FORD' THEN zmiana := 1.5;
				ELSE zmiana := 1.1; 
				END IF;
				UPDATE samochody SET koszt_dnia = koszt_dnia * zmiana
				WHERE CURRENT OF cur_samochody;
			END LOOP;
		END;
		
	-- Kursor niejawny
	
	• Tworzony automatycznie dla poleceń INSERT, UPDATE, DELETE i SELECT INTO w programie PL/SQL
	• Otwierany bezpośrednio przed wykonaniem polecenia
	• Zamykany zaraz po wykonaniu polecenia
	• Nazwa kursora: SQL
	
	BEGIN
		DELETE FROM klienci WHERE kod_pocz is null;
		IF SQL%FOUND THEN
			dbms_output.put_line('Rekordy usuniete: ' || to_char(SQL%ROWCOUNT));
		ELSE
			dbms_output.put_line('Brak rekordów do usunięcia!');
		END IF;
		INSERT INTO klienci(id_kli, nazwisko) AS SELECT id_kli + 10, 'Iksinski ' || nazwisko FROM klienci;
			dbms_output.put_line('Dodanych rekordów: ' || to_char(SQL%ROWCOUNT));
	END;
	
	%FOUND 		TRUE jeśli polecenie odczytało lub zmodyfikowało chociaż jeden rekord
	%NOTFOUND	TRUE jeśli polecenie nie odczytało lub nie zmodyfikowało żadnego rekordu
	%ISOPEN		Zawsze FALSE
	%ROWCOUNT	Liczba rekordów odczytanych lub zmodyfikowanych przez polecenie
			
-- Wyjątki

	CASE_NOT_FOUND 			nie znaleziono pasującej klauzuli WHEN dla CASE
	CURSOR_ALREADY_OPEN 		próba otwarcia już otwartego kursora
	DUP_VAL_ON_INDEX 		powielenie wartości w atrybucie kluczem podst. lub unikalnym
	INVALID_CURSOR 			wykonanie zabronionej operacji na kursorze 
	NO_DATA_FOUND 			polecenie SELECT INTO nie zwróciło żadnego rekordu 
	TOO_MANY_ROWS 			polecenie SELECT INTO zwróciło więcej niż jeden rekord
	VALUE_ERROR 			błąd wykonania op. arytmetycznej, konwersji lub rozmiaru typu
	ZERO_DIVIDE 			dzielenie przez zero

	DECLARE
		v_model samochody.model%TYPE;
	BEGIN
		SELECT model INTO v_model
		FROM samochody WHERE marka = 'FORD';
		dbms_output.put_line(' Dla marki FORD mamy model: '||v_model);
		EXCEPTION
		WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('Brak modeli dla marki FORD');
		WHEN TOO_MANY_ROWS THEN
		dbms_output.put_line('Więcej niż jeden model dla marki FORD');
		WHEN OTHERS THEN
		dbms_output.put_line('Mamy jakiś inny błąd');
	END;
	
	-- Wywalenie na ekran blędu
	WHEN NO_DATA_FOUND THEN
	raise_application_error(-20001,'Nie wypożyczono modelu samochodu '|| v_model);
	
	-- Predefiniowane
	EXCEPTION
		WHEN tanie_samochody THEN UPDATE samochody SET koszt_dnia =
		koszt_dnia * 1.2 WHERE CURRENT OF cur_sam;
		WHEN drogie_samochody THEN UPDATE samochody SET koszt_dnia =
		koszt_dnia /1.2 WHERE CURRENT OF cur_sam;


	
	








