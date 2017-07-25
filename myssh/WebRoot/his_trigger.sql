-- 新增
drop trigger if exists goods_ins_tri;
create trigger goods_ins_tri
after insert on goods 
for each row 
begin 
 declare username varchar(16);
 select manager into username from store where id = new.storeid;    
 insert into history value(to_char(unix_timestamp(now())),new.amount,to_char(now()),new.amount,'入库',username,new.id);
end;

-- 修改
drop trigger if exists goods_upd_tri;
create trigger goods_upd_tri
after update on goods 
for each row 
begin 
 declare username,_type varchar(16);
 declare amount double(6,2);
 select manager into username from store where id = new.storeid;    
 if old.amount>new.amount then
    set _type="出库";
  set amount = old.amount-new.amount;
 else
    set _type="入库";
    set amount = new.amount- old.amount;
 end if;
 insert into history value(unix_timestamp(now())+'',amount,now()+'',new.amount,_type,username,new.id);
end;
