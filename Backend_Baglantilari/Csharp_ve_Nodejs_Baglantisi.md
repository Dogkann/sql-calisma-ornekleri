# 🔌 Connecting Databases to Projects (Backend Integration)

We've learned how to write SQL queries, but how do we use this data in a real website or desktop application?

Here are the templates for connecting to our Northwind database using two of the most widely used languages ​​in the industry (C# and JavaScript):

## 1. Connecting to SQL Server with C# (.NET)
In the C# world, the `System.Data.SqlClient` library is generally used to connect to a database.
-
# 🔌 Veritabanını Projelere Bağlamak (Backend Entegrasyonu)

SQL sorgularını yazmayı öğrendik, peki bu verileri gerçek bir web sitesinde veya masaüstü uygulamasında nasıl kullanacağız? 

İşte sektörde en çok kullanılan iki dil (C# ve JavaScript) ile Northwind veritabanımıza bağlanma şablonları:

## 1. C# (.NET) ile SQL Server Bağlantısı
C# dünyasında veritabanına bağlanmak için genellikle `System.Data.SqlClient` kütüphanesi kullanılır.

```csharp
using System;
using System.Data.SqlClient;

class Program
{
    static void Main()
    {
        // 1. Adım: Bağlantı adresini (Connection String) tanımla
        string connectionString = "Server=SENIN_SUNUCU_ADIN;Database=Northwind;Trusted_Connection=True;";

        // 2. Adım: Bağlantıyı aç ve sorguyu gönder
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string sqlSorgusu = "SELECT TOP 5 ProductName, UnitPrice FROM Products";
            
            using (SqlCommand command = new SqlCommand(sqlSorgusu, connection))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    Console.WriteLine("--- En Pahalı 5 Ürün ---");
                    while (reader.Read())
                    {
                        // 3. Adım: Gelen veriyi ekrana yazdır
                        Console.WriteLine($"{reader["ProductName"]} - {reader["UnitPrice"]:C2}");
                    }
                }
            }
        }
    }
}
## 2. JavaScript (Node.js) ile SQL Server Bağlantısı
Modern web projelerinde veya Full-Stack uygulamalarda SQL Server'a bağlanmak için `mssql` paketi kullanılır. Projene terminalden `npm install mssql` diyerek paketi kurduktan sonra şu kodu kullanabilirsin:

```javascript
const sql = require('mssql');

// 1. Adım: Veritabanı ayarlarını yap
const config = {
    user: 'kullanici_adin',
    password: 'sifren',
    server: 'localhost', // Veya sunucu IP adresi
    database: 'Northwind',
    options: {
        encrypt: true, // Azure gibi bulut sistemleri için true
        trustServerCertificate: true // Lokal geliştirme için true olmalı
    }
};

// 2. Adım: Bağlan ve veriyi çek
async function urunleriGetir() {
    try {
        await sql.connect(config);
        console.log("Veritabanına başarıyla bağlanıldı! 🚀\n");

        // En pahalı 5 ürünü getiren sorgu
        const result = await sql.query`SELECT TOP 5 ProductName, UnitPrice FROM Products ORDER BY UnitPrice DESC`;
        
        console.log("--- En Pahalı 5 Ürün ---");
        console.table(result.recordset); // Veriyi şık bir tablo olarak konsola yazdır
        
    } catch (err) {
        console.error("Bağlantı hatası:", err);
    }
}

// Fonksiyonu çalıştır
urunleriGetir();
