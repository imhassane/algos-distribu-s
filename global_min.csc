atget id id
getpos2 posx posy
data m $id $posx
send $m
mark 1
set i 0
loop
wait
read m
print $i
inc i
	rdata $m rid rposx
	if($rposx<$posx)
		mark 0
		set posx $rposx
		data t $id $posx
		send $t
	end