select ui.loginID
      ,ui.name
      ,ui.dept_cd
      ,dp.dept_name
      ,ui.job_cd
      ,dc.detail_name as job_nm
      ,ifnull(ll.hr_date,'') as hr_date
  from tb_userinfo ui 
       inner join tb_dept dp on ui.dept_cd = dp.dept_cd
       inner join tb_detail_code dc on ui.job_cd = dc.detail_code and dc.group_code = 'POScd' 
       left outer join (
                         select loginID
                               ,DATE_FORMAT(max(hr_date),'%Y-%m-%d') as hr_date
                           from tb_human_resources 
                          group by loginID
                       ) ll on ui.loginID = ll.loginID