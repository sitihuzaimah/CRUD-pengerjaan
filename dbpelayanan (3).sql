-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Agu 2023 pada 10.08
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpelayanan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` varchar(20) NOT NULL,
  `usn` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `usn`, `pass`) VALUES
('001', 'admin1', 'admin123!');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengerjaan`
--

CREATE TABLE `pengerjaan` (
  `id` varchar(10) NOT NULL,
  `no_order` varchar(10) DEFAULT NULL,
  `admin_id` varchar(20) DEFAULT NULL,
  `bayar` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `NoOrder` varchar(10) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nm_user` varchar(50) DEFAULT NULL,
  `no_hp` varchar(15) NOT NULL,
  `jasa` varchar(20) DEFAULT NULL,
  `hari` int(3) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `berkas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengerjaan`
--
ALTER TABLE `pengerjaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_no_order` (`no_order`),
  ADD KEY `FK_id` (`admin_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`NoOrder`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pengerjaan`
--
ALTER TABLE `pengerjaan`
  ADD CONSTRAINT `FK_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  ADD CONSTRAINT `FK_no_order` FOREIGN KEY (`no_order`) REFERENCES `user` (`NoOrder`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
