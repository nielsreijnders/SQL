ALTER PROCEDURE spTracks @artist varchar(30)
AS
SELECT *
FROM track
WHERE artists = @artist
GO

EXEC spTracks @artist = 'Bruno Mars'