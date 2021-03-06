-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 12, 2020 at 03:18 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_umkm`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_kode_cetak`
--

CREATE TABLE `data_kode_cetak` (
  `id` int(11) NOT NULL,
  `id_cetak` varchar(2) NOT NULL,
  `cetak` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `data_kode_cetak`
--

INSERT INTO `data_kode_cetak` (`id`, `id_cetak`, `cetak`) VALUES
(1, 'CT', 'Cetak'),
(2, 'JL', 'Kasir'),
(3, 'BL', 'Pembelian'),
(4, 'BJ', 'Pengeluaran'),
(5, 'BR', 'Barang Rusak');

-- --------------------------------------------------------

--
-- Table structure for table `data_pegawai`
--

CREATE TABLE `data_pegawai` (
  `id` int(11) NOT NULL,
  `foto` varchar(256) NOT NULL,
  `nama` varchar(256) NOT NULL,
  `alamat` varchar(256) NOT NULL,
  `kota` varchar(128) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `tgl_masuk` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `aktif` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `data_pegawai`
--

INSERT INTO `data_pegawai` (`id`, `foto`, `nama`, `alamat`, `kota`, `phone`, `username`, `password`, `tgl_masuk`, `level_id`, `aktif`) VALUES
(2, 'avatar.jpg', 'Bagos', 'Durian', 'Jakarta', '08256943245', 'Kasir', '$2y$10$UPuyaJmDVxIDTNylqK.eGu7EgOOy2MAv/RPa7xXHQtpM.1MyKqV9a', 1584098793, 2, 1),
(3, 'avatar.jpg', 'Selamet', 'Surabaya', '', '', 'Manager', '$2y$10$ZLkJfgiakApES3dN3T5NS.J6zhArc3a1M6yiOyodfbrEcFh.9Jrki', 1584105618, 4, 1),
(21, 'helloween.jpg', 'Dimas Andika', 'Semangka', 'Surabaya', '08145689555', 'Dimas', '$2y$10$x9j2l6cK0Qj3LbvI.1KWWOxEFPSo1Vy4k/klJmiiONzPIhsVho4/m', 1586276213, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `data_pelanggan`
--

CREATE TABLE `data_pelanggan` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `alamat` varchar(128) NOT NULL,
  `kelurahan` varchar(128) NOT NULL,
  `kota` varchar(128) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `data_pelanggan`
--

INSERT INTO `data_pelanggan` (`id`, `nama`, `alamat`, `kelurahan`, `kota`, `phone`) VALUES
(1, 'Atik Sembiring', 'duku 15', 'Kejengkol', 'Surabaya', '08165487666'),
(2, 'Anton Tonaya', 'jagung 67', 'Hantu Tengah', 'Godam', '08165485555'),
(3, 'Anisa Suwing', 'Rambuta Panjang 45', 'Buahan', 'Gunukan', '08165487666'),
(4, 'Katijah Fatijah', 'Semangka 7', 'Lantungan', 'Surabaya', '08165487666'),
(5, 'Firnanda Siaman', 'Appel 1', 'Pontang', 'Surabaya', '08165485555'),
(6, 'Adinda Siapa', 'Pisang 2', 'Jati Lawas', 'Surabaya', '08165485555'),
(7, 'Nona Gombel', 'Gombel 9', 'Dantrasan', 'Surabaya', '08165487666');

-- --------------------------------------------------------

--
-- Table structure for table `data_suplier`
--

CREATE TABLE `data_suplier` (
  `id_suplier` int(5) NOT NULL,
  `nama_suplier` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `keterangan` text NOT NULL,
  `no_tlpn` int(20) NOT NULL,
  `nama_sales` varchar(250) NOT NULL,
  `sales_hp` int(20) NOT NULL,
  `created_date` date NOT NULL,
  `user_create` int(5) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_suplier`
--

INSERT INTO `data_suplier` (`id_suplier`, `nama_suplier`, `alamat`, `keterangan`, `no_tlpn`, `nama_sales`, `sales_hp`, `created_date`, `user_create`, `status`) VALUES
(1, 'PT Abadi Jaya Telur', 'Jl A Yani No 90 Sindang Laya', 'suplier makanan', 4351212, '', 9989, '2020-08-03', 0, 0),
(2, 'PT. Uniliver Kediri', 'Jl Sindang asri', 'Uniliver', 9989898, '', 65656565, '2020-08-09', 0, 0),
(3, 'Distributor Beras', 'Jl.MayorBismo', '-', 908880, '', 2147483647, '2020-08-09', 0, 1),
(4, 'Agung Jaya Merdeka', 'Jagakarsa - Jaksel', 'Supplier Unilever', 2147483647, '', 2147483647, '2020-08-15', 0, 0),
(5, 'Ari Jaya Maxima', 'Jalan Terbahsari Sleman', 'Sales Matahari Internusa', 2147483647, '', 5, '2020-08-17', 0, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `get_produk`
-- (See below for the actual view)
--
CREATE TABLE `get_produk` (
`kd_produk` varchar(50)
,`kd_barcode` varchar(100)
,`nama_produk` varchar(100)
,`gambar` varchar(255)
,`harga_promo` double
,`harga_grosir` double
,`batas_grosir` int(5)
,`harga_eceran` double
,`stok` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `get_produk_stok`
-- (See below for the actual view)
--
CREATE TABLE `get_produk_stok` (
`kd_produk` varchar(50)
,`kd_barcode` varchar(100)
,`nama_produk` varchar(100)
,`gambar` varchar(255)
,`harga_promo` double
,`harga_grosir` double
,`batas_grosir` int(5)
,`harga_eceran` double
,`stok` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `master_delivery`
--

CREATE TABLE `master_delivery` (
  `id_delivery` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tarif` double NOT NULL,
  `jarak` double NOT NULL COMMENT 'Satuan KM',
  `create_date` date NOT NULL,
  `modified_date` date DEFAULT NULL,
  `create_by` int(3) DEFAULT NULL,
  `modified_by` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_delivery`
--

INSERT INTO `master_delivery` (`id_delivery`, `nama`, `tarif`, `jarak`, `create_date`, `modified_date`, `create_by`, `modified_by`) VALUES
(1, 'Potongan Ongkir Belanja 100.000', 1000, 1, '2020-04-25', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_margin`
--

CREATE TABLE `master_margin` (
  `id` int(10) NOT NULL,
  `margin` double NOT NULL DEFAULT 0,
  `create_date` timestamp NULL DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_margin`
--

INSERT INTO `master_margin` (`id`, `margin`, `create_date`, `create_by`) VALUES
(1, 10, '2020-06-25 22:54:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `master_pembelian`
--

CREATE TABLE `master_pembelian` (
  `id_pembelian` int(12) NOT NULL,
  `kd_trx_pembelian` varchar(50) NOT NULL,
  `total_pembelian` double NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL COMMENT 'user yang menambah',
  `keterangan` text NOT NULL,
  `id_suplier` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_pembelian`
--

INSERT INTO `master_pembelian` (`id_pembelian`, `kd_trx_pembelian`, `total_pembelian`, `created_date`, `created_by`, `keterangan`, `id_suplier`) VALUES
(1, 'BL200809095511', 1345000, '2020-08-09 09:56:36', 21, '-', 2),
(2, 'BL200809122520', 355000, '2020-08-09 12:26:28', 21, '-', 2),
(3, 'BL200809131955', 250000, '2020-08-09 13:21:54', 21, '-', 2);

-- --------------------------------------------------------

--
-- Table structure for table `master_penjualan`
--

CREATE TABLE `master_penjualan` (
  `id_pembelian` int(12) NOT NULL DEFAULT 0,
  `kd_trx_penjualan` varchar(50) NOT NULL,
  `total_penjualan` double NOT NULL,
  `ongkir` double NOT NULL DEFAULT 0 COMMENT 'apabila ada ongkir',
  `diskon_nota` double NOT NULL,
  `delivery` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 Tidak 1 Ya',
  `id_pelanggan` int(5) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `id_kasir` int(5) NOT NULL,
  `keterangan` text NOT NULL,
  `created_by` int(11) NOT NULL COMMENT 'user yang menambah',
  `created_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `master_produk`
--

CREATE TABLE `master_produk` (
  `kd_produk` varchar(50) NOT NULL,
  `kd_barcode` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `id_kategori` int(5) DEFAULT NULL,
  `promo` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 aktif 0 tidak',
  `harga_promo` double NOT NULL DEFAULT 0,
  `gambar_produk` varchar(255) NOT NULL,
  `k1` int(2) DEFAULT NULL,
  `k2` int(5) DEFAULT NULL,
  `batas_grosir` int(5) NOT NULL DEFAULT 0,
  `harga_grosir` double NOT NULL DEFAULT 0,
  `eceran` int(5) NOT NULL,
  `harga_eceran` double NOT NULL DEFAULT 0,
  `stok` int(5) NOT NULL DEFAULT 0,
  `batas_min_stok` int(5) NOT NULL DEFAULT 0,
  `batas_min_stok_persen` int(5) NOT NULL,
  `batas_max_stok` int(5) NOT NULL DEFAULT 0,
  `created_date` date NOT NULL DEFAULT current_timestamp(),
  `create_by` int(5) NOT NULL,
  `modified_by` int(5) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_produk`
--

INSERT INTO `master_produk` (`kd_produk`, `kd_barcode`, `nama_produk`, `id_kategori`, `promo`, `harga_promo`, `gambar_produk`, `k1`, `k2`, `batas_grosir`, `harga_grosir`, `eceran`, `harga_eceran`, `stok`, `batas_min_stok`, `batas_min_stok_persen`, `batas_max_stok`, `created_date`, `create_by`, `modified_by`, `keterangan`) VALUES
('089686060126', '089686060126', 'POP MIE BAKSO', 2, 0, 0, '', 10, NULL, 0, 0, 0, 0, 0, 0, 10, 200, '2020-08-16', 0, NULL, NULL),
('4801010120223', '4801010120223', 'JOHNSON BABY COLOGNE SLIDE', NULL, 0, 0, 'johnson-blue.jpeg', NULL, 0, 10, 0, 0, 0, 0, 3, 0, 20, '2020-08-09', 0, NULL, NULL),
('8992222055499', '8992222055499', 'GATSBY SIDESWEPT STYLING POMADE', NULL, 0, 0, 'gatsby-pomade.jpeg', NULL, 0, 10, 0, 0, 0, 0, 3, 0, 20, '2020-08-09', 0, NULL, NULL),
('8992779269103', '8992779269103', 'KIT MOTOR MULTIGUNA', NULL, 0, 0, 'kit-prod.jpeg', NULL, 0, 10, 0, 0, 0, 0, 3, 0, 20, '2020-08-09', 0, NULL, NULL),
('8997023620679', '8997023620679', 'EXTRA FOOD FRUIT VEGETABLE HPAI', NULL, 0, 0, '', NULL, 0, 5, 0, 0, 0, 0, 3, 0, 20, '2020-08-09', 0, NULL, NULL);

--
-- Triggers `master_produk`
--
DELIMITER $$
CREATE TRIGGER `before_produk_update` AFTER UPDATE ON `master_produk` FOR EACH ROW BEGIN
    INSERT INTO trx_history_harga_jual
    set kd_produk = OLD.kd_produk,
    harga=new.harga_eceran,
    modified_by = new.modified_by,
    tanggal_modified = CURDATE();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role_id`, `role`) VALUES
(1, 1, 'Pegawai'),
(2, 2, 'Kasir'),
(3, 3, 'Kabag'),
(4, 4, 'CEO');

-- --------------------------------------------------------

--
-- Table structure for table `role_akses`
--

CREATE TABLE `role_akses` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `submenu_id` int(11) NOT NULL,
  `info` text NOT NULL,
  `aktif` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_akses`
--

INSERT INTO `role_akses` (`id`, `role_id`, `menu_id`, `submenu_id`, `info`, `aktif`) VALUES
(1, 1, 1, 1, '', 1),
(2, 1, 1, 2, '', 1),
(3, 1, 1, 3, '', 1),
(4, 1, 2, 1, '', 1),
(5, 1, 2, 2, '', 1),
(6, 1, 2, 3, '', 1),
(7, 1, 3, 1, '', 1),
(8, 1, 3, 2, '', 1),
(9, 1, 3, 3, '', 1),
(10, 1, 4, 1, '', 1),
(11, 1, 4, 2, '', 1),
(12, 1, 4, 3, '', 1),
(13, 1, 5, 1, '', 1),
(14, 1, 5, 2, '', 1),
(15, 1, 5, 3, '', 1),
(16, 2, 1, 1, '', 1),
(17, 2, 1, 2, '', 1),
(18, 2, 1, 3, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `role_menu`
--

CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL,
  `catatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_menu`
--

INSERT INTO `role_menu` (`id`, `menu_id`, `menu`, `catatan`) VALUES
(1, 1, 'PENJUALAN', ''),
(2, 2, 'PEMBELIAN', ''),
(3, 3, 'STOK', ''),
(4, 4, 'PEGAWAI', ''),
(5, 5, 'PEMBUKUAN', ''),
(6, 6, 'SETTING', '');

-- --------------------------------------------------------

--
-- Table structure for table `role_submenu`
--

CREATE TABLE `role_submenu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `submenu` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_submenu`
--

INSERT INTO `role_submenu` (`id`, `menu_id`, `submenu`, `url`, `icon`) VALUES
(1, 1, 'Kasir', 'jual_kasir', 'far fa-circle'),
(2, 1, 'Harga Jual', '', ''),
(3, 1, 'Pelanggan', '', ''),
(4, 2, 'Pembelian', '', ''),
(5, 2, 'Pengeluaran', '', ''),
(6, 2, 'Pemasok', '', ''),
(7, 3, 'Stok', '', ''),
(8, 3, 'Kategori', '', ''),
(9, 3, 'Kemasan', '', ''),
(10, 4, 'Data Pegawai', '', ''),
(11, 5, 'Daftar', '', ''),
(12, 6, 'Kode Cetak', '', ''),
(13, 6, 'Role', '', ''),
(14, 6, 'Role Akses', '', ''),
(15, 6, 'Menu', '', ''),
(16, 6, 'Submenu', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(5) NOT NULL,
  `nama_apps` varchar(255) NOT NULL,
  `nama_usaha` varchar(255) NOT NULL,
  `alamat_usaha` varchar(255) NOT NULL,
  `no_tlpn` varchar(50) NOT NULL,
  `no_wa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `nama_apps`, `nama_usaha`, `alamat_usaha`, `no_tlpn`, `no_wa`) VALUES
(1, 'MobieCash', '', '', '085815962808', '085812222');

-- --------------------------------------------------------

--
-- Stand-in structure for view `suplier_pembelian`
-- (See below for the actual view)
--
CREATE TABLE `suplier_pembelian` (
`id_pembelian` int(12)
,`kd_trx_pembelian` varchar(50)
,`kd_produk` varchar(50)
,`nama_barang` varchar(255)
,`harga` double
,`qty` int(10)
,`stok` int(5)
,`total` double
,`diskon` double
,`kd_satuan` int(11)
,`keterangan` text
,`created_date` date
,`id_suplier` int(5)
);

-- --------------------------------------------------------

--
-- Table structure for table `table_menu_icon`
--

CREATE TABLE `table_menu_icon` (
  `id` int(5) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `urutan_kat` int(5) NOT NULL,
  `id_produk` int(5) NOT NULL,
  `urutan_produk` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori_produk`
--

CREATE TABLE `tb_kategori_produk` (
  `id` int(11) NOT NULL,
  `kategori` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_kategori_produk`
--

INSERT INTO `tb_kategori_produk` (`id`, `kategori`, `slug`) VALUES
(1, 'Minuman', 'minuman'),
(2, 'Makanan Ringan', 'makanan-ringan'),
(3, 'Makanan Kaleng', 'makanan-kaleng'),
(4, 'Bumbu Masak', 'bumbu-masak'),
(5, 'Permen', 'permen'),
(6, 'Minuman Kotak', 'minuman-kotak'),
(7, 'Minuman Kaleng', 'minuman-kaleng'),
(8, 'Mie Instan', 'mie-instan');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kemasan`
--

CREATE TABLE `tb_kemasan` (
  `id` int(11) NOT NULL,
  `kd_kemasan` varchar(50) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `tipe` int(2) NOT NULL COMMENT '1 eceran\r\n2 grosir\r\n3 kemasan khusus'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_kemasan`
--

INSERT INTO `tb_kemasan` (`id`, `kd_kemasan`, `nama`, `tipe`) VALUES
(1, 'sak', 'Sak', 0),
(2, 'box', 'Box', 0),
(3, 'slp', 'Slop', 0),
(4, 'krt', 'Karton', 0),
(5, 'bal', 'Bal', 0),
(6, 'pak', 'Pak', 0),
(7, 'sct', 'Sachet', 0),
(8, 'btl', 'Botol', 0),
(9, 'klg', 'Kaleng', 0),
(10, 'bks', 'Bungkus', 0),
(11, 'gln', 'Galon', 0);

-- --------------------------------------------------------

--
-- Table structure for table `trx_history_harga_jual`
--

CREATE TABLE `trx_history_harga_jual` (
  `id_history_jual` int(10) NOT NULL,
  `kd_produk` varchar(50) NOT NULL,
  `harga` double NOT NULL,
  `tanggal_modified` datetime NOT NULL DEFAULT current_timestamp(),
  `keterangan` text DEFAULT NULL,
  `modified_by` int(5) DEFAULT NULL COMMENT 'user yang merubah'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trx_history_harga_jual`
--

INSERT INTO `trx_history_harga_jual` (`id_history_jual`, `kd_produk`, `harga`, `tanggal_modified`, `keterangan`, `modified_by`) VALUES
(1, 'BRS0001', 58000, '2020-05-01 00:00:00', NULL, 0),
(2, 'BRS0001', 58000, '2020-05-01 00:00:00', NULL, 0),
(3, 'BRS0001', 58000, '2020-05-01 00:00:00', NULL, 0),
(4, 'BRS0001', 58000, '2020-05-07 00:00:00', NULL, 0),
(5, 'BRS0001', 58000, '2020-05-07 00:00:00', NULL, 0),
(6, 'BRS0001', 58000, '2020-05-14 00:00:00', NULL, 0),
(7, 'LP00D1', 27000, '2020-05-17 00:00:00', NULL, NULL),
(8, '8992222055499', 14000, '2020-07-19 00:00:00', NULL, NULL),
(9, '8992771002975', 16000, '2020-07-19 00:00:00', NULL, NULL),
(10, '8992771002975', 16000, '2020-08-03 00:00:00', NULL, NULL),
(11, '4801010120223', 16000, '2020-08-03 00:00:00', NULL, NULL),
(12, 'LP00D1', 27000, '2020-08-03 00:00:00', NULL, NULL),
(13, '8992779269103', 27000, '2020-08-03 00:00:00', NULL, NULL),
(14, '', 0, '2020-08-16 00:00:00', NULL, NULL),
(15, '', 0, '2020-08-16 00:00:00', NULL, NULL),
(16, '', 0, '2020-08-16 00:00:00', NULL, NULL),
(17, '089686060126', 0, '2020-08-20 00:00:00', NULL, NULL),
(18, '089686060126', 0, '2020-08-20 00:00:00', NULL, NULL),
(19, '089686060126', 0, '2020-08-20 00:00:00', NULL, NULL),
(20, '4801010120223', 0, '2020-08-30 00:00:00', NULL, NULL),
(21, '8992222055499', 0, '2020-09-03 00:00:00', NULL, NULL),
(22, '8992779269103', 0, '2020-09-03 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trx_pembelian`
--

CREATE TABLE `trx_pembelian` (
  `id_pembelian` int(12) NOT NULL,
  `kd_trx_pembelian` varchar(50) NOT NULL,
  `kd_produk` varchar(50) NOT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `harga` double NOT NULL,
  `qty` int(10) NOT NULL,
  `stok` int(5) NOT NULL,
  `total` double NOT NULL DEFAULT 0,
  `diskon` double NOT NULL DEFAULT 0,
  `kd_satuan` int(11) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trx_pembelian`
--

INSERT INTO `trx_pembelian` (`id_pembelian`, `kd_trx_pembelian`, `kd_produk`, `nama_barang`, `harga`, `qty`, `stok`, `total`, `diskon`, `kd_satuan`, `keterangan`, `created_date`) VALUES
(1, 'BL200809095511', '4801010120223', 'JOHNSON BABY COLOGNE SLIDE', 15000, 20, 98, 300000, 0, NULL, NULL, '2020-08-09'),
(2, 'BL200809095511', '8992779269103', 'KIT MOTOR MULTIGUNA', 13000, 15, 99, 195000, 0, NULL, NULL, '2020-08-09'),
(3, 'BL200809095511', '8992222055499', 'GATSBY SIDESWEPT STYLING POMADE', 10000, 25, 97, 250000, 0, NULL, NULL, '2020-08-09'),
(4, 'BL200809095511', '8997023620679', 'EXTRA FOOD FRUIT VEGETABLE HPAI', 60000, 10, 1000, 600000, 0, NULL, NULL, '2020-08-09'),
(8, 'BL200809122520', '8992222055499', 'GATSBY SIDESWEPT STYLING POMADE', 10500, 10, 1000, 105000, 0, NULL, NULL, '2020-08-10'),
(9, 'BL200809122520', '8992779269103', 'KIT MOTOR MULTIGUNA', 12500, 20, 100, 250000, 0, NULL, NULL, '2020-08-10'),
(11, 'BL200809131955', '4801010120223', 'JOHNSON BABY COLOGNE SLIDE', 14000, 10, 1000, 140000, 0, NULL, NULL, '2020-08-09'),
(12, 'BL200809131955', '8992222055499', 'GATSBY SIDESWEPT STYLING POMADE', 11000, 100, 0, 110000, 0, NULL, NULL, '2020-08-09');

-- --------------------------------------------------------

--
-- Table structure for table `trx_pembelian_temp`
--

CREATE TABLE `trx_pembelian_temp` (
  `id_pembelian` int(12) NOT NULL,
  `kd_trx_pembelian` varchar(50) NOT NULL,
  `kd_produk` varchar(50) NOT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `harga` double NOT NULL,
  `qty` int(10) NOT NULL,
  `total` double NOT NULL DEFAULT 0,
  `diskon` double NOT NULL DEFAULT 0,
  `kd_satuan` int(11) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `trx_penjualan`
--

CREATE TABLE `trx_penjualan` (
  `id_penjualan` int(12) NOT NULL,
  `kd_trx_penjualan` varchar(50) NOT NULL,
  `kd_produk` varchar(50) NOT NULL,
  `kd_trx_pembelian` varchar(25) NOT NULL,
  `id_pembelian` int(10) DEFAULT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `qty` int(10) NOT NULL,
  `total` double NOT NULL DEFAULT 0,
  `diskon` double NOT NULL DEFAULT 0,
  `kd_satuan` int(11) NOT NULL,
  `created_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trx_penjualan`
--

INSERT INTO `trx_penjualan` (`id_penjualan`, `kd_trx_penjualan`, `kd_produk`, `kd_trx_pembelian`, `id_pembelian`, `nama_barang`, `harga`, `qty`, `total`, `diskon`, `kd_satuan`, `created_date`) VALUES
(1, 'JL200817223828', '4801010120223', 'BL200809095511', NULL, 'JOHNSON BABY COLOGNE SLIDE', 15400, 1, 15400, 0, 0, '2020-08-17'),
(2, 'JL200817223828', '8992222055499', 'BL200809095511', NULL, 'GATSBY SIDESWEPT STYLING POMADE', 12100, 1, 12100, 0, 0, '2020-08-17'),
(3, 'JL200817223828', '4801010120223', 'BL200809095511', NULL, 'JOHNSON BABY COLOGNE SLIDE', 15400, 1, 15400, 0, 0, '2020-08-17'),
(4, 'JL200817223828', '4801010120223', 'BL200809095511', NULL, 'JOHNSON BABY COLOGNE SLIDE', 15400, 1, 15400, 0, 0, '2020-08-17'),
(5, 'JL200821235042', '4801010120223', 'BL200809095511', NULL, 'JOHNSON BABY COLOGNE SLIDE', 15400, 1, 15400, 0, 0, '2020-08-21');

-- --------------------------------------------------------

--
-- Table structure for table `trx_penjualan_tmp`
--

CREATE TABLE `trx_penjualan_tmp` (
  `id_penjualan` int(12) NOT NULL,
  `kd_trx_penjualan` varchar(50) NOT NULL,
  `kd_produk` varchar(50) NOT NULL,
  `kd_trx_pembelian` varchar(25) NOT NULL,
  `id_pembelian` int(10) DEFAULT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `qty` int(10) NOT NULL,
  `sub_total` double NOT NULL,
  `diskon` double NOT NULL DEFAULT 0,
  `kd_satuan` int(11) NOT NULL DEFAULT 0,
  `created_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trx_penjualan_tmp`
--

INSERT INTO `trx_penjualan_tmp` (`id_penjualan`, `kd_trx_penjualan`, `kd_produk`, `kd_trx_pembelian`, `id_pembelian`, `nama_barang`, `harga`, `qty`, `sub_total`, `diskon`, `kd_satuan`, `created_date`) VALUES
(1, 'JL200911130734', '8992222055499', '', NULL, 'GATSBY SIDESWEPT STYLING POMADE', 12100, 0, 0, 0, 0, '2020-09-11'),
(2, 'JL200911130734', '1', '', NULL, 'bayam', 0, 0, 0, 0, 0, '2020-09-11');

-- --------------------------------------------------------

--
-- Table structure for table `trx_search_temp`
--

CREATE TABLE `trx_search_temp` (
  `id` int(10) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `count` int(5) NOT NULL,
  `expired` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trx_search_temp`
--

INSERT INTO `trx_search_temp` (`id`, `nama_produk`, `harga`, `count`, `expired`) VALUES
(1, 'bayam', 12000, 3, '2020-09-30 13:30:18'),
(2, 'bayam', 0, 1, '0000-00-00 00:00:00'),
(3, 'bawang', 0, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$08$200Z6ZZbp3RAEXoaWcMA6uJOFicwNZaqk4oDhqTUiFXFe63MG.Daa', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1268889823, 1, 'Admin', 'istrator', 'ADMIN', '0');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure for view `get_produk`
--
DROP TABLE IF EXISTS `get_produk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `get_produk`  AS  select `a`.`kd_produk` AS `kd_produk`,`b`.`kd_barcode` AS `kd_barcode`,`b`.`nama_produk` AS `nama_produk`,`b`.`gambar_produk` AS `gambar`,`b`.`harga_promo` AS `harga_promo`,`b`.`harga_grosir` AS `harga_grosir`,`b`.`batas_grosir` AS `batas_grosir`,`b`.`harga_eceran` AS `harga_eceran`,sum(`a`.`stok`) AS `stok` from (`master_produk` `b` left join `trx_pembelian` `a` on(`b`.`kd_produk` = `a`.`kd_produk`)) group by `a`.`kd_produk` ;

-- --------------------------------------------------------

--
-- Structure for view `get_produk_stok`
--
DROP TABLE IF EXISTS `get_produk_stok`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `get_produk_stok`  AS  select `b`.`kd_produk` AS `kd_produk`,`b`.`kd_barcode` AS `kd_barcode`,`b`.`nama_produk` AS `nama_produk`,`b`.`gambar_produk` AS `gambar`,`b`.`harga_promo` AS `harga_promo`,`b`.`harga_grosir` AS `harga_grosir`,`b`.`batas_grosir` AS `batas_grosir`,`b`.`harga_eceran` AS `harga_eceran`,sum(`a`.`stok`) AS `stok` from (`master_produk` `b` left join `trx_pembelian` `a` on(`b`.`kd_produk` = `a`.`kd_produk`)) group by `a`.`kd_produk` ;

-- --------------------------------------------------------

--
-- Structure for view `suplier_pembelian`
--
DROP TABLE IF EXISTS `suplier_pembelian`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `suplier_pembelian`  AS  select `a`.`id_pembelian` AS `id_pembelian`,`a`.`kd_trx_pembelian` AS `kd_trx_pembelian`,`a`.`kd_produk` AS `kd_produk`,`a`.`nama_barang` AS `nama_barang`,`a`.`harga` AS `harga`,`a`.`qty` AS `qty`,`a`.`stok` AS `stok`,`a`.`total` AS `total`,`a`.`diskon` AS `diskon`,`a`.`kd_satuan` AS `kd_satuan`,`a`.`keterangan` AS `keterangan`,`a`.`created_date` AS `created_date`,`b`.`id_suplier` AS `id_suplier` from (`trx_pembelian` `a` left join `master_pembelian` `b` on(`a`.`kd_trx_pembelian` = `b`.`kd_trx_pembelian`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_kode_cetak`
--
ALTER TABLE `data_kode_cetak`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_pegawai`
--
ALTER TABLE `data_pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_pelanggan`
--
ALTER TABLE `data_pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_suplier`
--
ALTER TABLE `data_suplier`
  ADD PRIMARY KEY (`id_suplier`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_delivery`
--
ALTER TABLE `master_delivery`
  ADD PRIMARY KEY (`id_delivery`);

--
-- Indexes for table `master_margin`
--
ALTER TABLE `master_margin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_pembelian`
--
ALTER TABLE `master_pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `master_produk`
--
ALTER TABLE `master_produk`
  ADD PRIMARY KEY (`kd_produk`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_akses`
--
ALTER TABLE `role_akses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_menu`
--
ALTER TABLE `role_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_submenu`
--
ALTER TABLE `role_submenu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_menu_icon`
--
ALTER TABLE `table_menu_icon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_kategori_produk`
--
ALTER TABLE `tb_kategori_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_kemasan`
--
ALTER TABLE `tb_kemasan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trx_history_harga_jual`
--
ALTER TABLE `trx_history_harga_jual`
  ADD PRIMARY KEY (`id_history_jual`);

--
-- Indexes for table `trx_pembelian`
--
ALTER TABLE `trx_pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `trx_pembelian_temp`
--
ALTER TABLE `trx_pembelian_temp`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `trx_penjualan`
--
ALTER TABLE `trx_penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indexes for table `trx_penjualan_tmp`
--
ALTER TABLE `trx_penjualan_tmp`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indexes for table `trx_search_temp`
--
ALTER TABLE `trx_search_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_kode_cetak`
--
ALTER TABLE `data_kode_cetak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `data_pegawai`
--
ALTER TABLE `data_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `data_pelanggan`
--
ALTER TABLE `data_pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `data_suplier`
--
ALTER TABLE `data_suplier`
  MODIFY `id_suplier` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_delivery`
--
ALTER TABLE `master_delivery`
  MODIFY `id_delivery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `master_margin`
--
ALTER TABLE `master_margin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `master_pembelian`
--
ALTER TABLE `master_pembelian`
  MODIFY `id_pembelian` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role_akses`
--
ALTER TABLE `role_akses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `role_menu`
--
ALTER TABLE `role_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `role_submenu`
--
ALTER TABLE `role_submenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `table_menu_icon`
--
ALTER TABLE `table_menu_icon`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_kategori_produk`
--
ALTER TABLE `tb_kategori_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_kemasan`
--
ALTER TABLE `tb_kemasan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `trx_history_harga_jual`
--
ALTER TABLE `trx_history_harga_jual`
  MODIFY `id_history_jual` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `trx_pembelian`
--
ALTER TABLE `trx_pembelian`
  MODIFY `id_pembelian` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `trx_pembelian_temp`
--
ALTER TABLE `trx_pembelian_temp`
  MODIFY `id_pembelian` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trx_penjualan`
--
ALTER TABLE `trx_penjualan`
  MODIFY `id_penjualan` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `trx_penjualan_tmp`
--
ALTER TABLE `trx_penjualan_tmp`
  MODIFY `id_penjualan` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trx_search_temp`
--
ALTER TABLE `trx_search_temp`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
