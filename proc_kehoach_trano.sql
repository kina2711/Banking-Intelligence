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
