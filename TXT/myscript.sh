FILES="my*.txt my*.sh"
SHA="SHA256SUM"

echo "Starting Script"
echo ""

echo "Removing $SHA and $SHA.asc"
rm -f $SHA $SHA.asc

echo "Running Checksum"
sha256sum $FILES > $SHA
sha256sum -c $SHA

echo "Running gpg"
gpg -o $SHA.asc -a -sb $SHA
gpg --verify $SHA.asc $SHA

echo ""
echo "Exiting Script"
exit 0
