FILES="my*.txt my*.sh"
SHA="SHA256SUM"

echo "Starting Script..."
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
