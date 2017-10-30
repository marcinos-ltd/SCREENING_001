echo "Adding puppet repo"
wget -P /tmp http://apt.puppetlabs.com/puppetlabs-release-trusty.deb
dpkg -i /tmp/puppetlabs-release-trusty.deb
wget -P /tmp http://us.archive.ubuntu.com/ubuntu/pool/main/a/augeas/augeas-lenses_1.2.0-0ubuntu1.1~ubuntu12.04.1_all.deb
dpkg -i /tmp/augeas-lenses_1.2.0-0ubuntu1.1~ubuntu12.04.1_all.deb
echo "installing puppet"
apt-get -y update
apt-get -y install puppet
echo "ensure puppet service is running"
# Not required
echo ""
sed -e '/templatedir/ s/^#*/#/' -i.back /etc/puppet/puppet.conf
