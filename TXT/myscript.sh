REC2="mirfanjunaidi@gmail.com"
REC1="operatingsystems@vlsm.org"
FILES="my*.asc my*.txt my*.sh"
SHA="SHA256SUM"

echo "Starting Script..."
echo

[ -d $HOME/RESULT ] || mkdir -p $HOME/RESULT
pushd $HOME/RESULT
for II in W?? ; do
    [ -d $II ] || continue
    TARFILE=my$II.tar.bz2
    TARFASC=$TARFILE.asc
    rm -f $TARFILE $TARFASC
    echo "tar cfj $TARFILE $II/"
    tar cfj $TARFILE $II/
    echo "gpg --armor --output $TARFASC --encrypt --recipient $REC1 --recipient $REC2 $TARFILE"
    gpg --armor --output $TARFASC --encrypt --recipient $REC1 --recipient $REC2 $TARFILE
done
popd

rm -f $HOME/RESULT/fakeDODOL
for II in $HOME/RESULT/myW*.tar.bz2.asc $HOME/RESULT/fakeDODOL ; do
    echo "Check and move $II..."
    [ -f $II ] && mv -f $II .
done
echo

echo "Removing SHA Files..."
rm -f $SHA $SHA.asc
echo

echo "Printing Checksum Hashes to $SHA..."
sha256sum $FILES > $SHA
echo

echo "Checking Files..."
sha256sum -c $SHA
echo

echo "Signing Files..."
gpg -o $SHA.asc -a -sb $SHA
echo

echo "Verifying Files..."
gpg --verify $SHA.asc $SHA
echo

echo "Exiting Script..."
exit 0
