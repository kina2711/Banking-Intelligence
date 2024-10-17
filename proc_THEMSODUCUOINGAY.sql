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
