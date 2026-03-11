/* ===========================================================
SQL COMMAND REFERENCE GUIDE (CHEAT SHEET)
=============================================================
This file is a glossary showing the meaning and usage of the most essential commands needed when learning SQL.

This file shows the meaning and usage of the most essential commands needed when learning SQL. */

-- ------------------------------------------------------------
-- 1. DATA SELECTION AND FILTERING (SELECT & WHERE)
-- ------------------------------------------------------------

-- SELECT: Tells us which columns (columns) we want to see from the table. -- What is it used for? It is the basic command we use to display data on the screen.
/* ============================================================
SQL KOMUTLARI BAŞVURU REHBERİ (CHEAT SHEET)
============================================================
Bu dosya, SQL öğrenirken en çok ihtiyaç duyulan temel komutların 
ne anlama geldiğini ve nasıl kullanıldığını gösteren bir sözlüktür.
*/

-- ------------------------------------------------------------
-- 1. VERİ SEÇME VE FİLTRELEME (SELECT & WHERE)
-- ------------------------------------------------------------

-- SELECT: Tablodan hangi kolonları (sütunları) görmek istediğimizi söyler.
-- Ne İşe Yarar? Veriyi ekrana getirmek için kullandığımız temel komuttur.
SELECT ProductName, UnitPrice FROM Products;

-- WHERE: Filters the incoming data according to a specific condition. 
-- What is it used for? It allows us to say "Only bring back those with a price greater than 50".
-- WHERE: Gelen veriyi belirli bir şarta göre filtreler.
-- Ne İşe Yarar? "Sadece fiyatı 50'den büyük olanları getir" dememizi sağlar.
SELECT ProductName, UnitPrice FROM Products 
WHERE UnitPrice > 50;

-- DISTINCT: Displays duplicate entries only once. 
-- What is it used for? It prevents the user from entering the same country 10 times in the answer to the question "Which countries are our customers from?".
-- DISTINCT: Tekrar eden kayıtları tek sefer gösterir.
-- Ne İşe Yarar? "Müşterilerimiz hangi ülkelerden?" sorusunun cevabında, aynı ülkeyi 10 kere yazmasını engeller.
SELECT DISTINCT Country FROM Customers;

-- ------------------------------------------------------------
-- 2. SORTING AND LIMITING (ORDER BY & TOP)
-- ------------------------------------------------------------

-- ORDER BY: Sorts the incoming data alphabetically or numerically. 
-- What is it used for? DESC (Largest to Smallest/Z to A), ASC (Smallest to Largest/A to Z).
-- ------------------------------------------------------------
-- 2. SIRALAMA VE LİMİTLEME (ORDER BY & TOP)
-- ------------------------------------------------------------
-- ORDER BY: Gelen veriyi alfabetik veya sayısal olarak sıralar.
-- Ne İşe Yarar? DESC (Büyükten küçüğe/Z'den A'ya), ASC (Küçükten büyüğe/A'dan Z'ye).

SELECT ProductName, UnitPrice FROM Products 
ORDER BY UnitPrice DESC; -- Fiyatı en yüksekten en düşüğe sıralar -- Sorts by price from highest to lowest.

-- TOP (or LIMIT): Only retrieves the number of records specified at the beginning.
-- What is it for? It's for saying, "Bring me the top 3 most expensive items."
-- TOP (veya LIMIT): Sadece baştan belirtilen sayı kadar kaydı getirir.
-- Ne İşe Yarar? "Bana en pahalı ilk 3 ürünü getir" demek içindir.
SELECT TOP 3 ProductName, UnitPrice FROM Products 
ORDER BY UnitPrice DESC;

-- ------------------------------------------------------------
-- 3. SEARCH AND PATTERN MATCHING (LIKE & IN & BETWEEN)
-- ------------------------------------------------------------

-- LIKE: Searches for a specific word or letter pattern within the text. 
-- What is it used for? It allows us to find products that contain "Ch" and start with "A". The (% sign means "whatever").
-- ------------------------------------------------------------
-- 3. ARAMA VE DESEN EŞLEŞTİRME (LIKE & IN & BETWEEN)
-- ------------------------------------------------------------

-- LIKE: Metin içinde belirli bir kelimeyi veya harf düzenini arar.
-- Ne İşe Yarar? İçinde "Ch" geçen, "A" ile başlayan ürünleri bulmamızı sağlar (% işareti "ne olursa olsun" demektir).
SELECT ProductName FROM Products 
WHERE ProductName LIKE 'Ch%'; -- 'Ch' ile başlayanlar -- Those starting with 'Ch'

-- IN: Instead of typing a long "OR" (or) statement, it searches for values ​​within a list. 
-- What is it used for? It is used to say "Bring back the values ​​that are in category 1, 3, or 5".
-- IN: Uzun uzun "OR" (veya) yazmak yerine, bir liste içindeki değerleri arar.
-- Ne İşe Yarar? "Kategorisi 1, 3 veya 5 olanları getir" demek için kullanılır.
SELECT ProductName, CategoryID FROM Products 
WHERE CategoryID IN (1, 3, 5);

-- BETWEEN: Retrieves data between two values ​​(commonly used with dates and numbers). 
-- What is it used for? It's used to say "List products priced between 10 and 20".
-- BETWEEN: İki değer arasındaki verileri getirir (Tarih ve sayılarda çok kullanılır).
-- Ne İşe Yarar? "Fiyatı 10 ile 20 arasında olan ürünleri listele" demek içindir.
SELECT ProductName, UnitPrice FROM Products 
WHERE UnitPrice BETWEEN 10 AND 20;

-- ------------------------------------------------------------
-- 4. GROUPING AND MATHEMATICAL OPERATIONS (GROUP BY & AGGREGATE)
-- ------------------------------------------------------------

-- AGGREGATE Functions: SUM, AVG, COUNT, MAX, MIN.
-- What is it used for? It answers questions like "How many customers do I have in total?" or "What is my average product price?".
-- ------------------------------------------------------------
-- 4. GRUPLAMA VE MATEMATİKSEL İŞLEMLER (GROUP BY & AGGREGATE)
-- ------------------------------------------------------------

-- AGGREGATE (Toplama) Fonksiyonları: SUM (Toplam), AVG (Ortalama), COUNT (Sayma), MAX (En Büyük), MIN (En Küçük).
-- Ne İşe Yarar? "Toplam kaç müşterim var?" veya "Ortalama ürün fiyatım nedir?" sorularını yanıtlar.
SELECT COUNT(CustomerID) AS ToplamMusteri FROM Customers;
SELECT AVG(UnitPrice) AS OrtalamaFiyat FROM Products;

-- GROUP BY: Groups data according to a specific column and performs operations on each group. 
-- What is it used for? It answers the question "How many customers do I have in each country?".
-- GROUP BY: Verileri belirli bir kolona göre gruplayıp, her grup için işlem yapar.
-- Ne İşe Yarar? "Hangi ülkede kaç müşterim var?" sorusunun cevabıdır.
SELECT Country, COUNT(CustomerID) AS MusteriSayisi FROM Customers 
GROUP BY Country;

-- HAVING: Filters data grouped with GROUP BY (a group version of WHERE). 
-- What is it used for? It's used to specify "List only countries with more than 5 customers".
-- HAVING: GROUP BY ile gruplanmış veriler üzerinde filtreleme yapar (WHERE'in grup versiyonudur).
-- Ne İşe Yarar? "Sadece 5'ten fazla müşterisi olan ülkeleri listele" demek içindir.
SELECT Country, COUNT(CustomerID) AS MusteriSayisi FROM Customers 
GROUP BY Country 
HAVING COUNT(CustomerID) > 5;

-- ------------------------------------------------------------
-- 5. TABLOLARI BİRLEŞTİRME (JOINS)
-- ------------------------------------------------------------

-- INNER JOIN: İki tabloda da KESİŞEN (ortak olan) verileri yan yana getirir.
-- Ne İşe Yarar? "Hangi ürünü, hangi tedarikçi getirmiş?" sorusunun cevabını, iki farklı tabloyu eşleştirerek verir.
SELECT P.ProductName, S.CompanyName 
FROM Products P
INNER JOIN Suppliers S ON P.SupplierID = S.SupplierID;
-- ------------------------------------------------------------
-- 6. DİĞER BİRLEŞTİRME TÜRLERİ (OUTER JOINS)
-- ------------------------------------------------------------

-- LEFT JOIN: Soldaki tablonun tamamını, sağdakinin sadece eşleşenlerini getirir.
-- Ne İşe Yarar? "Bana TÜM müşterileri getir, siparişi olmayanların yanına NULL yaz."
SELECT C.CompanyName, O.OrderID 
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID;

-- RIGHT JOIN: Sağdaki tablonun tamamını getirir. (LEFT JOIN'in tam tersi).
-- FULL OUTER JOIN: İki tablodaki her şeyi getirir, eşleşmeyenlere NULL basar.

-- ------------------------------------------------------------
-- 7. VERİ EKLEME, GÜNCELLEME VE SİLME (DML KOMUTLARI)
-- ------------------------------------------------------------

-- INSERT INTO: Tabloya yeni bir satır veri ekler.
-- Ne İşe Yarar? Sisteme yeni bir ürün veya müşteri kaydetmek içindir.
INSERT INTO Region (RegionID, RegionDescription) 
VALUES (5, 'Marmara');

-- UPDATE: Var olan bir veriyi günceller. (DİKKAT: WHERE koymazsan tüm tablo güncellenir!)
-- Ne İşe Yarar? "Chai isimli ürünün fiyatına zam yap" demek içindir.
UPDATE Products 
SET UnitPrice = UnitPrice + 10 
WHERE ProductName = 'Chai';

-- DELETE: Tablodan belirli bir satırı komple siler.
-- Ne İşe Yarar? "Bölge ID'si 5 olan kaydı sistemden kaldır."
DELETE FROM Region 
WHERE RegionID = 5;

-- ------------------------------------------------------------
-- 8. TABLO VE VERİTABANI YÖNETİMİ (DDL KOMUTLARI)
-- ------------------------------------------------------------

-- CREATE TABLE: Sıfırdan yeni bir tablo oluşturur.
-- Ne İşe Yarar? Sisteme "Personeller" adında yeni bir kayıt alanı açmak içindir.
CREATE TABLE DenemeTablosu (
    ID INT PRIMARY KEY,
    Isim NVARCHAR(50),
    Yas INT
);

-- ALTER TABLE: Var olan bir tablonun yapısını değiştirir (Kolon ekler veya siler).
-- Ne İşe Yarar? "Müşteriler tablosuna 'Doğum Tarihi' diye yeni bir sütun ekle."
ALTER TABLE DenemeTablosu ADD DogumTarihi DATE;

-- DROP TABLE: Tabloyu içindeki verilerle beraber tamamen yok eder.
-- Ne İşe Yarar? Artık kullanılmayan çöp tabloları temizler.
DROP TABLE DenemeTablosu;

-- ------------------------------------------------------------
-- 9. KOŞULLU İFADELER VE ÖZEL YAPILAR
-- ------------------------------------------------------------

-- CASE WHEN: SQL'in IF-ELSE (Eğer-Değilse) yapısıdır.
-- Ne İşe Yarar? "Fiyatı 50'den büyükse 'Pahalı', değilse 'Ucuz' yazdır" gibi özel etiketlemeler yapar.
SELECT ProductName, UnitPrice,
    CASE 
        WHEN UnitPrice > 50 THEN 'Pahalı Ürün'
        WHEN UnitPrice BETWEEN 20 AND 50 THEN 'Orta Seviye'
        ELSE 'Ucuz Ürün'
    END AS FiyatKategorisi
FROM Products;

-- SUBQUERY (Alt Sorgu): Bir sorgunun içine yazılan başka bir sorgudur.
-- Ne İşe Yarar? "Fiyatı, tüm ürünlerin ortalama fiyatından daha yüksek olan ürünleri getir."
SELECT ProductName, UnitPrice FROM Products 
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products);

-- UNION: İki farklı SELECT sorgusunun sonucunu alt alta birleştirir.
-- Ne İşe Yarar? "Müşterilerin şehirleri ile personellerin şehirlerini tek bir listede topla."
SELECT City FROM Customers
UNION
SELECT City FROM Employees;
-- ------------------------------------------------------------
-- 10. METİN (STRING) FONKSİYONLARI (Veri Temizleme)
-- ------------------------------------------------------------

-- UPPER() ve LOWER(): Metni tamamen BÜYÜK veya küçük harfe çevirir.
-- Ne İşe Yarar? Raporlarda isimlerin standart (hepsi büyük) görünmesini sağlar.
SELECT UPPER(FirstName), LOWER(LastName) FROM Employees;

-- LEN(): Metnin kaç karakterden oluştuğunu sayar.
-- Ne İşe Yarar? "Şifresi 6 karakterden kısa olan kullanıcıları bul."
SELECT CompanyName, LEN(CompanyName) AS KarakterSayisi FROM Customers;

-- SUBSTRING(): Metnin içinden belirli bir parçayı kesip alır.
-- Ne İşe Yarar? Telefon numaralarının sadece alan kodunu (ilk 3 haneyi) almak için.
SELECT Phone, SUBSTRING(Phone, 1, 3) AS AlanKodu FROM Customers;

-- CONCAT() veya + : Birden fazla metni veya kolonu tek bir metin gibi birleştirir.
-- Ne İşe Yarar? İsim ve soyisim kolonlarını birleştirip "Ad Soyad" sütunu yapmak için.
SELECT CONCAT(FirstName, ' ', LastName) AS TamAd FROM Employees;

-- ------------------------------------------------------------
-- 11. TARİH VE ZAMAN (DATE) FONKSİYONLARI
-- ------------------------------------------------------------

-- GETDATE(): Sistemin o anki tarih ve saatini verir.
-- Ne İşe Yarar? Tabloya yeni kayıt eklerken "Kayıt Tarihi" olarak bugünü basmak için.
SELECT GETDATE() AS SuAnkiZaman;

-- DATEDIFF(): İki tarih arasındaki farkı (gün, ay veya yıl cinsinden) hesaplar.
-- Ne İşe Yarar? "Sipariş veriliş tarihi ile kargolanma tarihi arasında kaç GÜN geçmiş?"
SELECT OrderID, DATEDIFF(DAY, OrderDate, ShippedDate) AS KargoSuresiGun 
FROM Orders;

-- DATEADD(): Bir tarihin üzerine gün, ay veya yıl ekler/çıkarır.
-- Ne İşe Yarar? "Bugünden itibaren 30 gün sonrası son ödeme tarihidir" demek için.
SELECT OrderDate, DATEADD(DAY, 30, OrderDate) AS SonOdemeTarihi 
FROM Orders;

-- ------------------------------------------------------------
-- 12. NULL (BOŞ DEĞER) KONTROLLERİ
-- ------------------------------------------------------------

-- ISNULL() (veya COALESCE): Eğer kolonun içi boşsa (NULL), ekrana 'Belirtilmedi' gibi bir yazı basar.
-- Ne İşe Yarar? Raporlarda çirkin "NULL" yazısı yerine "Bölge Yok", "0" gibi mantıklı şeyler yazdırmak için.
SELECT CompanyName, ISNULL(Region, 'Bölge Belirtilmedi') AS Bolge Durumu 
FROM Customers;

-- ------------------------------------------------------------
-- 13. TRANSACTIONS (GÜVENLİ İŞLEM YÖNETİMİ) - 👑 HAYAT KURTARIR
-- ------------------------------------------------------------

-- BEGIN TRAN, COMMIT, ROLLBACK: Veritabanında bir işlem yaparken hata çıkarsa her şeyi eski haline çevirir (Geri Al).
-- Ne İşe Yarar? Banka uygulamasında A kişisinden para düştü ama B kişisine geçmeden elektrik kesildi. Veritabanı parayı yutmasın diye işlem iptal edilir (ROLLBACK). Hata yoksa onaylanır (COMMIT).
BEGIN TRAN; -- İşlemi başlat (Gözlem moduna geç)

    UPDATE Products SET UnitPrice = UnitPrice + 50 WHERE ProductID = 1;
    
    -- Eğer burada bir hata fark edersen (Yanlış ürünü güncelledim!):
    -- ROLLBACK; komutunu çalıştırırsan her şey eski haline döner.
    
    -- Eğer her şey doğruysa, kalıcı olarak kaydetmek için:
    -- COMMIT;
-- ------------------------------------------------------------
-- 14. VIEWS (SANAL TABLOLAR / GÖRÜNÜMLER)
-- ------------------------------------------------------------

-- CREATE VIEW: Karmaşık ve uzun JOIN sorgularını tek bir sanal tablo gibi kaydeder.
-- Ne İşe Yarar? Her gün "Müşteri, Sipariş, Kargo, Ürün" tablolarını birleştiren 50 satırlık kodu yazmak yerine, bunu bir View yaparsın. Sonra sanki tek bir tabloymuş gibi "SELECT * FROM vw_GunlukSatisRaporu" dersin.
GO
CREATE VIEW vw_PahaliUrunler AS
SELECT ProductName, UnitPrice, CategoryID 
FROM Products 
WHERE UnitPrice > 50;
GO

-- Kullanımı:
SELECT * FROM vw_PahaliUrunler;

-- ------------------------------------------------------------
-- 15. CTE (COMMON TABLE EXPRESSIONS) - "Geçici Tablolar"
-- ------------------------------------------------------------

-- WITH ... AS: Sadece o anki sorgu çalışırken hafızada var olan geçici, isimlendirilmiş bir tablo oluşturur.
-- Ne İşe Yarar? İç içe yazılmış, okunması imkansız olan spagetti kodları jilet gibi temizler (Clean Code). Bir sorgunun sonucunu alıp, hemen altındaki sorguda kullanmanı sağlar.
WITH CTE_KategoriOrtalamalari AS (
    -- Önce kategorilerin ortalama fiyatını bulup hafızaya alıyoruz
    SELECT CategoryID, AVG(UnitPrice) AS OrtalamaFiyat
    FROM Products
    GROUP BY CategoryID
)
-- Sonra bu hafızadaki tabloyu ana tablomuzla birleştirip raporluyoruz
SELECT P.ProductName, P.UnitPrice, C.OrtalamaFiyat 
FROM Products P
INNER JOIN CTE_KategoriOrtalamalari C ON P.CategoryID = C.CategoryID
WHERE P.UnitPrice > C.OrtalamaFiyat; -- Kendi kategorisinin ortalamasından pahalı olanlar!

-- ------------------------------------------------------------
-- 16. WINDOW FUNCTIONS (ANALİTİK FONKSİYONLAR) - 👑 MÜLAKAT KURTARANLAR
-- ------------------------------------------------------------

-- ROW_NUMBER() OVER(): Belirli bir gruba göre verileri numaralandırır. GROUP BY gibi veriyi ezmez, detayı korur.
-- Ne İşe Yarar? Patron "Bana HER KATEGORİDEKİ en pahalı ilk 3 ürünü listele" dediğinde hayat kurtarır.
SELECT ProductName, CategoryID, UnitPrice,
       ROW_NUMBER() OVER(PARTITION BY CategoryID ORDER BY UnitPrice DESC) AS KategoriSiraNo
FROM Products;

-- LEAD() ve LAG(): Bir tablodaki bir önceki veya bir sonraki satırın değerini aynı satıra getirir.
-- Ne İşe Yarar? Büyüme raporlarında çok kritiktir. "Bu ayki ciromuz X, geçen ayki ciromuz Y. Aradaki fark nedir?" sorusunu tek sorguda çözer.
SELECT OrderID, OrderDate, Freight,
       LAG(Freight, 1) OVER(ORDER BY OrderDate) AS BirOncekiSiparisKargoUcreti,
       Freight - LAG(Freight, 1) OVER(ORDER BY OrderDate) AS FiyatFarki
FROM Orders;
