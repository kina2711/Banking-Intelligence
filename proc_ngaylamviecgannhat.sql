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
