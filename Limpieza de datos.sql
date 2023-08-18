
use tienda;
-- select * from DirtyTable;

-- insert into DirtyTable VALUES ('Pedro 1Gevara , 58, Jalisco'),('Jua78n Sandova1l,80,Colima'),('Karla Hinojosa, 71 , Jalisco'),
-- ('Luis Gonzales ,15, Colima');

-- CREATE TABLE CleanTable (
--     CustomerId int IDENTITY(1,1) PRIMARY KEY,
--     Name VARCHAR(100),
--     Age int,
--     Region VARCHAR(100)
-- );




DECLARE @i int = 0
DECLARE @count int = (select COUNT(DirtyId) from DirtyTable)
DECLARE @text varchar(2000)
DECLARE @TableToClean Table(Id int, Field varchar(2000))

DECLARE @Name VARCHAR(100)
DECLARE @Age VARCHAR(100)
DECLARE @Region VARCHAR(100)

DECLARE @NumberPattern VARCHAR(10) = '%[0-9]%'

WHILE @i < @count
    BEGIN

        set @text = (select Text from DirtyTable ORDER by DirtyId offset @i rows
                     fetch next 1 rows only)

        insert into @TableToClean(Id, Field) 
        SELECT ROW_NUMBER() OVER(ORDER by (SELECT 1)) as Id, value FROM string_split(TRIM(@text), ',')

        set @Name = (select top(1) Field from @TableToClean where Id = 1)
        set @Age = (select top(1) Field from @TableToClean where Id = 2)
        set @Region = (select top(1) Field from @TableToClean where Id = 3)

        set @Name = (select TRIM(REPLACE(REPLACE(REPLACE(@Name,' ','<>'), '><', ''), '<>', ' ')))

        WHILE PATINDEX(@NumberPattern, @Name) > 0
            BEGIN
                set @Name = STUFF(@Name, PATINDEX(@NumberPattern, @Name), 1, '')
            END

        SET @Age = TRIM(@Age)
        set @Region = TRIM(@Region)

        INSERT into CleanTable (Name, Age, Region) VALUES (@Name, @Age, @Region);

        DELETE from @TableToClean;

        SELECT @Name
        SELECT @Age
        SELECT @Region




        set @i = @i + 1
    END

    -- DELETE from CleanTable;