select loginID  
      ,ui.name
      ,ui.dept_cd
      ,dp.dept_name
      ,ui.job_cd
      ,dc.detail_name as job_nm
      ,DATE_FORMAT(ui.user_date, '%Y-%m-%d') as user_date
      , CASE
	WHEN ui.user_du = 'Y' 
                  	THEN '퇴직'
                  	ELSE '재직'
END as user_du_nm 

      ,ui.user_du
      ,ui.user_redate

from tb_userinfo ui 
     inner join tb_dept dp on ui.dept_cd = dp.dept_cd 
     inner join tb_detail_code dc on ui.job_cd = dc.detail_code and dc.group_code = 'POScd'