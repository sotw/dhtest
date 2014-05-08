LASTOUI="00"

sh_dhcpCheater_usage()
{
   echo "Usage:  "
   echo "  $0 <how many><fake hostname><interface>"
}

dhcpCheaterMain()
{
   for ((i=1;i<=$1;i++))
   do
      if ((i <= 9))
      then
        LASTOUI="0"$i        
      else
        LASTOUI=$i
      fi
      ./dhtest -f -h $2$LASTOUI -m 66:55:44:33:22:$LASTOUI -i $3 -V
   done 
}

if [ "$#" != "3" ]; then
   sh_dhcpCheater_usage
else
   dhcpCheaterMain $1 $2 $3
fi

