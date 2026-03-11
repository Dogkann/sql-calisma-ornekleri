/* ============================================================
REAL-LIFE BUSINESS SCENARIOS AND SOLUTIONS - NORTHWIND
==============================================================
This file contains complex reporting queries that a company would need in its daily operations.

*/

-- 🎯 SCENARIO 1: LOGISTICS DEPARTMENT (Shipping Delay Report)
-- Question: "Which shipping companies are we working with that result in late delivery of products to customers?"
-- Solution: Calculates the difference between the requested delivery date and the actual delivery date.

/* ============================================================
GERÇEK HAYAT İŞ SENARYOLARI VE ÇÖZÜMLERİ - NORTHWIND
============================================================
Bu dosya, bir şirketin günlük operasyonlarında ihtiyaç duyacağı 
karmaşık raporlama sorgularını içermektedir.
*/

-- 🎯 SENARYO 1: LOJİSTİK DEPARTMANI (Kargo Gecikme Raporu)
-- Soru: "Hangi kargo şirketleriyle çalışırken müşterilere ürünleri geç teslim ediyoruz?"
-- Çözüm: İstenen teslim tarihi ile gerçek teslim tarihi arasındaki farkı hesaplar.
SELECT 
    S.CompanyName AS Kargo_Sirketi,
    COUNT(O.OrderID) AS Toplam_Tasima,
    SUM(CASE WHEN O.ShippedDate > O.RequiredDate THEN 1 ELSE 0 END) AS Geciken_Teslimat,
    FORMAT((CAST(SUM(CASE WHEN O.ShippedDate > O.RequiredDate THEN 1 ELSE 0 END) AS FLOAT) / COUNT(O.OrderID)) * 100, 'N2') + '%' AS Gecikme_Orani
FROM Orders O
INNER JOIN Shippers S ON O.ShipVia = S.ShipperID
GROUP BY S.CompanyName
ORDER BY Gecikme_Orani DESC;

-- 🎯 SCENARIO 2: SALES DEPARTMENT (VIP Customers)
-- Question: "Who are our most valuable customers who have generated more than $10,000 in revenue for us to date?"
-- Solution: Filter using HAVING and SUM functions.

-- 🎯 SENARYO 2: SATIŞ DEPARTMANI (VIP Müşteriler)
-- Soru: "Bize bugüne kadar 10.000 Dolar'dan fazla kazandıran en değerli müşterilerimiz kimler?"
-- Çözüm: HAVING ve SUM fonksiyonları ile filtreleme yapar.
SELECT 
    C.CompanyName AS Musteri_Adi,
    C.Country AS Ulke,
    FORMAT(SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)), 'C', 'en-US') AS Toplam_Harcama
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY C.CompanyName, C.Country
HAVING SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) > 10000
ORDER BY SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) DESC;

-- 🎯 SCENARIO 3: HUMAN RESOURCES (Employee Performance Analysis)
-- Question: "How much revenue did each of our employees generate annually?"

-- 🎯 SENARYO 3: İNSAN KAYNAKLARI (Çalışan Performans Analizi)
-- Soru: "Hangi personelimiz yıl bazında ne kadar ciro yaptı?"
SELECT 
    E.FirstName + ' ' + E.LastName AS Personel,
    YEAR(O.OrderDate) AS Satis_Yili,
    FORMAT(SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)), 'C', 'en-US') AS Yillik_Ciro
FROM Employees E
INNER JOIN Orders O ON E.EmployeeID = O.EmployeeID
INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY E.FirstName + ' ' + E.LastName, YEAR(O.OrderDate)
ORDER BY Personel, Satis_Yili;
