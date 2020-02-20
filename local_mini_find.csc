atget id id

getpos2 x y

data m $id $x
 
send $m

mark 1

loop
wait

read m

rdata $m rid rx

if ($rx<$x)
mark 0
end 