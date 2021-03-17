-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2021 at 06:15 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopforall`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Pran Acharjee', 'admin@gmail.com', '2021-02-19 21:22:41', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XyvcG86rbJ', '2021-02-19 21:22:41', '2021-02-19 21:22:41');

-- --------------------------------------------------------

--
-- Table structure for table `admin_orders`
--

CREATE TABLE `admin_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userOrder_id` int(11) DEFAULT NULL,
  `userOrder_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_orders`
--

INSERT INTO `admin_orders` (`id`, `userOrder_id`, `userOrder_ip`, `delivary`, `created_at`, `updated_at`) VALUES
(26, NULL, '::1', '1', '2021-02-26 23:59:52', '2021-02-27 00:12:12'),
(27, NULL, '::1', '1', '2021-02-27 12:18:00', '2021-02-27 12:19:58'),
(28, 4, NULL, NULL, '2021-02-27 20:49:13', '2021-02-27 20:49:13');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `product_quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `conferm` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `user_id`, `ip_address`, `order_id`, `product_quantity`, `conferm`, `created_at`, `updated_at`) VALUES
(55, 7, NULL, '::1', NULL, 1, 1, '2021-02-26 23:54:27', '2021-02-27 00:12:11'),
(56, 9, NULL, '::1', NULL, 1, 1, '2021-02-27 00:13:26', '2021-02-27 12:19:58'),
(57, 9, NULL, '::1', NULL, 1, 1, '2021-02-27 12:17:39', '2021-02-27 12:19:58'),
(58, 6, NULL, '::1', NULL, 1, NULL, '2021-02-27 14:43:52', '2021-02-27 14:43:52'),
(59, 12, 4, NULL, NULL, 1, 0, '2021-02-27 20:48:51', '2021-02-27 20:49:13'),
(60, 11, 4, NULL, NULL, 1, NULL, '2021-02-27 20:49:47', '2021-02-27 20:49:47');

-- --------------------------------------------------------

--
-- Table structure for table `catagories`
--

CREATE TABLE `catagories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `catagories`
--

INSERT INTO `catagories` (`id`, `name`, `description`, `image`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'CAR', 'vcvvvvvvvvvvv', 'car-icon.jpg', 1, '2021-02-23 15:23:36', '2021-02-23 15:23:36'),
(3, 'TV', 'sfffffffff', 'tv.png', 1, '2021-02-27 04:36:25', '2021-02-27 04:36:25'),
(4, 'Rice', 'sfffffffff', 'rice-icon.png', 1, '2021-02-27 04:36:25', '2021-02-27 04:36:25'),
(5, 'Egg', 'dfsggggg', 'egg-icon.png', 1, '2021-02-27 04:38:43', '2021-02-27 04:38:43'),
(6, 'Laptop', 'dfsggggg', 'laptop-icon.png', 1, '2021-02-27 04:38:43', '2021-02-27 04:38:43'),
(7, 'Door', 'dfsggggg', 'door-icon.png', 1, '2021-02-27 04:38:43', '2021-02-27 04:38:43'),
(8, 'Fan', 'dfsggggg', 'fan-icon.png', 1, '2021-02-27 04:38:43', '2021-02-27 04:38:43'),
(9, 'Friger', 'dfsggggg', 'friger.jpg', 1, '2021-02-27 04:38:43', '2021-02-27 04:38:43'),
(10, 'Grocery', 'dfsggggg', 'grocery.png', 1, '2021-02-27 04:38:43', '2021-02-27 04:38:43'),
(11, 'Toy', 'dfsggggg', 'toy-icon.jpg', 1, '2021-02-27 04:38:43', '2021-02-27 04:38:43');

-- --------------------------------------------------------

--
-- Table structure for table `dashes`
--

CREATE TABLE `dashes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `division` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `district`, `division`, `created_at`, `updated_at`) VALUES
(2, 'dhaka', 'Dhaka', '2021-02-19 23:42:27', '2021-02-19 23:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prority` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `division`, `prority`, `created_at`, `updated_at`) VALUES
(2, 'Dhakas', 1, '2021-02-19 23:31:29', '2021-02-22 23:28:47');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_10_05_042556_create_sessions_table', 1),
(7, '2021_02_01_144749_create_admins_table', 1),
(9, '2021_02_19_134619_create_products_table', 2),
(10, '2021_02_19_140029_create_slides_table', 3),
(11, '2021_02_19_151538_create_product_images_table', 4),
(12, '2021_02_19_152047_create_divisions_table', 5),
(13, '2021_02_19_153355_create_districts_table', 6),
(14, '2014_10_12_000000_create_users_table', 7),
(15, '2021_02_20_140425_create_reviews_table', 8),
(19, '2021_02_20_155627_create_profiles_table', 9),
(20, '2021_02_20_155958_create_dashes_table', 9),
(21, '2021_02_20_183548_create_user_alls_table', 9),
(32, '2021_02_20_143828_create_carts_table', 12),
(33, '2021_02_20_144659_create_orders_table', 12),
(34, '2021_02_19_134601_create_catagories_table', 13),
(35, '2021_02_23_041733_create_admin_orders_table', 14);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `product_quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conferm` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `product_id`, `user_id`, `ip_address`, `order_id`, `product_quantity`, `name`, `email`, `phone`, `payment`, `address`, `conferm`, `created_at`, `updated_at`) VALUES
(49, 7, NULL, '::1', NULL, 1, 'Rahul Acharjee', 'acharjeep513@gmail.com', '0180000000', 'Cash on Delivery', 'HASHIMPUR', 1, '2021-02-26 23:54:27', '2021-02-27 00:12:12'),
(50, 9, NULL, '::1', NULL, 2, 'Rahul Acharjee', 'acharjeep513@gmail.com', '0180000000', 'Cash on Delivery', 'HASHIMPUR', 1, '2021-02-27 00:13:26', '2021-02-27 12:19:58'),
(51, 6, NULL, '::1', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-27 14:43:53', '2021-02-27 14:43:53'),
(52, 12, 4, NULL, NULL, 1, 'Rahul Acharjee', 'acharjeep513@gmail.com', '0180000000', 'Cash on Delivery', 'HASHIMPUR', 0, '2021-02-27 20:48:51', '2021-02-27 20:49:13'),
(53, 11, 4, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-27 20:49:47', '2021-02-27 20:49:47');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `catagory_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `oder_price` int(11) DEFAULT NULL,
  `admin_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `catagory_id`, `brand_id`, `title`, `description`, `slug`, `quantity`, `price`, `status`, `oder_price`, `admin_id`, `created_at`, `updated_at`) VALUES
(6, 1, 1, 'TOYOTA PREMIO  CAR', 'Product details of TOYOTA PREMIO Year: 2017\r\nCOLOR PEARL \r\ncc 1500             \r\nMilage:3,00\r\nAuction grade: 4.5\r\nChassis No:NZT260-3200356\r\nEngine No:1NZ-8389673', 'CAR', 1, 9000, 0, NULL, 1, '2021-02-20 22:31:23', '2021-02-20 22:31:23'),
(7, 1, 1, 'Proton The New Saga Car - ', 'Product details of Proton The New Saga Car - Silver The New Saga Engine Type Fuel Supply System Bore & Stroke (mm) Displacement (cc) Compression Ratio Maximum Horsepower [kW(hp)@rpm] Maximum Torque [Nm(kg-m)@rpm]', 'CAR', 1, 1850, 0, NULL, 1, '2021-02-21 22:01:44', '2021-02-21 22:01:44'),
(8, 1, 1, 'SHINE RAY X30', 'Product details of SHINE RAY X30-EXCLUSIVE 08 SEATER CAR 08 Seater 5 Speed Manual Transmission Stylish Instrument Cluster MP3, Radio And USB Specious ', 'CAR', 1, 14500, 0, NULL, 1, '2021-02-21 22:03:05', '2021-02-21 22:03:05'),
(9, 1, 1, '2019 Kia Soul EX', 'Product details of 2019 Kia Soul EX Name of Manufacturer : Kia Motors Corporation Country of Origin : South Korea Country of Manufacturing', 'CAR', 1, 34000, 0, NULL, 1, '2021-02-21 22:04:36', '2021-02-21 22:04:36'),
(10, 2, 1, 'Vikan HD LED TV', 'Product details of 32 \'\' VIKAN ULTRA SLIM HD lED TV BRAND= VIKAN MODEL= SMILE Power : 74W Low voltage & 90% saving your power .. Free Thunderstorm Protector FREE WALL MOUNT Panel & TECHNOLOGY: Taiwan parts/Assembly: China ★ 12month Display panel / parts respleasement Guaranty 10 year free service without parts . tv any problem contacts warryntee card mobail namber . solv early . products er back side e security any stiker not remove', 'TV', 1, 13900, 0, NULL, 1, '2021-02-21 22:10:16', '2021-02-21 22:10:16'),
(11, 2, 1, '40 \'\' Vikan HD ', 'Power : 74W Low voltage & 90% saving your power .. Free Thunderstorm Protector FREE WALL MOUNT Manufacture = Panel & TECHNOLOGY: Taiwan parts/Assembly: China ★ 12month Display panel / parts respleasement Guaranty 10 year free service without parts . tv any problem contacts warryntee card mobail namber . solv early . products er back side e security any stiker not remove টিভি যে কোনও সমস্যাই ওয়ারেন্ট ই কার্ড এরমোবাইল নাম্বার এ যোগাযোগ করবেন । দ্রুত সমাধান হবে।', 'TV', 1, 18500, 0, NULL, 1, '2021-02-21 22:11:42', '2021-02-21 22:11:42'),
(12, 2, 1, 'Transtec 32\" ', 'Product details of Transtec 32\" Edgeless Boomstation LED TV 32S6E Display: DLED Aspect Ratio: 16:9 Resolution:1366*768 ROM Size(GB):8 RAM Size(GB):1 Operating System:Android 9.0 WIFI:Yes Sound System:Sterio Maximum Audio Output:2×8W Color Temperature Adjustment:Yes HDMI:2 VGA:1 USB:2 Power Consumption (Max):56 WPower Requirement:AC 100-240V 50/60Hz', 'TV', 1, 19900, 0, NULL, 1, '2021-02-21 22:14:06', '2021-02-21 22:14:06'),
(13, 3, 1, 'Mozammel 20kg', 'Product details of Mozammel Special Miniket Rice 20Kg Product Type: Rice Weight: 20Kg Model: Miniket Fresh hard texture', 'Rice', 1, 1329, 0, NULL, 1, '2021-02-21 22:19:22', '2021-02-21 22:19:22'),
(14, 3, 1, 'Rupchanda rice - 20kg', 'Product details of Rupchanda Minicate Rice - 20kg Product Type: Rice Capacity: 20kg Brand: Rupchanda Type:Minicate Good Quality Product', 'Rice', 1, 1300, 0, NULL, 1, '2021-02-21 22:21:53', '2021-02-21 22:21:53'),
(15, 4, 1, 'Electric Egg Boiler', 'Product details of Electric Egg Boiler Boils up to 7 eggs at one time Quick to set up and easy to clean Includes egg holder Capacity: 7 Eggs Voltage: 220V/50Hz Power: 350W Electric Egg Boiler Product Type: Electric Egg Boiler Color: Multicolor', 'Egg', 1, 550, 0, NULL, 1, '2021-02-21 22:24:10', '2021-02-21 22:24:10'),
(16, 4, 1, 'Egg Steamer Electric Egg ', 'Product details of Egg Steamer Electric Egg Poacher Egg Boiler 7 Egg Capacity - Multi Capacity: 7 Eggs Voltage: 220V/ 50Hz Power: 350W Egg Cooker Electric Egg Boiler Egg poacher', 'Egg', 1, 499, 0, NULL, 1, '2021-02-21 22:25:29', '2021-02-21 22:25:29'),
(17, 5, 1, 'AVITA Essential', 'Product details of AVITA Essential NE14A2INC433-MB 14-inch Laptop (Celeron N4000/4GB/256GB SSD/Window 10 Home in S Mode/Integrated Graphics), Matt Black Processor: Celeron N4000 processor, 1.10 GHz base processor speed, 2.60 GHz Max speed Operating System: Pre-loaded Windows 10 Home in S Mode In the box Laptop, AC Adapter, User Guide, Manuals Display: 14-inch screen (1920X1080) FHD display Connectivity: 802.11 b/g/n/ac Wi-Fi and Bluetooth 4.0 Memory & Storage: 4 GB DDR4 RAM with intel integrated UHD Graphics', 'Laptop', 1, 28600, 0, NULL, 1, '2021-02-21 22:27:57', '2021-02-21 22:27:57'),
(18, 5, 1, 'Walton Prelude SSD', 'Product details of Walton Prelude A9 Slim & Slick, AMD A9-9425 3.10GHz up to 3.70GHz, 4GB DDR4 RAM, 240GB SATAIII M.2 2280 SSD 35.81cm (14.1\") HD Matte LED backlit display AMD A9-9425 3.10GHz up to 3.70GHz 240GB SATAIII M.2 2280 SSD 4GB DDR4 RAM AMD Radeon R5 Graphics High Definition Audio 802.11ac WLAN + BT4.2 Color: Black', 'Laptop', 1, 25000, 0, NULL, 1, '2021-02-21 22:29:02', '2021-02-21 22:29:02'),
(19, 6, 1, 'সুস্থতায় ব্যায়াম', 'Product details of সুস্থতায় ব্যায়াম লেখক: উম্মে শায়লা রুমকী বিষয়: Health আইএসবিএন: 978-984-8040-43-0 মুদ্রিত মূল্য: 200 পৃষ্ঠা সংখ্যা: 64', 'Book', 1, 57, 0, NULL, 1, '2021-02-21 22:31:04', '2021-02-21 22:31:04'),
(21, 7, 1, 'Eco Door Spring', 'Product details of Eco Door Spring Opening System: Right Handed Size: 7 feet X 2.5 feet Locking System: Tower Bolt Material: uPVC Eco friendly Fire retardant Moisture-proof Termite proof Borer proof Non-aging Door opens inwards No shrinking or no expansion Easy to assemble', 'Door', 1, 2850, 0, NULL, 1, '2021-02-21 22:45:49', '2021-02-21 22:45:49'),
(22, 7, 1, 'Eco Special Door', 'Product details of Eco Special Door Gerbera Opening System: Right Handed Size: 6,5 feet X 2.5 feet Locking System: Tower Bolt Material: uPVC Eco friendly Fire retardant Moisture-proof Termite proof Borer proof Non-aging Door opens inwards No shrinking or no expansion Easy to assemble Attractive appearance', 'Door', 1, 2300, 0, NULL, 1, '2021-02-21 22:47:03', '2021-02-21 22:47:03'),
(23, 8, 1, 'Conion Ceiling Fan 56”-', 'Product details of Conion Ceiling Fan Signature 56”- 4 Blades - Sparking Blue Blades: 4 RPM: 305 Color: Sparkling Blue Consumption in watts: 80 Energy Saving System Ultra High Speed (UHS) Technology Air Delivery: 280 CBM/min Ribbed Aluminum Blades', 'Fan', 1, 3467, 0, NULL, 1, '2021-02-21 22:50:17', '2021-02-21 22:50:17'),
(24, 8, 1, 'Misushita Wall Fan WF-16', 'Product details of Misushita Wall Fan WF-16 Brand: Misushita Made In Thailand Model No: WF-16 Voltage 220 V 50 HZ 53 W / 0.24 A Fan Size 16 inch Weight 3.4kg Revolution Speed 0.9m3/min/W Box Size (375*375*197) mm 16 inch(3 Part,) Fan blade. Special standard front and black safety grill. 3 Speed Fan 3 Years Warranty.', 'Fan', 1, 4350, 0, NULL, 1, '2021-02-21 22:51:27', '2021-02-21 22:51:27');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 4, 'a.jpg', '2021-02-19 23:17:56', '2021-02-19 23:17:56'),
(2, 4, 'a.jpg', '2021-02-19 23:17:56', '2021-02-19 23:17:56'),
(3, 4, 'a.jpg', '2021-02-19 23:17:56', '2021-02-19 23:17:56'),
(4, 5, 'a.jpg', '2021-02-20 22:30:12', '2021-02-20 22:30:12'),
(5, 5, 'a.jpg', '2021-02-20 22:30:12', '2021-02-20 22:30:12'),
(6, 6, 'car1.jpg', '2021-02-20 22:31:23', '2021-02-20 22:31:23'),
(7, 6, 'car2.jpg', '2021-02-20 22:31:23', '2021-02-20 22:31:23'),
(8, 1, 'car3.jpg', '2021-02-20 23:21:50', '2021-02-20 23:21:50'),
(9, 1, 'car4.jpg', '2021-02-20 23:21:50', '2021-02-20 23:21:50'),
(10, 2, 'tv1.jpg', '2021-02-20 23:24:07', '2021-02-20 23:24:07'),
(11, 2, 'tv2.jpg', '2021-02-20 23:24:07', '2021-02-20 23:24:07'),
(12, 7, 'car3.jpg', '2021-02-21 22:01:44', '2021-02-21 22:01:44'),
(13, 7, 'car3.jpg', '2021-02-21 22:01:44', '2021-02-21 22:01:44'),
(14, 8, 'car4.jpg', '2021-02-21 22:03:05', '2021-02-21 22:03:05'),
(15, 9, 'car4.jpg', '2021-02-21 22:04:36', '2021-02-21 22:04:36'),
(16, 9, 'car1.jpg', '2021-02-21 22:04:36', '2021-02-21 22:04:36'),
(17, 10, 'tv1.webp', '2021-02-21 22:10:16', '2021-02-21 22:10:16'),
(18, 11, 'tv2.jpg', '2021-02-21 22:11:42', '2021-02-21 22:11:42'),
(19, 12, 'tv3.jpg', '2021-02-21 22:14:07', '2021-02-21 22:14:07'),
(20, 13, 'rice1.jpg', '2021-02-21 22:19:22', '2021-02-21 22:19:22'),
(21, 14, 'rice2.jpg', '2021-02-21 22:21:53', '2021-02-21 22:21:53'),
(22, 15, 'egg1.jpg', '2021-02-21 22:24:10', '2021-02-21 22:24:10'),
(23, 16, 'egg2.jpg', '2021-02-21 22:25:29', '2021-02-21 22:25:29'),
(24, 17, 'laptop1.jpg', '2021-02-21 22:27:57', '2021-02-21 22:27:57'),
(25, 18, 'laptop2.jpg', '2021-02-21 22:29:02', '2021-02-21 22:29:02'),
(26, 19, 'book1.png', '2021-02-21 22:31:05', '2021-02-21 22:31:05'),
(27, 20, 'book2.png', '2021-02-21 22:31:05', '2021-02-21 22:31:05'),
(28, 21, 'door1.jpg', '2021-02-21 22:45:49', '2021-02-21 22:45:49'),
(29, 22, 'door2.jpg', '2021-02-21 22:47:03', '2021-02-21 22:47:03'),
(30, 23, 'fan1.jpg', '2021-02-21 22:50:17', '2021-02-21 22:50:17'),
(31, 24, 'fan2.png', '2021-02-21 22:51:28', '2021-02-21 22:51:28'),
(32, 25, ' book2.png', '2021-02-21 23:32:12', '2021-02-21 23:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `review` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `ip_address`, `product_id`, `review`, `rating`, `name`, `created_at`, `updated_at`) VALUES
(1, 4, 'NULL', 6, 'good Product', 1, 'Jitan', '2021-02-20 23:21:50', '2021-02-20 23:21:50'),
(2, 4, 'NULL', 6, 'good Product', 1, 'Jitan', '2021-02-20 23:24:07', '2021-02-20 23:24:07');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('RjIqUzWTMIrRyKJb9L1uuUHoO4kMVpcuzSvZW691', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiemRRMGxQM2NidzJKUGdJNWdoS0VHRWRzRURobDVOVEVxbktpSWZQciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3QvbGFyYTh0ZXN0cy9wdWJsaWMvYWRtaW5TaG93Q2F0YWdvcnkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUyOiJsb2dpbl9hZG1pbl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1614696433);

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `title`, `image`, `button_text`, `button_link`, `created_at`, `updated_at`) VALUES
(3, 'Applea', 'a.jpg', 'jjjjjj', 'yyyyyyy', '2021-02-20 00:03:14', '2021-02-20 00:03:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verification_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_varified` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `address`, `mobile`, `email_verified_at`, `password`, `verification_code`, `is_varified`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(4, 'MIthun moinak', 'user@gmail.com', 'wwwwww', '333333333', NULL, '$2y$10$/VQqgXqWaHL/JnxnrQty.esq2JLP7Su29eCOvp/KpD3gd2Fd6/mAW', 'ff866c4d4d473feaf7e56a49883973d2a39942b6', 1, NULL, NULL, NULL, '2021-02-20 21:36:37', '2021-02-20 21:43:31');

-- --------------------------------------------------------

--
-- Table structure for table `user_alls`
--

CREATE TABLE `user_alls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_orders`
--
ALTER TABLE `admin_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catagories`
--
ALTER TABLE `catagories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashes`
--
ALTER TABLE `dashes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_alls`
--
ALTER TABLE `user_alls`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_orders`
--
ALTER TABLE `admin_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `catagories`
--
ALTER TABLE `catagories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `dashes`
--
ALTER TABLE `dashes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_alls`
--
ALTER TABLE `user_alls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
