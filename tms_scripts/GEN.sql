
INSERT INTO SwimmingCompetitionsGroup2.People.Judge
SELECT DISTINCT  P.FirstName AS FirstName
,P.LastName AS LastName
,CONCAT('JDG',SUBSTRING(Ph.PhoneNumber,4,3),SUBSTRING(Ad.AddressLine1,4,4)) AS PassportNumber -- √≈Õ≈–»Ã ÕŒÃ≈– œ¿—œŒ–“¿ ƒÀﬂ  ¿∆ƒŒ√Œ —”ƒ‹»
,StP.CountryRegionCode AS Citizenship
,(CASE																	--¬€—“¿¬Àﬂ≈Ã  ¿“≈√Œ–»ﬁ —”ƒ‹»
  WHEN SUBSTRING(P.FirstName,4,1) BETWEEN 'A' AND 'G' THEN 'CMS'
  WHEN SUBSTRING(P.FirstName,4,1) BETWEEN 'H' AND 'T' THEN 'MS'
  WHEN SUBSTRING(P.FirstName,4,1) BETWEEN 'U' AND 'Z' THEN 'WMS' 
END
) AS 'Rank'														
FROM AdventureWorks2017.Person.Person P 
LEFT JOIN AdventureWorks2017.Person.BusinessEntityAddress BusAd ON P.BusinessEntityID = BusAd.BusinessEntityID
LEFT JOIN AdventureWorks2017.Person.Address Ad ON BusAd.AddressID = Ad.AddressID
LEFT JOIN AdventureWorks2017.Person.StateProvince StP ON StP.StateProvinceID = Ad.StateProvinceID
LEFT JOIN AdventureWorks2017.Person.CountryRegion Co ON Co.CountryRegionCode = StP.CountryRegionCode
LEFT JOIN AdventureWorks2017.Person.PersonPhone Ph on Ph.BusinessEntityID = BusAd.BusinessEntityID


GO


INSERT INTO SwimmingCompetitionsGroup2.People.Coach
SELECT DISTINCT P.FirstName AS FirstName
,P.LastName AS LastName
,CONCAT('CCH',SUBSTRING(Ph.PhoneNumber,2,2),SUBSTRING(Ad.AddressLine1,2,2)) AS PassportNumber -- √≈Õ≈–»Ã ÕŒÃ≈– œ¿—œŒ–“¿ ƒÀﬂ  ¿∆ƒŒ√Œ  Œ”◊¿
,StP.CountryRegionCode AS Citizenship
,(CASE																		--¬€—“¿¬Àﬂ≈Ã  ¿“≈√Œ–»ﬁ  Œ”◊¿
  WHEN SUBSTRING(P.FirstName,4,1) BETWEEN 'A' AND 'G' THEN 'CMS'
  WHEN SUBSTRING(P.FirstName,4,1) BETWEEN 'H' AND 'T' THEN 'MS'
  WHEN SUBSTRING(P.FirstName,4,1) BETWEEN 'U' AND 'Z' THEN 'WMS' 
END
) AS 'Rank'
, (CASE																		--¬€—“¿¬Àﬂ≈Ã  ¿“≈√Œ–»ﬁ  Œ”◊¿
  WHEN SUBSTRING(P.LastName,3,1) BETWEEN 'D' AND 'G' THEN 'Head coach'
  WHEN SUBSTRING(P.LastName,3,1) BETWEEN 'H' AND 'T' THEN 'Coach'
  WHEN SUBSTRING(P.LastName,3,1) BETWEEN 'U' AND 'Z' THEN 'Head coach assistant' 
END
) AS 'Type'
FROM AdventureWorks2017.Person.Person P 
LEFT JOIN AdventureWorks2017.Person.BusinessEntityAddress BusAd ON P.BusinessEntityID = BusAd.BusinessEntityID
LEFT JOIN AdventureWorks2017.Person.Address Ad ON BusAd.AddressID = Ad.AddressID
LEFT JOIN AdventureWorks2017.Person.StateProvince StP ON StP.StateProvinceID = Ad.StateProvinceID
LEFT JOIN AdventureWorks2017.Person.CountryRegion Co ON Co.CountryRegionCode = StP.CountryRegionCode
LEFT JOIN AdventureWorks2017.Person.PersonPhone Ph on Ph.BusinessEntityID = BusAd.BusinessEntityID

GO


INSERT INTO SwimmingCompetitionsGroup2.People.Swimmer
SELECT DISTINCT TOP 100000 Ch.CoachID
,P.FirstName AS FirstName
,P.LastName AS LastName
,CONVERT(DATE,GETDATE()) AS Birthday
,(CASE 
	WHEN P.MiddleName = 'Mr.' THEN 'M'
	WHEN P.MiddleName = 'Ms.' THEN 'F'
END
) AS 'Gender'
,CONCAT('SWR',SUBSTRING(Ph.PhoneNumber,2,5),SUBSTRING(Ad.AddressLine1,3,4)) AS PassportNumber -- √≈Õ≈–¿÷»ﬂ ÕŒÃ≈–¿ œ¿—œŒ–“¿
,StP.CountryRegionCode AS Citizenship
,(CASE 
	WHEN SUBSTRING(P.LastName,3,1) BETWEEN 'A' AND 'C' THEN 'U2'
	WHEN SUBSTRING(P.LastName,3,1) BETWEEN 'D' AND 'F' THEN 'MS'
	WHEN SUBSTRING(P.LastName,3,1) BETWEEN 'G' AND 'J' THEN 'U3'
	WHEN SUBSTRING(P.LastName,3,1) BETWEEN 'K' AND 'M' THEN 'U1'
	WHEN SUBSTRING(P.LastName,3,1) BETWEEN 'N' AND 'P' THEN 'CMS'
	WHEN SUBSTRING(P.FirstName,1,1) BETWEEN 'Q' AND 'S' THEN '2'
	WHEN SUBSTRING(P.FirstName,1,1) BETWEEN 'T' AND 'V' THEN '1'
	WHEN SUBSTRING(P.FirstName,1,1) BETWEEN 'W' AND 'X' THEN 'WMS'
	WHEN SUBSTRING(P.FirstName,1,1) BETWEEN 'Y' AND 'Z' THEN '3'
END
) AS 'Rank'
FROM AdventureWorks2017.Person.Person P --“¿¡À»÷€ ƒÀﬂ √≈Õ≈–¿÷»» Õ”∆Õ€’ ƒ¿ÕÕ€’
LEFT JOIN AdventureWorks2017.Person.BusinessEntityAddress BusAd ON P.BusinessEntityID = BusAd.BusinessEntityID
LEFT JOIN AdventureWorks2017.Person.Address Ad ON BusAd.AddressID = Ad.AddressID
LEFT JOIN AdventureWorks2017.Person.StateProvince StP ON StP.StateProvinceID = Ad.StateProvinceID
LEFT JOIN AdventureWorks2017.Person.CountryRegion Co ON Co.CountryRegionCode = StP.CountryRegionCode
LEFT JOIN AdventureWorks2017.Person.PersonPhone Ph on Ph.BusinessEntityID = BusAd.BusinessEntityID
LEFT JOIN SwimmingCompetitionsGroup2.People.Coach Ch ON 1=1
WHERE SUBSTRING(P.FirstName,1,1) NOT BETWEEN 'A' AND 'H'  -- ”—ÀŒ¬»ﬂ ƒÀﬂ —Œ –¿Ÿ≈Õ»ﬂ  ŒÀ»◊≈—“¬¿ —“–Œ  ¬ “¿¡À»÷≈
AND P.FirstName NOT LIKE '%A%' AND P.LastName NOT LIKE '%A%' AND P.LastName NOT LIKE '%K%' AND P.FirstName NOT LIKE '%G%'
AND Ch.CoachID%2 <> 0 AND CH.CoachID%3 <> 0 AND CH.CoachID%5 <> 0 AND SUBSTRING(Ad.AddressLine1,3,4) <> ' ' AND SUBSTRING(Ph.PhoneNumber,2,5) <> ' (11)'


UPDATE SwimmingCompetitionsGroup2.People.Coach			-- «‡ÏÂÌ‡ Ò„ÂÌÂËÓ‚‡ÌÌ˚ı ‡‚ÚÓÏ‡ÚË˜ÂÒÍË ÒËÏ‚ÓÎÓ‚ Ì‡ ·ÓÎÂÂ Í‡ÒË‚˚Â Ë ÔÓ‰ıÓ‰ˇ˘ËÂ ‰Îˇ Ú‡·ÎËˆ
SET PassportNumber = REPLACE(PassportNumber,')','/')

UPDATE SwimmingCompetitionsGroup2.People.Judge		
SET PassportNumber = REPLACE(PassportNumber,')','/')

UPDATE SwimmingCompetitionsGroup2.People.Swimmer		
SET PassportNumber = REPLACE(PassportNumber,')','/')

UPDATE SwimmingCompetitionsGroup2.People.Swimmer		
SET PassportNumber = REPLACE(PassportNumber,',','')

UPDATE SwimmingCompetitionsGroup2.People.Judge		
SET PassportNumber = REPLACE(PassportNumber,',','')

UPDATE SwimmingCompetitionsGroup2.People.Coach		
SET PassportNumber = REPLACE(PassportNumber,',','')

UPDATE SwimmingCompetitionsGroup2.People.Coach			
SET PassportNumber = REPLACE(PassportNumber,'(','/')

UPDATE SwimmingCompetitionsGroup2.People.Judge		
SET PassportNumber = REPLACE(PassportNumber,'(','/')

UPDATE SwimmingCompetitionsGroup2.People.Swimmer		
SET PassportNumber = REPLACE(PassportNumber,'(','/')

UPDATE SwimmingCompetitionsGroup2.People.Swimmer		
SET PassportNumber = REPLACE(PassportNumber,'.','')

UPDATE SwimmingCompetitionsGroup2.People.Judge		
SET PassportNumber = REPLACE(PassportNumber,'.','')

UPDATE SwimmingCompetitionsGroup2.People.Coach		
SET PassportNumber = REPLACE(PassportNumber,'.','')


--some comment
--and more