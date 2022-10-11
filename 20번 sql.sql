select ex.exp_no
      ,DATE_FORMAT(ex.exp_date,'%Y-%m-%d') as exp_date
      ,DATE_FORMAT(ex.exp_sdate,'%Y-%m-%d') as exp_sdate
      ,ex.loginID
      ,ui.name
      ,ea.acc_nm
      ,ea.scc_desc
      ,FORMAT(ex.exp_cost,0) as exp_cost
      ,ex.exp_stat

from tb_expend ex
    inner join tb_expend_account ea on ex.acc_no = ea.acc_no
    inner join tb_userinfo ui on ex.loginID = ui.loginID
   
