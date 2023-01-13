-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jan 2023 pada 23.47
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_solid`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `idcart` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `tglorder` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL DEFAULT 'Cart'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`idcart`, `orderid`, `userid`, `tglorder`, `status`) VALUES
(13, '16NGI0TIDK3Ik', 2, '2023-01-12 18:36:40', 'Payment'),
(14, '16PWG2dYAKKSQ', 2, '2023-01-12 18:45:49', 'Cart');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailorder`
--

CREATE TABLE `detailorder` (
  `detailid` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detailorder`
--

INSERT INTO `detailorder` (`detailid`, `orderid`, `idproduk`, `qty`) VALUES
(15, '16NGI0TIDK3Ik', 23, 1),
(16, '16PWG2dYAKKSQ', 5, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `namakategori` varchar(20) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`idkategori`, `namakategori`, `tgldibuat`) VALUES
(4, 'Bantal', '2023-01-12 17:44:19'),
(5, 'Kursi', '2023-01-12 17:44:33'),
(6, 'Baju', '2023-01-12 17:44:46'),
(7, 'Celana', '2023-01-12 17:44:55'),
(8, 'Tas', '2023-01-12 17:45:05'),
(9, 'Sandal', '2023-01-12 17:45:19'),
(10, 'Kaos', '2023-01-12 17:45:29'),
(11, 'Speaker', '2023-01-12 17:45:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `idkonfirmasi` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `payment` varchar(10) NOT NULL,
  `namarekening` varchar(25) NOT NULL,
  `tglbayar` date NOT NULL,
  `tglsubmit` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `userid` int(11) NOT NULL,
  `namalengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `notelp` varchar(15) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tgljoin` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(7) NOT NULL DEFAULT 'Member',
  `lastlogin` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`userid`, `namalengkap`, `email`, `password`, `notelp`, `alamat`, `tgljoin`, `role`, `lastlogin`) VALUES
(1, 'Admin', 'admin', '$2y$10$GJVGd4ji3QE8ikTBzNyA0uLQhiGd6MirZeSJV1O6nUpjSVp1eaKzS', '0823 4567 8910', 'Indonesia', '2023-03-10 11:31:17', 'Admin', NULL),
(3, 'anjong', 'saviordompu@gmail.com', '$2y$10$ZUZM49XS1NNdGERcspHQ5.8SqFNjYphdhB4TLwT0PZIlxGhJTnrAy', '12345678', 'aan yahanjong', '2023-01-12 18:52:56', 'Member', NULL),
(4, 'Banafa', 'banafa@gmail.com', '$2y$10$CCNjpLcEgRZQ92uPivjVRu5B.L7mL3DYkZEAPvV4dpJTizJ0NINpC', '987654321', 'Banafa Shafa', '2023-01-12 18:54:48', 'Member', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `no` int(11) NOT NULL,
  `metode` varchar(25) NOT NULL,
  `norek` varchar(25) NOT NULL,
  `logo` text DEFAULT NULL,
  `an` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`no`, `metode`, `norek`, `logo`, `an`) VALUES
(1, 'Bank BCA', '2435872938', 'images/bca.jpg', 'Anjong'),
(3, 'DANA', '082133975028', 'images/dana.png', 'Muhammad Shougi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `namaproduk` varchar(30) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `rate` int(11) NOT NULL,
  `hargabefore` int(11) NOT NULL,
  `hargaafter` int(11) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`idproduk`, `idkategori`, `namaproduk`, `gambar`, `deskripsi`, `rate`, `hargabefore`, `hargaafter`, `tgldibuat`) VALUES
(4, 4, 'Bantal Estetik', 'produk/16Y2K8g6BAo3Y.jpg', 'nyaman digunakan dan terbuat dari bahan import', 5, 20000, 18000, '2023-01-12 17:47:55'),
(5, 4, 'Bantal Lucu', 'produk/16Re9h5e3Uy7g.jpg', 'lucu dan empuk', 5, 25000, 20000, '2023-01-12 17:48:44'),
(6, 4, 'Bantal Rumbai', 'produk/16f8ocSIoTc2Q.jpg', 'desain elegan ', 4, 15000, 14000, '2023-01-12 17:49:30'),
(7, 6, 'Baju Wanita Lucu ', 'produk/16tXGuFRwjt26.jpg', 'nyaman digunakan', 4, 45000, 43000, '2023-01-12 17:56:19'),
(8, 7, 'Celana Training ', 'produk/16oUq7WBprHQA.jpg', 'bahan lembut dan menyerap keringat', 5, 70000, 65000, '2023-01-12 17:57:56'),
(9, 7, 'Celana Pria Keren', 'produk/16nH1Ppqyd9j..jpg', 'Desain modern', 4, 85000, 75000, '2023-01-12 17:59:27'),
(11, 5, 'Kursi Gaming Viral', 'produk/16mRVuy1dmSCc.jpg', 'kuat dan tahan lama', 5, 2000000, 1900000, '2023-01-12 18:07:58'),
(13, 5, 'Kursi Kayu Estetik', 'produk/16xRV7LJtzbCM.jpg', 'Desain modern dan elegan', 5, 250000, 235000, '2023-01-12 18:11:56'),
(14, 8, 'Tas Prada', 'produk/16kxgnbZ3MAE6.jpg', 'terbuat dari bahan bahan berkualitas ', 5, 500000, 450000, '2023-01-12 18:14:10'),
(15, 8, 'Tas Kulit Putih', 'produk/16STUQQS6inog.jpg', 'Terbuat dari kulit sapi asli', 4, 95000, 80000, '2023-01-12 18:15:24'),
(16, 8, 'Tas Sekolah Viral', 'produk/16I3AZDIxuLcM.jpg', 'nyaman digunakan', 5, 125000, 118000, '2023-01-12 18:16:35'),
(17, 7, 'Celana Kulot', 'produk/164OX9lBgDsBI.jpg', 'bahan halus dan nyaman digunakan', 5, 85000, 80000, '2023-01-12 18:18:04'),
(20, 11, 'Speaker JBL Pink', 'produk/16QlwvLUuPcyM.jpg', 'Memiliki suara yang kencang dengan bas yang menggelegar', 5, 150000, 135000, '2023-01-12 18:22:51'),
(21, 9, 'Sandal Wanita Viral', 'produk/164uP1yxiPLBk.jpg', 'nyaman digunakan dan terbuat dari bahan import', 5, 35000, 32000, '2023-01-12 18:24:30'),
(22, 9, 'Sandal Karet Hitam', 'produk/16woRHrczDLk..jpg', 'Emput dan Nyaman digunakan', 3, 18000, 15000, '2023-01-12 18:27:29'),
(23, 10, 'Kaos Distro ', 'produk/16UwEI.teExr6.jpg', 'nyaman digunakan dan terbuat dari bahan import', 5, 300000, 285000, '2023-01-12 18:29:00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`idcart`),
  ADD UNIQUE KEY `orderid` (`orderid`),
  ADD KEY `orderid_2` (`orderid`);

--
-- Indeks untuk tabel `detailorder`
--
ALTER TABLE `detailorder`
  ADD PRIMARY KEY (`detailid`),
  ADD KEY `orderid` (`orderid`),
  ADD KEY `idproduk` (`idproduk`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indeks untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`idkonfirmasi`),
  ADD KEY `userid` (`userid`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`userid`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`),
  ADD KEY `idkategori` (`idkategori`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `idcart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `detailorder`
--
ALTER TABLE `detailorder`
  MODIFY `detailid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `idkonfirmasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detailorder`
--
ALTER TABLE `detailorder`
  ADD CONSTRAINT `idproduk` FOREIGN KEY (`idproduk`) REFERENCES `produk` (`idproduk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderid` FOREIGN KEY (`orderid`) REFERENCES `cart` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `idkategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`idkategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
