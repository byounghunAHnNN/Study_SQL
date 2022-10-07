select DATE_FORMAT(sa.sal_date,'%Y-%m-%d') as sal_date
       ,sa.loginID 
       ,ui.dept_cd
       ,dp.dept_name
       ,ui.job_cd
       ,dc.detail_name as job_nm
       ,ui.name
       ,FORMAT(sa.sal_ad,0) as sal_ad
       ,FORMAT(sa.sal_bt,0) as sal_bt
       ,FORMAT(sa.sal_price,0) as sal_price
       ,FORMAT(sa.sal_kuk,0) as sal_kuk
       ,FORMAT(sa.sal_kun,0) as sal_kun
       ,FORMAT(sa.sal_ko,0) as sal_ko
      
       

from tb_salary sa
     inner join tb_userinfo ui on sa.loginID = ui.loginID
     inner join tb_dept dp on ui.dept_cd = dp.dept_cd
     inner join tb_detail_code dc on ui.job_cd = dc.detail_code and dc.group_code = 'POScd'
where sa.loginID = '2019008'