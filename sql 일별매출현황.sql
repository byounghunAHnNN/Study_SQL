select ord.cop_no
      ,co.cop_nm
      ,ord.acc_no
      ,ord.dac_no
      ,ea.acc_nm
      ,ed.dac_nm
      ,ord.ord_tot
      ,ord.ord_ar

from tb_order ord
        inner join tb_expend_account ea on ea.acc_no = ord.acc_no
        inner join tb_expend_dtlaccount ed on ed.acc_no = ord.acc_no and ed.dac_no = ord.dac_no 
        inner join tb_company co on ord.ord_no = co.cop_no
        
where ord.cop_no = '2'        