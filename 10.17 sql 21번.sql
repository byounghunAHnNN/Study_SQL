select vr.vac_no
      , CASE
	WHEN vr.vac_stat = '1' 
                  	THEN '연차'
                  	ELSE '공가'
END as vac_stat
      ,vr.loginID
      ,ui.name
      ,DATE_FORMAT(vr.vac_sdate, '%Y-%m-%d') as vac_sdate
      ,DATE_FORMAT(vr.vac_edate, '%Y-%m-%d') as vac_edate
      ,vr.vac_bo
      , CASE
	WHEN vr.vac_stat = '1' 
                  	THEN '반려'
                  	ELSE '승인'
END as vac_stat 

from tb_vacation_request vr
    inner join tb_userinfo ui 