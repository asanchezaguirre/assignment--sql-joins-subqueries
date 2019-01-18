/*Sprint 1
Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.*/
SELECT FirstName, LastName, CustomerId, Country FROM Customer WHERE Country != "USA";

/*Provide a query only showing the Customers from Brazil.*/
SELECT FirstName, LastName FROM Customer WHERE Country = "Brazil";

#Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT 
C.FirstName,
C.LastName,
I.InvoiceId,
I.InvoiceDate,
I.BillingCountry
FROM Customer C 
INNER JOIN Invoice I
ON I.CustomerId = C.CustomerId
WHERE I.BillingCountry="Brazil";

#Provide a query showing only the Employees who are Sales Agents. 
SELECT * FROM Employee WHERE Title = 'Sales Support Agent';

#Provide a query showing a unique/distinct list of billing countries from the Invoice table.
SELECT DISTINCT(BillingCountry) FROM Invoice;


#Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
SELECT 
I.InvoiceId,
E.FirstName,
E.LastName 
FROM Invoice I
INNER JOIN Customer C
ON I.CustomerId = C.CustomerId
INNER JOIN Employee E
ON C.SupportRepId = E.EmployeeId
WHERE E.Title = "Sales Support Agent"
ORDER BY I.InvoiceId;


#Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
SELECT 
I.InvoiceId,
I.Total, 
E.FirstName,
C.Country, 
C.FirstName 
FROM Invoice I
INNER JOIN Customer C
ON I.CustomerId = C.CustomerId
INNER JOIN Employee E
ON C.SupportRepId = E.EmployeeId
ORDER BY I.InvoiceId;


#How many Invoices were there in 2009 and 2011?



#What are the respective total sales for each of those years?



#Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
SELECT COUNT(*) FROM InvoiceLine WHERE InvoiceId = 37;

#Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice.
SELECT InvoiceId, COUNT(*) FROM InvoiceLine GROUP BY InvoiceId;

#Provide a query that includes the purchased track name with each invoice line item.
SELECT 
I.InvoiceLineId, 
T.Name 
FROM InvoiceLine I
INNER JOIN Track T
ON I.TrackId = T.TrackId
ORDER BY I.InvoiceLineId;

#Provide a query that includes the purchased track name AND artist name with each invoice line item.
SELECT 
I.InvoiceLineId,
T.Name,
AT.Name 
FROM InvoiceLine I
INNER JOIN TRACK T
ON I.TrackId = T.TrackId
INNER JOIN Album AL
ON T.AlbumId = AL.AlbumId
INNER JOIN Artist AT
ON AL.ArtistId = AT.ArtistId
ORDER BY I.InvoiceLineId;

#Provide a query that shows the # of invoices per country.
SELECT BillingCountry, COUNT(*) FROM Invoice GROUP BY BillingCountry;

#Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resultant table.
SELECT 
PT.PlaylistId,
PL.Name,
COUNT(*) AS "Total Tracks"
FROM PlaylistTrack PT
INNER JOIN Playlist PL
ON PT.PlaylistId = PL.PlaylistId
GROUP BY PT.PlaylistId;

#Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.
SELECT 
T.Name, 
AL.Title, 
MT.Name,  
G.Name 
FROM Track T
INNER JOIN Album AL
ON T.AlbumId = AL.AlbumId
INNER JOIN MediaType MT
ON T.MediaTypeId = MT.MediaTypeId
INNER JOIN Genre G
ON T.GenreId = G.GenreId;

#Provide a query that shows all Invoices but includes the # of invoice line items.
SELECT InvoiceId, COUNT(*) FROM InvoiceLine GROUP BY InvoiceId;

#Provide a query that shows total sales made by each sales agent.

#Which sales agent made the most in sales in 2009?


#Which sales agent made the most in sales over all?


#Provide a query that shows the count of customers assigned to each sales agent.
SELECT COUNT(*) AS "Customers by SA", 
E.FirstName 
FROM Customer C
INNER JOIN Employee E
ON C.SupportRepId = E.EmployeeId 
GROUP BY SupportRepId;

#Provide a query that shows the total sales per country.


#Which country's customers spent the most?
SELECT
BillingCountry, SUM(TOTAL) AS "Total Sales"
FROM Invoice
GROUP BY BillingCountry
ORDER BY "Total Sales" DESC
LIMIT 1;

#Provide a query that shows the most purchased track of 2013.
SELECT 
IL.TrackId,
T.Name AS "Song",
SUM(IL.UnitPrice) AS Total 
FROM InvoiceLine IL
INNER JOIN Invoice I
ON IL.InvoiceId = I.InvoiceId
INNER JOIN Track T
ON IL.TrackId = T.TrackId
GROUP BY IL.TrackId
ORDER BY Total DESC
LIMIT 5;

#Provide a query that shows the top 5 most purchased tracks over all.
#Provide a query that shows the top 3 best selling artists.
#Provide a query that shows the most purchased Media Type.
SELECT COUNT(IL.TrackId),
MT.Name 
FROM InvoiceLine IL
INNER JOIN Track T 
ON IL.TrackId = T.TrackId
INNER JOIN MediaType MT
ON T.MediaTypeId = MT.MediaTypeId
GROUP BY MT.Name
ORDER BY "Total Songs Sold" DESC
LIMIT 1;

#Sprint 2

#Get all invoices where the UnitPrice on the InvoiceLine is greater than $0.99.
SELECT * FROM Invoice I
INNER JOIN InvoiceLine IL
WHERE IL.UnitPrice > 0.99;

#Get the InvoiceDate, customer FirstName and LastName, and Total from all invoices.
SELECT 
DATE(I.InvoiceDate),
C.LastName,
C.FirstName,
I.Total
FROM Invoice I
INNER JOIN Customer C
ON I.CustomerId = C.CustomerId;

#Get the customer FirstName and LastName and the support rep's FirstName and LastName from all customers.


#Support reps are on the Employee table.


#Get the album Title and the artist Name from all albums.
SELECT 
AL.Title,
AR.Name 
FROM ALBUM AL 
INNER JOIN Artist AR 
ON AL.ArtistId = AR.ArtistId

#Get all PlaylistTrack TrackIds where the playlist Name is Music.
#Get all Track Names for PlaylistId 5.
#Get all Track Names and the playlist Name that they're on.
#Get all Track Names and Album Titles that are the genre "Alternative".