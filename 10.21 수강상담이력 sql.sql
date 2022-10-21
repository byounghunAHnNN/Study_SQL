select *
  from tb_lecinfo;


select ts.loginID
      ,ui.name
      ,ifnull(ll.ss_score,0) as ss_score
  from tb_subjectlist ts
       inner join tb_userinfo ui on ts.loginID = ui.loginID       
       left outer join (  
                          select li_no
                                ,loginID
                                ,test_cd
                                ,sum(ss_score) as ss_score
                            from tb_stdanswer
                          group by li_no
                                  ,loginID
                                  ,test_cd
                       ) ll on ts.li_no = ll.li_no and ts.loginID = ll.loginID and test_cd = ( select test_cd from tb_lecinfo where li_no = 1)
 where ts.li_no = 1;     


select ts.loginID
      ,ui.name
      ,ifnull(ll.ss_score,0) as ss_score
  from tb_subjectlist ts
       inner join tb_userinfo ui on ts.loginID = ui.loginID       
       left outer join (  
                          select li_no
                                ,loginID
                                ,test_cd
                                ,sum(ss_score) as ss_score
                            from tb_stdanswer
                          group by li_no
                                  ,loginID
                                  ,test_cd
                       ) ll on ts.li_no = ll.li_no and ts.loginID = ll.loginID and test_cd = ( select test_cd from tb_lecinfo where li_no = #{li_no})
 where ts.li_no = #{li_no} 
 LIMIT #{pageIndex}, #{pageSize}

