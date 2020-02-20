atget id id
set once true
set id_root 4
if($id==$id_root)
	data m $id A
	send $m
end
loop
wait
read m
	rdata $m rid rm
	if(($rm==A) && ($once==true))
		edge 1 $rid
		set once false
		data m $id A
		send $m
	end