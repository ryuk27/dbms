CREATE PROCEDURE CheckPrimeComposite(@Number INT)
AS
BEGIN
DECLARE @IsPrime BIT;
SET @IsPrime = 1;

IF @Number <= 1
BEGIN
SET @IsPrime = 0;
END
ELSE
BEGIN
DECLARE @Divisor INT;
SET @Divisor = 2;

WHILE @Divisor <= SQRT(@Number)
BEGIN
IF @Number % @Divisor = 0
BEGIN
SET @IsPrime = 0;
BREAK;
END
SET @Divisor = @Divisor + 1;
END
END

IF @IsPrime = 1
PRINT 'the number ' + CAST(@Number AS VARCHAR) + ' is prime.';
ELSE
PRINT 'the number ' + CAST(@Number AS VARCHAR) + ' is composite.';
END

EXEC CheckPrimeComposite 17;
