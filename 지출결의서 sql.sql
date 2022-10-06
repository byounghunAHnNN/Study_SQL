select ex.exp_no
      ,DATE_FORMAT(ex.exp_date, '%Y-%m-%d') as exp_date
      ,DATE_FORMAT(ex.exp_sdate, '%Y-%m-%d') as exp_sdate
      ,ex.exp_date
      ,ex.exp_sdate
      ,ex.loginID
      ,ui.name
      ,ex.acc_no
      ,ea.acc_nm
      ,ex.dac_no
      ,ed.dac_nm
      ,ex.dept_cd
      ,FORMAT(ex.exp_cost,0) as exp_cost
      ,ex.exp_cost
      ,ex.exp_stat 
      ,dc.detail_name
      
   from tb_expend ex 
        inner join tb_userinfo ui on ui.loginID = ex.loginID
        inner join tb_expend_account ea on ea.acc_no = ex.acc_no
        inner join tb_expend_dtlaccount ed on ed.acc_no = ex.acc_no and ed.dac_no = ex.dac_no 
        inner join tb_detail_code dc on dc.detail_code =ex.exp_stat and dc.group_code = 'Okcd'
        
where   ex.exp_date between STR_TO_DATE('2022-07-01', '%Y-%m-%d') and STR_TO_DATE('2022-07-31', '%Y-%m-%d')
  and ex.exp_stat = '2'
  and ex.acc_no = '2000000' 
  and ex.dac_no = '2000003'