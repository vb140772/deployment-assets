#for i in $(ls -rv *list*); do for j in stat delete get put; do echo -e "$i results:"; cat $i; echo -e "\n";  done | tee $j-full.log; done
#for i in $(ls -rv *stat*); do for j in stat delete get put; do echo -e "$i results:"; cat $i; echo -e "\n";  done | tee stat-full.log; done
#for i in $(ls -rv *delete*); do for j in stat delete get put; do echo -e "$i results:"; cat $i; echo -e "\n";  done | tee delete-full.log; done
#for i in $(ls -rv *get*); do for j in stat delete get put; do echo -e "$i results:"; cat $i; echo -e "\n";  done | tee get-full.log; done
#for i in $(ls -rv *put*); do for j in stat delete get put; do echo -e "$i results:"; cat $i; echo -e "\n";  done | tee put-full.log; done
#for i in $(ls -lv *get*); do echo -e "$i results:"; cat $i; echo -e "\n";  done | tee get-full.logfor i in $(ls -rv *list*); do echo -e "$i results:"; cat $i; echo -e "\n";  done 
#ls -rv *list*
for i in $(ls -rv *put*log); do echo -e "$i results:"; cat $i; echo -e "\n";  done  | tee put-full.log
for i in $(ls -rv *get*log); do echo -e "$i results:"; cat $i; echo -e "\n";  done | tee get-full.log
for i in $(ls -rv *stat*log); do echo -e "$i results:"; cat $i; echo -e "\n";  done | tee stat-full.log
for i in $(ls -rv *list*log); do echo -e "$i results:"; cat $i; echo -e "\n";  done | tee list-full.log
for i in $(ls -rv *delete*log); do echo -e "$i results:"; cat $i; echo -e "\n";  done | tee delete-full.log

echo "Results written to summary.log"

for i in put get stat list delete; do echo "Results from $i:"; grep -i -A20 $i $i-full* | grep -C1 Average |grep -v ^M; done > summary.log
