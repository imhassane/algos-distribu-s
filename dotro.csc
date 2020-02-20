atget id id

data x 1
data wt1 null
data wt2 null

set xmin $x
set step 1
set leader true

send $x

mark 1

loop
wait

	if($step==1)
		read wt1
		rdata $wt1 rx
		if($rx==null)
			set step 2
			if($leader==true)
				send $x
			end
		else
			if($rx<$x)
				mark 0
				set leader false
			end
		end
	end
	if($step==2)
		read wt2
		rdata $wt2 rx
		if($rx==null)
			stop
		else
			if($rx<$xmin)
				mark 0
				set leader false
				set xmin $rx
				send $rx
			end
		end
	end