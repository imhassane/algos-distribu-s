atget id id

set id_root 4
set leaf false
set once false
mark 1
if($id==$id_root)
	set leaf false
	set once true
	data m T1 $id
	send $m
else
	set leaf true
	set once false
end

loop
wait
	read m
	rdata $m rtype rid
	
	if(($rtype==T1) && ($once==false))
		edge 1 $rid
		set once true
		
		data m T2 $id
		send $m $rid

		data m T1 $id
		send $m
	end
	if($rtype == T2)
		mark 0
		set leaf false
	end


