$Id: BUILD,v 1.2 2006/08/27 04:01:10 doros Exp $


Si scaricano i sorgenti eventualmente con wget:

samba_3.0.14a-3.diff.gz
samba_3.0.14a-3.dsc
samba_3.0.14a.orig.tar.gz


Si scompattano alla "Debian way":

dpkg-source -x samba_3.0.14a-3.dsc


Si modifica la patch debian/patches/fhs.patch:

cd samba-3.0.14a/
cp $repository/fhs.patch debian/patches/fhs.patch


Si compila:

fakeroot dpkg-buildpackage -b -uc

