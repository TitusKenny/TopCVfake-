USE [master]
GO
/****** Object:  Database [TopCV]    Script Date: 7/14/2022 12:37:25 AM ******/
CREATE DATABASE [TopCV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TopCV', FILENAME = N'E:\SQL\MSSQL15.MSSQLSERVER01\MSSQL\DATA\TopCV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TopCV_log', FILENAME = N'E:\SQL\MSSQL15.MSSQLSERVER01\MSSQL\DATA\TopCV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TopCV] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TopCV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TopCV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TopCV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TopCV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TopCV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TopCV] SET ARITHABORT OFF 
GO
ALTER DATABASE [TopCV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TopCV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TopCV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TopCV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TopCV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TopCV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TopCV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TopCV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TopCV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TopCV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TopCV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TopCV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TopCV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TopCV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TopCV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TopCV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TopCV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TopCV] SET RECOVERY FULL 
GO
ALTER DATABASE [TopCV] SET  MULTI_USER 
GO
ALTER DATABASE [TopCV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TopCV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TopCV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TopCV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TopCV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TopCV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TopCV', N'ON'
GO
ALTER DATABASE [TopCV] SET QUERY_STORE = OFF
GO
USE [TopCV]
GO
/****** Object:  Table [dbo].[CV]    Script Date: 7/14/2022 12:37:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CV](
	[MaBaiDang] [int] IDENTITY(1,1) NOT NULL,
	[TenCty] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[MaPhanLoai] [int] NULL,
	[NgayDang] [datetime] NULL,
	[Luong] [nvarchar](max) NULL,
	[Logo] [nvarchar](max) NULL,
	[CongViec] [nvarchar](max) NULL,
	[MaDoiTac] [int] NULL,
 CONSTRAINT [PK_CV] PRIMARY KEY CLUSTERED 
(
	[MaBaiDang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoiTac]    Script Date: 7/14/2022 12:37:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoiTac](
	[MaDoiTac] [int] IDENTITY(1,1) NOT NULL,
	[TenDoiTac] [nvarchar](50) NULL,
	[DienThoai] [int] NULL,
	[DiaChi] [nvarchar](max) NULL,
	[MatKhau] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[GioiThieu] [nvarchar](max) NULL,
 CONSTRAINT [PK_DoiTac] PRIMARY KEY CLUSTERED 
(
	[MaDoiTac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NopCV]    Script Date: 7/14/2022 12:37:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NopCV](
	[MaNop] [int] IDENTITY(1,1) NOT NULL,
	[MaDoiTac] [int] NULL,
	[MaUser] [int] NULL,
	[MaBaiDang] [int] NULL,
	[MaProfile] [int] NULL,
	[ThuGioiThieu] [nvarchar](max) NULL,
 CONSTRAINT [PK_NopCV] PRIMARY KEY CLUSTERED 
(
	[MaNop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanLoaiMN]    Script Date: 7/14/2022 12:37:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanLoaiMN](
	[MaPhanLoaiMN] [int] IDENTITY(1,1) NOT NULL,
	[TenPhanLoaiMN] [nvarchar](100) NULL,
 CONSTRAINT [PK_PhanLoai] PRIMARY KEY CLUSTERED 
(
	[MaPhanLoaiMN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 7/14/2022 12:37:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[MaProfile] [int] IDENTITY(1,1) NOT NULL,
	[ChucVuUngTuyen] [nvarchar](max) NULL,
	[HinhCV] [nvarchar](50) NULL,
	[KinhNghiem] [nvarchar](max) NULL,
	[HocVan] [nvarchar](50) NULL,
	[NgonNgu] [nvarchar](50) NULL,
	[MaUser] [int] NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[MaProfile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/14/2022 12:37:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[MaUser] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](max) NULL,
	[DienThoai] [int] NULL,
	[DiaChi] [nvarchar](max) NULL,
	[Email] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[MaUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CV] ON 

INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2, N'Phúc', N'123', 2, CAST(N'2022-05-27T21:48:26.960' AS DateTime), NULL, N'Content/Image/Grosser_Panda.JPG', NULL, NULL)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (3, N'HVUHe', N'736NTP11Q5', 3, CAST(N'2022-05-27T14:31:43.000' AS DateTime), NULL, N'Content/Image/img1.jpg', N'bảo vệ', NULL)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (5, N'Phúc', N'736NTP11Q5', 1, CAST(N'2022-06-17T23:09:09.603' AS DateTime), NULL, N'Content/Image/img1.jpg', N'Lập trình web', NULL)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (6, N'HVUHe', N'736NTP11Q5', 1, CAST(N'2022-06-17T23:12:00.297' AS DateTime), NULL, N'Content/Image/img1.jpg', N'Lập trình web', NULL)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (7, N'Phúc', N'123', 3, CAST(N'2022-06-17T23:12:49.650' AS DateTime), NULL, N'Content/Image/Grosser_Panda.JPG', N'Trưởng', NULL)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (1005, N'HVUH', N'736NTP11Q5', 1, CAST(N'2022-06-19T15:52:28.903' AS DateTime), N'12-15TR', N'Content/Image/admin.png', N'Trưởng', NULL)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2005, N'HVUH', N'736NTP11Q5', 1, CAST(N'2022-06-20T20:58:45.003' AS DateTime), N'12-15TR', N'Content/Image/u.png', N'Lập trình web', NULL)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2006, N'HVUH', N'736NTP11Q5', 3, CAST(N'2022-06-21T11:39:11.000' AS DateTime), N'12-15TR', N'Content/Image/Grosser_Panda.JPG', N'Lập trình web', NULL)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2007, N'HVUH', N'736NTP11Q5', 1, CAST(N'2022-06-21T11:39:52.910' AS DateTime), N'12-15TR', N'Content/Image/admin.png', N'bảo vệ', NULL)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2008, N'Phúc', N'736NTP11Q5', 3, NULL, N'12-15TR', N'Content/Image/bg.jpg', N'bảo vệ', NULL)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2009, N'HVUH', N'736NTP11Q5', 3, CAST(N'2022-06-21T12:06:59.000' AS DateTime), N'12-15TR', N'Content/Image/pro.png', N'Lập trình web', NULL)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2010, N'HVUH', N'736NTP11Q5', 3, NULL, N'12-15TR', N'Content/Image/img1.jpg', N'Lập trình web', NULL)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2011, N'Phúc', N'123', 3, CAST(N'2022-06-21T18:43:03.000' AS DateTime), N'8-10', N'Content/Image/Grosser_Panda.JPG', N'Trưởng', NULL)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2012, N'dh', N'123ư', 3, NULL, N'12-15TR', N'Content/Image/team4.jpg', N'Lập trình web', 5)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2013, N'dhh', N'736NTP11Q5', 3, NULL, N'12-15TR', N'Content/Image/brand1.png', N'bảo vệ', 4)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2014, N'HVUH', N'736NTP11Q5', 3, NULL, N'12-15TR', N'Content/Image/Grosser_Panda.JPG', N'Lập trình web', 5)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2015, N'Phúc', N'438A Trần Hưng Đạo , Phường 6 , Quận 1', 1, NULL, N'8-10tr', N'Content/Image/c3.jpg', N'Lập trình web', 4)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2016, N'TNHH 1 thành viên Alibaba', N'123 Ngô Đức Kế , phường 12 , quận Bình Thạnh', 3, CAST(N'2022-07-09T13:36:32.250' AS DateTime), N'12-15TR', N'Content/Image/bg.jpg', N'Giao hàng', 4)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2017, N'Ligi', N'48 Lò Siêu, Phường 12, Quận 11,TP.Hồ Chí Minh', 3, NULL, N'8-10tr', N'Content/Image/team2.jpg', N'Nhân viên kế toán', 4)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2018, N'TNHH 40 thành viên Aladin', N'12 Võ Văn Tần, Phường 10, Quận 3', 1, CAST(N'2022-07-10T00:57:24.800' AS DateTime), N'12-15TR', N'Content/Image/c3.jpg', N'Lập trình web', 5)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2019, N'Mom', N'118 Ngô Quyền Phường 8 Quận 5', 3, NULL, N'5-8tr', N'Content/Image/images (8).jpg', N'vệ sinh nhà cửa', 6)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2020, N'TNHH 1 nhà Mom', N'20 Lê Quang Sung, Phường 6 , Quận 6', 15, CAST(N'2022-07-14T00:06:46.357' AS DateTime), N'5-8tr', N'Content/Image/images (4).jpg', N'Phục vụ', 6)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2021, N'Dad', N'Quận 2', 9, CAST(N'2022-07-14T00:09:04.983' AS DateTime), N'8-10tr', N'Content/Image/images (5).jpg', N'tiếp viên', 7)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2022, N'Gia đình', N'46 Khánh Hoà , Quận 4', 10, CAST(N'2022-07-14T00:13:49.770' AS DateTime), N'3-5tr', N'Content/Image/images (3).jpg', N'Giáo viên tiểu học', 7)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2023, N'Jolibeans', N'số 6 đường D5, Phường Tân Phong, Quận 7', 13, CAST(N'2022-07-14T00:15:20.413' AS DateTime), N'12-15TR', N'Content/Image/Chris-Hemsworth-Vai-.png', N'Kỹ sư thiết kế ', 7)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2024, N'Son', N'110 Phạm Hùng, Phường  12, Quận 8', 12, CAST(N'2022-07-14T00:17:12.800' AS DateTime), N'12-15TR', N'Content/Image/5.jpg', N'Vận chuyển hàng hoá', 8)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2025, N'Physical Technology', N'12, Khu Công nghệ cao , Quận 9', 7, CAST(N'2022-07-14T00:19:15.583' AS DateTime), N'12-15TR', N'Content/Image/images (1).jpg', N'Kỹ sư lắp ráp', 8)
INSERT [dbo].[CV] ([MaBaiDang], [TenCty], [DiaChi], [MaPhanLoai], [NgayDang], [Luong], [Logo], [CongViec], [MaDoiTac]) VALUES (2026, N'Quán ăn 12s', N'12s , đường 3/2 , Phường 5, Quận 10', 15, CAST(N'2022-07-14T00:21:15.000' AS DateTime), N'5-8tr', N'Content/Image/biet-cach-kiem-soat-nhiet-do.jpg', N'Đầu bếp ', 8)
SET IDENTITY_INSERT [dbo].[CV] OFF
GO
SET IDENTITY_INSERT [dbo].[DoiTac] ON 

INSERT [dbo].[DoiTac] ([MaDoiTac], [TenDoiTac], [DienThoai], [DiaChi], [MatKhau], [Email], [GioiThieu]) VALUES (4, N'HVU', 19006358, N'736 Nguyễn Trãi', N'1', N'Hvuh@gmail.com', N'alibaba')
INSERT [dbo].[DoiTac] ([MaDoiTac], [TenDoiTac], [DienThoai], [DiaChi], [MatKhau], [Email], [GioiThieu]) VALUES (5, N'DHV', 19001068, N'736 Nguyễn Trãi, Phường 11', N'1', N'dhv@gmail.com', N'alalumbama')
INSERT [dbo].[DoiTac] ([MaDoiTac], [TenDoiTac], [DienThoai], [DiaChi], [MatKhau], [Email], [GioiThieu]) VALUES (6, N'Momy', 19001268, N'118 Ngô Quyền Phường 8 Quận 5', N'1', N'momy@gmail.com', N'Công ty mẹ')
INSERT [dbo].[DoiTac] ([MaDoiTac], [TenDoiTac], [DienThoai], [DiaChi], [MatKhau], [Email], [GioiThieu]) VALUES (7, N'Daddy', 19001269, N'120 Ngô Quyền Phường 8 Quận 5', N'1', N'daddy@gmail.com', N'Công ty cha')
INSERT [dbo].[DoiTac] ([MaDoiTac], [TenDoiTac], [DienThoai], [DiaChi], [MatKhau], [Email], [GioiThieu]) VALUES (8, N'Son', 19001270, N'22 Trần Phú', N'1', N'son@gmail.com', N'Công ty con')
INSERT [dbo].[DoiTac] ([MaDoiTac], [TenDoiTac], [DienThoai], [DiaChi], [MatKhau], [Email], [GioiThieu]) VALUES (9, N'Kenny', 19006666, N'66 Trần Nhân Tôn, Phường 10, Quận 10', N'1', N'kenny@gmail.com', N'kenny company')
SET IDENTITY_INSERT [dbo].[DoiTac] OFF
GO
SET IDENTITY_INSERT [dbo].[NopCV] ON 

INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (2, 5, 4, 1005, 3, NULL)
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (7, 5, 1, 2011, 3, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (8, 4, 1, 2011, 3, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (9, 4, 1, 2011, 3, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (21, 4, 1, 2011, 3, NULL)
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (23, 4, 1, 2011, 3, NULL)
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (24, 4, 1, 2011, 3, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (25, 4, 1, 2011, 3, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (26, 4, 1, 2010, 3, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (27, 4, 1, 2012, 3, NULL)
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (28, 4, 1, 2015, 3, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (29, 4, 1, 2012, 3, NULL)
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (31, 4, 1, 2012, 3, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (32, 4, 1, 2012, 3, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (33, 4, 1, 2012, 3, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (34, 4, 1, 2012, 3, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (35, 4, 1, 2012, 3, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (36, 5, 1, 2011, 3, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (37, 4, 1, 2005, 1017, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (38, 4, 1, 2005, 1017, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (39, 4, 1, 2018, 3, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (40, 4, 1, 2018, 1017, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (41, 4, 1, 2016, 3, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (42, 4, 1, 2018, 3, NULL)
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (43, 4, 1, 2018, 1017, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (44, 4, 1, 2018, 3, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (45, 4, 1, 2018, 1018, N're')
INSERT [dbo].[NopCV] ([MaNop], [MaDoiTac], [MaUser], [MaBaiDang], [MaProfile], [ThuGioiThieu]) VALUES (46, 4, 4, 2018, 1018, N're')
SET IDENTITY_INSERT [dbo].[NopCV] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanLoaiMN] ON 

INSERT [dbo].[PhanLoaiMN] ([MaPhanLoaiMN], [TenPhanLoaiMN]) VALUES (1, N'Công Nghệ Thông Tin')
INSERT [dbo].[PhanLoaiMN] ([MaPhanLoaiMN], [TenPhanLoaiMN]) VALUES (2, N'Kế Toán')
INSERT [dbo].[PhanLoaiMN] ([MaPhanLoaiMN], [TenPhanLoaiMN]) VALUES (3, N'Bảo Vệ')
INSERT [dbo].[PhanLoaiMN] ([MaPhanLoaiMN], [TenPhanLoaiMN]) VALUES (4, N'Y tế')
INSERT [dbo].[PhanLoaiMN] ([MaPhanLoaiMN], [TenPhanLoaiMN]) VALUES (5, N'Kinh Doanh')
INSERT [dbo].[PhanLoaiMN] ([MaPhanLoaiMN], [TenPhanLoaiMN]) VALUES (6, N'Hành chính')
INSERT [dbo].[PhanLoaiMN] ([MaPhanLoaiMN], [TenPhanLoaiMN]) VALUES (7, N'Kỹ thuật')
INSERT [dbo].[PhanLoaiMN] ([MaPhanLoaiMN], [TenPhanLoaiMN]) VALUES (8, N'Chuyên môn')
INSERT [dbo].[PhanLoaiMN] ([MaPhanLoaiMN], [TenPhanLoaiMN]) VALUES (9, N'Dịch vụ')
INSERT [dbo].[PhanLoaiMN] ([MaPhanLoaiMN], [TenPhanLoaiMN]) VALUES (10, N'Giáo dục')
INSERT [dbo].[PhanLoaiMN] ([MaPhanLoaiMN], [TenPhanLoaiMN]) VALUES (11, N'Truyền thông')
INSERT [dbo].[PhanLoaiMN] ([MaPhanLoaiMN], [TenPhanLoaiMN]) VALUES (12, N'Vận tải , bưu chính')
INSERT [dbo].[PhanLoaiMN] ([MaPhanLoaiMN], [TenPhanLoaiMN]) VALUES (13, N'Xây dựng')
INSERT [dbo].[PhanLoaiMN] ([MaPhanLoaiMN], [TenPhanLoaiMN]) VALUES (14, N'Bất động sản')
INSERT [dbo].[PhanLoaiMN] ([MaPhanLoaiMN], [TenPhanLoaiMN]) VALUES (15, N'Các ngành khác')
SET IDENTITY_INSERT [dbo].[PhanLoaiMN] OFF
GO
SET IDENTITY_INSERT [dbo].[Profile] ON 

INSERT [dbo].[Profile] ([MaProfile], [ChucVuUngTuyen], [HinhCV], [KinhNghiem], [HocVan], [NgonNgu], [MaUser]) VALUES (3, N'It', N'Content/Image/pro.png', N'dưới 1 năm', N'ĐH', N'Anh', 1)
INSERT [dbo].[Profile] ([MaProfile], [ChucVuUngTuyen], [HinhCV], [KinhNghiem], [HocVan], [NgonNgu], [MaUser]) VALUES (1004, N'It', N'Content/Image/bg.jpg', N'dưới 1 năm', N'ĐH', N'Anh', 4)
INSERT [dbo].[Profile] ([MaProfile], [ChucVuUngTuyen], [HinhCV], [KinhNghiem], [HocVan], [NgonNgu], [MaUser]) VALUES (1006, N'It', N'Content/Image/bg.jpg', N'dưới 1 năm', N'ĐH', N'Anh', 1)
INSERT [dbo].[Profile] ([MaProfile], [ChucVuUngTuyen], [HinhCV], [KinhNghiem], [HocVan], [NgonNgu], [MaUser]) VALUES (1007, N'It', N'Content/Image/bg.jpg', N'dưới 1 năm', N'ĐH', N'Anh', 4)
INSERT [dbo].[Profile] ([MaProfile], [ChucVuUngTuyen], [HinhCV], [KinhNghiem], [HocVan], [NgonNgu], [MaUser]) VALUES (1008, N'It', N'Content/Image/bg.jpg', N'dưới 1 năm', N'ĐH', N'Anh', 4)
INSERT [dbo].[Profile] ([MaProfile], [ChucVuUngTuyen], [HinhCV], [KinhNghiem], [HocVan], [NgonNgu], [MaUser]) VALUES (1009, N'It', N'Content/Image/bg.jpg', N'dưới 1 năm', N'ĐH', N'Anh', 4)
INSERT [dbo].[Profile] ([MaProfile], [ChucVuUngTuyen], [HinhCV], [KinhNghiem], [HocVan], [NgonNgu], [MaUser]) VALUES (1010, N'It', N'Content/Image/pro.png', N'dưới 1 năm', N'ĐH', N'Anh', 4)
INSERT [dbo].[Profile] ([MaProfile], [ChucVuUngTuyen], [HinhCV], [KinhNghiem], [HocVan], [NgonNgu], [MaUser]) VALUES (1014, N'It', N'Content/Image/img1.jpg', N'dưới 1 năm', N'ĐH', N'Anh', 1)
INSERT [dbo].[Profile] ([MaProfile], [ChucVuUngTuyen], [HinhCV], [KinhNghiem], [HocVan], [NgonNgu], [MaUser]) VALUES (1015, N'Trưởng bộ phận', N'Content/Image/team1.jpg', N'5 năm', N'Đại học', N'Tiếng việt', 4)
INSERT [dbo].[Profile] ([MaProfile], [ChucVuUngTuyen], [HinhCV], [KinhNghiem], [HocVan], [NgonNgu], [MaUser]) VALUES (1016, N'It', N'Content/Image/team1.jpg', N'2 năm', N'Đại học', N'Anh', 4)
INSERT [dbo].[Profile] ([MaProfile], [ChucVuUngTuyen], [HinhCV], [KinhNghiem], [HocVan], [NgonNgu], [MaUser]) VALUES (1017, N'Nhân viên', N'Content/Image/team3.jpg', N'dưới 1 năm', N'Đại học', N'Anh', 4)
INSERT [dbo].[Profile] ([MaProfile], [ChucVuUngTuyen], [HinhCV], [KinhNghiem], [HocVan], [NgonNgu], [MaUser]) VALUES (1018, N'Nhân viên', N'Content/Image/team3.jpg', N'2 năm', N'Đại học', N'Tiếng việt', 9)
INSERT [dbo].[Profile] ([MaProfile], [ChucVuUngTuyen], [HinhCV], [KinhNghiem], [HocVan], [NgonNgu], [MaUser]) VALUES (1019, N'Nhân viên', N'Content/Image/images.jpg', N'2 năm', N'Đại học', N'Tiếng việt', 10)
SET IDENTITY_INSERT [dbo].[Profile] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([MaUser], [HoTen], [DienThoai], [DiaChi], [Email], [MatKhau], [NgaySinh]) VALUES (1, N'Phúc', 1234564789, N'5ds54sd', N'phuclachongphuc@gmail.com', N'1', CAST(N'2000-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([MaUser], [HoTen], [DienThoai], [DiaChi], [Email], [MatKhau], [NgaySinh]) VALUES (4, N'Lạc Hồng Phúc', 918176213, N'106 Lô G, c/c Nguyễn Trãi, Phường 8, Quận 5 , TP. Hồ Chí Minh', N'lachongphuc@gmail.com', N'1', CAST(N'2000-09-10T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([MaUser], [HoTen], [DienThoai], [DiaChi], [Email], [MatKhau], [NgaySinh]) VALUES (7, N'Lạc Hồng Phúc', 912345678, N'736NTP11Q5', N'LHP@gmail.com', N'1', CAST(N'2000-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([MaUser], [HoTen], [DienThoai], [DiaChi], [Email], [MatKhau], [NgaySinh]) VALUES (8, N'Phúc hi hi', 1212, N'47 Nguyễn Duy Dương', N'phuc123@gmail.com', N'1', CAST(N'2000-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([MaUser], [HoTen], [DienThoai], [DiaChi], [Email], [MatKhau], [NgaySinh]) VALUES (9, N'Kaito Kid', 911111125, N'4 bể là nhà', N'kid@gmail.com', N'1', CAST(N'2000-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([MaUser], [HoTen], [DienThoai], [DiaChi], [Email], [MatKhau], [NgaySinh]) VALUES (10, N'Tituss', 909789432, N'47 Nguyễn Duy Dương', N'titus@gmail.com', N'1', CAST(N'2000-09-10T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[CV]  WITH CHECK ADD  CONSTRAINT [FK_CV_DoiTac] FOREIGN KEY([MaDoiTac])
REFERENCES [dbo].[DoiTac] ([MaDoiTac])
GO
ALTER TABLE [dbo].[CV] CHECK CONSTRAINT [FK_CV_DoiTac]
GO
ALTER TABLE [dbo].[CV]  WITH CHECK ADD  CONSTRAINT [FK_CV_PhanLoaiMN] FOREIGN KEY([MaPhanLoai])
REFERENCES [dbo].[PhanLoaiMN] ([MaPhanLoaiMN])
GO
ALTER TABLE [dbo].[CV] CHECK CONSTRAINT [FK_CV_PhanLoaiMN]
GO
ALTER TABLE [dbo].[NopCV]  WITH CHECK ADD  CONSTRAINT [FK_NopCV_CV] FOREIGN KEY([MaBaiDang])
REFERENCES [dbo].[CV] ([MaBaiDang])
GO
ALTER TABLE [dbo].[NopCV] CHECK CONSTRAINT [FK_NopCV_CV]
GO
ALTER TABLE [dbo].[NopCV]  WITH CHECK ADD  CONSTRAINT [FK_NopCV_DoiTac] FOREIGN KEY([MaDoiTac])
REFERENCES [dbo].[DoiTac] ([MaDoiTac])
GO
ALTER TABLE [dbo].[NopCV] CHECK CONSTRAINT [FK_NopCV_DoiTac]
GO
ALTER TABLE [dbo].[NopCV]  WITH CHECK ADD  CONSTRAINT [FK_NopCV_Profile] FOREIGN KEY([MaProfile])
REFERENCES [dbo].[Profile] ([MaProfile])
GO
ALTER TABLE [dbo].[NopCV] CHECK CONSTRAINT [FK_NopCV_Profile]
GO
ALTER TABLE [dbo].[NopCV]  WITH CHECK ADD  CONSTRAINT [FK_NopCV_User] FOREIGN KEY([MaUser])
REFERENCES [dbo].[User] ([MaUser])
GO
ALTER TABLE [dbo].[NopCV] CHECK CONSTRAINT [FK_NopCV_User]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_User] FOREIGN KEY([MaUser])
REFERENCES [dbo].[User] ([MaUser])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_User]
GO
USE [master]
GO
ALTER DATABASE [TopCV] SET  READ_WRITE 
GO
