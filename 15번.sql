select DISTINCT ord.ord_no
               ,ord.est_no 
               ,de.dept_name
               ,DATE_FORMAT(gc.update_date,'%Y-%m-%d') as update_date
               ,co.cop_nm
               ,si.si_nm
               ,ic.inc_cost
               ,DATE_FORMAT(ic.inc_date,'%Y-%m-%d') as inc_date
               ,CASE
          	WHEN ord.supply_st ='N'
            THEN '납품'
            ELSE '미납품건' 
            
          END as supply_st
               ,CASE
          	WHEN ic.inc_st ='Y'
            THEN '수금'
            ELSE '미수금'
            
          END as inc_st
            

from tb_order ord
    left outer join tb_dept de on de.dept_name
    inner join tb_group_code gc on gc.update_date
    inner join tb_company co on ord.ord_no = co.cop_no
    left outer join tb_sitem si on si.si_nm
    inner join tb_income ic on ord.ord_no = ic.inc_no
