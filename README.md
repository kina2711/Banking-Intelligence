# Data In Banking
# I. Đặt vấn đề

Ngành ngân hàng đóng vai trò thiết yếu trong nền kinh tế, cung cấp các dịch vụ tài chính quan trọng và đảm bảo sự luân chuyển vốn hiệu quả. Với vai trò trung tâm trong hệ thống tài chính, ngân hàng cung cấp ba nghiệp vụ cốt lõi: **huy động vốn**, **tín dụng**, và **thanh toán**. Những nghiệp vụ này không chỉ giúp ngân hàng tăng trưởng mà còn duy trì tính thanh khoản và ổn định của hệ thống tài chính quốc gia.

Dự án này tập trung vào việc phân tích dữ liệu từ **Ngân hàng giả lập VNC (Vietnam Capital Bank)** nhằm tối ưu hóa hoạt động và hỗ trợ ra quyết định kinh doanh. Ngân hàng VNC hoạt động với cấu trúc ***Hội sở - Chi nhánh*,** quản lý theo 8 khu vực trên toàn quốc. Đối tượng khách hàng của ngân hàng bao gồm cả **khách hàng cá nhân** và **khách hàng doanh nghiệp**. Các sản phẩm chính mà ngân hàng cung cấp bao gồm:

1. **Sản phẩm huy động vốn**: Thu hút nguồn vốn từ khách hàng thông qua các tài khoản tiền gửi và các sản phẩm huy động khác, giúp ngân hàng tái đầu tư vào các hoạt động tín dụng.
2. **Sản phẩm tín dụng**: Cung cấp các khoản vay cho khách hàng cá nhân và doanh nghiệp, tối ưu hóa việc sử dụng vốn huy động và hỗ trợ phát triển kinh tế.
3. **Sản phẩm thanh toán**: Đảm bảo việc chuyển tiền, thanh toán hóa đơn, và các giao dịch tài chính diễn ra nhanh chóng và hiệu quả.

Để quản lý và vận hành hiệu quả các nghiệp vụ này, VNC đã xây dựng hệ thống cơ sở dữ liệu dựa trên *SQL Server*, cho phép lưu trữ, quản lý và truy xuất thông tin về khách hàng, sản phẩm và giao dịch một cách tối ưu.

**Mục tiêu của dự án:**

- Xây dựng hệ thống cơ sở dữ liệu vững chắc và linh hoạt để hỗ trợ quản lý các nghiệp vụ huy động vốn, tín dụng, và thanh toán.
- Tạo ra các báo cáo phân tích tổng hợp về tình trạng tài khoản, quản lý khoản vay, đánh giá rủi ro, và tối ưu hóa quy trình thanh toán, từ đó giúp ngân hàng vận hành hiệu quả hơn và tăng cường khả năng cạnh tranh.

Với các công cụ quản lý dữ liệu tiên tiến và hệ thống cơ sở dữ liệu mạnh mẽ, dự án này sẽ giúp Ngân hàng VNC đạt được những kết quả mong muốn và cải thiện chất lượng dịch vụ tài chính mà ngân hàng cung cấp.

# II. Kiến thức sử dụng

# III. Quy trình

## 1. Quy trình tổng quan

![Blank board.jpeg](https://prod-files-secure.s3.us-west-2.amazonaws.com/f0b482dd-ba81-4e7b-9b52-d1f61affe890/691f8748-901e-4eb6-82a2-dfc0aeff0ad2/Blank_board.jpeg)

## 2. Hiểu dữ liệu

Dữ liệu dự án này bao gồm nhiều bảng lưu trữ thông tin về khách hàng và các giao dịch của họ với ngân hàng. Dưới đây là tóm tắt các bảng chính và chức năng của chúng:

### 2.1. **Bảng KHACHHANG (Thông tin khách hàng)**

- **Mô tả chung**: Đây là bảng trung tâm chứa các thông tin quan trọng về khách hàng của ngân hàng, bao gồm cả khách hàng cá nhân và doanh nghiệp. Mỗi khách hàng được định danh duy nhất qua mã khách hàng và có thể có nhiều thông tin liên quan khác như giấy tờ, ngày mở tài khoản, và chi nhánh đăng ký.
- **Các trường**: mã khách hàng, tên, ngày sinh, ngày mở tài khoản, mã chi nhánh, địa chỉ, vốn điều lệ, quy mô doanh nghiệp, loại giấy tờ, ngành nghề kinh tế, mã tài khoản thanh toán.
- **Mục đích**: Giúp ngân hàng quản lý thông tin của từng khách hàng, hỗ trợ trong việc tra cứu, theo dõi các thông tin cơ bản và các hoạt động liên quan như giao dịch, tiết kiệm, tín dụng.

### 2.2. Bảng THANHPHO (Thành phố)

- **Mô tả chung**: Lưu trữ danh sách các thành phố mà ngân hàng có chi nhánh hoạt động. Điều này giúp trong việc theo dõi và quản lý các chi nhánh của ngân hàng theo khu vực địa lý.
- **Các trường**: mã và tên thành phố.
- **Mục đích**: Phân loại các thành phố theo mã và tên để liên kết với các chi nhánh, hỗ trợ việc phân tích và quản lý chi nhánh theo khu vực địa lý.

### 2.3. Bảng CHINHANH (Thông tin chi nhánh)

- **Mô tả chung**: Lưu trữ các chi nhánh của ngân hàng, bao gồm thông tin về tên chi nhánh và địa chỉ cụ thể. Các chi nhánh này được liên kết với bảng thành phố và khu vực.
- **Các trường:** mã chi nhánh, tên chi nhánh, địa chỉ chi nhánh, mã thành phố, mã khu vực.
- **Mục đích**: Theo dõi các thông tin chi tiết về chi nhánh, giúp ngân hàng quản lý mạng lưới chi nhánh và cung cấp thông tin về chi nhánh cho khách hàng.

### 2.4. Bảng KHUVUC (Thông tin khu vực)

- **Mô tả chung**: Bảng này chứa dữ liệu về các khu vực mà ngân hàng hoạt động, phân loại theo mã và tên khu vực.
- **Các trường:** mã và tên khu vực.
- **Mục đích**: Hỗ trợ phân loại các chi nhánh theo khu vực, giúp trong việc quản lý và báo cáo theo vùng địa lý hoạt động của ngân hàng.

2.5. **Bảng LOAI_GIAYTO (Loại giấy tờ)**

- **Mô tả chung**: Bảng lưu trữ các loại giấy tờ tùy thân mà khách hàng sử dụng khi mở tài khoản hoặc thực hiện các giao dịch tại ngân hàng.
- **Các trường:** mã và tên loại giấy tờ.
- **Mục đích**: Quản lý và phân loại các loại giấy tờ theo mã và tên để dễ dàng theo dõi thông tin khách hàng.

### 2.6. Bảng LOAIHINH_DOANHNGHIEP (Loại hình doanh nghiệp)

- **Mô tả chung**: Bảng lưu trữ thông tin về các loại hình doanh nghiệp, giúp phân loại khách hàng là doanh nghiệp theo quy mô và ngành nghề.
- **Các trường:** mã và tên loại hình doanh nghiệp.
- **Mục đích**: Hỗ trợ phân loại và quản lý các doanh nghiệp là khách hàng của ngân hàng theo từng loại hình.

### 2.7. Bảng NGANHNGHE_KINHTE_CAP01, CAP02, CAP03 (Ngành nghề kinh tế)

- **Mô tả chung**: Các bảng này chứa thông tin phân cấp về các ngành nghề kinh tế của khách hàng doanh nghiệp. Bảng cấp 01 lưu thông tin cấp cao nhất, sau đó bảng cấp 02 và cấp 03 lưu các thông tin chi tiết hơn về ngành nghề của doanh nghiệp.
- **Các trường:** mã ngành nghề cấp 1, 2, 3 và tên ngành nghề.
- **Mục đích**: Giúp phân loại và theo dõi các khách hàng doanh nghiệp dựa trên ngành nghề kinh tế mà họ hoạt động, hỗ trợ trong việc phân tích và quản lý rủi ro.

### 2.8. Bảng TIENGUI_TIETKIEM (Tiền gửi tiết kiệm)

- **Mô tả chung**: Lưu trữ thông tin về các khoản tiền gửi tiết kiệm của khách hàng. Các trường bao gồm mã khách hàng, kỳ hạn gửi, lãi suất, số tiền gửi và ngày đến hạn.
- **Các trường:** mã khách hàng, tài khoản, ngày gửi, lãi suất, số tiền, kỳ hạn, tự gia hạn.
- **Mục đích**: Quản lý và theo dõi các khoản tiền gửi tiết kiệm của khách hàng, giúp ngân hàng phân tích tài chính và hỗ trợ các quyết định về lãi suất.

### 2.9. Bảng TIENGUI_COKYHAN (Tiền gửi có kỳ hạn)

- **Mô tả chung**: Ghi nhận các khoản tiền gửi có kỳ hạn của khách hàng, tương tự như tiền gửi tiết kiệm nhưng thường có điều kiện kỳ hạn và lãi suất chặt chẽ hơn.
- **Các trường:** mã khách hàng, tài khoản, số tiền, lãi suất, ngày gửi, kỳ hạn, trạng thái.
- **Mục đích**: Theo dõi các khoản tiền gửi có kỳ hạn, giúp quản lý và tối ưu hoá việc tính toán lãi suất cũng như thời gian đáo hạn.

### 2.10. Bảng TIENGUI_THANHTOAN (Tiền gửi thanh toán)

- **Mô tả chung**: Lưu trữ thông tin về các tài khoản thanh toán của khách hàng, bao gồm các giao dịch và số dư tài khoản.
- **Các trường:** mã tài khoản, thời gian giao dịch, số dư đầu, số tiền tăng/giảm, số dư cuối.
- **Mục đích**: Giúp ngân hàng theo dõi và quản lý các tài khoản thanh toán của khách hàng, cung cấp thông tin cần thiết cho việc kiểm soát số dư và giao dịch.

### 2.11. Bảng HOPDONG_TINDUNG (Hợp đồng tín dụng)

- **Mô tả chung**: Quản lý các hợp đồng tín dụng của khách hàng, bao gồm các thông tin quan trọng như số tiền vay, lãi suất, thời hạn vay, và hình thức tín dụng.
- **Các trường:** mã khách hàng, mã hợp đồng tín dụng, hình thức tín dụng, số tiền vay, lãi suất và thời hạn vay.
- **Mục đích**: Theo dõi chi tiết các hợp đồng tín dụng của khách hàng, giúp ngân hàng quản lý các khoản vay và điều chỉnh các điều kiện tín dụng cho phù hợp với từng khách hàng.

## 3. Chi tiết các bảng

### 3.1. Bảng 1: Thông tin khách hàng

Bảng **`KHACHHANG`** là bảng rất quan trọng, lưu trữ thông tin chi tiết về từng khách hàng, bao gồm cả cá nhân và doanh nghiệp. Thông tin này không chỉ giới hạn ở tên và mã số, mà còn bao gồm các dữ liệu quan trọng khác như ngày mở tài khoản, loại giấy tờ tùy thân và chi nhánh mà khách hàng đã đăng ký.

| **STT** | **Trường** | **Mô tả** | Kiểu dữ liệu | Ghi chú |
| --- | --- | --- | --- | --- |
| 1 | MA_CHINHANH | Mã chi nhánh của khách hàng (liên kết tới bảng `CHINHANH`). | Nvarchar(10) | Cho phép NULL |
| 2 | MA_CIC | Mã CIC của khách hàng. | Nvarchar(20) | Cho phép NULL |
| 3 | MA_KHACHHANG | Mã khách hàng, dùng để định danh duy nhất. | Nvarchar(12) | Cho phép NULL |
| 4 | TEN_KHACHHANG | Tên đầy đủ của khách hàng. | Nvarchar(500) | Cho phép NULL |
| 5 | NGAY_MO_TAIKHOAN | Ngày mở tài khoản của khách hàng. | Date | Cho phép NULL |
| 6 | NGAY_SINH | Ngày sinh của khách hàng (hoặc ngày thành lập doanh nghiệp). | Date | Cho phép NULL |
| 7 | MA_GIAYTO | Mã số giấy tờ cá nhân của khách hàng. | Nvarchar(20) | Cho phép NULL |
| 8 | MA_LOAI_KHACHHANG | Mã loại khách hàng (cá nhân, doanh nghiệp, vv.) (liên kết tới bảng `LOAIHINH_DOANHNGHIEP`). | Nvarchar(10) | Cho phép NULL |
| 9 | MA_LOAI_GIAYTO | Mã loại giấy tờ của khách hàng (liên kết tới bảng `LOAI_GIAYTO`). | Nvarchar(5) | Cho phép NULL |
| 10 | NGAYCAP_GIAYTO | Ngày cấp giấy tờ của khách hàng. | Date | Cho phép NULL |
| 11 | MA_NOICAP | Mã nơi cấp giấy tờ của khách hàng. | Int | Cho phép NULL |
| 12 | DIACHI | Địa chỉ chi tiết của khách hàng. | Nvarchar(max) | Cho phép NULL |
| 13 | NGAY_THANHLAP | Ngày thành lập doanh nghiệp (nếu khách hàng là doanh nghiệp). | Date | Cho phép NULL |
| 14 | QUY_MO_DOANHNGHIEP | Quy mô của doanh nghiệp (số lượng nhân viên, hoặc cấp độ phát triển). | Int | Cho phép NULL |
| 15 | VON_DIEULE | Vốn điều lệ của doanh nghiệp (nếu có). | Numeric(18,0) | Cho phép NULL |
| 16 | MA_TAIKHOAN_THANHTOAN | Mã tài khoản thanh toán của khách hàng (liên kết tới bảng `TIENGUI_THANHTOAN`). | Nvarchar(20) | Cho phép NULL |
| 17 | TEN_CHU_DOANHNGHIEP | Tên chủ doanh nghiệp (nếu là doanh nghiệp). | Nvarchar(500) | Cho phép NULL |
| 18 | ID_CHU_DOANHNGHIEP | Số ID của chủ doanh nghiệp. | Nvarchar(50) | Cho phép NULL |
| 19 | MA_LOAIHINH_KHACHHANG | Mã loại hình khách hàng. | Nvarchar(5) | Cho phép NULL |
| 20 | MA_NGANHNGHE_KINHTE | Mã ngành nghề kinh tế của khách hàng (liên kết tới bảng `NGANHNGHE_KINHTE_CAP03`). | Nvarchar(5) | Cho phép NULL |

### 3.2. Bảng 2: Thành phố

Bảng **`THANHPHO`** lưu trữ thông tin về các thành phố, nơi có các chi nhánh của ngân hàng hoạt động. Dưới đây là mô tả chi tiết các trường trong bảng:

| **STT** | **Trường** | **Mô tả** | Kiểu dữ liệu | Ghi chú |
| --- | --- | --- | --- | --- |
| 1 | MA_THANHPHO | Mã thành phố. | nvarchar(5) | Cho phép NULL |
| 2 | TEN_THANHPHO | Tên thành phố. | nvarchar(50) | Cho phép NULL |

### 3.3. Bảng 3: Chi nhánh

Bảng **`CHINHANH`** chứa dữ liệu chi tiết về các chi nhánh của ngân hàng. Nó không chỉ cung cấp thông tin về tên gọi mà còn cả địa chỉ cụ thể của từng chi nhánh, giúp định vị rõ ràng vị trí hoạt động của chúng. Điều này rất quan trọng trong việc theo dõi và quản lý hệ thống ngân hàng trên phạm vi toàn quốc.

| **STT** | **Trường** | **Mô tả** | Kiểu dữ liệu | Ghi chú |
| --- | --- | --- | --- | --- |
| 1 | MA_CHINHANH | Mã chi nhánh | nvarchar(20) | Cho phép NULL |
| 2 | TEN_CHINHANH | Tên chi nhánh | nvarchar(500) | Cho phép NULL |
| 3 | DIACHI_CHINHANH | Địa chỉ chi tiết của chi nhánh | nvarchar(max) | Cho phép NULL |
| 4 | MA_THANHPHO | Mã thành phố nơi chi nhánh tọa lạc (liên kết tới bảng `THANHPHO`). | int | Cho phép NULL |
| 5 | MA_KHUVUC | Mã khu vực nơi chi nhánh tọa lạc (liên kết tới bảng `KHUVUC`). | nvarchar(10) | Cho phép NULL |

### 3.4. Bảng 4: Khu vực

Bảng **`KHUVUC`** chứa dữ liệu các khu vực mà ngân hàng hoạt động. Liên kết với bảng Chi nhánh theo One to Many.

| **STT** | **Trường** | **Mô tả** | Kiểu dữ liệu | Ghi chú |
| --- | --- | --- | --- | --- |
| 1 | MA_KHUVUC | Mã khu vực, dùng để định danh khu vực. | nvarchar(10) | Cho phép NULL |
| 2 | TEN_KHUVUC | Tên đầy đủ của khu vực. | nvarchar(50) | Cho phép NULL |

### 3.5. Bảng 5: Loại giấy tờ

Bảng **`LOAI_GIAYTO`** lưu trữ thông tin về các loại giấy tờ mà khách hàng sử dụng.

| **STT** | **Trường** | **Mô tả** | Kiểu dữ liệu | Ghi chú |
| --- | --- | --- | --- | --- |
| 1 | MA_LOAI_GIAYTO | Mã loại giấy tờ, dùng để phân biệt các loại giấy tờ. | nvarchar(10) | Cho phép NULL |
| 2 | TEN_LOAI_GIAYTO | Tên đầy đủ của loại giấy tờ. | nvarchar(50) | Cho phép NULL |

### 3.6. Bảng 6: Loại hình doanh nghiệp

Bảng **`LOAIHINH_DOANHNGHIEP`** lưu trữ thông tin về các loại hình doanh nghiệp.

| **STT** | **Trường** | **Mô tả** | Kiểu dữ liệu | Ghi chú |
| --- | --- | --- | --- | --- |
| 1 | MA_LOAIHINH_DOANHNGHIEP | Mã loại hình doanh nghiệp. (liên kết tới bảng `KHACHHANG`). | nvarchar(5) | Cho phép NULL |
| 2 | TEN_LOAIHINH_DOANHNGHIEP | Tên đầy đủ của loại hình doanh nghiệp. | nvarchar(500) | Cho phép NULL |

### 3.7. Bảng 7: Ngành nghề kinh tế cấp 01

Bảng **`NGANHNGHE_KINHTE_CAP01`** lưu thông tin về các ngành nghề kinh tế cấp 1.

| **STT** | **Trường** | **Mô tả** | Kiểu dữ liệu | Ghi chú |
| --- | --- | --- | --- | --- |
| 1 | MA_NGANHNGHE_KINHTE_CAP01 | Mã ngành nghề kinh tế cấp 1. | nvarchar(5) | Cho phép NULL |
| 2 | TEN_NGANHNGHE_KINHTE_CAP01 | Tên đầy đủ của ngành nghề kinh tế cấp 1. | nvarchar(500) | Cho phép NULL |

### 3.8. Bảng 8: Ngành nghề kinh tế cấp 02

Bảng **`NGANHNGHE_KINHTE_CAP02`** lưu thông tin về các ngành nghề kinh tế cấp 2.

| **STT** | **Trường** | **Mô tả** | Kiểu dữ liệu | Ghi chú |
| --- | --- | --- | --- | --- |
| 1 | MA_NGANHNGHE_KINHTE_CAP01 | Mã ngành nghề kinh tế cấp 1 (liên kết tới bảng `NGANHNGHE_KINHTE_CAP01`). | nvarchar(5) | Cho phép NULL |
| 2 | MA_NGANHNGHE_KINHTE_CAP02 | Mã ngành nghề kinh tế cấp 2. | nvarchar(5) | Cho phép NULL |
| 3 | TEN_NGANHNGHE_KINHTE_CAP02 | Tên đầy đủ của ngành nghề kinh tế cấp 2. | nvarchar(500) | Cho phép NULL |

### 3.9. Bảng 9: Ngành nghề kinh tế cấp 03

Bảng **`NGANHNGHE_KINHTE_CAP03`** lưu thông tin về các ngành nghề kinh tế cấp 3.

| **STT** | **Trường** | **Mô tả** | Kiểu dữ liệu | Ghi chú |
| --- | --- | --- | --- | --- |
| 1 | MA_NGANHNGHE_KINHTE_CAP01 | Mã ngành nghề kinh tế cấp 1 (liên kết tới bảng `NGANHNGHE_KINHTE_CAP01`). | nvarchar(5) | Cho phép NULL |
| 2 | MA_NGANHNGHE_KINHTE_CAP02 | Mã ngành nghề kinh tế cấp 2 (liên kết tới bảng `NGANHNGHE_KINHTE_CAP02`). | nvarchar(5) | Cho phép NULL |
| 3 | MA_NGANHNGHE_KINHTE_CAP03 | Mã ngành nghề kinh tế cấp 3. | nvarchar(5) | Cho phép NULL |
| 4 | TEN_NGANHNGHE_KINHTE_CAP03 | Tên đầy đủ của ngành nghề kinh tế cấp 3. | nvarchar(500) | Cho phép NULL |

### 3.10. Bảng 10: Tiền gửi tiết kiệm

Bảng **`TIENGUI_TIETKIEM`** chứa thông tin chi tiết về các khoản tiền gửi tiết kiệm của khách hàng. Mỗi khách hàng có thể gửi tiết kiệm với các kỳ hạn và lãi suất khác nhau.

| **STT** | **Trường** | **Mô tả** | Kiểu dữ liệu | Ghi chú |
| --- | --- | --- | --- | --- |
| 1 | MA_KHACHHANG | Mã khách hàng (Liên kết tới bảng `KHACHHANG`). | nvarchar(20) | Cho phép NULL |
| 2 | MA_TAIKHOAN_TIETKIEM | Mã tài khoản tiết kiệm | nvarchar(20) | Cho phép NULL |
| 3 | NGAY_GUI | Ngày gửi | date | Cho phép NULL |
| 4 | NGAY_DENHAN | Ngày đến hạn | date | Cho phép NULL |
| 5 | KY_HAN | Kỳ hạn | int | Cho phép NULL |
| 6 | LAISUAT | Lãi suất | numeric(7,2) | Cho phép NULL |
| 7 | SOTIEN | Số tiền | numeric(18,2) | Cho phép NULL |
| 8 | LOAITIEN | Loại tiền | nvarchar(5) | Cho phép NULL |
| 9 | SOTIEN_LAI | Số tiền lãi | numeric(18,2) | Cho phép NULL |
| 10 | SOTIEN_THUCNHAN | Số tiền thực nhận | numeric(18,2) | Cho phép NULL |
| 11 | TUGIAHAN | Tự gia hạn | int | Cho phép NULL |
| 12 | NGAY_RUT | Ngày rút | date | Cho phép NULL |
| 13 | TRANG_THAI | Trạng thái | int | Cho phép NULL |

### 3.11. Bảng 11: Tiền gửi có kỳ hạn

Bảng **`TIENGUI_COKYHAN`** ghi nhận thông tin về các khoản tiền gửi có kỳ hạn của khách hàng, tương tự như bảng Tiền gửi tiết kiệm nhưng thường có sự ràng buộc chặt chẽ hơn về kỳ hạn và lãi suất.

| **STT** | **Trường** | **Mô tả** | Kiểu dữ liệu | Ghi chú |
| --- | --- | --- | --- | --- |
| 1 | MA_KHACHHANG | Mã khách hàng (Liên kết tới bảng `KHACHHANG`). | nvarchar(20) | Cho phép NULL |
| 2 | MA_TAIKHOAN_TGCKH | Mã tài khoản tiền gửi có kỳ hạn | nvarchar(20) | Cho phép NULL |
| 3 | NGAY_GUI | Ngày gửi | date | Cho phép NULL |
| 4 | NGAY_DENHAN | Ngày đến hạn | date | Cho phép NULL |
| 5 | KY_HAN | Kỳ hạn | int | Cho phép NULL |
| 6 | LAISUAT | Lãi suất | numeric(7,2) | Cho phép NULL |
| 7 | SOTIEN | Số tiền | numeric(18,2) | Cho phép NULL |
| 8 | LOAITIEN | Loại tiền | nvarchar(5) | Cho phép NULL |
| 9 | SOTIEN_LAI | Số tiền lãi | numeric(18,2) | Cho phép NULL |
| 10 | SOTIEN_THUCNHAN | Số tiền thực nhận | numeric(18,2) | Cho phép NULL |
| 11 | TUGIAHAN | Tự gia hạn | int | Cho phép NULL |
| 12 | NGAY_RUT | Ngày rút | date | Cho phép NULL |
| 13 | TRANG_THAI | Trạng thái | int | Cho phép NULL |

### 3.12. Bảng 12: Tiền gửi thanh toán

Bảng **`TIENGUI_THANHTOAN`** lưu trữ các thông tin liên quan đến tài khoản thanh toán của khách hàng, bao gồm mã tài khoản thanh toán, thời gian giao dịch, số dư ban đầu, số tiền tăng giảm và số dư cuối cùng. Ngoài ra, bảng còn lưu thông tin về loại tiền và tài khoản gửi/nhận tiền trong giao dịch thanh toán.

| **STT** | **Trường** | **Mô tả** | Kiểu dữ liệu | Ghi chú |
| --- | --- | --- | --- | --- |
| 1 | MA_TAIKHOAN_THANHTOAN | Mã tài khoản thanh toán (Liên kết tới bảng `KHACHHANG`). | nvarchar(15) | Cho phép NULL |
| 2 | THOIGIAN_GIAODICH | Thời gian giao dịch | datetime | Cho phép NULL |
| 3 | SODU_BANDAU | Số dư ban đầu | numeric(18, 0) | Cho phép NULL |
| 4 | SOTIEN_TANG | Số tiền tăng | numeric(18, 0) | Cho phép NULL |
| 5 | SOTIEN_GIAM | Số tiền giảm | numeric(18, 0) | Cho phép NULL |
| 6 | SODU_CUOI | Số dư cuối | numeric(18, 0) | Cho phép NULL |
| 7 | LOAI_TIEN | Loại tiền  | nvarchar(5) | Cho phép NULL |
| 8 | GHI_CHU | Ghi chú | nvarchar(max) | Cho phép NULL |
| 9 | TAIKHOAN_GUITIEN | Tài khoản gửi tiền | nvarchar(50) | Cho phép NULL |
| 10 | TAIKHOAN_NHANTIEN | Tài khoản nhận tiền | nvarchar(50) | Cho phép NULL |
| 11 | LOAI_CK | Loại CK | nvarchar(5) | Cho phép NULL |

### 3.13. Bảng 13: Hợp đồng tín dụng

Bảng **`HOPDONG_TINDUNG`** chứa thông tin về các hợp đồng tín dụng của khách hàng, bao gồm mã khách hàng, mã hợp đồng, thông tin về hình thức tín dụng, số tiền vay, kỳ hạn, lãi suất và các thông tin liên quan đến ngày giải ngân và đáo hạn.

| **STT** | **Trường** | **Mô tả** | Kiểu dữ liệu | Ghi chú |
| --- | --- | --- | --- | --- |
| 1 | MA_KHACHHANG | Mã khách hàng (Liên kết tới bảng `KHACHHANG`). | nvarchar(20) | Cho phép NULL |
| 2 | MA_HOPDONG_TINDUNG | Mã hợp đồng tín dụng | nvarchar(20) | Cho phép NULL |
| 3 | MA_HOPDONG_THECHAP | Mã hợp đồng thế chấp (Liên kết trực tiếp tới bảng `HOPDONG_THECHAP`). | nvarchar(20) | Cho phép NULL |
| 4 | SO_HOPDONG_TINDUNG | Số hợp đồng tín dụng | nvarchar(500) | Cho phép NULL |
| 5 | MA_MUCDICH_CAPTD | Mã mục đích cấp tổng | nvarchar(15) | Cho phép NULL |
| 6 | MA_HINHTHUC_CAPTD | Mã hình thức cấp tổng | nvarchar(15) | Cho phép NULL |
| 7 | MA_PHUONGTHUC_CHOVAY | Mã phương thức cho vay | nvarchar(15) | Cho phép NULL |
| 8 | NGAY_GIAINGAN | Ngày giải ngân | date | Cho phép NULL |
| 9 | SOTIEN | Số tiền | numeric(18,2) | Cho phép NULL |
| 10 | LOAI_TIEN | Loại tiền | nvarchar(10) | Cho phép NULL |
| 11 | NGAY_DAOHAN | Ngày đáo hạn | date | Cho phép NULL |
| 12 | KY_HAN | Kỳ hạn | int | Cho phép NULL |
| 13 | LAISUAT | Lãi suất | numeric(10,2) | Cho phép NULL |

### 3.14. Bảng 14: Mục đích cấp tín dụng

Bảng **`MUCDICH_CAPTINDUNG`** lưu trữ các thông tin về mục đích sử dụng tín dụng của khách hàng, phân chia theo các cấp mục đích tín dụng khác nhau (Cấp 1, Cấp 2, Cấp 3, Cấp 4, Cấp 5). Các thông tin được mô tả bao gồm tên và mã của từng cấp mục đích.

| **STT** | **Trường** | **Mô tả** | Kiểu dữ liệu | Ghi chú |
| --- | --- | --- | --- | --- |
| 1 | MA_CAP1 | Mã cấp 1 | nvarchar(15) | Cho phép NULL |
| 2 | TEN_MUCDICH_CAP1 | Tên mục đích cấp 1 | nvarchar(500) | Cho phép NULL |
| 3 | MA_CAP2 | Mã cấp 2 | nvarchar(15) | Cho phép NULL |
| 4 | TEN_MUCDICH_CAP2 | Tên mục đích cấp 2 | nvarchar(500) | Cho phép NULL |
| 5 | MA_CAP3 | Mã cấp 3 | nvarchar(15) | Cho phép NULL |
| 6 | TEN_MUCDICH_CAP3 | Tên mục đích cấp 3 | nvarchar(500) | Cho phép NULL |
| 7 | MA_CAP4 | Mã cấp 4 | nvarchar(15) | Cho phép NULL |
| 8 | TEN_MUCDICH_CAP4 | Tên mục đích cấp 4 | nvarchar(500) | Cho phép NULL |
| 9 | MA_CAP5 | Mã cấp 5 | nvarchar(15) | Cho phép NULL |
| 10 | TEN_MUCDICH_CAP5 | Tên mục đích cấp 5 | nvarchar(500) | Cho phép NULL |
| 11 | MA_MUCDICH_CAPTD | Mã mục đích cấp tổng (Liên kết trực tiếp tới bảng `HOPDONG_TINDUNG`). | nvarchar(15) | Cho phép NULL |

### **3.15. Bảng 15: Hình thức cấp tín dụng**

Bảng **`HINHTHUC_CAPTINDUNG`** chứa các thông tin về các hình thức cấp tín dụng, bao gồm các cấp từ 1 đến cấp tín dụng tổng.

| **STT** | **Trường** | **Mô tả** | Kiểu dữ liệu | Ghi chú |
| --- | --- | --- | --- | --- |
| 1 | TEN_HINHTHUC_CAP1 | Tên hình thức cấp 1 | nvarchar(500) | Cho phép NULL |
| 2 | MA_CAP2 | Mã cấp 2 | nvarchar(15) | Cho phép NULL |
| 3 | TEN_HINHTHUC_CAP2 | Tên hình thức cấp 2 | nvarchar(500) | Cho phép NULL |
| 4 | MA_HINHTHUC_CAPTD | Mã hình thức cấp tổng (Liên kết trực tiếp tới bảng `HOPDONG_TINDUNG`). | nvarchar(15) | Cho phép NULL |

### 3.16. Bảng 16: Phương thức cho vay

Bảng **`PHUONGTHUC_CHOVAY`** lưu trữ các phương thức vay của khách hàng.

| **STT** | **Trường** | **Mô tả** | Kiểu dữ liệu | Ghi chú |
| --- | --- | --- | --- | --- |
| 1 | MA_CAP1 | Mã cấp 1 | nvarchar(15) | Cho phép NULL |
| 2 | TEN_PHUONGTHUC_CAP1 | Tên phương thức cấp 1 | nvarchar(500) | Cho phép NULL |
| 3 | MA_CAP2 | Mã cấp 2 | nvarchar(15) | Cho phép NULL |
| 4 | TEN_PHUONGTHUC_CAP2 | Tên phương thức cấp 2 | nvarchar(500) | Cho phép NULL |
| 5 | MA_PHUONGTHUC_CHOVAY | Mã phương thức cho vay (Liên kết trực tiếp tới bảng `HOPDONG_TINDUNG`). | nvarchar(15) | Cho phép NULL |

### 3.17. Bảng 17: Loại hình tài sản bảo đảm

Bảng `**LOAIHINH_TSBD**` lưu trữ các thông tin về loại hình tài sản bảo đảm cho các hợp đồng tín dụng.

| **STT** | **Trường** | **Mô tả** | Kiểu dữ liệu | Ghi chú |
| --- | --- | --- | --- | --- |
| 1 | MA_CAP1 | Mã cấp 1 | nvarchar(15) | Cho phép NULL |
| 2 | TEN_LOAIHINH_CAP1 | Tên loại hình cấp 1 | nvarchar(500) | Cho phép NULL |
| 3 | MA_CAP2 | Mã cấp 2 | nvarchar(15) | Cho phép NULL |
| 4 | TEN_LOAIHINH_CAP2 | Tên loại hình cấp 2 | nvarchar(500) | Cho phép NULL |
| 5 | MA_CAP3 | Mã cấp 3 | nvarchar(15) | Cho phép NULL |
| 6 | TEN_LOAIHINH_CAP3 | Tên loại hình cấp 3 | nvarchar(500) | Cho phép NULL |
| 7 | MA_CAP4 | Mã cấp 4 | nvarchar(15) | Cho phép NULL |
| 8 | TEN_LOAIHINH_CAP4 | Tên loại hình cấp 4 | nvarchar(500) | Cho phép NULL |
| 9 | MA_LOAIHINH_TSBD | Mã loại hình tổng | nvarchar(15) | Cho phép NULL |

### 3.18. Bảng 18: Hợp đồng thế chấp

Bảng **`HOPDONG_THECHAP`** chứa thông tin về các hợp đồng thế chấp, bao gồm mã hợp đồng, tên hợp đồng, ngày hợp đồng thế chấp và các ghi chú liên quan.

| **STT** | **Trường** | **Mô tả** | **Kiểu dữ liệu** | **Ghi chú** |
| --- | --- | --- | --- | --- |
| 1 | MA_HOPDONG_THECHAP | Mã hợp đồng thế chấp | nvarchar(20) | Cho phép NULL |
| 2 | TEN_HOPDONG_THECHAP | Tên hợp đồng thế chấp | nvarchar(max) | Cho phép NULL |
| 3 | NGAY_HOPDONG_THECHAP | Ngày hợp đồng thế chấp | date | Cho phép NULL |
| 4 | GHI_CHU | Ghi chú | nvarchar(max) | Cho phép NULL |

### 3.19. Bảng 19: Tài sản bảo đảm

Bảng **`TAISAN_BAODAM`** lưu trữ các thông tin về tài sản bảo đảm, bao gồm mã tài sản, giá trị, địa chỉ, mã hợp đồng và các ghi chú liên quan.

| **STT** | **Trường** | **Mô tả** | **Kiểu dữ liệu** | **Ghi chú** |
| --- | --- | --- | --- | --- |
| 1 | MA_TAISAN_BAODAM | Mã tài sản bảo đảm | nvarchar(20) | Cho phép NULL |
| 2 | MA_LOAIHINH_TSBD | Mã loại hình tài sản bảo đảm | nvarchar(15) | Cho phép NULL |
| 3 | GIATRI | Giá trị | numeric(18,2) | Cho phép NULL |
| 4 | DIACHI | Địa chỉ | nvarchar(max) | Cho phép NULL |
| 5 | MA_THANH_PHO | Mã thành phố | nvarchar(5) | Cho phép NULL |
| 6 | MA_HOPDONG_THECHAP | Mã hợp đồng thế chấp (Liên kết trực tiếp tới bảng `HOPDONG_THECHAP`). | nvarchar(20) | Cho phép NULL |
| 7 | GHICHU | Ghi chú | nvarchar(max) | Cho phép NULL |

### 3.20: Bảng 20: Khách hàng trả nợ các kỳ trong tín dụng

Bảng **`KHACHHANG_TRANO`** lưu trữ thông tin về các khoản trả nợ của khách hàng theo từng kỳ và ngày Khách hàng đến để tất toán khoản nợ của kỳ đó trong tín dụng, bao gồm mã hợp đồng, kỳ trả, ngày trả, số tiền lãi và tổng tiền trả.

| **STT** | **Trường** | **Mô tả** | **Kiểu dữ liệu** | **Ghi chú** |
| --- | --- | --- | --- | --- |
| 1 | MA_HOPDONG_TINDUNG | Mã hợp đồng tín dụng (Liên kết trực tiếp tới bảng `HOPDONG_TINDUNG`). | nvarchar(20) | Cho phép NULL |
| 2 | KYTRA | Kỳ trả | int | Cho phép NULL |
| 3 | NGAYTRA | Ngày trả | date | Cho phép NULL |
| 4 | SOTIEN_LAI | Số tiền lãi | numeric(18,2) | Cho phép NULL |
| 5 | TONG_TIEN | Tổng tiền | numeric(18,2) | Cho phép NULL |

### 3.21. Bảng 21: Kế hoạch trả nợ (theo dự kiến chuẩn tính toán) các kỳ trong tín dụng

Bảng **`KEHOACH_TRANO`** là **bảng tạo mới** để lưu trữ các dự kiến về ngày tất toán các kỳ của khách hàng, để Ngân hàng theo dõi và tính nhóm nợ cho khách hàng, tính lãi quá hạn, cũng như biện pháp hạn chế rủi ro do nợ xấu.

| **STT** | **Trường** | **Mô tả** | **Kiểu dữ liệu** | **Ghi chú** |
| --- | --- | --- | --- | --- |
| 1 | MA_KEHOACH | Mã kế hoạch | nvarchar(20) | Cho phép NULL |
| 2 | MA_HOPDONG_TINDUNG | Mã hợp đồng tín dụng (Liên kết trực tiếp tới bảng `HOPDONG_TINDUNG`). | nvarchar(20) | Cho phép NULL |
| 3 | SOTIEN_DAUKY | Số tiền đầu kỳ | numeric(18, 2) | Cho phép NULL |
| 4 | KYTRA | Kỳ trả | int | Cho phép NULL |
| 5 | NGAY_DAUKY | Ngày đầu kỳ trả nợ | date | Cho phép NULL |
| 6 | NGAY_CUOIKY | Ngày cuối kỳ trả nợ | date | Cho phép NULL |
| 7 | SONGAY_TINHLAI | Số ngày tính lãi | int | Cho phép NULL |
| 8 | LAISUAT | Lãi suất | numeric(7, 2) | Cho phép NULL |
| 9 | SOTIEN_GOC | Số tiền gốc trả | numeric(18,2) | Cho phép NULL |
| 10 | SOTIEN_LAI | Số tiền lãi trả | numeric(18, 0) | Cho phép NULL |
| 11 | TONG_TIEN | Tổng số tiền phải trả (gốc + lãi) | numeric(18, 0) | Cho phép NULL |

## 4. Thiết kế ERD

Hình ảnh minh họa ERD:

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/f0b482dd-ba81-4e7b-9b52-d1f61affe890/1e939608-5352-47e7-8659-a044d74f8ef0/image.png)

## 5. Làm sạch dữ liệu

- Công cụ sử dụng: Microsoft SQL Server

### 5.1. Update lại dữ liệu lỗi trong bảng TIENGUI_TIETKIEM

```sql
UPDATE TIENGUI_TIETKIEM
SET NGAY_GUI = '2024-03-26', NGAY_DENHAN = '2025-04-09'
WHERE MA_TAIKHOAN_TIETKIEM = 'CSAV0015213.1' AND NGAY_RUT = '2024-07-09';
```

### 5.2. Update dữ liệu bảng HOPDONG_THECHAP

- Nếu một hợp đồng thế chấp có nhiều khoản vay hoặc nhiều lần giải ngân, tìm kiếm lần giải ngân đầu tiên (tức là ngày giải ngân nhỏ nhất) và cập nhật ngày đó vào trường `NGAY_HOPDONG_THECHAP` trong bảng `HOPDONG_THECHAP`.
- Cập nhật ngày hợp đồng thế chấp (`NGAY_HOPDONG_THECHAP`) trong bảng `HOPDONG_THECHAP` thành **ngày giải ngân nhỏ nhất** (`MIN(NGAY_GIAINGAN)`) từ bảng `HOPDONG_TINDUNG` có cùng mã hợp đồng thế chấp (`MA_HOPDONG_THECHAP`).
- Query:

```sql
UPDATE HOPDONG_THECHAP
SET NGAY_HOPDONG_THECHAP = B.NGAY_HD
FROM 
HOPDONG_THECHAP A
INNER JOIN (
    SELECT MA_HOPDONG_THECHAP, MIN(NGAY_GIAINGAN) AS 'NGAY_HD'
    FROM HOPDONG_TINDUNG
    GROUP BY MA_HOPDONG_THECHAP
) B 
ON A.MA_HOPDONG_THECHAP = B.MA_HOPDONG_THECHAP;
```

### 5.3. Tạo Stored Procedure NGAYLAMVIEC để cập nhật các ngày nghỉ lễ trong năm 2024

- Khi ngày đến hạn rút tiền của Khách hàng trùng với ngày nghỉ lễ, ngày rút tiền sẽ được cập nhật lại thành ngày làm việc tiếp theo sau ngày nghỉ lễ đó, và trong khoảng từ ngày đến hạn cũ đến ngày làm việc đã cập nhật, khách hàng vẫn được tính lãi theo lãi của kỳ
- Query:

```sql
CREATE PROCEDURE them_ngay_lamviec_gannhat
AS
BEGIN
    -- Kiểm tra xem bảng NGAY_LAMVIEC đã tồn tại hay chưa, nếu chưa thì tạo mới
    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'NGAY_LAMVIEC')
    BEGIN
        -- Tạo bảng NGAY_LAMVIEC
        CREATE TABLE NGAY_LAMVIEC
        (
            NGAY_DENHAN DATE,                -- Ngày hạn cuối
            NGAY_LAMVIEC_GANNHAT DATE        -- Ngày làm việc gần nhất
        );
    END;

    -- Xóa dữ liệu cũ trong bảng trước khi thêm mới
    DELETE FROM NGAY_LAMVIEC;

    -- Khai báo biến ngày bắt đầu
    DECLARE @DATE DATE = '2024-01-01';

    -- Vòng lặp thêm dữ liệu cho tất cả các ngày trong năm 2024
    WHILE @DATE <= '2024-12-31'
    BEGIN
        -- Chèn ngày hiện tại vào bảng NGAY_LAMVIEC
        INSERT INTO NGAY_LAMVIEC (NGAY_DENHAN, NGAY_LAMVIEC_GANNHAT)
        VALUES (@DATE, @DATE);

        -- Tăng ngày thêm 1
        SET @DATE = DATEADD(DAY, 1, @DATE);
    END;

    -- Xử lý các trường hợp đặc biệt cho ngày làm việc gần nhất

    -- 1. Chủ nhật: Chuyển ngày làm việc gần nhất sang Thứ Hai
    UPDATE NGAY_LAMVIEC 
    SET NGAY_LAMVIEC_GANNHAT = DATEADD(DAY, 1, NGAY_DENHAN) 
    WHERE DATEPART(WEEKDAY, NGAY_DENHAN) = 1;  -- Chủ nhật

    -- 2. Tết dương lịch: Ngày làm việc gần nhất sau Tết Dương là ngày 02/01/2024
    UPDATE NGAY_LAMVIEC 
    SET NGAY_LAMVIEC_GANNHAT = '2024-01-02' 
    WHERE NGAY_LAMVIEC_GANNHAT = '2024-01-01';

    -- 3. Tết âm lịch: Các ngày từ 08/02/2024 đến 14/02/2024, ngày làm việc gần nhất là 15/02/2024
    UPDATE NGAY_LAMVIEC 
    SET NGAY_LAMVIEC_GANNHAT = '2024-02-15' 
    WHERE NGAY_LAMVIEC_GANNHAT BETWEEN '2024-02-08' AND '2024-02-14';

    -- 4. Giỗ tổ Hùng Vương: Ngày 18/04/2024, ngày làm việc gần nhất là 19/04/2024
    UPDATE NGAY_LAMVIEC 
    SET NGAY_LAMVIEC_GANNHAT = '2024-04-19' 
    WHERE NGAY_LAMVIEC_GANNHAT = '2024-04-18';

    -- 5. Ngày 30/04 - 01/05: Ngày làm việc gần nhất sau kỳ nghỉ là 02/05/2024
    UPDATE NGAY_LAMVIEC 
    SET NGAY_LAMVIEC_GANNHAT = '2024-05-02' 
    WHERE NGAY_LAMVIEC_GANNHAT BETWEEN '2024-04-29' AND '2024-05-01';

    -- 6. Ngày Quốc Khánh 2/9: Ngày làm việc gần nhất sau lễ là 04/09/2024
    UPDATE NGAY_LAMVIEC 
    SET NGAY_LAMVIEC_GANNHAT = '2024-09-04' 
    WHERE NGAY_LAMVIEC_GANNHAT BETWEEN '2024-09-02' AND '2024-09-03';
END;

--- THỰC THI
EXEC them_ngay_lamviec_gannhat;
```

### 5.4. Tạo Stored Procedure Update dữ liệu bảng KEHOACH_TRANO theo phương pháp tính dư nợ giảm dần

```sql
--- TẠO 1 PROCEDURE ĐỂ TẠO KẾ HOẠCH TRẢ NỢ CHO KHÁCH HÀNG
CREATE PROC TAO_KEHOACH_TRANO 
@MA_HDTD		nvarchar(20),
@SOTIEN			numeric(18,2),
@NGAY_GIAINGAN	date,
@NGAY_DENHAN	date,
@LAISUAT		numeric(5,2)
as
begin
	declare @soky as int;						
	declare @sotiengocmoiky as numeric(18,0);
	declare @sotienconlai as numeric(18,0);
	declare @sotienlai as numeric(18,0);
	
	declare @i as int = 1;
	declare @ngaydauky as date;
	declare @ngaycuoiky as date;
	declare @songaytinhlai as int;
	declare @sotiengocdauky as numeric(18,0);
	
	
	set @ngaydauky = @ngay_giaingan;
	set @soky = datediff(month,@ngay_giaingan,@ngay_denhan); --> 12 kỳ 
	set @sotiengocmoiky  = round(@SOTIEN / @soky, 0);        ---> 3 tỷ /12 tháng = 250tr
	
	
	while @i <= @soky
	begin
		if @i = @soky
			set @ngaycuoiky = @ngay_denhan;
		else
			set @ngaycuoiky = DATEADD(DAY,-1, DATEADD(month,1,@ngaydauky));

		set @songaytinhlai = datediff(day,@ngaydauky,@ngaycuoiky) + 1;
		set @sotiengocdauky = @SOTIEN - @sotiengocmoiky* (@i-1);
		set @sotienlai = round( @sotiengocdauky*@laisuat*@songaytinhlai/36500,0);

		if @i = @soky
			set @sotiengocmoiky = @sotiengocdauky; 
		------> DO ANH DÙNG HÀM ROUND CHO SỐ TIỀN GỐC MỖI KỲ NÊN ĐẾN KỲ CUỐI ANH ĐỂ SỐ TIỀN GỐ PHẢI TRẢ = GỐC ĐẦU KỲ ĐỂ KHI CỘNG LẠI MỚI TRÒN

		insert into KEHOACH_TRANO
		values('KH-' + @MA_HDTD ,@MA_HDTD,@sotiengocdauky,@i,@ngaydauky,@ngaycuoiky,@songaytinhlai,@laisuat,@sotiengocmoiky,@sotienlai,@sotienlai + @sotiengocmoiky);
		set @i = @i+1;
		set @ngaydauky = DATEADD(day,1, @ngaycuoiky);
	end;		
end;

--- TẠO 1 CON TRỎ ĐỂ TẠO KẾ HOẠCH CHO TẤT CẢ CÁC KHOẢN NỢ
CREATE PROC THEM_MOI_KEHOACH_MUANO
AS
BEGIN
	DECLARE @MA_HOPDONG_TINDUNG		AS	NVARCHAR(20);					---> TẠO BIẾN TÊN @MA_HOPDONG_TINDUNG; biến này để đổ thông tin từ con trỏ vào
    DECLARE @SOTIEN					AS	numeric(18,2);
    DECLARE @NGAY_GIAINGAN			AS	date;
    DECLARE @NGAY_DENHAN			AS	date;
    DECLARE @LAISUAT				AS	numeric(5,2);

	DECLARE CURSOR_KEHOACH CURSOR FOR							---> KHAI BÁO CON TRỎ
    SELECT DISTINCT  MA_HOPDONG_TINDUNG FROM HOPDONG_TINDUNG;	---> CÂU LỆNH SQL CẦN LẤY THÔNG TIN, Ở ĐÂY TA LẤY TẤT CẢ HỢP ĐỒNG TÍN DỤNG

    OPEN CURSOR_KEHOACH;										---> MỞ CON TRỎ
    FETCH NEXT FROM  CURSOR_KEHOACH INTO @MA_HOPDONG_TINDUNG;	
	---> GÁN LẦN LƯỢT VÀO BIẾN ĐÃ KHAI BÁO TRÊN: @MA_HOPDONG_TINDUNG, @SOTIEN, @NGAY_GIAINGAN, @NGAY_DENHAN, @LAISUAT (BẮT ĐẦU GIÁ TRỊ ĐẦU TIÊN)

    WHILE @@FETCH_STATUS = 0									-----> KHI VẪN ĐANG ĐỌC CON TRỎ
    BEGIN
		SET @SOTIEN			= (SELECT SOTIEN		FROM HOPDONG_TINDUNG WHERE MA_HOPDONG_TINDUNG = @MA_HOPDONG_TINDUNG);
		SET @NGAY_GIAINGAN	= (SELECT NGAY_GIAINGAN FROM HOPDONG_TINDUNG WHERE MA_HOPDONG_TINDUNG = @MA_HOPDONG_TINDUNG);
		SET @NGAY_DENHAN	= (SELECT NGAY_DAOHAN	FROM HOPDONG_TINDUNG WHERE MA_HOPDONG_TINDUNG = @MA_HOPDONG_TINDUNG);
		SET @LAISUAT		= (SELECT LAISUAT		FROM HOPDONG_TINDUNG WHERE MA_HOPDONG_TINDUNG = @MA_HOPDONG_TINDUNG);
		
        EXEC TAO_KEHOACH_TRANO  @MA_HOPDONG_TINDUNG, @SOTIEN, @NGAY_GIAINGAN, @NGAY_DENHAN, @LAISUAT;
        FETCH NEXT FROM CURSOR_KEHOACH INTO @MA_HOPDONG_TINDUNG;			-----> ĐỌC SANG GIÁ TRỊ KẾ TIẾP
    END;
    CLOSE		CURSOR_KEHOACH;								----> ĐÓNG CON TRỎ
    DEALLOCATE	CURSOR_KEHOACH;								----> VÔ HIỆU HÓA CON TRỎ
END;

--- THỰC THI PROCEDURE
EXEC THEM_MOI_KEHOACH_MUANO;
```

## 6. Các bài toán đặt ra

### 6.1. Bài toán tính doanh thu và chi phí theo tháng của ngân hàng

- Doanh thu của ngân hàng: Thu lãi từ việc Thu hồi các khoản nợ các kỳ của các Hợp đồng tín dụng
- Chi phí của ngân hàng: Trả lãi cho Khách hàng từ các dịch vụ Tiền gửi có kỳ hạn, TIền gửi Thanh toán, Tiền gửi tiết kiệm
- Chi phí đối với tài khoản Tiền gửi không kỳ hạn (tài khoản thanh toán):
    - **Cách tính**: Lãi suất tính trên số dư tài khoản thanh toán mỗi ngày, từ ngày gửi đến ngày trước khi rút tiền.
    - **Công thức tính**: **`Số tiền lãi ngày = Số dư thực tế * Lãi suất tính lãi / 365`**
    - Trong đó:
        - **Lãi suất tính lãi**: Được tính theo tỷ lệ phần trăm trên năm (%/năm). Thường sẽ là 0.1%/năm.
        - **Số dư thực tế**: Là số dư trong tài khoản thanh toán tại thời điểm cuối mỗi ngày.
    - Procedure thêm số dư cuối ngày của các tài khoản thanh toán trong khoảng thời gian từ @StartDate đến @EndDate:
        
        ```sql
        --- PROC 1: PROC THIẾT LẬP ĐỂ TÍNH SỐ TIỀN CUỐI MỖI NGÀY ĐỐI VỚI TÀI KHOẢN THANH TOÁN
        CREATE PROC THEM_SODUCUOINGAY
            @StartDate DATE,
            @EndDate DATE
        AS
        BEGIN
            -- Tạo bảng để lưu kết quả nếu chưa tồn tại
            IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'TINH_SODUCUOINGAY')
            BEGIN
                CREATE TABLE TINH_SODUCUOINGAY (
                    MA_TAIKHOAN_THANHTOAN NVARCHAR(20),
                    NGAY_GIAODICH DATE,
                    SODUCUOINGAY NUMERIC(18, 2)
                );
            END;
        
            -- Xóa dữ liệu cũ trong khoảng thời gian cần tính toán
            DELETE FROM TINH_SODUCUOINGAY;
        
            -- Tạo dữ liệu ban đầu cho tất cả các ngày trong khoảng thời gian chỉ định
            DECLARE @CUR_DATE DATE = @StartDate;
        
            WHILE @CUR_DATE <= @EndDate
            BEGIN
                -- Thêm các bản ghi cho từng tài khoản với số dư ban đầu là 0
                INSERT INTO TINH_SODUCUOINGAY (MA_TAIKHOAN_THANHTOAN, NGAY_GIAODICH, SODUCUOINGAY)
                SELECT DISTINCT TG.MA_TAIKHOAN_THANHTOAN, @CUR_DATE, 0
                FROM TIENGUI_THANHTOAN TG;
        
                -- Tăng ngày
                SET @CUR_DATE = DATEADD(DAY, 1, @CUR_DATE);
            END;
        
            -- Cập nhật số dư cuối ngày cho các ngày có giao dịch
            UPDATE TINH_SODUCUOINGAY
            SET SODUCUOINGAY = TG.SODU_CUOI
            FROM TINH_SODUCUOINGAY TS
            INNER JOIN (
                -- Lấy giao dịch cuối cùng trong ngày của mỗi tài khoản
                SELECT 
                    MA_TAIKHOAN_THANHTOAN,
                    CAST(THOIGIAN_GIAODICH AS DATE) AS NGAY_GIAODICH,
                    SODU_CUOI,
                    ROW_NUMBER() OVER (PARTITION BY MA_TAIKHOAN_THANHTOAN, CAST(THOIGIAN_GIAODICH AS DATE) ORDER BY THOIGIAN_GIAODICH DESC, ID DESC) AS RN
                FROM TIENGUI_THANHTOAN A
                WHERE CAST(THOIGIAN_GIAODICH AS DATE) BETWEEN @StartDate AND @EndDate
            ) TG
            ON TS.MA_TAIKHOAN_THANHTOAN = TG.MA_TAIKHOAN_THANHTOAN AND TS.NGAY_GIAODICH = TG.NGAY_GIAODICH
            WHERE TG.RN = 1;
        
            -- Cập nhật số dư cho các ngày không có giao dịch
            DECLARE @MA_TK NVARCHAR(20);
            DECLARE CURSOR_TK CURSOR FOR 
            SELECT DISTINCT MA_TAIKHOAN_THANHTOAN FROM TINH_SODUCUOINGAY;
        
            OPEN CURSOR_TK;
            FETCH NEXT FROM CURSOR_TK INTO @MA_TK;
        
            WHILE @@FETCH_STATUS = 0
            BEGIN
                DECLARE @TIEN NUMERIC(18, 2) = 0;
                DECLARE @DATE DATE = @StartDate;
        
                -- Kiểm tra số dư ngày @StartDate, nếu không có giao dịch thì lấy số dư ban đầu của giao dịch đầu tiên sau đó
                IF (SELECT SODUCUOINGAY FROM TINH_SODUCUOINGAY WHERE NGAY_GIAODICH = @StartDate AND MA_TAIKHOAN_THANHTOAN = @MA_TK) = 0
                BEGIN
                    SET @TIEN = (SELECT TOP 1 SODU_BANDAU FROM TIENGUI_THANHTOAN 
                                 WHERE MA_TAIKHOAN_THANHTOAN = @MA_TK 
                                 AND CAST(THOIGIAN_GIAODICH AS DATE) > @StartDate
                                 ORDER BY THOIGIAN_GIAODICH ASC);
                    UPDATE TINH_SODUCUOINGAY 
                    SET SODUCUOINGAY = @TIEN 
                    WHERE NGAY_GIAODICH = @StartDate AND MA_TAIKHOAN_THANHTOAN = @MA_TK;
                END;
        
                -- Duyệt qua từng ngày để cập nhật số dư cho các ngày không có giao dịch
                WHILE @DATE <= @EndDate
                BEGIN
                    SET @TIEN = (SELECT TOP 1 SODUCUOINGAY FROM TINH_SODUCUOINGAY 
                                 WHERE MA_TAIKHOAN_THANHTOAN = @MA_TK 
                                 AND NGAY_GIAODICH <= @DATE 
                                 AND SODUCUOINGAY > 0
                                 ORDER BY NGAY_GIAODICH DESC);
        
                    -- Cập nhật số dư nếu không có giao dịch
                    IF (SELECT SODUCUOINGAY FROM TINH_SODUCUOINGAY 
                        WHERE NGAY_GIAODICH = @DATE AND MA_TAIKHOAN_THANHTOAN = @MA_TK) = 0
                    BEGIN
                        UPDATE TINH_SODUCUOINGAY 
                        SET SODUCUOINGAY = @TIEN 
                        WHERE NGAY_GIAODICH = @DATE AND MA_TAIKHOAN_THANHTOAN = @MA_TK;
                    END;
        
                    -- Tăng ngày
                    SET @DATE = DATEADD(DAY, 1, @DATE);
                END;
        
                FETCH NEXT FROM CURSOR_TK INTO @MA_TK;
            END;
        
            CLOSE CURSOR_TK;
            DEALLOCATE CURSOR_TK;
        END;
        
        -- THỰC THI
        EXEC THEM_SODUCUOINGAY '2024-01-01', '2024-03-31';
        
        SELECT * FROM TINH_SODUCUOINGAY
        ORDER BY MA_TAIKHOAN_THANHTOAN, NGAY_GIAODICH;
        ```
        
- Chi phí Tiền gửi có kỳ hạn, tiền gửi tiết kiệm:
    - Tính chi phí vào thời điểm khách hàng rút tiền gửi
    - Các trường hợp xảy ra:
        - Khách hàng rút trước hạn: Tính lãi theo lãi không kỳ hạn cho khách hàng (Sử dụng lãi không kỳ hạn là 0.1%/năm)
        - Khách hàng rút sau hạn:
            - Trường hợp tự động gia hạn: Mở kỳ hạn mới cho Khách hàng, với thời hạn của kỳ hạn mới đúng với kỳ hạn cũ, và lãi suất bằng với lãi suất hiện hành
            - Trường hợp không tự động gia hạn: Những ngày sau khi kết thúc kỳ hạn, khách hàng được tính lãi theo lãi suất không kỳ hạn (0.1%/năm)
    - Lưu ý: Nếu ngày đến hạn rút tiền của khách hàng trùng với ngày lễ, ngày đến hạn sẽ được cập nhật thành “Ngày làm việc tiếp theo”, và khách hàng sẽ hưởng lãi suất trong kỳ hạn áp dụng với khoảng thời gian từ ngày đến hạn cho đến ngày làm việc tiếp theo.
        
        ⇒ Đã chỉnh ngày đến hạn thành ngày làm việc tiếp theo, và tính lãi cho Khách hàng.
        
    
    ⇒ Stored Procedure để cập nhật số tiền lãi nhận được của Khách hàng đối với tiền gửi có kỳ hạn và tiền gửi tiết kiệm:
    
    - Stored Procedure tính tiền lãi tiền gửi có kỳ hạn:
    
    ```sql
    --- PROC 1: PROC XOAY VÒNG KỲ HẠN ĐỐI VỚI TRƯỜNG HỢP TỰ ĐỘNG GIA HẠN
    CREATE PROC XOAYVONG1
    @MA_TAIKHOAN		NVARCHAR(20)
    AS
    BEGIN
    	--> KHAI BÁO BIẾN
    
    	DECLARE @NGAYDENHAN AS DATE;
    	DECLARE	@NGAYRUT	AS DATE;
    	DECLARE @KYHAN		AS INT;
    
    	SET @NGAYDENHAN	= (SELECT NGAY_DENHAN	FROM TIENGUI_COKYHAN WHERE MA_TAIKHOAN_TGCKH = @MA_TAIKHOAN);
    	SET @NGAYRUT	= (SELECT NGAY_RUT		FROM TIENGUI_COKYHAN WHERE MA_TAIKHOAN_TGCKH = @MA_TAIKHOAN);
    	SET @KYHAN		= (SELECT KY_HAN		FROM TIENGUI_COKYHAN WHERE MA_TAIKHOAN_TGCKH = @MA_TAIKHOAN);
    	
    	--> CHẠY VÒNG LẶP
    	while @NGAYDENHAN < @NGAYRUT
    		BEGIN
    			UPDATE	TIENGUI_COKYHAN
    			SET		SOTIEN	=	SOTIEN + ( DATEDIFF(D, NGAY_GUI, NGAY_DENHAN)*LAISUAT*SOTIEN )/(100*365), --> CẬP NHẬT LẠI GỐC MỚI = GỐC + LÃI
    								NGAY_GUI	=	@NGAYDENHAN, --> ĐẦU KỲ MỚI BẰNG CUỐI KỲ CŨ
    								NGAY_DENHAN	=	DATEADD(MONTH, @KYHAN ,NGAY_DENHAN)
    			WHERE	MA_TAIKHOAN_TGCKH = @MA_TAIKHOAN
    			SET @NGAYDENHAN = (SELECT NGAY_DENHAN FROM TIENGUI_COKYHAN WHERE MA_TAIKHOAN_TGCKH = @MA_TAIKHOAN)
    		END
    END;
    
    --- PROC 2: TÍNH TIỀN LÃI TIỀN GỬI CÓ KỲ HẠN CỦA KHÁCH HÀNG
    ALTER PROCEDURE TINHLAI_TIENGUI_COKYHAN
    AS
    BEGIN
        -- Khai báo CURSOR cho danh sách tất cả các tài khoản cần xử lý
        DECLARE @MA_TAIKHOAN NVARCHAR(20);
        
        DECLARE CURSOR_TAIKHOAN CURSOR FOR
        SELECT MA_TAIKHOAN_TGCKH FROM TIENGUI_COKYHAN;
    
        -- Mở CURSOR
        OPEN CURSOR_TAIKHOAN;
        
        -- Lấy từng tài khoản trong CURSOR
        FETCH NEXT FROM CURSOR_TAIKHOAN INTO @MA_TAIKHOAN;
    
        -- Bắt đầu vòng lặp CURSOR
        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- CẬP NHẬT NGÀY RÚT THEO NGÀY LÀM VIỆC GẦN NHẤT
            UPDATE TIENGUI_COKYHAN
            SET NGAY_RUT = NGAY_LAMVIEC_GANNHAT
            FROM TIENGUI_COKYHAN A
                INNER JOIN NGAY_LAMVIEC B ON A.NGAY_RUT = B.NGAY_DENHAN
            WHERE A.TRANG_THAI = 1
                AND NGAY_RUT >= A.NGAY_DENHAN
                AND A.MA_TAIKHOAN_TGCKH = @MA_TAIKHOAN;
    
            -- Khai báo các biến
            DECLARE @NGAYGUI AS DATE;
            DECLARE @NGAYDENHAN AS DATE;
            DECLARE @TUGIAHAN AS INT;
            DECLARE @NGAYRUT AS DATE;
            DECLARE @LS_KHONG_KH AS NUMERIC(10,2);
    
            -- Gán giá trị cho các biến
            SET @NGAYGUI = (SELECT NGAY_GUI FROM TIENGUI_COKYHAN WHERE MA_TAIKHOAN_TGCKH = @MA_TAIKHOAN);
            SET @NGAYDENHAN = (SELECT NGAY_DENHAN FROM TIENGUI_COKYHAN WHERE MA_TAIKHOAN_TGCKH = @MA_TAIKHOAN);
            SET @TUGIAHAN = (SELECT TUGIAHAN FROM TIENGUI_COKYHAN WHERE MA_TAIKHOAN_TGCKH = @MA_TAIKHOAN);
            SET @NGAYRUT = (SELECT NGAY_RUT FROM TIENGUI_COKYHAN WHERE MA_TAIKHOAN_TGCKH = @MA_TAIKHOAN);
            SET @LS_KHONG_KH = (SELECT CASE LOAITIEN WHEN 'VND' THEN 0.1 ELSE 0 END FROM TIENGUI_COKYHAN WHERE MA_TAIKHOAN_TGCKH = @MA_TAIKHOAN);
    
            -- Phân chia các trường hợp
            -- TH1: RÚT TIỀN TRƯỚC HẠN
            IF @NGAYRUT < @NGAYDENHAN
            BEGIN
                -- Tính lãi không kỳ hạn
                UPDATE TIENGUI_COKYHAN
                SET SOTIEN_LAI = (DATEDIFF(D, @NGAYGUI, @NGAYRUT) * 0.1 * SOTIEN) / (100 * 365)
                WHERE MA_TAIKHOAN_TGCKH = @MA_TAIKHOAN;
            END
            ELSE
            BEGIN
                -- TH2: RÚT TIỀN SAU HẠN, xử lý gia hạn
                IF @TUGIAHAN = 1
                BEGIN
                    -- Gọi PROC XOAY VÒNG
                    EXEC XOAYVONG1 @MA_TAIKHOAN;
                    
                    -- Cập nhật lãi suất không kỳ hạn cho những ngày còn lại
                    UPDATE TIENGUI_COKYHAN
                    SET SOTIEN_LAI = SOTIEN_LAI + (DATEDIFF(D, NGAY_GUI, @NGAYRUT) * @LS_KHONG_KH * SOTIEN) / (100 * 365)
                    WHERE MA_TAIKHOAN_TGCKH = @MA_TAIKHOAN;
                END
                ELSE
                BEGIN
                    -- Tính lãi 1 kỳ gửi, và tính lãi suất không kỳ hạn cho những ngày còn lại
                    UPDATE TIENGUI_COKYHAN
                    SET SOTIEN_LAI = (DATEDIFF(D, @NGAYGUI, @NGAYDENHAN) * LAISUAT * SOTIEN) / (100 * 365) -- Lãi 1 kỳ
                        + (DATEDIFF(D, @NGAYDENHAN, @NGAYRUT) * @LS_KHONG_KH * SOTIEN) / (100 * 365) -- Lãi không kỳ hạn
                    WHERE MA_TAIKHOAN_TGCKH = @MA_TAIKHOAN;
                END;
            END;
    
            -- Lấy tài khoản tiếp theo
            FETCH NEXT FROM CURSOR_TAIKHOAN INTO @MA_TAIKHOAN;
        END;
    
        -- Đóng CURSOR
        CLOSE CURSOR_TAIKHOAN;
        DEALLOCATE CURSOR_TAIKHOAN;
    END;
    
    -- THỰC THI
    EXEC TINHLAI_TIENGUI_COKYHAN;
    ```
    
    - Stored Procedure tính tiền lãi tiền gửi tiết kiệm:
    
    ```sql
    --- PROC 1: PROC XOAY VÒNG KỲ HẠN ĐỐI VỚI TRƯỜNG HỢP TỰ ĐỘNG GIA HẠN
    CREATE PROC XOAYVONG2
    @MA_TAIKHOAN		NVARCHAR(20)
    AS
    BEGIN
    	--> KHAI BÁO BIẾN
    
    	DECLARE @NGAYDENHAN AS DATE;
    	DECLARE	@NGAYRUT	AS DATE;
    	DECLARE @KYHAN		AS INT;
    
    	SET @NGAYDENHAN	= (SELECT NGAY_DENHAN	FROM TIENGUI_TIETKIEM WHERE MA_TAIKHOAN_TIETKIEM = @MA_TAIKHOAN);
    	SET @NGAYRUT	= (SELECT NGAY_RUT		FROM TIENGUI_TIETKIEM WHERE MA_TAIKHOAN_TIETKIEM = @MA_TAIKHOAN);
    	SET @KYHAN		= (SELECT KY_HAN		FROM TIENGUI_TIETKIEM WHERE MA_TAIKHOAN_TIETKIEM = @MA_TAIKHOAN);
    	
    	--> CHẠY VÒNG LẶP
    	while @NGAYDENHAN < @NGAYRUT
    		BEGIN
    			UPDATE	TIENGUI_TIETKIEM
    			SET		SOTIEN	=	SOTIEN + ( DATEDIFF(D, NGAY_GUI, NGAY_DENHAN)*LAISUAT*SOTIEN )/(100*365), --> CẬP NHẬT LẠI GỐC MỚI = GỐC + LÃI
    								NGAY_GUI	=	@NGAYDENHAN, --> ĐẦU KỲ MỚI BẰNG CUỐI KỲ CŨ
    								NGAY_DENHAN	=	DATEADD(MONTH, @KYHAN ,NGAY_DENHAN)
    			WHERE	MA_TAIKHOAN_TIETKIEM = @MA_TAIKHOAN
    			SET @NGAYDENHAN = (SELECT NGAY_DENHAN FROM TIENGUI_TIETKIEM WHERE MA_TAIKHOAN_TIETKIEM = @MA_TAIKHOAN)
    		END
    END;
    
    --- PROC 2: TÍNH TIỀN LÃI TIỀN GỬI TIẾT KIỆM CỦA KHÁCH HÀNG
    ALTER PROCEDURE TINHLAI_TIENGUI_TIETKIEM
    AS
    BEGIN
        -- Khai báo CURSOR cho danh sách tất cả các tài khoản cần xử lý
        DECLARE @MA_TAIKHOAN NVARCHAR(20);
        
        DECLARE CURSOR_TAIKHOAN CURSOR FOR
        SELECT MA_TAIKHOAN_TIETKIEM FROM TIENGUI_TIETKIEM;
    
        -- Mở CURSOR
        OPEN CURSOR_TAIKHOAN;
        
        -- Lấy từng tài khoản trong CURSOR
        FETCH NEXT FROM CURSOR_TAIKHOAN INTO @MA_TAIKHOAN;
    
        -- Bắt đầu vòng lặp CURSOR
        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- CẬP NHẬT NGÀY RÚT THEO NGÀY LÀM VIỆC GẦN NHẤT
            UPDATE TIENGUI_TIETKIEM
            SET NGAY_RUT = NGAY_LAMVIEC_GANNHAT
            FROM TIENGUI_TIETKIEM A
                INNER JOIN NGAY_LAMVIEC B ON A.NGAY_RUT = B.NGAY_DENHAN
            WHERE A.TRANG_THAI = 1
                AND NGAY_RUT >= A.NGAY_DENHAN
                AND A.MA_TAIKHOAN_TIETKIEM = @MA_TAIKHOAN;
    
            -- Khai báo các biến
            DECLARE @NGAYGUI AS DATE;
            DECLARE @NGAYDENHAN AS DATE;
            DECLARE @TUGIAHAN AS INT;
            DECLARE @NGAYRUT AS DATE;
            DECLARE @LS_KHONG_KH AS NUMERIC(10,2);
    
            -- Gán giá trị cho các biến
            SET @NGAYGUI = (SELECT NGAY_GUI FROM TIENGUI_TIETKIEM WHERE MA_TAIKHOAN_TIETKIEM = @MA_TAIKHOAN);
            SET @NGAYDENHAN = (SELECT NGAY_DENHAN FROM TIENGUI_TIETKIEM WHERE MA_TAIKHOAN_TIETKIEM = @MA_TAIKHOAN);
            SET @TUGIAHAN = (SELECT TUGIAHAN FROM TIENGUI_TIETKIEM WHERE MA_TAIKHOAN_TIETKIEM = @MA_TAIKHOAN);
            SET @NGAYRUT = (SELECT NGAY_RUT FROM TIENGUI_TIETKIEM WHERE MA_TAIKHOAN_TIETKIEM = @MA_TAIKHOAN);
            SET @LS_KHONG_KH = (SELECT CASE LOAITIEN WHEN 'VND' THEN 0.1 ELSE 0 END FROM TIENGUI_TIETKIEM WHERE MA_TAIKHOAN_TIETKIEM = @MA_TAIKHOAN);
    
            -- Phân chia các trường hợp
            -- TH1: RÚT TIỀN TRƯỚC HẠN
            IF @NGAYRUT < @NGAYDENHAN
            BEGIN
                -- Tính lãi không kỳ hạn
                UPDATE TIENGUI_TIETKIEM
                SET SOTIEN_LAI = (DATEDIFF(D, @NGAYGUI, @NGAYRUT) * 0.1 * SOTIEN) / (100 * 365)
                WHERE MA_TAIKHOAN_TIETKIEM = @MA_TAIKHOAN;
            END
            ELSE
            BEGIN
                -- TH2: RÚT TIỀN SAU HẠN, xử lý gia hạn
                IF @TUGIAHAN = 1
                BEGIN
                    -- Gọi PROC XOAY VÒNG
                    EXEC XOAYVONG2 @MA_TAIKHOAN;
                    
                    -- Cập nhật lãi suất không kỳ hạn cho những ngày còn lại
                    UPDATE TIENGUI_TIETKIEM
                    SET SOTIEN_LAI = SOTIEN_LAI + (DATEDIFF(D, NGAY_GUI, @NGAYRUT) * @LS_KHONG_KH * SOTIEN) / (100 * 365)
                    WHERE MA_TAIKHOAN_TIETKIEM = @MA_TAIKHOAN;
                END
                ELSE
                BEGIN
                    -- Tính lãi 1 kỳ gửi, và tính lãi suất không kỳ hạn cho những ngày còn lại
                    UPDATE TIENGUI_TIETKIEM
                    SET SOTIEN_LAI = (DATEDIFF(D, @NGAYGUI, @NGAYDENHAN) * LAISUAT * SOTIEN) / (100 * 365) -- Lãi 1 kỳ
                        + (DATEDIFF(D, @NGAYDENHAN, @NGAYRUT) * @LS_KHONG_KH * SOTIEN) / (100 * 365) -- Lãi không kỳ hạn
                    WHERE MA_TAIKHOAN_TIETKIEM = @MA_TAIKHOAN;
                END;
            END;
    
            -- Lấy tài khoản tiếp theo
            FETCH NEXT FROM CURSOR_TAIKHOAN INTO @MA_TAIKHOAN;
        END;
    
        -- Đóng CURSOR
        CLOSE CURSOR_TAIKHOAN;
        DEALLOCATE CURSOR_TAIKHOAN;
    END;
    
    -- THỰC THI
    EXEC TINHLAI_TIENGUI_TIETKIEM;
    ```
    
- Stored Procedure tạo báo cáo doanh thu theo tháng:

```sql
ALTER PROCEDURE BC_THUCHI
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    -- TẠO BẢNG BAOCAO_THUCHI NẾU CHƯA TỒN TẠI
    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'BAOCAO_THUCHI')
    BEGIN
        CREATE TABLE BAOCAO_THUCHI (
            ID  INT PRIMARY KEY,
            TIEU_CHI  NVARCHAR(500),
            SO_TIEN  NUMERIC(18,2)
        );

        INSERT INTO BAOCAO_THUCHI (ID, TIEU_CHI, SO_TIEN)
        VALUES (1, N'DOANH THU TỪ LÃI CÁC HĐTD', 0),
               (2, N'CHI PHÍ LÃI TIỀN GỬI KHÔNG KỲ HẠN', 0),
               (3, N'CHI PHÍ LÃI TIỀN GỬI CÓ KỲ HẠN', 0),
               (4, N'CHI PHÍ LÃI TIỀN GỬI TIẾT KIỆM', 0),
               (5, N'TỔNG LỢI NHUẬN', 0);
    END;

    -- CẬP NHẬT DÒNG DOANH THU TỪ LÃI CÁC HĐTD
    UPDATE BAOCAO_THUCHI
    SET SO_TIEN = ISNULL(
        (SELECT SUM(SOTIEN_LAI)
        FROM KHACHHANG_TRANO
        WHERE NGAYTRA >= @StartDate AND NGAYTRA <= @EndDate)
    ,0)
    WHERE ID = 1;

    -- CẬP NHẬT CHI PHÍ LÃI TIỀN GỬI KHÔNG KỲ HẠN
    EXEC THEM_SODUCUOINGAY @StartDate, @EndDate;
    
    UPDATE BAOCAO_THUCHI
    SET SO_TIEN = ISNULL(
        (SELECT SUM(SODUCUOINGAY) * 0.1 / 100 / 365
        FROM TINH_SODUCUOINGAY
        WHERE NGAY_GIAODICH >= @StartDate AND NGAY_GIAODICH <= @EndDate)
    ,0)
    WHERE ID = 2;

    -- CẬP NHẬT CHI PHÍ LÃI TIỀN GỬI CÓ KỲ HẠN
    UPDATE BAOCAO_THUCHI
    SET SO_TIEN = ISNULL(
        (SELECT SUM(SOTIEN_LAI)
        FROM TIENGUI_COKYHAN
        WHERE NGAY_RUT >= @StartDate AND NGAY_RUT <= @EndDate)
    ,0)
    WHERE ID = 3;

    -- CẬP NHẬT CHI PHÍ LÃI TIỀN GỬI TIẾT KIỆM
    UPDATE BAOCAO_THUCHI
    SET SO_TIEN = ISNULL(
        (SELECT SUM(SOTIEN_LAI)
        FROM TIENGUI_TIETKIEM
        WHERE NGAY_RUT >= @StartDate AND NGAY_RUT <= @EndDate)
    ,0)
    WHERE ID = 4;

    -- LƯU TẠM DỮ LIỆU VÀ TÍNH TỔNG LỢI NHUẬN
    DECLARE @DOANH_THU NUMERIC(18,2),
            @CHI_PHI_KKH NUMERIC(18,2),
            @CHI_PHI_COKH NUMERIC(18,2),
            @CHI_PHI_TIETKIEM NUMERIC(18,2);

    -- LẤY DỮ LIỆU TỪ BẢNG BAOCAO_THUCHI
    SELECT @DOANH_THU = SO_TIEN FROM BAOCAO_THUCHI WHERE ID = 1;
    SELECT @CHI_PHI_KKH = SO_TIEN FROM BAOCAO_THUCHI WHERE ID = 2;
    SELECT @CHI_PHI_COKH = SO_TIEN FROM BAOCAO_THUCHI WHERE ID = 3;
    SELECT @CHI_PHI_TIETKIEM = SO_TIEN FROM BAOCAO_THUCHI WHERE ID = 4;

    -- CẬP NHẬT DÒNG TỔNG LỢI NHUẬN UPDATE BAOCAO_THUCHI
	UPDATE BAOCAO_THUCHI
	SET SO_TIEN = @DOANH_THU - @CHI_PHI_KKH - @CHI_PHI_COKH - @CHI_PHI_TIETKIEM
	WHERE ID = 5;
END;

-- THỰC THI
EXEC BC_THUCHI @StartDate = '2024-02-01', @EndDate = '2024-02-29';

SELECT * FROM BAOCAO_THUCHI;
```

### 6.2. Bài toán báo cáo tình hình các nhóm nợ xấu theo tháng

- Giả định: Ngân hàng áp dụng mức lãi suất 150% cho các khoản nợ quá hạn. Ngoài ra không áp dụng lãi chậm trả lãi
- Stored Procedure Nhập vào mã khách hàng để in ra nhóm nợ của khách hàng và số lượng khách hàng theo nhóm nợ của chi nhánh

```sql
--- TẠO BẢNG TẠM CHỨA DANH SÁCH KHÁCH HÀNG KÈM NHÓM NỢ (SỐ LỚN NHẤT) VÀ CHI NHÁNH
CREATE TABLE BANG_TAM (
    MA_HOPDONG_TINDUNG NVARCHAR(20),
    KYTRA INT,
    NGAY_CUOIKY DATE,
    NGAYTRA DATE,
    SOTIEN_GOC NUMERIC(18, 2),
    SOTIEN_LAI NUMERIC(18, 0),
    TONG_TIEN NUMERIC(18, 0),
    NHOM_NO INT,
    MA_KHACHHANG NVARCHAR(20),
    MA_CHINHANH NVARCHAR(20),
    TEN_CHINHANH NVARCHAR(100),
    ROW_NUM INT
);

--- CẬP NHẬT DỮ LIỆU CHO BẢNG TẠM DANH SÁCH KHÁCH HÀNG KÈM NHÓM NỢ (SỐ LỚN NHẤT) VÀ CHI NHÁNH
WITH CTE AS (
    SELECT A.MA_HOPDONG_TINDUNG,
           A.KYTRA,
           A.NGAY_CUOIKY,
           ISNULL(B.NGAYTRA, '9999-12-31') AS NGAYTRA,
           A.SOTIEN_GOC,
           A.SOTIEN_LAI,
           A.TONG_TIEN,
           CASE 
               WHEN (DATEDIFF(D, NGAY_CUOIKY, NGAYTRA) + 1) < 10 THEN 1
               WHEN (DATEDIFF(D, NGAY_CUOIKY, NGAYTRA) + 1) BETWEEN 10 AND 90 THEN 2
               WHEN (DATEDIFF(D, NGAY_CUOIKY, NGAYTRA) + 1) BETWEEN 91 AND 180 THEN 3
               WHEN (DATEDIFF(D, NGAY_CUOIKY, NGAYTRA) + 1) BETWEEN 181 AND 360 THEN 4
               ELSE 5
           END AS NHOM_NO
    FROM KEHOACH_TRANO A
    LEFT JOIN KHACHHANG_TRANO B
        ON A.MA_HOPDONG_TINDUNG = B.MA_HOPDONG_TINDUNG AND A.KYTRA = B.KYTRA
)
, CTE_RANKED AS (
    SELECT B.MA_KHACHHANG, 
           CTE.*, 
           C.MA_CHINHANH, 
           C.TEN_CHINHANH,
           ROW_NUMBER() OVER (PARTITION BY CTE.MA_HOPDONG_TINDUNG ORDER BY CTE.NHOM_NO DESC) AS ROW_NUM
    FROM CTE
    INNER JOIN HOPDONG_TINDUNG A 
        ON CTE.MA_HOPDONG_TINDUNG = A.MA_HOPDONG_TINDUNG
    INNER JOIN KHACHHANG B 
        ON B.MA_KHACHHANG = A.MA_KHACHHANG
    INNER JOIN CHINHANH C 
        ON C.MA_CHINHANH = B.MA_CHINHANH
)
INSERT INTO BANG_TAM (
    MA_HOPDONG_TINDUNG,
    KYTRA,
    NGAY_CUOIKY,
    NGAYTRA,
    SOTIEN_GOC,
    SOTIEN_LAI,
    TONG_TIEN,
    NHOM_NO,
    MA_KHACHHANG,
    MA_CHINHANH,
    TEN_CHINHANH,
    ROW_NUM
)
SELECT 
    MA_HOPDONG_TINDUNG,
    KYTRA,
    NGAY_CUOIKY,
    NGAYTRA,
    SOTIEN_GOC,
    SOTIEN_LAI,
    TONG_TIEN,
    NHOM_NO,
    MA_KHACHHANG,
    MA_CHINHANH,
    TEN_CHINHANH,
    ROW_NUM
FROM CTE_RANKED
WHERE ROW_NUM = 1
ORDER BY MA_HOPDONG_TINDUNG, KYTRA;
---
SELECT * FROM BANG_TAM
ORDER BY MA_CHINHANH, NHOM_NO;

--- PROC NHẬP VÀO MÃ KHÁCH HÀNG -> IN RA NHÓM NỢ CỦA KHÁCH HÀNG; DANH SÁCH SỐ LƯỢNG KHÁCH HÀNG THEO NHÓM NỢ CỦA CHI NHÁNH
ALTER PROC KHACHHANG_NHOMNO
@MAKHACHHANG NVARCHAR(50)
AS
BEGIN
    -- Truy vấn danh sách số lượng khách hàng theo nhóm nợ của chi nhánh @MACHINHANH
    SELECT @MAKHACHHANG AS MA_KHACHHANG, NHOM_NO
    FROM BANG_TAM
    WHERE MA_KHACHHANG = @MAKHACHHANG;
END;

--- THỰC THI
EXEC KHACHHANG_NHOMNO 'CIF0006599';

--- PROC ĐỂ NHẬP VÀO MÃ CHI NHÁNH -> IN RA SỐ LƯỢNG KHÁCH HÀNG THEO TỪNG NHÓM NỢ
ALTER PROC KHACHHANG_NHOMNO_CHINHANH
@MACHINHANH NVARCHAR(50)
AS
BEGIN
    -- Truy vấn danh sách số lượng khách hàng theo nhóm nợ của chi nhánh @MACHINHANH
    SELECT @MACHINHANH AS MA_CHINHANH, NHOM_NO, COUNT(*) AS SO_LUONG
    FROM BANG_TAM
    WHERE MA_CHINHANH = @MACHINHANH
    GROUP BY NHOM_NO
    ORDER BY NHOM_NO;
END;

--- THỰC THI
EXEC KHACHHANG_NHOMNO_CHINHANH '1302004';
```

### **6.3. Tạo TRIGGER khi thêm mới 1 khách hàng sẽ kiểm tra xem số giấy tờ của khách hàng đã có hay chưa, nếu đã có thì thông báo đã có, yêu cầu thêm mới khách hàng khác**
```sql
CREATE TRIGGER TRG_CHECK_MA_GIAYTO
ON KHACHHANG
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @MaGiayTo NVARCHAR(20),
            @MaKhachHang NVARCHAR(12),
            @TenKhachHang NVARCHAR(500);

    -- Lấy thông tin từ bảng inserted (bảng ảo chứa dữ liệu mới)
    SELECT @MaGiayTo = i.MA_GIAYTO, 
           @MaKhachHang = i.MA_KHACHHANG,
           @TenKhachHang = i.TEN_KHACHHANG
    FROM inserted i;

    -- Kiểm tra xem số giấy tờ đã tồn tại hay chưa
    IF EXISTS (SELECT 1 FROM KHACHHANG WHERE MA_GIAYTO = @MaGiayTo)
    BEGIN
        -- Nếu tồn tại, thông báo lỗi
        RAISERROR('Số giấy tờ đã tồn tại, vui lòng thêm khách hàng khác.', 16, 1);
        ROLLBACK TRANSACTION;  -- Hủy giao dịch thêm mới
    END
    ELSE
    BEGIN
        -- Nếu không tồn tại, thực hiện thêm khách hàng mới
        INSERT INTO KHACHHANG(MA_CHINHANH, MA_CIC, MA_KHACHHANG, TEN_KHACHHANG, NGAY_MO_TAIKHOAN, NGAY_SINH, MA_GIAYTO, MA_LOAI_KHACHHANG, MA_LOAI_GIAYTO, NGAYCAP_GIAYTO, MA_NOICAP, DIACHI, NGAY_THANHLAP, QUY_MO_DOANHNGHIEP, VON_DIEULE, MA_TAIKHOAN_THANHTOAN, TEN_CHU_DOANHNGHIEP, ID_CHU_DOANHNGHIEP, MA_LOAIHINH_KHACHHANG, MA_NGANHNGHE_KINHTE)
        SELECT i.MA_CHINHANH, i.MA_CIC, i.MA_KHACHHANG, i.TEN_KHACHHANG, i.NGAY_MO_TAIKHOAN, i.NGAY_SINH, i.MA_GIAYTO, i.MA_LOAI_KHACHHANG, i.MA_LOAI_GIAYTO, i.NGAYCAP_GIAYTO, i.MA_NOICAP, i.DIACHI, i.NGAY_THANHLAP, i.QUY_MO_DOANHNGHIEP, i.VON_DIEULE, i.MA_TAIKHOAN_THANHTOAN, i.TEN_CHU_DOANHNGHIEP, i.ID_CHU_DOANHNGHIEP, i.MA_LOAIHINH_KHACHHANG, i.MA_NGANHNGHE_KINHTE
        FROM inserted i;
    END
END;
```
