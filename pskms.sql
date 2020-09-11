-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2020 at 06:04 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pskms`
--

-- --------------------------------------------------------

--
-- Table structure for table `diagnosa_penyakit`
--

CREATE TABLE `diagnosa_penyakit` (
  `kode_diagnosa` varchar(6) NOT NULL,
  `nama_penyakit` varchar(50) NOT NULL,
  `ciri_ciri_penyakit` text NOT NULL,
  `keterangan` text NOT NULL,
  `ciri_ciri_umum` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `kode_dokter` varchar(5) NOT NULL,
  `nama_dokter` varchar(30) NOT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `nomor_induk_dokter` varchar(20) NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `tgl_lahir` varchar(10) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hak_akses`
--

CREATE TABLE `hak_akses` (
  `id` int(2) NOT NULL,
  `id_user_level` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(3) NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `icon` varchar(40) NOT NULL,
  `is_main_menu` int(3) NOT NULL,
  `is_aktif` enum('y','n') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `kode_obat` varchar(5) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `jenis_obat` varchar(50) NOT NULL,
  `dosis_aturan_obat` varchar(40) NOT NULL,
  `satuan` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `paramedis`
--

CREATE TABLE `paramedis` (
  `kode_paramedis` varchar(4) NOT NULL,
  `nama_paramedis` varchar(40) NOT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `no_izin_paramedis` varchar(20) NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `tanggal_lahir` varchar(10) NOT NULL,
  `alamat_tinggal` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `no_rekamedis` char(6) NOT NULL,
  `no_ktp` varchar(16) NOT NULL,
  `no_bpjs` varchar(20) NOT NULL,
  `nama_pasien` varchar(30) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `tanggal_lahir` varchar(10) NOT NULL,
  `alamat` text NOT NULL,
  `status_pasien` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `no_registrasi` varchar(4) NOT NULL,
  `no_rawat` varchar(18) NOT NULL,
  `no_rekamedis` varchar(6) NOT NULL,
  `tanggal_daftar` date NOT NULL,
  `kode_dokter` varchar(4) NOT NULL,
  `nama_penanggung_jawab` varchar(40) NOT NULL,
  `hubungan_dengan_penanggung_jawab` varchar(40) NOT NULL,
  `alamat_penanggung _jawab` text NOT NULL,
  `status_pasien` varchar(10) NOT NULL,
  `no_bpjs` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pengadaan_obat`
--

CREATE TABLE `pengadaan_obat` (
  `id_pengadaan` varchar(6) NOT NULL,
  `no_trans` varchar(15) NOT NULL,
  `supplier` varchar(50) NOT NULL,
  `kode_obat` varchar(5) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `jenis_obat` varchar(50) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `jumlah` int(4) NOT NULL,
  `satuan` varchar(15) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `total` int(11) NOT NULL,
  `tgl_transaksi` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran_obat`
--

CREATE TABLE `pengeluaran_obat` (
  `id_pengeluaran` varchar(6) NOT NULL,
  `no_terima_obat` char(15) NOT NULL,
  `nama_pasien` varchar(50) NOT NULL,
  `kode_obat` varchar(5) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `jenis_obat` varchar(50) NOT NULL,
  `dosis_aturan_obat` varchar(50) NOT NULL,
  `jumlah` int(4) NOT NULL,
  `satuan` varchar(15) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `tgl_serah_obat` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `resep_obat`
--

CREATE TABLE `resep_obat` (
  `kode_resep` int(4) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `jenis_obat` varchar(50) NOT NULL,
  `dosis_aturan_obat` varchar(40) NOT NULL,
  `jumlah_obat` int(3) NOT NULL,
  `no_rawat` varchar(20) NOT NULL,
  `no_rekamedis` varchar(6) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_tindakan`
--

CREATE TABLE `riwayat_tindakan` (
  `id_riwayat_tindakan` int(11) NOT NULL,
  `kode_diagnosa` varchar(6) NOT NULL,
  `kode_tindakan` varchar(6) NOT NULL,
  `no_rawat` varchar(18) NOT NULL,
  `hasil_periksa` varchar(100) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `no_rekamedis` varchar(6) NOT NULL,
  `tanggal` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stok_obat`
--

CREATE TABLE `stok_obat` (
  `kode_obat` varchar(5) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `satuan` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tindakan`
--

CREATE TABLE `tindakan` (
  `kode_tindakan` varchar(6) NOT NULL,
  `nama_tindakan` varchar(30) NOT NULL,
  `tindakan_oleh` enum('dokter','petugas','dokter_dan_petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_users` int(2) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(225) NOT NULL,
  `images` text NOT NULL,
  `id_user_level` int(11) NOT NULL,
  `is_aktif` enum('y','n') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_level`
--

CREATE TABLE `user_level` (
  `id_user_level` int(2) NOT NULL,
  `nama_level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `diagnosa_penyakit`
--
ALTER TABLE `diagnosa_penyakit`
  ADD PRIMARY KEY (`kode_diagnosa`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`kode_dokter`);

--
-- Indexes for table `hak_akses`
--
ALTER TABLE `hak_akses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`kode_obat`);

--
-- Indexes for table `paramedis`
--
ALTER TABLE `paramedis`
  ADD PRIMARY KEY (`kode_paramedis`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`no_rekamedis`);

--
-- Indexes for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`no_rawat`);

--
-- Indexes for table `pengadaan_obat`
--
ALTER TABLE `pengadaan_obat`
  ADD PRIMARY KEY (`no_trans`);

--
-- Indexes for table `pengeluaran_obat`
--
ALTER TABLE `pengeluaran_obat`
  ADD PRIMARY KEY (`no_terima_obat`);

--
-- Indexes for table `resep_obat`
--
ALTER TABLE `resep_obat`
  ADD PRIMARY KEY (`kode_resep`);

--
-- Indexes for table `riwayat_tindakan`
--
ALTER TABLE `riwayat_tindakan`
  ADD PRIMARY KEY (`id_riwayat_tindakan`);

--
-- Indexes for table `stok_obat`
--
ALTER TABLE `stok_obat`
  ADD PRIMARY KEY (`kode_obat`);

--
-- Indexes for table `tindakan`
--
ALTER TABLE `tindakan`
  ADD PRIMARY KEY (`kode_tindakan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_users`);

--
-- Indexes for table `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id_user_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hak_akses`
--
ALTER TABLE `hak_akses`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resep_obat`
--
ALTER TABLE `resep_obat`
  MODIFY `kode_resep` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `riwayat_tindakan`
--
ALTER TABLE `riwayat_tindakan`
  MODIFY `id_riwayat_tindakan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_users` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id_user_level` int(2) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
