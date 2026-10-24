CREATE SCHEMA "SALAM";

CREATE TABLE "SALAM".mahasiswas (
    id INT PRIMARY KEY,
    nim VARCHAR(12) NOT NULL UNIQUE,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    prodi VARCHAR(60) NOT NULL,
    ipk NUMERIC(3,2) NOT NULL CHECK (ipk BETWEEN 0 AND 4)
);

INSERT INTO "SALAM".mahasiswas
    (id, nim, nama, email, prodi, ipk)
VALUES
    (1, '1247050044', 'Fathan Rafif Athaya', '1247050044@student.uinsgd.ac.id', 'Informatika', 3.73),
    (2, '1247050055', 'Sausan Syakira Rihadatulaisy', '1247050055@student.uinsgd.ac.id', 'Informatika', 3.87);

-- Aktivitas pembeda: kategori mahasiswa berdasarkan IPK
CREATE VIEW "SALAM".v_mahasiswas_ringkas AS
SELECT nim, nama, prodi,
       CASE WHEN ipk >= 3.50 THEN 'Istimewa' ELSE 'Reguler' END AS kategori
FROM "SALAM".mahasiswas;

SELECT * FROM "SALAM".mahasiswas;
SELECT * FROM "SALAM".v_mahasiswas_ringkas;