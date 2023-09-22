-- abs 함수는 절댓값을 반환합니다. -15의 절댓값은 15입니다.
select abs(-15) from dual;

-- ceil 함수는 주어진 숫자를 올림합니다. 15.7을 올림하면 16이 됩니다.
select ceil(15.7) from dual;

-- cos 함수는 주어진 각도의 코사인 값을 반환합니다. 여기서는 원주율(π)의 코사인 값을 반환합니다.
select cos(3.141592) from dual;

-- floor 함수는 주어진 숫자를 내림합니다. 15.7을 내림하면 15가 됩니다.
select floor(15.7) from dual;

-- log 함수는 주어진 숫자를 주어진 밑(base)으로 로그를 취한 값을 반환합니다. 여기서는 100을 10을 밑으로 로그를 취한 값을 반환합니다.
select log(10,100) from dual;

-- mod 함수는 나머지를 반환합니다. 11을 4로 나눈 나머지는 3입니다.
select mod(11,4) from dual;

-- power 함수는 주어진 숫자를 주어진 지수로 제곱한 값을 반환합니다. 3^2는 9입니다.
select power(3,2) from dual;

-- round 함수는 주어진 숫자를 반올림합니다. 15.7을 반올림하면 16이 됩니다.
select round(15.7) from dual;

-- sign 함수는 숫자의 부호를 반환합니다. -15의 부호는 음수(-1)입니다.
select sign(-15) from dual;

-- trunc 함수는 주어진 숫자를 절사(소수 부분을 제거)합니다. 15.7을 절사하면 15가 됩니다.
select trunc(15.7) from dual;

-- chr 함수는 ASCII 코드를 기반으로 문자를 반환합니다. ASCII 코드 67은 대문자 'C'입니다.
select chr(67) from dual;

-- concat 함수는 문자열을 결합합니다. 'HAPPY'와 'Birthday'를 결합하면 'HAPPYBirthday'가 됩니다.
select concat('HAPPY','Birthday') from dual;

-- lower 함수는 문자열을 모두 소문자로 변환합니다. 'Birthday'를 소문자로 변환하면 'birthday'가 됩니다.
select lower('Birthday') from dual;

-- lpad 함수는 문자열을 주어진 길이만큼 왼쪽에 특정 문자로 채웁니다. 'Page 1'을 길이 15로 만들고 왼쪽에 '" '를 추가합니다.
select lpad('Page 1', 15, '" ') from dual;

-- ltrim 함수는 문자열의 왼쪽에서 주어진 문자를 제거합니다. 'Page 1'에서 'a'와 'e'를 제거하면 'P g 1'이 됩니다.
select ltrim('Page 1', 'ae') from dual;

-- replace 함수는 문자열에서 특정 문자나 문자열을 다른 문자나 문자열로 대체합니다. 'JACK'에서 'J'를 'BL'로 대체하면 'BLACK'이 됩니다.
select replace('JACK', 'J', 'BL') from dual;

-- rpad 함수는 문자열을 주어진 길이만큼 오른쪽에 특정 문자로 채웁니다. 'Page 1'을 길이 15로 만들고 오른쪽에 '" '를 추가합니다.
select rpad('Page 1', 15, '" ') from dual;

-- rtrim 함수는 문자열의 오른쪽에서 주어진 문자를 제거합니다. 'Page 1'에서 'a'와 'e'를 제거하면 'Pag 1'이 됩니다.
select rtrim('Page 1', 'ae') from dual;

-- substr 함수는 문자열에서 특정 위치부터 주어진 길이만큼의 부분 문자열을 추출합니다. 'ABCDEFG'에서 3번째 위치부터 길이 4인 부분 문자열을 추출하면 'CDEF'가 됩니다.
select substr('ABCDEFG', 3, 4) from dual;

-- trim 함수는 문자열의 양 끝에서 주어진 문자를 제거합니다. '00AA00'에서 앞쪽의 '0'을 제거하면 'AA00'이 됩니다.
select trim(LEADING '0' FROM '00AA00') from dual;

-- upper 함수는 문자열을 모두 대문자로 변환합니다. 'birthday'를 대문자로 변환하면 'BIRTHDAY'가 됩니다.
select upper('birthday') from dual;

-- ascii 함수는 문자의 ASCII 코드 값을 반환합니다. 'A'의 ASCII 코드 값은 65입니다.
select ascii('A') from dual;

-- instr 함수는 문자열에서 특정 부분 문자열의 위치를 찾습니다. 'CORPORATE FLOOR'에서 'OR'을 3번째 위치부터 두 번째로 찾으면 12가 됩니다.
select instr('CORPORATE FLOOR', 'OR', 3, 2) from dual;

-- length 함수는 문자열의 길이를 반환합니다. 'BIRTHDAY'의 길이는 8입니다.
select length('BIRTHDAY') from dual;

-- add_months 함수는 날짜에 월을 추가합니다. '14/05/21'에 1개월을 추가하면 '14/06/21'이 됩니다.
select add_months('14/05/21', 1) from dual;

-- last_day 함수는 주어진 날짜의 해당 월의 마지막 날짜를 반환합니다. 현재 날짜의 해당 월 마지막 날짜를 반환합니다.
select last_day(sysdate) from dual;

-- next_day 함수는 주어진 날짜 이후로 가장 가까운 특정 요일의 날짜를 반환합니다. 현재 날짜로부터 다음 화요일의 날짜를 반환합니다.
select next_day(sysdate, '화') from dual;

-- round 함수는 날짜를 가장 가까운 정수로 반올림합니다. 현재 날짜와 시간을 반올림한 값입니다.
select round(sysdate) from dual;

-- sysdate 함수는 현재 날짜와 시간을 반환합니다.
select sysdate from dual;

-- to_char 함수는 날짜를 문자열로 변환합니다. 현재 날짜와 시간을 문자열로 변환합니다.
select to_char(sysdate) from dual;

-- to_char 함수는 숫자를 문자열로 변환합니다. 123을 문자열 '123'으로 변환합니다.
select to_char(123) from dual;

-- to_date 함수는 문자열을 날짜로 변환합니다. '12 05 2014'를 'DD MM YYYY' 형식으로 해석하여 날짜로 변환합니다.
select to_date('12 05 2014', 'DD MM YYYY') from dual;

-- to_number 함수는 문자열을 숫자로 변환합니다. '12.3'을 숫자 12.3으로 변환합니다.
select to_number('12.3') from dual;

-- decode 함수는 조건에 따라 다른 값을 반환합니다. 1이 1과 같으므로 'aa'를 반환합니다.
select decode(1, 1, 'aa', 'bb') from dual;

-- nullif 함수는 두 값이 같으면 NULL을 반환하고, 다르면 첫 번째 값 반환합니다. 123과 345는 다르므로 123을 반환합니다.
select nullif(123, 345) from dual;

-- nvl 함수는 첫 번째 값이 NULL이면 두 번째 값으로 대체합니다. 첫 번째 값이 NULL이므로 123으로 대체됩니다.
select nvl(null, 123) from dual;
