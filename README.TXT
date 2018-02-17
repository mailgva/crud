Инструкция:
1) git clone https://github.com/mailgva/crud
2) cd crud
3) В файле src\main\resources\application.properties указано следующее:
    spring.jpa.hibernate.ddl-auto=update
    если таблицы нет в базе, то он ее создаст, или изменит текущую.
    spring.datasource.initialize=true
    выполнение скрипта: src\main\resources\data.sql
3) mvn clean install
   сборка проекта
4) Вот тут непонятка, maven счиатет что в скипте
   src\main\resources\data.sql
   данные для поля description слишком большие, хотя они нормальные.
   Чтоб тестовые данные загрузились - запускал проект через Intellij Idea. Или после загрузки тестовых данных и изменения значения
   spring.datasource.initialize=true
   на
   spring.datasource.initialize=false
   можно запускать через:
   java -jar target\crud-0.0.1-SNAPSHOT.jar