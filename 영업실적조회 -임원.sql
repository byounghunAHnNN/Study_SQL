select ui.loginID
      ,ui.name
      ,pl.pln_ddate
      ,pl.si_cd
      ,si.si_cd
      ,pl.pln_nmt
  from tb_userinfo ui
       inner join (
                     select loginID
                           ,pln_ddate
                           ,si_cd
                           ,sum(pln_nmt) as pln_nmt
                       from tb_planning
                      group by loginID
                              ,pln_ddate
                              ,si_cd 
                   ) pl on pl.loginID  = ui.loginID 
       inner join tb_sitem si on si.si_cd = pl.si_cd
       
       
 where ui.user_type = 'D'
order by ui.loginID,  pl.si_cd  
   
   