select  hr.job_cd
        ,dc.detail_name as job_nm
        ,DATE_FORMAT(hr_date,'%Y-%m-%d') as hr_date
        

from tb_human_resources hr
      inner join tb_detail_code dc on hr.job_cd = dc.detail_code and dc.group_code = 'POScd'  
where hr.loginID = '2022017'